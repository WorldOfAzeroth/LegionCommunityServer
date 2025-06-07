/*
 * This file is part of the TrinityCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "vmapexport.h"
#include "adtfile.h"
#include "Banner.h"
#include "Common.h"
#include "DB2CascFileSource.h"
#include "ExtractorDB2LoadInfo.h"
#include "Locales.h"
#include "MapDefines.h"
#include "MapUtils.h"
#include "StringFormat.h"
#include "Util.h"
#include "VMapDefinitions.h"
#include "wdtfile.h"
#include "wmo.h"
#include <CascLib.h>
#include <boost/filesystem/operations.hpp>
#include <algorithm>
#include <fstream>
#include <list>
#include <map>
#include <unordered_map>
#include <unordered_set>
#include <cstdio>

//-----------------------------------------------------------------------------

CASC::StorageHandle CascStorage;

struct LiquidMaterialEntry
{
    EnumFlag<LiquidMaterialFlags> Flags = { { } };
};

struct LiquidTypeEntry
{
    uint8 MaterialID = 0;
};

struct MapEntry
{
    char name[64];
    int32 parent_id;
};

std::unordered_map<uint32, LiquidMaterialEntry> LiquidMaterials;
std::unordered_map<uint32, LiquidTypeEntry> LiquidTypes;
std::vector<MapEntry> map_ids; // partitioned by parent maps first
std::unordered_set<uint32> maps_that_are_parents;
boost::filesystem::path input_path;
bool preciseVectorData = false;
std::unordered_map<std::string, WMODoodadData> WmoDoodads;

// Constants

const char* szWorkDirWmo = "./Buildings";

#define CASC_LOCALES_COUNT 17
char const* CascLocaleNames[CASC_LOCALES_COUNT] =
{
    "none", "enUS",
    "koKR", "unknown",
    "frFR", "deDE",
    "zhCN", "esES",
    "zhTW", "enGB",
    "enCN", "enTW",
    "esMX", "ruRU",
    "ptBR", "itIT",
    "ptPT"
};

uint32 WowLocaleToCascLocaleFlags[12] =
{
    CASC_LOCALE_ENUS | CASC_LOCALE_ENGB,
    CASC_LOCALE_KOKR,
    CASC_LOCALE_FRFR,
    CASC_LOCALE_DEDE,
    CASC_LOCALE_ZHCN,
    CASC_LOCALE_ZHTW,
    CASC_LOCALE_ESES,
    CASC_LOCALE_ESMX,
    CASC_LOCALE_RURU,
    0,
    CASC_LOCALE_PTBR | CASC_LOCALE_PTPT,
    CASC_LOCALE_ITIT,
};

bool OpenCascStorage(int locale)
{
    try
    {
        boost::filesystem::path const storage_dir(boost::filesystem::canonical(input_path) / "Data");
        CascStorage = CASC::OpenStorage(storage_dir, WowLocaleToCascLocaleFlags[locale]);
        if (!CascStorage)
        {
            printf("error opening casc storage '%s' locale %s\n", storage_dir.string().c_str(), localeNames[locale]);
            return false;
        }

        return true;
    }
    catch (boost::filesystem::filesystem_error const& error)
    {
        printf("error opening casc storage : %s\n", error.what());
        return false;
    }
}

uint32 GetInstalledLocalesMask()
{
    try
    {
        boost::filesystem::path const storage_dir(boost::filesystem::canonical(input_path) / "Data");
        CASC::StorageHandle storage = CASC::OpenStorage(storage_dir, 0);
        if (!storage)
            return false;

        return CASC::GetInstalledLocalesMask(storage);
    }
    catch (boost::filesystem::filesystem_error const& error)
    {
        printf("Unable to determine installed locales mask: %s\n", error.what());
    }

    return 0;
}

std::map<std::pair<uint32, uint16>, uint32> uniqueObjectIds;

uint32 GenerateUniqueObjectId(uint32 clientId, uint16 clientDoodadId)
{
    return uniqueObjectIds.emplace(std::make_pair(clientId, clientDoodadId), uniqueObjectIds.size() + 1).first->second;
}

// Local testing functions
bool FileExists(const char* file)
{
    if (FILE* n = fopen(file, "rb"))
    {
        fclose(n);
        return true;
    }
    return false;
}

bool ExtractSingleWmo(std::string& fname)
{
    // Copy files from archive
    std::string originalName = fname;

    char szLocalFile[1024];
    char* plain_name = GetPlainName(&fname[0]);
    FixNameCase(plain_name, strlen(plain_name));
    FixNameSpaces(plain_name, strlen(plain_name));
    sprintf(szLocalFile, "%s/%s", szWorkDirWmo, plain_name);

    if (FileExists(szLocalFile))
        return true;

    int p = 0;
    // Select root wmo files
    char const* rchr = strrchr(plain_name, '_');
    if (rchr != nullptr)
    {
        char cpy[4];
        memcpy(cpy, rchr, 4);
        for (int i = 0; i < 4; ++i)
        {
            int m = cpy[i];
            if (isdigit(m))
                p++;
        }
    }

    if (p == 3)
        return true;

    bool file_ok = true;
    printf("Extracting %s\n", originalName.c_str());
    WMORoot froot(originalName);
    if (!froot.open())
    {
        printf("Couldn't open RootWmo!!!\n");
        return true;
    }
    FILE *output = fopen(szLocalFile,"wb");
    if(!output)
    {
        printf("couldn't open %s for writing!\n", szLocalFile);
        return false;
    }
    froot.ConvertToVMAPRootWmo(output);
    WMODoodadData& doodads = WmoDoodads[plain_name];
    std::swap(doodads, froot.DoodadData);
    int Wmo_nVertices = 0;
    //printf("root has %d groups\n", froot->nGroups);
    for (std::size_t i = 0; i < froot.groupFileDataIDs.size(); ++i)
    {
        std::string s = Trinity::StringFormat("FILE{:08X}.xxx", froot.groupFileDataIDs[i]);
        WMOGroup fgroup(s);
        if (!fgroup.open(&froot))
        {
            printf("Could not open all Group file for: %s\n", plain_name);
            file_ok = false;
            break;
        }

        Wmo_nVertices += fgroup.ConvertToVMAPGroupWmo(output, preciseVectorData);
        for (uint16 groupReference : fgroup.DoodadReferences)
        {
            if (groupReference >= doodads.Spawns.size())
                continue;

            uint32 doodadNameIndex = doodads.Spawns[groupReference].NameIndex;
            if (froot.ValidDoodadNames.find(doodadNameIndex) == froot.ValidDoodadNames.end())
                continue;

            doodads.References.insert(groupReference);
        }
    }

    fseek(output, 8, SEEK_SET); // store the correct no of vertices
    fwrite(&Wmo_nVertices,sizeof(int),1,output);
    fclose(output);

    // Delete the extracted file in the case of an error
    if (!file_ok)
        remove(szLocalFile);
    return true;
}

bool IsLiquidIgnored(uint32 liquidTypeId)
{
    if (LiquidTypeEntry const* liquidType = Trinity::Containers::MapGetValuePtr(LiquidTypes, liquidTypeId))
        if (LiquidMaterialEntry const* liquidMaterial = Trinity::Containers::MapGetValuePtr(LiquidMaterials, liquidType->MaterialID))
            if (liquidMaterial->Flags.HasFlag(LiquidMaterialFlags::VisualOnly))
                return true;

    return false;
}

void ParsMapFiles()
{
    std::unordered_map<uint32, WDTFile> wdts;
    auto getWDT = [&wdts](uint32 mapId) -> WDTFile*
    {
        auto itr = wdts.find(mapId);
        if (itr == wdts.end())
        {
            auto mapEntryItr = std::ranges::find(map_ids, mapId, &MapEntry::Id);
            if (mapEntryItr == map_ids.end())
                return nullptr;

            uint32 fileDataId = mapEntryItr->WdtFileDataId;
            if (!fileDataId)
                return nullptr;

            std::string description = Trinity::StringFormat("WDT for map {} - {} (FileDataID {})", mapId, mapEntryItr->Name, fileDataId);
            std::string directory = mapEntryItr->Directory;
            itr = wdts.emplace(std::piecewise_construct, std::forward_as_tuple(mapId), std::forward_as_tuple(fileDataId, description, std::move(directory), maps_that_are_parents.count(mapId) > 0)).first;
            if (!itr->second.init(mapId))
            {
                wdts.erase(itr);
                return nullptr;
            }
        }

        return &itr->second;
    };

    for (auto itr = map_ids.begin(); itr != map_ids.end(); ++itr)
    {
        if (WDTFile* WDT = getWDT(itr->first))
        {
            WDTFile* parentWDT = itr->second.parent_id >= 0 ? getWDT(itr->second.parent_id) : nullptr;
            printf("Processing Map %u\n[", itr->first);
            for (int32 x = 0; x < 64; ++x)
            {
                for (int32 y = 0; y < 64; ++y)
                {
                    bool success = false;
                    if (ADTFile* ADT = WDT->GetMap(x, y))
                    {
                        success = ADT->init(itr->first, itr->first);
                        WDT->FreeADT(ADT);
                    }
                    if (!success && parentWDT)
                    {
                        if (ADTFile* ADT = parentWDT->GetMap(x, y))
                        {
                            ADT->init(itr->first, itr->second.parent_id);
                            parentWDT->FreeADT(ADT);
                        }
                    }
                }
                printf("#");
                fflush(stdout);
            }
            printf("]\n");
        }
    }
}

void TryLoadDB2(char const* name, DB2CascFileSource* source, DB2FileLoader* db2, DB2FileLoadInfo const* loadInfo)
{
    try
    {
        db2->Load(source, loadInfo);
    }
    catch (std::exception const& e)
    {
        printf("Fatal error: Invalid %s file format! %s\n%s\n", name, CASC::HumanReadableCASCError(GetCascError()), e.what());
        exit(1);
    }
}

void ReadMapTable()
{
    printf("Read Map.dbc file... ");

    DB2CascFileSource source(CascStorage, MapLoadInfo::Instance.Meta->FileDataId);
    DB2FileLoader db2;
    TryLoadDB2("Map.db2", &source, &db2, &MapLoadInfo::Instance);

    map_ids.reserve(db2.GetRecordCount() + db2.GetRecordCopyCount());
    std::unordered_map<uint32, std::size_t> idToIndex;
    for (uint32 x = 0; x < db2.GetRecordCount(); ++x)
    {
        DB2Record record = db2.GetRecord(x);
        if (!record)
            continue;

        MapEntry& map = map_ids.emplace_back();
        map.Id = record.GetId();
        map.WdtFileDataId = record.GetInt32("WdtFileDataID");
        map.ParentMapID = int16(record.GetUInt16("ParentMapID"));
        map.Name = record.GetString("MapName");
        map.Directory = record.GetString("Directory");

        if (map.ParentMapID < 0)
            map.ParentMapID = int16(record.GetUInt16("CosmeticParentMapID"));

        if (map.ParentMapID >= 0)
            maps_that_are_parents.insert(map.ParentMapID);

        idToIndex[map.Id] = map_ids.size() - 1;
    }

    for (uint32 x = 0; x < db2.GetRecordCopyCount(); ++x)
    {
        DB2RecordCopy copy = db2.GetRecordCopy(x);
        auto itr = idToIndex.find(copy.SourceRowId);
        if (itr != idToIndex.end())
        {
            MapEntry& map = map_ids.emplace_back(map_ids[itr->second]);
            map.Id = copy.NewRowId;
        }
    }

    std::erase_if(map_ids, [](MapEntry const& map) { return !map.WdtFileDataId; });

    // force parent maps to be extracted first
    std::stable_partition(map_ids.begin(), map_ids.end(), [](MapEntry const& map) { return maps_that_are_parents.contains(map.Id); });

    printf("Done! (" SZFMTD " maps loaded)\n", map_ids.size());
}

void ReadLiquidMaterialTable()
{
    printf("Read LiquidMaterial.db2 file...\n");

    DB2CascFileSource source(CascStorage, LiquidMaterialLoadInfo::Instance.Meta->FileDataId);
    DB2FileLoader db2;
    TryLoadDB2("LiquidMaterial.db2", &source, &db2, &LiquidMaterialLoadInfo::Instance);

    for (uint32 x = 0; x < db2.GetRecordCount(); ++x)
    {
        DB2Record record = db2.GetRecord(x);
        if (!record)
            continue;

        LiquidMaterialEntry& liquidType = LiquidMaterials[record.GetId()];
        liquidType.Flags = static_cast<LiquidMaterialFlags>(record.GetUInt32("Flags"));
    }

    for (uint32 x = 0; x < db2.GetRecordCopyCount(); ++x)
        LiquidMaterials[db2.GetRecordCopy(x).NewRowId] = LiquidMaterials[db2.GetRecordCopy(x).SourceRowId];

    printf("Done! (" SZFMTD " LiquidMaterials loaded)\n", LiquidMaterials.size());
}

void ReadLiquidTypeTable()
{
    printf("Read LiquidType.db2 file...\n");

    DB2CascFileSource source(CascStorage, LiquidTypeLoadInfo::Instance.Meta->FileDataId);
    DB2FileLoader db2;
    TryLoadDB2("LiquidType.db2", &source, &db2, &LiquidTypeLoadInfo::Instance);

    for (uint32 x = 0; x < db2.GetRecordCount(); ++x)
    {
        DB2Record record = db2.GetRecord(x);
        if (!record)
            continue;

        LiquidTypeEntry& liquidType = LiquidTypes[record.GetId()];
        liquidType.MaterialID = record.GetUInt8("MaterialID");
    }

    for (uint32 x = 0; x < db2.GetRecordCopyCount(); ++x)
        LiquidTypes[db2.GetRecordCopy(x).NewRowId] = LiquidTypes[db2.GetRecordCopy(x).SourceRowId];

    printf("Done! (" SZFMTD " LiquidTypes loaded)\n", LiquidTypes.size());
}

bool processArgv(int argc, char ** argv, const char *versionString)
{
    bool result = true;
    preciseVectorData = false;

    for (int i = 1; i < argc; ++i)
    {
        if (strcmp("-s", argv[i]) == 0)
        {
            preciseVectorData = false;
        }
        else if (strcmp("-d", argv[i]) == 0)
        {
            if ((i + 1) < argc)
            {
                input_path = boost::filesystem::path(argv[i + 1]);
                ++i;
            }
            else
            {
                result = false;
            }
        }
        else if (strcmp("-?", argv[1]) == 0)
        {
            result = false;
        }
        else if(strcmp("-l",argv[i]) == 0)
        {
            preciseVectorData = true;
        }
        else
        {
            result = false;
            break;
        }
    }

    if (!result)
    {
        printf("Extract %s.\n",versionString);
        printf("%s [-?][-s][-l][-d <path>]\n", argv[0]);
        printf("   -s : (default) small size (data size optimization), ~500MB less vmap data.\n");
        printf("   -l : large size, ~500MB more vmap data. (might contain more details)\n");
        printf("   -d <path>: Path to the vector data source folder.\n");
        printf("   -? : This message.\n");
    }

    return result;
}

static bool RetardCheck()
{
    try
    {
        boost::filesystem::path storageDir(boost::filesystem::canonical(input_path) / "Data");
        boost::filesystem::directory_iterator end;
        for (boost::filesystem::directory_iterator itr(storageDir); itr != end; ++itr)
        {
            if (itr->path().extension() == ".MPQ")
            {
                printf("MPQ files found in Data directory!\n");
                printf("This tool works only with World of Warcraft: Dragonflight\n");
                printf("\n");
                printf("To extract maps for Wrath of the Lich King, rebuild tools using 3.3.5 branch!\n");
                printf("\n");
                printf("Press ENTER to exit...\n");
                getchar();
                return false;
            }
        }
    }
    catch (std::exception const& error)
    {
        printf("Error checking client version: %s\n", error.what());
    }

    return true;
}

int main(int argc, char ** argv)
{
    Trinity::Banner::Show("VMAP data extractor", [](char const* text) { printf("%s\n", text); }, nullptr);

    bool success = true;

    // Use command line arguments, when some
    if (!processArgv(argc, argv, VMAP::VMAP_MAGIC))
        return 1;

    if (!RetardCheck())
        return 1;

    // some simple check if working dir is dirty
    boost::filesystem::path sdir_bin = boost::filesystem::path(szWorkDirWmo) / "dir_bin";
    {
        boost::system::error_code ec;
        if (boost::filesystem::exists(sdir_bin, ec) && !boost::filesystem::is_empty(sdir_bin, ec))
        {
            printf("Your output directory seems to be polluted, please use an empty directory!\n");
            printf("<press return to exit>");
            char garbage[2];
            return scanf("%c", garbage);
        }
    }

    printf("Extract %s. Beginning work ....\n", VMAP::VMAP_MAGIC);
    //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    // Create the working directory
    success = boost::filesystem::create_directories(sdir_bin) || boost::filesystem::is_directory(sdir_bin);

    uint32 installedLocalesMask = GetInstalledLocalesMask();
    int32 FirstLocale = -1;
    for (int i = 0; i < TOTAL_LOCALES; ++i)
    {
        if (i == LOCALE_none)
            continue;

        if (!(installedLocalesMask & WowLocaleToCascLocaleFlags[i]))
            continue;

        if (!OpenCascStorage(i))
            continue;

        FirstLocale = i;
        uint32 build = CASC::GetBuildNumber(CascStorage);
        if (!build)
        {
            CascStorage.reset();
            continue;
        }

        printf("Detected client build %u for locale %s\n\n", build, localeNames[i]);
        break;
    }

    if (FirstLocale == -1)
    {
        printf("FATAL ERROR: No locales defined, unable to continue.\n");
        return 1;
    }

    // Extract models, listed in GameObjectDisplayInfo.dbc
    ExtractGameobjectModels();

    //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    //map.dbc
    if (success)
    {
        ReadMapTable();
        ReadLiquidMaterialTable();
        ReadLiquidTypeTable();
        ParsMapFiles();
    }

    CascStorage.reset();

    printf("\n");
    if (!success)
    {
        printf("ERROR: Extract %s. Work NOT complete.\n   Precise vector data=%d.\nPress any key.\n", VMAP::VMAP_MAGIC, preciseVectorData);
        getchar();
    }

    printf("Extract %s. Work complete. No errors.\n", VMAP::VMAP_MAGIC);
    return 0;
}
