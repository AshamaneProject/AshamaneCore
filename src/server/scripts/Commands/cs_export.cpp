
/* ScriptData
Name: arena_commandscript
%Complete: 100
Comment: All arena team related commands
Category: commandscripts
EndScriptData */

#include "SpellMgr.h"
#include "DatabaseEnv.h"
#include "RBAC.h"
#include "ScriptMgr.h"
#include "ObjectMgr.h"
#include "MapManager.h"
#include "Chat.h"
#include <stdlib.h>
#include "DB2Stores.h"
#include "PhasingHandler.h"
#include "Creature.h"
#include "World.h"
#include <Windows.h>
class CommadExportHelper
{
    //friend class ObjectMgr;
public:
    CreatureDataContainer _creatureDataStore;

    CreatureData const* _GetCreatureData() const {
        return m_creatureData;
    }
    CreatureData const* m_creatureData;
    /* Function GetItemQuality */
    std::string GetItemQuality(uint32 item_entry)
    {
        if ( ItemTemplate const* itemProto = sObjectMgr->GetItemTemplate(item_entry) )
        {
            switch ( itemProto->GetQuality() )
            {
            case ITEM_QUALITY_POOR:
                return "GREY_POOR       ";
                break;
            case ITEM_QUALITY_NORMAL:
                return "WAIHT_COMMON    ";
                break;
            case ITEM_QUALITY_UNCOMMON:
                return "GREEN_UNCOMMON  ";
                break;
            case ITEM_QUALITY_RARE:
                return "BLUE_RARE       ";
                break;
            case ITEM_QUALITY_EPIC:
                return "PURPULE_EPIC    ";
                break;
            case ITEM_QUALITY_LEGENDARY:
                return "ORANGE_LEGENDARY";
                break;
            case ITEM_QUALITY_ARTIFACT:
                return "ED_ARTIFACT    ";
                break;
            default:
                return "<unknown>      ";
                break;
            }
        }
        else
            return "<unknown>";
    }
    /*#####
    # Get Area and Zone by Position
    #####*/
    uint32 GetZoneOrAreaID(uint32 map, float position_x, float position_y, float position_z, bool zoneOrArea)
    {
        if ( sMapMgr->IsValidMapCoord(map, position_x, position_y, position_z) )
        {
            /* True for Zone, False for Area */
            if ( zoneOrArea )
            {
                uint32 ZoneId = sMapMgr->GetZoneId(PhasingHandler::GetEmptyPhaseShift(), map, position_x, position_y, position_z);
                return ZoneId;
            }
            else
            {
                uint32 AreaId = sMapMgr->GetAreaId(PhasingHandler::GetEmptyPhaseShift(), map, position_x, position_y, position_z);
                return AreaId;
            }
        }
        else
            return 0;
    }

    /// # GetIntemName by entry
    ///*#####*/
    std::string GetIntemName(uint32 item_entry, bool validate)
    {

        LocaleConstant defaultLocale = sWorld->GetDefaultDbcLocale();
        //Check if is on template
        if ( ItemTemplate const* itemProto = sObjectMgr->GetItemTemplate(item_entry) )
        {
            if ( itemProto->GetName(defaultLocale) > 0 )
                return itemProto->GetName(defaultLocale);
            else
                return "";
        }
        else
            if ( validate )
            {
                if ( ItemEntry const* dbcItem = sItemStore.LookupEntry(item_entry) )
                    return "THIS ITEM IS JUST VISUAL, DONT HAVE TEMPLATE";
                else
                    return "THIS ITEM DONT EXIST";
            }
            else
                return "";
    }
    /*#####
    # GetItemLevel by entry
    #####*/
    std::ostringstream GetItemLevel(uint32 item_entry)
    {
        std::ostringstream ItemLevelString;
        //Check if is on template
        if ( ItemTemplate const* itemProto = sObjectMgr->GetItemTemplate(item_entry) )
        {
            ItemLevelString << itemProto->GetBaseItemLevel();
            return ItemLevelString;
        }
        else
        {
            ItemLevelString << "THIS ITEM DONT EXIST";
            return ItemLevelString;
        }
    }
    /*#####
    # GetRequiredLevel by entry
    #####*/
    std::ostringstream GetRequiredLevel(uint32 item_entry)
    {
        std::ostringstream RequiredLevelString;
        //Check if is on template
        if ( ItemTemplate const* itemProto = sObjectMgr->GetItemTemplate(item_entry) )
        {
            RequiredLevelString << itemProto->GetBaseItemLevel();
            return RequiredLevelString;
        }
        else
        {
            RequiredLevelString << "THIS ITEM DONT EXIST";
            return RequiredLevelString;
        }
    }
    /*#####
    # GetQuestNameByEntry by entry
    #####*/
    std::string GetQuestNameByEntry(uint32 quest_entry)
    {
        /*Check if quest_entry exist*/
        if ( Quest const* quetProto = sObjectMgr->GetQuestTemplate(quest_entry) )
            return quetProto->GetLogTitle();
        else
            return "THIS QUEST DONT EXITS ON DB";
    }
    /*#####
    # GetQuestRequiredSkill This is for know what profession the quest is
    #####*/
    uint32 GetQuestRequiredSkill(uint32 quest_required_skill)
    {
        /*Check if quest_entry exist*/
        if ( Quest const* questProtolevel = sObjectMgr->GetQuestTemplate(quest_required_skill) )
            return questProtolevel->GetRequiredSkill();
        else
            return 0;
    }
    /*#####
    # GetSpellNameByEntry by entry
    #####*/
    //std::string GetSpellNameByEntry(uint32 spellId)
    //{
    //	/*Check if Spell ID exist*/
    //	if (SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(spellId))
    //		return spellInfo->SpellName;
    //	else
    //		return "THIS SPELL DONT EXIST";
    //}
private:
    /*Export Data*/
    std::ostringstream dump_data;
    std::ostringstream fileName;
};

class CommandExportCreature : public CommadExportHelper
{
private:
    ChatHandler* fHandler;
    std::ostringstream fCacheStream;

public:
    /// Author:
    /// <summary>
    /// Sustituye los caracteres en una cadena string
    /// </summary>
    /// <param name="aInput">Cadena de entrada.</param>
    /// <return>Cadena con los caracteres sustituidos.</return>
    std::string CheckScapeChar(std::string &aInput, std::string &aScapeChar)
    {
        //
        std::ostringstream _aFirst;
        /* Check for scape characters */
        int _Start = 0, _Index;
        do {
            std::string _Aux;
            _Index = aInput.find(aScapeChar, _Start);
            if ( _Index != std::string::npos )
            {
                _Aux = aInput.substr(_Start, _Index - _Start);
                _aFirst << _Aux << "";
                _Start = _Index + 1;
            }
            else
            {
                _Aux = aInput.substr(_Start, aInput.length() - _Start);
                _aFirst << _Aux;
            }
        } while ( _Index != std::string::npos );
        /* Return Value */
        return _aFirst.str();
    }
    /// Author:
    /// <summary>
    /// inicializa una nueva instancia de la clase.
    /// </summary>
    /// <param name="aHandler">Objeto de chat global usado para notificar al cliente cualquier evento.</param>
    CommandExportCreature(ChatHandler* aHandler)
    {
        this->fHandler = aHandler;
    }


    /// Author:
    /// <summary>
    /// Sustituye los caracteres ', " por \', \" respectivamente
    /// </summary>
    /// <param name="aInput">Cadena de entrada.</param>
    /// <return>Cadena con los caracteres sustituidos.</return>
    std::string SafeSQLParams(std::string &aInput)
    {
        std::ostringstream _aFirst;
        std::ostringstream _aSecond;
        /* Check for ' */
        int _Start = 0, _Index;
        do {
            std::string _Aux;
            _Index = aInput.find('\'', _Start);
            if ( _Index != std::string::npos )
            {
                _Aux = aInput.substr(_Start, _Index - _Start);
                _aFirst << _Aux << "\\'";
                _Start = _Index + 1;
            }
            else
            {
                _Aux = aInput.substr(_Start, aInput.length() - _Start);
                _aFirst << _Aux;
            }
        } while ( _Index != std::string::npos );
        /* Check for " */
        _Start = 0;
        do {
            std::string _Aux;
            _Index = _aFirst.str().find('\"', _Start);
            if ( _Index != std::string::npos )
            {
                _Aux = _aFirst.str().substr(_Start, _Index - _Start);
                _aSecond << _Aux << "\\\"";
                _Start = _Index + 1;
            }
            else
            {
                _Aux = _aFirst.str().substr(_Start, _aFirst.str().length() - _Start);
                _aSecond << _Aux;
            }
        } while ( _Index != std::string::npos );
        /* Return Value */
        return _aSecond.str();
    }
    /*#####
    # GetSkillNameByEntry by ID
    #####*/
    std::string GetSkillNameByEntry(uint32 skillID)
    {
        std::string name;
        LocaleConstant defaultLocale = sWorld->GetDefaultDbcLocale();
        if ( SkillLineEntry const* skillInfo = sSkillLineStore.LookupEntry(skillID) )
            return name = skillInfo->DisplayName.Str [defaultLocale];
        else
            return "THIS SKILL DONT EXIST";
    }
    ///
    bool exportQuestPoi(uint32 aquestId)
    {
        uint32 QuestID;
        uint32 BlobIndex;
        uint32 Idx1;
        int32 ObjectiveIndex;
        uint32 QuestObjectiveID;
        uint32 QuestObjectID;
        uint32 MapID;
        uint32 WorldMapAreaId;
        uint32 Floor;
        uint32 Priority;
        uint32 Flags;
        uint32 WorldEffectID;
        uint32 PlayerConditionID;
        uint32 WoDUnk1;
        uint32 AlwaysAllowMergingBlobs;
        uint32 VerifiedBuild;


        QueryResult _Result = WorldDatabase.PQuery(
            "SELECT * FROM `quest_poi` WHERE `QuestID` = '%u';", aquestId);

        //Add the delete
        this->fCacheStream
            << "/* Step 3.4 Table  `quest_poi` */\n"
            << "DELETE FROM  `quest_poi` WHERE `QuestID` = " << aquestId << ";\n";

        if ( _Result )
        {
            bool _IsFirstTime = true;
            do {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto


                QuestID = _Fields [_Index++].GetUInt32();
                BlobIndex = _Fields [_Index++].GetUInt32();
                Idx1 = _Fields [_Index++].GetUInt32();
                ObjectiveIndex = _Fields [_Index++].GetInt32();
                QuestObjectiveID = _Fields [_Index++].GetUInt32();
                QuestObjectID = _Fields [_Index++].GetUInt32();
                MapID = _Fields [_Index++].GetUInt32();
                WorldMapAreaId = _Fields [_Index++].GetUInt32();
                Floor = _Fields [_Index++].GetUInt32();
                Priority = _Fields [_Index++].GetUInt32();
                Flags = _Fields [_Index++].GetUInt32();
                WorldEffectID = _Fields [_Index++].GetUInt32();
                PlayerConditionID = _Fields [_Index++].GetUInt32();
                WoDUnk1 = _Fields [_Index++].GetUInt32();
                AlwaysAllowMergingBlobs = _Fields [_Index++].GetUInt32();
                VerifiedBuild = _Fields [_Index++].GetUInt32();


                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `quest_poi` ("
                        << "`QuestID`, "
                        << "`BlobIndex`, "
                        << "`Idx1`, "
                        << "`ObjectiveIndex`, "
                        << "`QuestObjectiveID`, "
                        << "`QuestObjectID`, "
                        << "`MapID`, "
                        << "`WorldMapAreaId`, "
                        << "`Floor`, "
                        << "`Priority`, "
                        << "`Flags`, "
                        << "`WorldEffectID`, "
                        << "`PlayerConditionID`, "
                        << "`WoDUnk1`, "
                        << "`AlwaysAllowMergingBlobs`, "
                        << "`VerifiedBuild`) VALUES \n";

                }
                else
                    this->fCacheStream << ", \n";
                //
                // Insertar los parámetros.
                this->fCacheStream
                    << "('" << QuestID << "',"
                    << " '" << BlobIndex << "',"
                    << " '" << Idx1 << "',"
                    << " '" << ObjectiveIndex << "',"
                    << " '" << QuestObjectiveID << "',"
                    << " '" << QuestObjectID << "',"
                    << " '" << MapID << "',"
                    << " '" << WorldMapAreaId << "',"
                    << " '" << Floor << "',"
                    << " '" << Priority << "',"
                    << " '" << Flags << "',"
                    << " '" << WorldEffectID << "',"
                    << " '" << PlayerConditionID << "',"
                    << " '" << WoDUnk1 << "',"
                    << " '" << AlwaysAllowMergingBlobs << "',"
                    << " '" << VerifiedBuild << "')";

                //
            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //

            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    quest_poi exported.");
        }
        else
            return false;
        return true;
    }
    bool exportQuestPoiPoints(uint32 aquestId)
    {
        QueryResult _Result = WorldDatabase.PQuery(
            "SELECT * FROM `quest_poi_points` WHERE `QuestID` = '%u'  ORDER BY Idx1 ASC, Idx2 ASC;", aquestId);

        //Add the delete
        this->fCacheStream
            << "/* Step 3.5 Table  `quest_poi_points` */\n"
            << "DELETE FROM  `quest_poi_points` WHERE `QuestID` = " << aquestId << ";\n";

        if ( _Result )
        {
            bool _IsFirstTime = true;
            do {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                        //
                                                        // Obtener cada uno de los parámetros de la tabla de la bd según sus indices
                uint32 QuestID = _Fields [_Index++].GetUInt32();
                uint32 Idx1 = _Fields [_Index++].GetUInt32();
                uint32 Idx2 = _Fields [_Index++].GetUInt32();
                int32  x = _Fields [_Index++].GetInt32();
                int32  y = _Fields [_Index++].GetInt32();
                uint32 VerifiedBuild = _Fields [_Index++].GetUInt32();

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `quest_poi_points` ("
                        << "`QuestID`, "
                        << "`Idx1`, "
                        << "`Idx2`, "
                        << "`X`, "
                        << "`Y`, "
                        << "`VerifiedBuild`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";
                //
                // Insertar los parámetros.
                this->fCacheStream
                    << "('" << QuestID << "',"
                    << " '" << Idx1 << "',"
                    << " '" << Idx2 << "',"
                    << " '" << x << "',"
                    << " '" << y << "',"
                    << " '" << VerifiedBuild << "')";

                //
            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //

            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    quest_poi_points exported.");
        }
        else
            return false;
        return true;
    }
    /// Author: MAYOR
    /// <summary>
    /// Exportar todo lo referente a la tabla gameobject_template
    /// </summary>
    /// <param name="aGameObjID">Identificador del Objeto a exportar.</param>
    /// <param name="aGameObjectName">Devuelve el nombre del la plantilla de objeto.</param>
    /// <return>Si no hay errores true, false en otro caso.</return>
    bool exportGameObjectTemplate(uint32 aGameObjID, std::string &aGameObjectName)
    {
        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `gameobject_template` WHERE `entry` = '%u';", aGameObjID);

        //Add the delete
        this->fCacheStream
            << "/* Step 4.1 Table  `gameobject_template */\n"
            << "DELETE FROM `gameobject_template` WHERE `entry` = " << "@ENTRY" << ";\n";

        if ( _Result )
        {
            bool _IsFirstTime = true;
            do {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                        //
                                                        // Obtener cada uno de los parmetros de la tabla de la bd segn sus indices
                uint32 _Entry = _Fields [_Index++].GetUInt32();
                uint32 type = ( uint32 )_Fields [_Index++].GetUInt8();
                uint32 displayId = _Fields [_Index++].GetUInt32();
                std::string name = aGameObjectName = _Fields [_Index++].GetString();
                std::string IconName = _Fields [_Index++].GetString();
                std::string castBarCaption = _Fields [_Index++].GetString();
                std::string unk1 = _Fields [_Index++].GetString();
                float size = _Fields [_Index++].GetFloat();


                uint64  data0 = _Fields [_Index++].GetUInt32();
                uint64  data1 = _Fields [_Index++].GetUInt32();
                uint32  data2 = _Fields [_Index++].GetUInt32();
                uint32  data3 = _Fields [_Index++].GetUInt32();
                uint32  data4 = _Fields [_Index++].GetUInt32();
                uint32  data5 = _Fields [_Index++].GetUInt32();
                uint32  data6 = _Fields [_Index++].GetUInt32();
                uint32  data7 = _Fields [_Index++].GetUInt32();
                uint32  data8 = _Fields [_Index++].GetUInt32();
                uint32  data9 = _Fields [_Index++].GetUInt32();
                uint32  data10 = _Fields [_Index++].GetUInt32();
                uint32  data11 = _Fields [_Index++].GetUInt32();
                uint32  data12 = _Fields [_Index++].GetUInt32();
                uint32  data13 = _Fields [_Index++].GetUInt32();
                uint32  data14 = _Fields [_Index++].GetUInt32();
                uint32  data15 = _Fields [_Index++].GetUInt32();
                uint32  data16 = _Fields [_Index++].GetUInt32();
                uint32  data17 = _Fields [_Index++].GetUInt32();
                uint32  data18 = _Fields [_Index++].GetUInt32();
                uint32  data19 = _Fields [_Index++].GetUInt32();
                uint32  data20 = _Fields [_Index++].GetUInt32();
                uint32  data21 = _Fields [_Index++].GetUInt32();
                uint32  data22 = _Fields [_Index++].GetUInt32();
                uint32  data23 = _Fields [_Index++].GetUInt32();
                uint32  data24 = _Fields [_Index++].GetUInt32();
                uint32  data25 = _Fields [_Index++].GetUInt32();
                uint32  data26 = _Fields [_Index++].GetUInt32();
                uint32  data27 = _Fields [_Index++].GetUInt32();
                int32   data28 = _Fields [_Index++].GetInt32();
                uint32  data29 = _Fields [_Index++].GetUInt32();
                uint32  data30 = _Fields [_Index++].GetUInt32();
                uint32  data31 = _Fields [_Index++].GetUInt32();
                int32   Data32 = _Fields [_Index++].GetInt32();
                uint32  RequiredLevel = _Fields [_Index++].GetUInt32();
                std::string AIName = _Fields [_Index++].GetString();
                std::string ScriptName = _Fields [_Index++].GetString();
                int16 VerifiedBuild = _Fields [_Index++].GetInt16();

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `gameobject_template` ("
                        << "`entry`, "
                        << "`type`, "
                        << "`displayId`, "
                        << "`name`, "
                        << "`IconName`, "
                        << "`castBarCaption`, "
                        << "`unk1`, "
                        << "`size`, "
                        << "`Data0`, "
                        << "`Data1`, "
                        << "`Data2`, "
                        << "`Data3`, "
                        << "`Data4`, "
                        << "`Data5`, "
                        << "`Data6`, "
                        << "`Data7`, "
                        << "`Data8`, "
                        << "`Data9`, "
                        << "`Data10`, "
                        << "`Data11`, "
                        << "`Data12`, "
                        << "`Data13`, "
                        << "`Data14`, "
                        << "`Data15`, "
                        << "`Data16`, "
                        << "`Data17`, "
                        << "`Data18`, "
                        << "`Data19`, "
                        << "`Data20`, "
                        << "`Data21`, "
                        << "`Data22`, "
                        << "`Data23`, "
                        << "`Data24`, "
                        << "`Data25`, "
                        << "`Data26`, "
                        << "`Data27`, "
                        << "`Data28`, "
                        << "`Data29`, "
                        << "`Data30`, "
                        << "`Data31`, "
                        << "`Data32`, "
                        << "`RequiredLevel`, "
                        << "`AIName`, "
                        << "`ScriptName`, "
                        << "`VerifiedBuild`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";

                //
                // Insertar los parmetros.
                this->fCacheStream
                    //<< "('" << _Entry << "',"
                    << "(" << "@ENTRY" << ","
                    << " '" << type << "',"
                    << " '" << displayId << "',"
                    << " '" << this->SafeSQLParams(name) << "',"
                    << " '" << this->SafeSQLParams(IconName) << "',"
                    << " '" << this->SafeSQLParams(castBarCaption) << "',"
                    << " '" << this->SafeSQLParams(unk1) << "',"
                    << " '" << size << "',"
                    << " '" << data0 << "',"
                    << " '" << data1 << "',"
                    << " '" << data2 << "',"
                    << " '" << data3 << "',"
                    << " '" << data4 << "',"
                    << " '" << data5 << "',"
                    << " '" << data6 << "',"
                    << " '" << data7 << "',"
                    << " '" << data8 << "',"
                    << " '" << data9 << "',"
                    << " '" << data10 << "',"
                    << " '" << data11 << "',"
                    << " '" << data12 << "',"
                    << " '" << data13 << "',"
                    << " '" << data14 << "',"
                    << " '" << data15 << "',"
                    << " '" << data16 << "',"
                    << " '" << data17 << "',"
                    << " '" << data18 << "',"
                    << " '" << data19 << "',"
                    << " '" << data20 << "',"
                    << " '" << data21 << "',"
                    << " '" << data22 << "',"
                    << " '" << data23 << "',"
                    << " '" << data24 << "',"
                    << " '" << data25 << "',"
                    << " '" << data26 << "',"
                    << " '" << data27 << "',"
                    << " '" << data28 << "',"
                    << " '" << data29 << "',"
                    << " '" << data30 << "',"
                    << " '" << data31 << "',"
                    << " '" << Data32 << "',"
                    << " '" << RequiredLevel << "',"
                    << " '" << this->SafeSQLParams(AIName) << "',"
                    << " '" << this->SafeSQLParams(ScriptName) << "',"
                    << " '" << VerifiedBuild << "')";

                //
                // Solo como comentario
                ;
            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    gameobject_template exported.");
        }
        else
            return false;
        return true;
    }

    bool exportGameObject(uint32 aGameObjID)
    {
        // Extra data Struct
        struct guidExportEntry
        {
            uint64 guid;
            uint32 pHmS;
            uint32 cMap;
            float  posX;
            float  posY;
            float  posZ;
        };
        // Extra data vector
        std::vector<guidExportEntry> _guidExportVector;

        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `gameobject` WHERE `id` = '%u';", aGameObjID);

        //Add the delete
        this->fCacheStream
            << "/* Step 4.1 Table `gameobject */\n"
            // Moodificado por Pekado
            << "DELETE FROM `gameobject` WHERE `id` = " << "@ENTRY" << ";\n";

        if ( _Result )
        {
            bool _IsFirstTime = true;
            do {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                        //
                                                        // Obtener cada uno de los parmetros de la tabla de la bd segn sus indices
                uint32 guid = _Fields [_Index++].GetUInt32();
                uint32 id = _Fields [_Index++].GetUInt32();
                uint16 mapid = _Fields [_Index++].GetUInt16();
                uint16 zoneId = _Fields [_Index++].GetUInt16();
                uint16 areaId = _Fields [_Index++].GetUInt16();
                uint32 spawnDifficulties = _Fields [_Index++].GetUInt32();
                uint32  phaseUseFlags= _Fields[_Index++].GetUInt32();
                uint16 PhaseId = _Fields [_Index++].GetUInt16();
                uint16 PhaseGroup = _Fields [_Index++].GetUInt16();
                uint16 terrainSwapMap = _Fields[_Index++].GetUInt16();
                float posX = _Fields [_Index++].GetFloat();
                float posY = _Fields [_Index++].GetFloat();
                float posZ = _Fields [_Index++].GetFloat();
                float orientation = _Fields [_Index++].GetFloat();
                float rotation0 = _Fields [_Index++].GetFloat();
                float rotation1 = _Fields [_Index++].GetFloat();
                float rotation2 = _Fields [_Index++].GetFloat();
                float rotation3 = _Fields [_Index++].GetFloat();
                uint32 spawntimesecs = _Fields [_Index++].GetUInt32();
                uint32 animprogress = _Fields [_Index++].GetUInt32();
                uint32 state = _Fields [_Index++].GetUInt32();
                bool isActive = _Fields [_Index++].GetBool();
                std::string ScriptName = _Fields [_Index++].GetString();
                int16 VerifiedBuild = _Fields [_Index++].GetInt16();


                if ( !sMapStore.LookupEntry(mapid) )
                    continue;

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `gameobject` ("
                        << "`guid`, "
                        << "`id`, "
                        << "`map`, "
                        << "`zoneId`, "
                        << "`areaId`, "
                        << "`spawnDifficulties`, "
                        << "`phaseUseFlags`, "
                        << "`PhaseId`, "
                        << "`PhaseGroup`, "
                        << "`terrainSwapMap`, "
                        << "`position_x`, "
                        << "`position_y`, "
                        << "`position_z`, "
                        << "`orientation`, "
                        << "`rotation0`, "
                        << "`rotation1`, "
                        << "`rotation2`, "
                        << "`rotation3`, "
                        << "`spawntimesecs`, "
                        << "`animprogress`, "
                        << "`state`, "
                        << "`isActive`, "
                        << "`ScriptName`, "
                        << "`VerifiedBuild`) VALUES \n";

                }
                else
                    this->fCacheStream << ", \n";
                //
                // Insertar los parmetros.
                this->fCacheStream
                    //<< "('" << guid << "',"
                    //<< " '" << id << "',"
                    << "(" << guid << ","
                    << " " << "@ENTRY" << ","
                    << " '" << mapid << "',"
                    << " '" << this->GetZoneOrAreaID(mapid, posX, posY, posZ, true) << "',"
                    << " '" << this->GetZoneOrAreaID(mapid, posX, posY, posZ, false) << "',"
                    << " '" << spawnDifficulties << "',"
                    << " '" << phaseUseFlags << "',"
                    << " '" << PhaseId << "',"
                    << " '" << PhaseGroup << "',"
                    << " '" << terrainSwapMap << "',"
                    << " '" << posX << "',"
                    << " '" << posY << "',"
                    << " '" << posZ << "',"
                    << " '" << orientation << "',"
                    << " '" << rotation0 << "',"
                    << " '" << rotation1 << "',"
                    << " '" << rotation2 << "',"
                    << " '" << rotation3 << "',"
                    << " '" << spawntimesecs << "',"
                    << " '" << animprogress << "',"
                    << " '" << state << "',"
                    << " '" << isActive << "',"
                    << " '" << this->SafeSQLParams(ScriptName) << "',"
                    << " '" << VerifiedBuild << "')";

                // Solo como comentario
                ;
            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    gameobject exported.");


        }
        else
            return false;
        return true;
    }

    /*Loot del gobject exportado como parametro el entry del gobject*/
    bool exportGameobjectLootTemplate(uint32 aEntry, std::ostringstream &aDescriptions)
    {
        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `gameobject_loot_template` WHERE entry = '%u';", aEntry);
        std::list<uint64> _itemsToExport;

        //Add the delete
        this->fCacheStream
            << "/* Step x.x Table  `gameobject_loot_template */\n"
            //<< "DELETE FROM gameobject_loot_template WHERE  `entry` = " << aEntry << ";\n";
            << "DELETE FROM gameobject_loot_template WHERE  `entry` = " << "@ENTRY" << ";\n";

        if ( _Result )
        {
            bool _IsFirstTime = true;
            int32 _ReferencesIndex = 0;
            int32 *_References = new int32 [_Result->GetRowCount()];
            do {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                        //
                                                        // Obtener cada uno de los parmetros de la tabla de la bd segn sus indices
                uint32 entry = _Fields [_Index++].GetUInt32();
                uint32 item = abs(_Fields [_Index++].GetInt32());
                uint32 Reference = abs(_Fields [_Index++].GetInt32());
                float  Chance = _Fields [_Index++].GetFloat();
                uint32 QuestRequired = abs(_Fields [_Index++].GetInt32());
                uint32 lootmode = uint32(_Fields [_Index++].GetUInt16());
                uint32 groupid = uint32(_Fields [_Index++].GetUInt8());
                int32  mincountOrRef = _Fields [_Index++].GetInt32();
                int32  maxcount = int32(_Fields [_Index++].GetUInt8());
                std::string Comment = _Fields [_Index++].GetString();

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `gameobject_loot_template` ("
                        << "`entry`,"
                        << "`item`,"
                        << "`Reference`,"
                        << "`Chance`,"
                        << "`QuestRequired`,"
                        << "`LootMode`,"
                        << "`GroupId`,"
                        << "`MinCount`,"
                        << "`MaxCount`,"
                        << "`Comment`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";
                //
                // Insertar los parmetros.
                this->fCacheStream
                    //<< "('" << entry << "',"
                    << "(" << "@ENTRY" << ","
                    << " '" << item << "',"
                    << " '" << Reference << "',"
                    << " '" << Chance << "',"
                    << " '" << QuestRequired << "',"
                    << " '" << lootmode << "',"
                    << " '" << groupid << "',"
                    << " '" << mincountOrRef << "',"
                    << " '" << maxcount << "',"
                    << " '" << Comment << "')";

                //
                // Solo como comentario
                this->fCacheStream << " /* Item(" << item << "): " << ", ItemLevel: " << GetItemLevel(item).str().c_str() << ", RequiredLevel: " << GetRequiredLevel(item).str().c_str() << ", ItemQuality: " << GetItemQuality(item) << " */";
                //
                // exportar los reference templates
                if ( mincountOrRef < 0 ) {
                    _References [_ReferencesIndex] = mincountOrRef;
                    _ReferencesIndex++;
                }
                // exportar los items
                if ( mincountOrRef > 0 )
                    _itemsToExport.push_back(item);
                //
            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";

            //
            //Export items corectly sorted.
            for ( auto _citem : _itemsToExport )
            {

                if ( ItemTemplate const* itemProto = sObjectMgr->GetItemTemplate(_citem) )
                {
                    aDescriptions
                        << itemProto->GetId() << "  "
                        << itemProto->GetQuality() << "  "
                        << GetItemQuality(_citem) << "  ";
                    //Decent way to read item price.
                    /*if (itemProto->GetSellPrice())
                    {
                    uint32 _gold = (itemProto->GetSellPrice / GOLD);
                    uint32 _silv = ((itemProto->GetSellPrice % GOLD) / SILVER);
                    uint32 _copp = ((itemProto->GetSellPrice % GOLD) % SILVER);
                    aDescriptions
                    << _gold << "g " << _silv << "s " << _copp << "c  ";
                    }*/
                    aDescriptions
                        << itemProto->GetBaseItemLevel() << "  "
                        << itemProto->GetBaseRequiredLevel() << "  ";
                    //<< itemProto->GetName(_citem) << "\n";
                }
            }

            //
            // Comment end.
            aDescriptions
                << "*/\n";

            //
            //// Export Reference Loot Template
            //for (int i = 0; i < _ReferencesIndex; i++)
            //	this->exportReferenceLootTemplate(abs(_References[i]), aDescriptions);

            delete [] _References;

            // Clear the list.
            _itemsToExport.clear();

            //
            // Notificar al usuario q se exporto los gameobject_loot_template de un gameobject.
            this->fHandler->PSendSysMessage("    gameobject_loot_template exported.");
        }
        else
            return false;
        return true;
    }

    /// Author: MAYOR
    /// <summary>
    /// Exportar todo lo referente a la tabla gameobject_questrelation
    /// </summary>
    /// <param name="aGAmeObjectId">.</param>
    /// <param name="aQuestId">.</param>
    /// <return>Si no hay errores true, false en otro caso.</return>
    bool exportGameObjectQuestRelation(uint32 aGAmeObjectId, uint32 aQuestId) // Preguntar si se pasa el QuestGiver o el GoEntry
    {
        QueryResult _Result;
        uint32 _rowCount = 1;

        if ( aGAmeObjectId != 0 && aQuestId == 0 )
        {
            _Result = WorldDatabase.PQuery(
                "SELECT  "
                "`id`,  "
                "`quest` "
                "FROM `gameobject_queststarter` WHERE id = '%u';", aGAmeObjectId);

            //Add the delete
            this->fCacheStream
                << "/* Step 2.2 Table  `gameobject_queststarter */\n"
                //<< "DELETE FROM  `gameobject_questrelation` WHERE `id`= " << aGAmeObjectId << ";\n";
                << "DELETE FROM  `gameobject_queststarter` WHERE `id`= " << "@ENTRY" << ";\n";

        }
        else if ( aGAmeObjectId == 0 && aQuestId != 0 )
        {
            _Result = WorldDatabase.PQuery(
                "SELECT  "
                "`id`,  "
                "`quest` "
                "FROM `gameobject_queststarter` WHERE quest = '%u';", aQuestId);

            //Add the delete
            this->fCacheStream
                << "/* Step 2.2 Table  `gameobject_queststarter */\n"
                << "DELETE FROM  `gameobject_queststarter` WHERE `quest`= " << aQuestId << ";\n";

        }
        else
        {
            return false;
        }

        if ( _Result )
        {
            do {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                        //
                                                        // Obtener cada uno de los parmetros de la tabla de la bd segn sus indices
                uint32 id = _Fields [_Index++].GetUInt32();
                uint32 quest = _Fields [_Index++].GetUInt32();

                if ( _rowCount == 1 )
                {
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `gameobject_queststarter` ("
                        << "`id`, "
                        << "`quest`) VALUES \n";
                }

                //
                // Insertar los parmetros.
                this->fCacheStream
                    << "('" << id << "',"
                    << " '" << quest << "')";

                //
                //
                if ( _Result->GetRowCount() == _rowCount )
                    this->fCacheStream << "; ";
                else
                    this->fCacheStream << ", ";

                //
                // Solo como comentario
                this->fCacheStream << " /* " << "Quest(" << quest << "): " << this->GetQuestNameByEntry(quest) << " ,QuestProfession ID: " << this->GetQuestRequiredSkill(quest) << "["; //<< this->GetSkillNameByEntry(GetQuestRequiredSkill(quest)) << "]" << " */ \n";
                _rowCount++;
            } while ( _Result->NextRow() );

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //
            // Notificar al usuario q se exporto las opciones de menu de un gobject.
            this->fHandler->PSendSysMessage("    gameobject_queststarter exported.");
        }
        else
            return false;
        return true;
    }

    bool exportGameObjectInvolvedRelation(uint32 aGAmeObjectId, uint32 aQuestId)
    {
        QueryResult _Result;
        uint32 _rowCount = 1;

        if ( aGAmeObjectId != 0 && aQuestId == 0 )
        {
            _Result = WorldDatabase.PQuery(
                "SELECT  "
                "`id`,  "
                "`quest` "
                "FROM `gameobject_questender` WHERE id = '%u';", aGAmeObjectId);

            //Add the delete	
            this->fCacheStream
                << "/* Step 2.2 Table  `gameobject_questender */\n"
                //<< "DELETE FROM  `gameobject_involvedrelation` WHERE `id`= " << aGAmeObjectId << ";\n";
                << "DELETE FROM  `gameobject_questender` WHERE `id`= " << "@ENTRY" << ";\n";

        }
        else if ( aGAmeObjectId == 0 && aQuestId != 0 )
        {
            _Result = WorldDatabase.PQuery(
                "SELECT  "
                "`id`,  "
                "`quest` "
                "FROM `gameobject_questender` WHERE quest = '%u';", aQuestId);

            //Add the delete
            this->fCacheStream
                << "/* Step 2.2 Table  `gameobject_questender */\n"
                << "DELETE FROM  `gameobject_questender` WHERE `quest`= " << aQuestId << ";\n";
        }
        else
        {
            return false;
        }

        if ( _Result )
        {
            do {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                        //
                                                        // Obtener cada uno de los parmetros de la tabla de la bd segn sus indices
                uint32 id = _Fields [_Index++].GetUInt32();
                uint32 quest = _Fields [_Index++].GetUInt32();

                if ( _rowCount == 1 )
                {
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `gameobject_questender` ("
                        << "`id`, "
                        << "`quest`) VALUES \n";
                }

                //
                // Insertar los parmetros.
                this->fCacheStream
                    << "('" << id << "',"
                    << " '" << quest << "')";

                //
                //
                if ( _Result->GetRowCount() == _rowCount )
                    this->fCacheStream << "; ";
                else
                    this->fCacheStream << ", ";

                //
                // Solo como comentario
                this->fCacheStream << " /* " << "Quest(" << quest << "): " << this->GetQuestNameByEntry(quest) << " ,QuestProfession ID: " << this->GetQuestRequiredSkill(quest) << "[" << "]" << " */ \n";
                _rowCount++;
            } while ( _Result->NextRow() );

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //
            // Notificar al usuario q se exporto las opciones de menu de un gobject.
            this->fHandler->PSendSysMessage("    gameobject_questender exported.");
        }
        else
            return false;
        return true;
    }


    bool exportWaypointData(uint32 aId, uint32 aPhaseMask, uint32 aMap, float aPosition_x, float aPosition_y, float aPosition_z)
    {
        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `waypoint_data` WHERE id = '%u' ORDER BY id, point;", aId);

        //Add the delete
        this->fCacheStream
            << "/* Step 3.4 Table  `waypoint_data` */\n"
            << "SET @GUID := (SELECT `guid` FROM `creature` WHERE "
            << "`position_x` REGEXP '" << aPosition_x << "' AND "
            << "`position_y` REGEXP '" << aPosition_y << "' AND "
            << "`position_z` REGEXP '" << aPosition_z << "' AND "
            << "`PhaseId` = '" << aPhaseMask << "' AND "
            << "`map` = '" << aMap << "');\n"
            << "DELETE FROM  `waypoint_data` WHERE `id` = @GUID;\n";

        if ( _Result )
        {
            bool _IsFirstTime = true;
            do {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                        //
                                                        // Obtener cada uno de los parámetros de la tabla de la bd según sus indices
                uint32 id = _Fields [_Index++].GetUInt32();
                uint32 point = _Fields [_Index++].GetUInt32();
                float position_x = _Fields [_Index++].GetFloat();
                float position_y = _Fields [_Index++].GetFloat();
                float position_z = _Fields [_Index++].GetFloat();
                float orientation = _Fields [_Index++].GetFloat();
                uint32 delay = _Fields [_Index++].GetUInt32();
                uint32 move_flag = _Fields [_Index++].GetUInt32();
                uint32 action = _Fields [_Index++].GetUInt32();
                uint32 action_chance = _Fields [_Index++].GetUInt32();
                uint64 wpguid = _Fields [_Index++].GetUInt64();

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `waypoint_data` ("
                        << "`id`,"
                        << "`point`,"
                        << "`position_x`,"
                        << "`position_y`,"
                        << "`position_z`,"
                        << "`orientation`,"
                        << "`delay`,"
                        << "`move_type`,"
                        << "`action`,"
                        << "`action_chance`,"
                        << "`wpguid`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";
                //
                // Insertar los parámetros.
                this->fCacheStream
                    << "(" << "@GUID" << ","
                    << " '" << point << "',"
                    << " '" << position_x << "',"
                    << " '" << position_y << "',"
                    << " '" << position_z << "',"
                    << " '" << orientation << "',"
                    << " '" << delay << "',"
                    << " '" << move_flag << "',"
                    << " '" << action << "',"
                    << " '" << action_chance << "',"
                    << " '" << wpguid << "')";

                //
                // Solo como comentario
                ;
            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    waypoint_data exported.");
        }
        else
            return false;
        return true;
    }


    /// Author: Mayor
    /// <summary>
    /// Exportar todo lo referente a la tabla creature_template
    /// </summary>
    /// <param name="aEntry">Identificador de la plantilla de la criatura.</param>
    /// <param name="aCreatureLootId">.</param>
    /// <param name="aCreatureEquipmentId">.</param>
    /// <param name="aCreatureIsQuestGiver">.</param>
    /// <param name="aGossipMenuIdTemplate">.</param>
    /// <param name="aCreatureName">.</param>
    /// <return>Si no hay errores true, false en otro caso.</return>
    bool exportCreatureTemplate(uint32 aEntry, uint32 *aCreatureLootId, uint32 *aCreatureEquipmentId, uint32 *aCreatureIsQuestGiver, uint32 *aGossipMenuIdTemplate, std::string &aCreatureName)
    {
        uint32 _Entry;
        uint32 _Difficulty_entry_1;
        uint32 _Difficulty_entry_2;
        uint32 _Difficulty_entry_3;
        uint32 _KillCredit1;
        uint32 _KillCredit2;
        uint32 _Modelid1;
        uint32 _Modelid2;
        uint32 _Modelid3;
        uint32 _Modelid4;
        std::string _Name;
        std::string _femaleName;
        std::string _Subname;
        std::string TitleAlt;
        std::string IconName;
        uint32 _Gossip_menu_id;
        uint32 _Minlevel;
        uint32 _Maxlevel;
        int32 _HealthScalingExpansion;
        uint32 RequiredExpansion;
        uint32 _VignetteID;
        uint32 _faction;
        uint64 _Npcflag;
        float _Speed_walk;
        float _Speed_run;
        float _Scale;
        uint32 rank;
        uint32 _Dmgschool;
        uint32 _Baseattacktime;
        uint32 _Rangeattacktime;
        float  BaseVariance;
        float  RangeVariance;
        uint32 _Unit_class;
        uint32 _Unit_flags;
        uint32 _Unit_flags2;
        uint32 _Unit_flags3;
        uint32 _Dynamicflags;
        uint32 _Family;
        uint32 _Trainer_type;
        uint32 _Trainer_class;
        uint32 _Trainer_race;
        uint32 _Type;
        uint32 _Type_flags;
        uint32 _Type_flags2;
        uint32 _Lootid;
        uint32 _Pickpocketloot;
        uint32 _Skinloot;
        int32 _Resistance1;
        int32 _Resistance2;
        int32 _Resistance3;
        int32 _Resistance4;
        int32 _Resistance5;
        int32 _Resistance6;
        uint32 _Spell1;
        uint32 _Spell2;
        uint32 _Spell3;
        uint32 _Spell4;
        uint32 _Spell5;
        uint32 _Spell6;
        uint32 _Spell7;
        uint32 _Spell8;
        uint32 _VehicleId;
        uint32 _Mingold;
        uint32 _Maxgold;
        std::string _AIName;
        uint32 _MovementType;
        uint32 _InhabitType;
        float _HoverHeight;
        float _Health_mod;
        float HealthModifierExtra;
        float _Mana_mod;
        float _Mana_mod_extra;
        float _Armor_mod;
        float _DamageModifier;
        float _ExperienceModifier;
        uint32 _RacialLeader;
        uint32 _MovementId;
        uint32 _RegenHealth;
        uint32 _Mechanic_immune_mask;
        uint32 _Flags_extra;
        std::string _ScriptName;
        int32 _WDBVerified;
        uint16 _Index;
        Field* _Fields;

        QueryResult _Result = WorldDatabase.PQuery(
            "SELECT * FROM `creature_template` WHERE entry = '%u';", aEntry);

        //Add the delete
        this->fCacheStream
            << "/* Step 1.1 Table  `creature_template` */\n"
            //<< "DELETE FROM `creature_template` WHERE `entry` = " << aEntry << ";\n";
            << "DELETE FROM `creature_template` WHERE `entry` = " << "@ENTRY" << ";\n";

        if ( _Result )
        {
            _Index = 0;
            _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                            //
                                            // Obtener cada uno de los parmetros de la tabla de la bd segn sus indices
            _Entry = _Fields [_Index++].GetUInt32();
            _Difficulty_entry_1 = _Fields [_Index++].GetUInt32();
            _Difficulty_entry_2 = _Fields [_Index++].GetUInt32();
            _Difficulty_entry_3 = _Fields [_Index++].GetUInt32();
            _KillCredit1 = _Fields [_Index++].GetUInt32();
            _KillCredit2 = _Fields [_Index++].GetUInt32();
            _Modelid1 = _Fields [_Index++].GetUInt32();
            _Modelid2 = _Fields [_Index++].GetUInt32();
            _Modelid3 = _Fields [_Index++].GetUInt32();
            _Modelid4 = _Fields [_Index++].GetUInt32();
            _Name = _Fields [_Index++].GetString();
            _femaleName = _Fields [_Index++].GetString();
            _Subname = _Fields [_Index++].GetString();
            TitleAlt = _Fields [_Index++].GetString();
            IconName = _Fields [_Index++].GetString();
            _Gossip_menu_id = _Fields [_Index++].GetUInt32();
            _Minlevel = _Fields [_Index++].GetUInt16();
            _Maxlevel = _Fields [_Index++].GetUInt16();
            _HealthScalingExpansion = _Fields [_Index++].GetInt32();
            RequiredExpansion = _Fields [_Index++].GetInt16();
            _VignetteID = _Fields [_Index++].GetInt16();
            _faction = _Fields [_Index++].GetUInt16();
            _Npcflag = _Fields [_Index++].GetUInt64();
            _Speed_walk = _Fields [_Index++].GetFloat();
            _Speed_run = _Fields [_Index++].GetFloat();
            _Scale = _Fields [_Index++].GetFloat();
            rank = _Fields [_Index++].GetInt8();
            _Dmgschool = _Fields [_Index++].GetInt8();
            _Baseattacktime = _Fields [_Index++].GetUInt32();
            _Rangeattacktime = _Fields [_Index++].GetUInt32();
            BaseVariance = _Fields [_Index++].GetFloat();
            RangeVariance = _Fields [_Index++].GetFloat();
            _Unit_class = _Fields [_Index++].GetUInt8();
            _Unit_flags = _Fields [_Index++].GetUInt32();
            _Unit_flags2 = _Fields [_Index++].GetUInt32();
            _Unit_flags3 = _Fields [_Index++].GetUInt32();
            _Dynamicflags = _Fields [_Index++].GetUInt32();
            _Family = _Fields [_Index++].GetUInt32();
            _Trainer_type = _Fields [_Index++].GetUInt8();
            _Trainer_class = _Fields [_Index++].GetUInt8();
            _Trainer_race = _Fields [_Index++].GetUInt8();
            _Type = _Fields [_Index++].GetUInt8();
            _Type_flags = _Fields [_Index++].GetUInt32();
            _Type_flags2 = _Fields [_Index++].GetUInt32();
            _Lootid = _Fields [_Index++].GetUInt32();
            _Pickpocketloot = _Fields [_Index++].GetUInt32();
            _Skinloot = _Fields [_Index++].GetUInt32();
            _Resistance1 = _Fields [_Index++].GetInt16();
            _Resistance2 = _Fields [_Index++].GetInt16();
            _Resistance3 = _Fields [_Index++].GetInt16();
            _Resistance4 = _Fields [_Index++].GetInt16();
            _Resistance5 = _Fields [_Index++].GetInt16();
            _Resistance6 = _Fields [_Index++].GetInt16();
            _Spell1 = _Fields [_Index++].GetUInt32();
            _Spell2 = _Fields [_Index++].GetUInt32();
            _Spell3 = _Fields [_Index++].GetUInt32();
            _Spell4 = _Fields [_Index++].GetUInt32();
            _Spell5 = _Fields [_Index++].GetUInt32();
            _Spell6 = _Fields [_Index++].GetUInt32();
            _Spell7 = _Fields [_Index++].GetUInt32();
            _Spell8 = _Fields [_Index++].GetUInt32();
            _VehicleId = _Fields [_Index++].GetUInt32();
            _Mingold = _Fields [_Index++].GetUInt32();
            _Maxgold = _Fields [_Index++].GetUInt32();
            _AIName = _Fields [_Index++].GetString();
            _MovementType = _Fields [_Index++].GetUInt8();
            _InhabitType = _Fields [_Index++].GetUInt8();
            _HoverHeight = _Fields [_Index++].GetFloat();
            _Health_mod = _Fields [_Index++].GetFloat();
            HealthModifierExtra = _Fields [_Index++].GetFloat();
            _Mana_mod = _Fields [_Index++].GetFloat();
            _Mana_mod_extra = _Fields [_Index++].GetFloat();
            _Armor_mod = _Fields [_Index++].GetFloat();
            _DamageModifier = _Fields [_Index++].GetFloat();
            _ExperienceModifier = _Fields [_Index++].GetFloat();
            _RacialLeader = _Fields [_Index++].GetUInt32();
            _MovementId = _Fields [_Index++].GetUInt32();
            _RegenHealth = _Fields [_Index++].GetBool();
            _Mechanic_immune_mask = _Fields [_Index++].GetUInt32();
            _Flags_extra = _Fields [_Index++].GetUInt32();
            _ScriptName = _Fields [_Index++].GetCString();
            _WDBVerified = _Fields [_Index++].GetInt32();


            aCreatureName = _Name;
            //
            // Agregar la query a la cache de almacenamiento.
            this->fCacheStream << "INSERT INTO `creature_template` ("
                << "`entry`, "
                << "`difficulty_entry_1`, "
                << "`difficulty_entry_2`, "
                << "`difficulty_entry_3`, "
                << "`KillCredit1`, "
                << "`KillCredit2`, "
                << "`modelid1`, "
                << "`modelid2`, "
                << "`modelid3`, "
                << "`modelid4`, "
                << "`name`, "
                << "`femaleName`, "
                << "`subname`, "
                << "`TitleAlt`, "
                << "`IconName`, "
                << "`gossip_menu_id`, "
                << "`minlevel`, "
                << "`maxlevel`, "
                << "`HealthScalingExpansion`, "
                << "`RequiredExpansion`, "
                << "`VignetteID`, "
                << "`faction`, "
                << "`npcflag`, "
                << "`speed_walk`, "
                << "`speed_run`, "
                << "`scale`, "
                << "`rank`, "
                << "`dmgschool`, "
                << "`BaseAttackTime`, "
                << "`RangeAttackTime`, "
                << "`BaseVariance`, "
                << "`RangeVariance`, "
                << "`unit_class`, "
                << "`unit_flags`, "
                << "`unit_flags2`, "
                << "`unit_flags3`, "
                << "`dynamicflags`, "
                << "`family`, "
                << "`trainer_type`, "
                << "`trainer_class`, "
                << "`trainer_race`, "
                << "`type`, "
                << "`type_flags`, "
                << "`type_flags2`, "
                << "`lootid`, "
                << "`pickpocketloot`, "
                << "`skinloot`, "
                << "`resistance1`, "
                << "`resistance2`, "
                << "`resistance3`, "
                << "`resistance4`, "
                << "`resistance5`, "
                << "`resistance6`, "
                << "`spell1`, "
                << "`spell2`, "
                << "`spell3`, "
                << "`spell4`, "
                << "`spell5`, "
                << "`spell6`, "
                << "`spell7`, "
                << "`spell8`, "
                << "`VehicleId`, "
                << "`mingold`, "
                << "`maxgold`, "
                << "`AIName`, "
                << "`MovementType`, "
                << "`InhabitType`, "
                << "`HoverHeight`, "
                << "`HealthModifier`, "
                << "`HealthModifierExtra`, "
                << "`ManaModifier`, "
                << "`ManaModifierExtra`, "
                << "`ArmorModifier`, "
                << "`DamageModifier`, "
                << "`ExperienceModifier`, "
                << "`RacialLeader`, "
                << "`movementId`, "
                << "`RegenHealth`, "
                << "`mechanic_immune_mask`, "
                << "`flags_extra`, "
                << "`ScriptName`, "
                << "`VerifiedBuild`) VALUES \n";
            //
            // Insertar los parmetros.
            this->fCacheStream
                //<< "(" << _Entry << ","
                << "(" << "@ENTRY" << ","
                << "  '" << _Difficulty_entry_1 << "',"
                << "  '" << _Difficulty_entry_2 << "',"
                << "  '" << _Difficulty_entry_3 << "',"
                << "  '" << _KillCredit1 << "',"
                << "  '" << _KillCredit2 << "',"
                << "  '" << _Modelid1 << "',"
                << "  '" << _Modelid2 << "',"
                << "  '" << _Modelid3 << "',"
                << "  '" << _Modelid4 << "',"
                << "   " << "@CREATURE" << ","
                << "  '" << this->SafeSQLParams(_femaleName) << "',"
                << "  '" << this->SafeSQLParams(_Subname) << "',"
                << "  '" << this->SafeSQLParams(TitleAlt) << "',"
                << "  '" << this->SafeSQLParams(IconName) << "',"
                << "  '" << _Gossip_menu_id << "',"
                << "  '" << _Minlevel << "',"
                << "  '" << _Maxlevel << "',"
                << "  '" << _HealthScalingExpansion << "',"//
                << "  '" << RequiredExpansion << "',"
                << "  '" << _VignetteID << "',"
                << "  '" << _faction << "',"
                << "  '" << _Npcflag << "',"
                << "  '" << _Speed_walk << "',"
                << "  '" << _Speed_run << "',"
                << "  '" << _Scale << "',"
                << "  '" << rank << "',"
                << "  '" << _Dmgschool << "',"
                << "  '" << _Baseattacktime << "',"
                << "  '" << _Rangeattacktime << "',"
                << "  '" << BaseVariance << "',"
                << "  '" << RangeVariance << "',"
                << "  '" << _Unit_class << "',"
                << "  '" << _Unit_flags << "',"
                << "  '" << _Unit_flags2 << "',"
                << "  '" << _Unit_flags3 << "',"
                << "  '" << _Dynamicflags << "',"
                << "  '" << _Family << "',"
                << "  '" << _Trainer_type << "',"
                << "  '" << _Trainer_class << "',"
                << "  '" << _Trainer_race << "',"
                << "  '" << _Type << "',"
                << "  '" << _Type_flags << "',"
                << "  '" << _Type_flags2 << "',"
                << "  '" << _Lootid << "',"
                << "  '" << _Pickpocketloot << "',"
                << "  '" << _Skinloot << "',"
                << "  '" << _Resistance1 << "',"
                << "  '" << _Resistance2 << "',"
                << "  '" << _Resistance3 << "',"
                << "  '" << _Resistance4 << "',"
                << "  '" << _Resistance5 << "',"
                << "  '" << _Resistance6 << "',"
                << "  '" << _Spell1 << "',"
                << "  '" << _Spell2 << "',"
                << "  '" << _Spell3 << "',"
                << "  '" << _Spell4 << "',"
                << "  '" << _Spell5 << "',"
                << "  '" << _Spell6 << "',"
                << "  '" << _Spell7 << "',"
                << "  '" << _Spell8 << "',"
                << "  '" << _VehicleId << "',"
                << "  '" << _Mingold << "',"
                << "  '" << _Maxgold << "',"
                << "  '" << this->SafeSQLParams(_AIName) << "',"
                << "  '" << _MovementType << "',"
                << "  '" << _InhabitType << "',"
                << "  '" << _HoverHeight << "',"
                << "  '" << _Health_mod << "',"
                << "  '" << HealthModifierExtra << "',"
                << "  '" << _Mana_mod << "',"
                << "  '" << _Mana_mod_extra << "',"
                << "  '" << _Armor_mod << "',"
                << "  '" << _DamageModifier << "',"
                << "  '" << _ExperienceModifier << "',"
                << "  '" << _RacialLeader << "',"
                << "  '" << _MovementId << "',"
                << "  '" << _RegenHealth << "',"
                << "  '" << _Mechanic_immune_mask << "',"
                << "  '" << _Flags_extra << "',"
                << "  '" << this->SafeSQLParams(_ScriptName) << "',"
                << "  '" << _WDBVerified << "');";

            //
            // Referencia a los otros valores a exportar.
            *aCreatureLootId = _Lootid;
            *aCreatureIsQuestGiver = _Npcflag;
            *aGossipMenuIdTemplate = _Gossip_menu_id;

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";

            //
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("%s's creature_template exported.", _Name.c_str());
        }
        else
            return false;
        return true;
    }
    /* NPC_TEX*/
    bool exportNpcText(uint32 aEntry)
    {
        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `npc_text` WHERE ID = '%u';", aEntry);

        //Add the delete
        this->fCacheStream
            << "/* Step 4.6 Table  `npc_text` */\n"
            << "DELETE FROM npc_text WHERE `ID` = " << aEntry << ";\n";

        if ( _Result )
        {
            bool _IsFirstTime = true;
            do {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                        //
                                                        // Obtener cada uno de los parmetros de la tabla de la bd segn sus indices
                uint32 ID = _Fields [_Index++].GetUInt32();
                float Probability0 = _Fields [_Index++].GetFloat();
                float Probability1 = _Fields [_Index++].GetFloat();
                float Probability2 = _Fields [_Index++].GetFloat();
                float Probability3 = _Fields [_Index++].GetFloat();
                float Probability4 = _Fields [_Index++].GetFloat();
                float Probability5 = _Fields [_Index++].GetFloat();
                float Probability6 = _Fields [_Index++].GetFloat();
                float Probability7 = _Fields [_Index++].GetFloat();
                uint32 BroadcastTextID0 = _Fields [_Index++].GetUInt32();
                uint32 BroadcastTextID1 = _Fields [_Index++].GetUInt32();
                uint32 BroadcastTextID2 = _Fields [_Index++].GetUInt32();
                uint32 BroadcastTextID3 = _Fields [_Index++].GetUInt32();
                uint32 BroadcastTextID4 = _Fields [_Index++].GetUInt32();
                uint32 BroadcastTextID5 = _Fields [_Index++].GetUInt32();
                uint32 BroadcastTextID6 = _Fields [_Index++].GetUInt32();
                uint32 BroadcastTextID7 = _Fields [_Index++].GetUInt32();
                uint32 VerifiedBuild = 1111;


                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `npc_text` ("
                        << "`ID`,"
                        << "`Probability0`,"
                        << "`Probability1`,"
                        << "`Probability2`,"
                        << "`Probability3`,"
                        << "`Probability4`,"
                        << "`Probability5`,"
                        << "`Probability6`,"
                        << "`Probability7`,"
                        << "`BroadcastTextID0`,"
                        << "`BroadcastTextID1`,"
                        << "`BroadcastTextID2`,"
                        << "`BroadcastTextID3`,"
                        << "`BroadcastTextID4`,"
                        << "`BroadcastTextID5`,"
                        << "`BroadcastTextID6`,"
                        << "`BroadcastTextID7`,"
                        << "`VerifiedBuild`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";

                //
                // Insertar los parmetros.
                this->fCacheStream
                    << "('" << ID << "',"
                    << " '" << Probability0 << "',"
                    << " '" << Probability1 << "',"
                    << " '" << Probability2 << "',"
                    << " '" << Probability3 << "',"
                    << " '" << Probability4 << "',"
                    << " '" << Probability5 << "',"
                    << " '" << Probability6 << "',"
                    << " '" << Probability7 << "',"
                    << " '" << BroadcastTextID0 << "',"
                    << " '" << BroadcastTextID1 << "',"
                    << " '" << BroadcastTextID2 << "',"
                    << " '" << BroadcastTextID3 << "',"
                    << " '" << BroadcastTextID4 << "',"
                    << " '" << BroadcastTextID5 << "',"
                    << " '" << BroadcastTextID6 << "',"
                    << " '" << BroadcastTextID7 << "',"
                    << " '" << VerifiedBuild << "')";

                //
                // Solo como comentario
                ;
            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    npc_text exported.");
        }
        else
            return false;
        return true;
    }


    bool exportGossipMenuOption(uint32 aGossipMenuId)
    {
        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `gossip_menu_option` WHERE MenuId = '%u';", aGossipMenuId);

        //Add the delete
        this->fCacheStream
            << "/* Step 2.7 Table  `gossip_menu_option */\n"
            << "DELETE FROM gossip_menu_option WHERE  `MenuId` = " << aGossipMenuId << ";\n";

        if (!_Result)
            return false;

        do
        {
            uint16 _Index = 0;
            Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                    //
                                                    // Obtener cada uno de los parámetros de la tabla de la bd según sus indices
            uint32 _Menu_id = uint32(_Fields [_Index++].GetUInt16());
            uint32 OptionIndex = uint32(_Fields [_Index++].GetUInt16());
            uint32 _Option_icon = _Fields [_Index++].GetUInt32();
            std::string _Option_text = _Fields [_Index++].GetString();
            uint32 OptionBroadcastTextId = uint32(_Fields [_Index++].GetUInt8());
            uint32 OptionType = _Fields [_Index++].GetUInt32();
            uint32 OptionNpcFlag = _Fields [_Index++].GetUInt32();
            uint32 VerifiedBuild = _Fields [_Index++].GetUInt32();


            //
            // Agregar la query a la cache de almacenamiento.
            this->fCacheStream
                << "INSERT INTO `gossip_menu_option` ("
                << "`MenuId`, "
                << "`OptionIndex`, "
                << "`OptionIcon`, "
                << "`OptionText`, "
                << "`OptionBroadcastTextId`, "
                << "`OptionType`, "
                << "`OptionNpcFlag`, "
                << "`VerifiedBuild`) VALUES \n";
            //
            // Insertar los parámetros.
            this->fCacheStream
                << "('" << _Menu_id << "',"
                << " '" << OptionIndex << "',"
                << " '" << _Option_icon << "',"
                << " '" << this->SafeSQLParams(_Option_text) << "',"
                << " '" << OptionBroadcastTextId << "',"
                << " '" << OptionType << "',"
                << " '" << OptionNpcFlag << "',"
                << " '" << VerifiedBuild << "');\n";

            //
            // Solo como comentario
            ;
        } while ( _Result->NextRow() );

        //
        // Seperador (solo de bonito en el fichero)
        this->fCacheStream << "\n\n";
        //
        // Notificar al usuario q se exporto las opciones de menu de una criatura.
        this->fHandler->PSendSysMessage("    gossip_menu_opcion exported.");

        return true;
    }

    bool exportGossipMenuOptionAction(uint32 aGossipMenuId)
    {
        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `gossip_menu_option_action` WHERE MenuId = '%u';", aGossipMenuId);

        //Add the delete
        this->fCacheStream
            << "/* Step 1.2 Table `gossip_menu_option_action */\n"
            << "DELETE FROM `gossip_menu_option_action` WHERE `MenuId`= " << aGossipMenuId << ";\n";

        if ( _Result )
        {
            do
            {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                uint32 MenuId = _Fields [_Index++].GetUInt32();
                uint32 OptionIndex = _Fields [_Index++].GetUInt32();
                uint32 ActionMenuId = _Fields [_Index++].GetUInt32();
                uint32 ActionPoiId = _Fields [_Index++].GetUInt32();

                //
                // Agregar la query a la cache de almacenamiento.
                this->fCacheStream
                    << "INSERT INTO `gossip_menu_option_action` ("
                    << "`MenuId`,"
                    << "`OptionIndex`,"
                    << "`ActionMenuId`,"
                    << "`ActionPoiId`) VALUES \n";
                // Insertar los parámetros.
                this->fCacheStream
                    << "('" << MenuId << "',"
                    << " '" << OptionIndex << "',"
                    << " '" << ActionMenuId << "',"
                    << " '" << ActionPoiId << "');\n";
                if ( ActionPoiId != 0 )
                    this->exportPointsOfInterest(ActionPoiId);
                if ( ActionMenuId != 0 )
                    this->exportGossipMenuOption(ActionMenuId);

            } while ( _Result->NextRow() );
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    gossip_menu_option_action exported.");
        }
        else
            return false;
        return true;

    }
    ///points_of_interest
    bool exportPointsOfInterest(uint32 ActionPoiId)
    {
        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `points_of_interest` WHERE ID = '%u';", ActionPoiId);

        //Add the delete
        this->fCacheStream
            << "/* Step 1.2 Table `points_of_interest */\n"
            << "DELETE FROM `points_of_interest` WHERE `ID`= " << ActionPoiId << ";\n";

        if ( _Result )
        {
            do
            {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                uint32 ID = _Fields [_Index++].GetUInt32();
                float PositionX = _Fields [_Index++].GetFloat();
                float PositionY = _Fields [_Index++].GetFloat();
                uint32 Icon = _Fields [_Index++].GetUInt32();
                uint32 Flags = _Fields [_Index++].GetUInt32();
                uint32 Importance = _Fields [_Index++].GetUInt32();
                std::string Name = _Fields [_Index++].GetString();
                uint32 VerifiedBuild = _Fields [_Index++].GetUInt32();

                //
                // Agregar la query a la cache de almacenamiento.
                this->fCacheStream
                    << "INSERT INTO `points_of_interest` ("
                    << "`ID`,"
                    << "`PositionX`,"
                    << "`PositionY`,"
                    << "`Icon`,"
                    << "`Flags`,"
                    << "`Importance`,"
                    << "`Name`,"
                    << "`VerifiedBuild`) VALUES \n";
                // Insertar los parámetros.
                this->fCacheStream
                    << "('" << ID << "',"
                    << "'" << PositionX << "',"
                    << "'" << PositionY << "',"
                    << "'" << Icon << "',"
                    << "'" << Flags << "',"
                    << "'" << Importance << "',"
                    << "'" << Name << "',"
                    << " '" << VerifiedBuild << "');\n";


            } while ( _Result->NextRow() );
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    points_of_interest exported.");
        }
        else
            return false;
        return true;

    }

    /// Author:  MAYOR
    /// <summary>
    /// Exportar todo lo referente a la tabla creature_equipment_id
    /// </summary>
    /// <param name="aCreatureEquipmentId">.</param>
    /// <return>Si no hay errores true, false en otro caso.</return>
    bool exportCreatureEquipTemplate(uint32 aCreatureEntry)
    {
        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `creature_equip_template` WHERE CreatureID = '%u';", aCreatureEntry);

        //Add the delete
        this->fCacheStream
            << "/* Step 1.2 Table `creature_equip_template */\n"
            << "DELETE FROM `creature_equip_template` WHERE `CreatureID`= " << aCreatureEntry << ";\n";

        if ( _Result )
        {
            uint16 _Index = 0;
            Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                    //
                                                    // Obtener cada uno de los parmetros de la tabla de la bd segn sus indices
            uint32 CreatureID = _Fields [_Index++].GetUInt32();
            uint32 ID = _Fields [_Index++].GetUInt32();
            uint32 ItemID1 = _Fields [_Index++].GetUInt32();
            uint32 AppearanceModID1 = _Fields [_Index++].GetUInt32();
            uint32 ItemVisual1 = _Fields [_Index++].GetUInt32();
            uint32 ItemID2 = _Fields [_Index++].GetUInt32();
            uint32 AppearanceModID2 = _Fields [_Index++].GetUInt32();
            uint32 ItemVisual2 = _Fields [_Index++].GetUInt32();
            uint32 ItemID3 = _Fields [_Index++].GetUInt32();
            uint32 AppearanceModID3 = _Fields [_Index++].GetUInt32();
            uint32 ItemVisual3 = _Fields [_Index++].GetUInt32();
            uint32 VerifiedBuild = _Fields [_Index++].GetUInt32();

            //
            // Agregar la query a la cache de almacenamiento.
            this->fCacheStream
                << "INSERT INTO `creature_equip_template` (`"
                << "CreatureID`, "
                << "`ID`, "
                << "`ItemID1`, "
                << "`AppearanceModID1`, "
                << "`ItemID2`, "
                << "`AppearanceModID2`, "
                << "`ItemVisual2`, "
                << "`ItemID3`, "
                << "`AppearanceModID3`, "
                << "`ItemVisual3`, "
                << "`VerifiedBuild`) VALUES \n";
            //
            // Insertar los parmetros.
            this->fCacheStream
                << "('" << CreatureID << "',"
                << " '" << ID << "',"
                << " '" << ItemID1 << "',"
                << " '" << AppearanceModID1 << "',"
                << " '" << ItemID2 << "',"
                << " '" << AppearanceModID2 << "',"
                << " '" << ItemVisual2 << "',"
                << " '" << ItemID3 << "',"
                << " '" << AppearanceModID3 << "',"
                << " '" << ItemVisual3 << "',"
                << " '" << VerifiedBuild << "');";

            // Referencia a los otros valores a exportar.
            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    creature_equip_template exported.");
        }
        else
            return false;
        return true;
    }
    /// Author:
    /// <summary>
    /// Exportar todo lo referente a la tabla npc_vendor
    /// </summary>
    /// <param name="aEntry">.</param>
    /// <return>Si no hay errores true, false en otro caso.</return>
    bool exportNPCVendor(uint32 aNPCVendor)		// se pasa el entry o el guid de la criatura
    {
        std::list<uint64> _itemsToExport;
        uint32 _rowCount = 1;

        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `npc_vendor` WHERE entry = '%u';", aNPCVendor);

        //Add the delete
        this->fCacheStream
            //<< "DELETE FROM npc_vendor WHERE  `entry` = " << aNPCVendor << ";\n";
            << "DELETE FROM npc_vendor WHERE  `entry` = " << "@ENTRY" << ";\n";

        if ( _Result )
        {
            bool _IsFirstTime = true;
            uint32 entry;
            int slot;
            int32 item;
            uint32 maxcount;
            uint32 incrtime;
            uint32 ExtendedCost;
            int64 OverrideGoldCost;
            uint32 type;
            std::string BonusListIDs;
            uint32 PlayerConditionID;
            uint32 IgnoreFiltering;
            uint16 _Index;
            Field* _Fields;		// Materializar la fila en un objeto

            uint32 VerifiedBuild;
            do {

                _Index = 0;
                _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                VendorItem vItem;
                //uint16 VendorGld = vItem.OverrideGoldCost;

                //
                // Obtener cada uno de los parmetros de la tabla de la bd segn sus indices
                entry = _Fields [_Index++].GetUInt32();
                slot = _Fields [_Index++].GetInt16();
                item = _Fields [_Index++].GetInt32();
                maxcount = _Fields [_Index++].GetUInt32();
                incrtime = _Fields [_Index++].GetUInt32();
                ExtendedCost = _Fields [_Index++].GetUInt32();
                OverrideGoldCost = _Fields [_Index++].GetInt64();
                type = _Fields [_Index++].GetUInt32();
                BonusListIDs = _Fields [_Index++].GetString();
                PlayerConditionID = _Fields [_Index++].GetUInt32();
                IgnoreFiltering = _Fields [_Index++].GetUInt32();
                VerifiedBuild = _Fields [_Index++].GetUInt32();

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `npc_vendor` ("
                        << "`entry`,"
                        << "`slot`,"
                        << "`item`,"
                        << "`maxcount`,"
                        << "`incrtime`,"
                        << "`ExtendedCost`,"
                        << "`OverrideGoldCost`,"
                        << "`type`,"
                        << "`BonusListIDs`,"
                        << "`PlayerConditionID`,"
                        << "`IgnoreFiltering`,"
                        << "`VerifiedBuild`) VALUES \n";
                }

                //
                // Insertar los parmetros.
                this->fCacheStream
                    //<< "('" << entry << "',"
                    << "(" << "@ENTRY" << ","
                    << " '" << slot << "',"
                    << " '" << item << "',"
                    << " '" << maxcount << "',"
                    << " '" << incrtime << "',"
                    << " '" << ExtendedCost << "',"
                    << " '" << OverrideGoldCost << "',"
                    << " '" << type << "',"
                    << " '" << BonusListIDs << "',"
                    << " '" << PlayerConditionID << "',"
                    << " '" << IgnoreFiltering << "',"
                    << " '" << VerifiedBuild << "')";

                //
                //
                if ( _Result->GetRowCount() == _rowCount )
                    this->fCacheStream << "; ";
                else
                    this->fCacheStream << ", ";

                //
                // Solo como comentario
                this->fCacheStream << "  /* Item(" << item << "): " << this->GetIntemName(item, true) << ", ItemLevel: " << GetItemLevel(item).str().c_str() << ", RequiredLevel: " << GetRequiredLevel(item).str().c_str() << ", ItemQuality: " << GetItemQuality(item) << " */\n";
                //
                // exportar los items
                _itemsToExport.push_back(item);
                //
                _rowCount++;
            } while ( _Result->NextRow() );

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //

            //

            // Clear the list.
            _itemsToExport.clear();

            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    creature_npc_vendors exported.");
        }
        else
            return false;
        return true;
    }
    /// Author:
    /// <summary>
    /// Exportar todo lo referente a la tabla npc_trainer
    /// </summary>
    /// <param name="aEntry">.</param>
    /// <return>Si no hay errores true, false en otro caso.</return>
    bool exportNPCTrainer(uint32 aNPCTrainer)
    {
        uint32 _rowCount = 1;

        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `npc_trainer` WHERE ID = '%u';", aNPCTrainer);

        //Add the delete
        this->fCacheStream
            //<< "DELETE FROM npc_trainer WHERE `entry` = " << aNPCTrainer << ";\n";
            << "DELETE FROM npc_trainer WHERE `ID` = " << "@ENTRY" << ";\n";

        if ( _Result )
        {
            bool _IsFirstTime = true;
            do {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                        //
                                                        // Obtener cada uno de los parmetros de la tabla de la bd segn sus indices
                uint32 ID = _Fields [_Index++].GetUInt32();
                int32  SpellID = _Fields [_Index++].GetInt32();
                uint32 MoneyCost = _Fields [_Index++].GetUInt32();
                uint32 ReqSkillLine = _Fields [_Index++].GetUInt32();
                uint32 ReqSkillRank = _Fields [_Index++].GetUInt32();
                uint32 ReqLevel = _Fields [_Index++].GetUInt32();
                uint32 Index = _Fields [_Index++].GetUInt32();

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `npc_trainer` ("
                        << "`ID`, "
                        << "`SpellID`, "
                        << "`MoneyCost`, "
                        << "`ReqSkillLine`, "
                        << "`ReqSkillRank`, "
                        << "`ReqLevel`, "
                        << "`Index`) VALUES \n";
                }

                //
                // Insertar los parmetros.
                this->fCacheStream
                    //<< "('" << entry << "',"
                    << "(" << ID << ","
                    << " '" << SpellID << "',"
                    << " '" << MoneyCost << "',"
                    << " '" << ReqSkillLine << "',"
                    << " '" << ReqSkillRank << "',"
                    << " '" << ReqLevel << "',"
                    << " '" << Index << "')";

                //
                //
                if ( _Result->GetRowCount() == _rowCount )
                    this->fCacheStream << "; ";
                else
                    this->fCacheStream << ", ";

                //
                // Solo como comentario
                this->fCacheStream << " /*" << " Spell(" << SpellID << "): " /*<< GetSpellNameByEntry(SpellID)*/ << "*/\n";

                //
                //
                _rowCount++;
            } while ( _Result->NextRow() );

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    npc_trainer exported.");
        }
        else
            return false;
        return true;
    }

    /// Author:
    /// <summary>
    /// Exportar todo lo referente a la tabla creature_text
    /// </summary>
    /// <modify by="Lester">Cambie NULO por guid </modify>
    /// <param name="aEntry">.</param>
    /// <return>Si no hay errores true, false en otro caso.</return>
    bool exportCreature(uint32 aEntry)
    {
        // Extra data Struct
        struct guidExportEntry
        {
            uint64 guid;
            uint32 pHmS;
            uint32 cMap;
            float  posX;
            float  posY;
            float  posZ;
        };

        // Extra data vector
        std::vector<guidExportEntry> _guidExportVector;
        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `creature` WHERE id = '%u' ORDER BY `areaId`;", aEntry);

        //Add the delete
        this->fCacheStream
            << "/* Step 1.7 Table  `creature */\n"
            << "DELETE FROM creature WHERE  `id` = " << "@ENTRY" << ";\n";

        if ( _Result )
        {
            bool _IsFirstTime = true;
            uint64 _Rows = _Result->GetRowCount();

            do
            {

                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                ObjectGuid::LowType guid = _Fields [_Index++].GetUInt64();
                CreatureData const* data = sObjectMgr->GetCreatureData(guid);

                //uint32 spawnDifficulties = data->spawnDifficulties;
                //uint32 map       = data->mapid;

                uint32 id = uint32(_Fields [_Index++].GetUInt32());
                uint32 map = uint32(_Fields [_Index++].GetUInt16());
                uint32 zoneId = uint32(_Fields [_Index++].GetUInt16());
                uint32 areaId = uint32(_Fields [_Index++].GetUInt16());
                uint64 spawnDifficulties = _Fields [_Index++].GetUInt64();
                uint32 phaseUseFlags = _Fields [_Index++].GetUInt32();
                uint32 PhaseId = _Fields [_Index++].GetUInt32();
                uint32 PhaseGroup = _Fields [_Index++].GetUInt32();
                int32 terrainSwapMap = _Fields [_Index++].GetInt32();
                uint32 modelid = _Fields [_Index++].GetUInt32();
                int32  equipment_id = _Fields [_Index++].GetUInt32();
                float  position_x = _Fields [_Index++].GetFloat();
                float  position_y = _Fields [_Index++].GetFloat();
                float  position_z = _Fields [_Index++].GetFloat();
                float  orientation = _Fields [_Index++].GetFloat();
                uint32 spawntimesecs = _Fields [_Index++].GetUInt32();
                float  spawndist = _Fields [_Index++].GetFloat();
                uint32 currentwaypoint = _Fields [_Index++].GetUInt32();
                uint32 curhealth = _Fields [_Index++].GetUInt32();
                uint32 curmana = _Fields [_Index++].GetUInt32();
                uint32 MovementType = uint32(_Fields [_Index++].GetUInt8());
                uint32 npcflag = _Fields [_Index++].GetUInt32();
                uint32 unit_flags = _Fields [_Index++].GetUInt32();
                uint32 unit_flags2 = _Fields [_Index++].GetUInt32();
                uint32 unit_flags3 = _Fields [_Index++].GetUInt32();
                uint32 dynamicflags = _Fields [_Index++].GetUInt32();
                std::string ScriptName = _Fields [_Index++].GetString();
                uint32 VerifiedBuild = _Fields [_Index++].GetUInt32();


                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `creature` ("
                        << " `guid`,"
                        << " `id`,"
                        << " `map`,"
                        << " `zoneId`,"
                        << " `areaId`,"
                        << " `spawnDifficulties`,"
                        << " `phaseUseFlags`,"
                        << " `PhaseId`,"
                        << " `PhaseGroup`,"
                        << " `terrainSwapMap`,"
                        << " `modelid`,"
                        << " `equipment_id`,"
                        << " `position_x`,"
                        << " `position_y`,"
                        << " `position_z`,"
                        << " `orientation`,"
                        << " `spawntimesecs`,"
                        << " `spawndist`,"
                        << " `currentwaypoint`,"
                        << " `curhealth`,"
                        << " `curmana`,"
                        << " `MovementType`,"
                        << " `npcflag`,"
                        << " `unit_flags`,"
                        << " `unit_flags2`,"
                        << " `unit_flags3`,"
                        << " `dynamicflags`,"
                        << " `ScriptName`,"
                        << "`VerifiedBuild`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";

                this->fCacheStream
                    // Insertar los par?metros.
                    << "(" << guid << ","
                    << " " << "@ENTRY" << ","
                    << " '" << map << "',"
                    << " '" << this->GetZoneOrAreaID(map, position_x, position_y, position_z, true) << "',"
                    << " '" << this->GetZoneOrAreaID(map, position_x, position_y, position_z, false) << "',"
                    << " '" << spawnDifficulties << "',"
                    << " '" << phaseUseFlags << "',"
                    << " '" << PhaseId << "',"
                    << " '" << PhaseGroup << "',"
                    << " '" << terrainSwapMap << "',"
                    << " '" << modelid << "',"
                    << " '" << equipment_id << "',"
                    << " '" << position_x << "',"
                    << " '" << position_y << "',"
                    << " '" << position_z << "',"
                    << " '" << orientation << "',"
                    << " '" << spawntimesecs << "',"
                    << " '" << spawndist << "',"
                    << " '" << currentwaypoint << "',"
                    << " '" << curhealth << "',"
                    << " '" << curmana << "',"
                    << " '" << MovementType << "',"
                    << " '" << npcflag << "',"
                    << " '" << unit_flags << "',"
                    << " '" << unit_flags2 << "',"
                    << " '" << unit_flags3 << "',"
                    << " '" << dynamicflags << "',"
                    << " '" << ScriptName << "',"
                    << " '" << VerifiedBuild << "')";


                //this->fCacheStream << "; \n\n";

                /*Extra DATA*/
                guidExportEntry _cd;
                {
                    _cd.guid = guid;
                    _cd.pHmS = PhaseId;
                    _cd.cMap = map;
                    _cd.posX = position_x;
                    _cd.posY = position_y;
                    _cd.posZ = position_z;
                }
                //Fill the data vector.
                _guidExportVector.push_back(_cd);


            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n\n";

            // Exportar los datos relacionados al GUID de la creatura.
            for ( auto cguid : _guidExportVector )
            {
                //
                // Exportar las creature_addon referente a dicha creature
                this->exportCreatureAddon(cguid.guid, cguid.pHmS, cguid.cMap, cguid.posX, cguid.posY, cguid.posZ);
                //
                // Exportar lo referente a creature formations
                this->exportCreatureFormations(cguid.guid, cguid.pHmS, cguid.cMap, cguid.posX, cguid.posY, cguid.posZ);
            }
            //Clear the list.
            _guidExportVector.clear();
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";

            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    creature exported.");
        }
        else
            return false;
        return true;
    }

    /// Author: Lester Pastrana
    /// <summary>
    /// Exportar todo lo referente a la tabla creature_addon
    /// </summary>
    /// <param name="aCreatureGuid">.</param>
    /// <return>Si no hay errores true, false en otro caso.</return>
    bool exportCreatureAddon(uint32 aCreatureGuid, uint32 aPhaseMask, uint32 aMap, float aPosition_x, float aPosition_y, float aPosition_z)
    {
        std::list<uint64> _wayPointsToExport;

        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM creature_addon WHERE guid = '%u';", aCreatureGuid);

        //Add the delete
        this->fCacheStream

            << "/* Step 2.8 Table  `creature_addon` */\n"
            << "SET @GUID := (SELECT `guid` FROM `creature` WHERE "
            << "`position_x` REGEXP '" << aPosition_x << "' AND "
            << "`position_y` REGEXP '" << aPosition_y << "' AND "
            << "`position_z` REGEXP '" << aPosition_z << "' AND "
            << "`PhaseId` = '" << aPhaseMask << "' AND "
            << "`map` = '" << aMap << "');\n"
            << "DELETE FROM `creature_addon` WHERE `guid` = @GUID;\n";


        if ( _Result )
        {
            bool _IsFirstTime = true;
            do {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                        //
                                                        // Obtener cada uno de los par?metros de la tabla de la bd seg?n sus indices
                ObjectGuid::LowType guid = _Fields [_Index++].GetUInt64();
                uint32 path_id = _Fields [_Index++].GetUInt32();
                uint16 mount = _Fields [_Index++].GetUInt16();
                uint32 bytes1 = _Fields [_Index++].GetUInt32();
                uint32 bytes2 = _Fields [_Index++].GetUInt32();
                uint32 emote = _Fields [_Index++].GetUInt32();
                uint32 aiAnimKit = _Fields [_Index++].GetUInt32();
                uint32 movementAnimKit = _Fields [_Index++].GetUInt32();
                uint32 meleeAnimKit = _Fields [_Index++].GetUInt32();
                std::string auras = _Fields [_Index++].GetString();

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `creature_addon` ("
                        << "`guid`,"
                        << "`path_id`,"
                        << "`mount`,"
                        << "`bytes1`,"
                        << "`bytes2`,"
                        << "`emote`,"
                        << "`aiAnimKit`,"
                        << "`movementAnimKit`,"
                        << "`meleeAnimKit`,"
                        << "`auras`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";
                //
                // Insertar los par?metros.
                this->fCacheStream
                    << "(" << "@GUID" << ",";
                //
                // Insertar GUID si tiene path
                if ( path_id != 0 )
                {
                    this->fCacheStream
                        << " " << "@GUID" << ",";
                }
                else
                {
                    this->fCacheStream
                        << " '" << path_id << "',";
                }
                //
                this->fCacheStream
                    << " '" << mount << "',"
                    << " '" << bytes1 << "',"
                    << " '" << bytes2 << "',"
                    << " '" << emote << "',"
                    << " '" << aiAnimKit << "',"
                    << " '" << movementAnimKit << "',"
                    << " '" << meleeAnimKit << "',"
                    << " '" << this->SafeSQLParams(auras) << "')";

                //
                // Solo como comentario
                ;
                // Llenar la lista para Exportar los Waypoint Data que tenga la creatura por Creature addon
                if ( path_id != 0 )
                    _wayPointsToExport.push_back(path_id);
            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n\n";

            // Exportar los datos relacionados al GUID de la creatura.
            for ( auto _cway : _wayPointsToExport )
            {

                // Exportar los Waypoint Data que tenga la creatura por Creature addon
                this->exportWaypointData(_cway, aPhaseMask, aMap, aPosition_x, aPosition_y, aPosition_z);
            }
            // Clear the list.
            _wayPointsToExport.clear();

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";

            //
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    creature_addon exported.");
        }
        else
            return false;
        return true;
    }

    /// Author: Boris Cabrera
    /// <summary>
    /// Exportar todo lo referente a la tabla creature_formations
    /// </summary>
    /// <param name="aCreatureFormations">.</param>
    /// <return>Si no hay errores true, false en otro caso.</return>
    bool exportCreatureFormations(uint32 aCreatureFormations, uint32 aPhaseMask, uint32 aMap, float aPosition_x, float aPosition_y, float aPosition_z)
    {
        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `creature_formations` WHERE leaderGUID = '%u';", aCreatureFormations);

        //Add the delete
        this->fCacheStream
            << "/* Step 3.1 Table  `creature_formations` */\n"
            << "SET @GUID := (SELECT `guid` FROM `creature` WHERE "
            << "`position_x` REGEXP '" << aPosition_x << "' AND "
            << "`position_y` REGEXP '" << aPosition_y << "' AND "
            << "`position_z` REGEXP '" << aPosition_z << "' AND "
            << "`PhaseId` = '" << aPhaseMask << "' AND "
            << "`map` = '" << aMap << "');\n"
            << "DELETE FROM  `creature_formations` WHERE `leaderGUID` = @GUID;\n";


        if ( _Result )
        {
            bool _IsFirstTime = true;
            do {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                        //
                                                        // Obtener cada uno de los par?metros de la tabla de la bd seg?n sus indices
                ObjectGuid::LowType leaderGUID = _Fields [_Index++].GetUInt64();
                uint32 memberGUID = _Fields [_Index++].GetUInt32();
                float  dist = _Fields [_Index++].GetFloat();
                float  angle = _Fields [_Index++].GetFloat();
                uint32 groupAI = _Fields [_Index++].GetUInt32();
                uint32 point_1 = uint32(_Fields [_Index++].GetUInt16());
                uint32 point_2 = uint32(_Fields [_Index++].GetUInt16());

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `creature_formations` ("
                        << "`leaderGUID`,"
                        << "`memberGUID`,"
                        << "`dist`,"
                        << "`angle`,"
                        << "`groupAI`,"
                        << "`point_1`,"
                        << "`point_2`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";

                //
                // Insertar los par?metros.
                this->fCacheStream
                    << "(" << "@GUID" << ","
                    << " '" << memberGUID << "',"
                    << " '" << dist << "',"
                    << " '" << angle << "',"
                    << " '" << groupAI << "',"
                    << " '" << point_1 << "',"
                    << " '" << point_2 << "')";

                //
                // Solo como comentario
                //
            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    creature_formations exported.");
        }
        else
            return false;
        return true;
    }

    bool exportQuestTemplate(uint32 aEntry, std::string &aQuestName)
    {
        uint16 _Index = 0;
        Field* _Fields;	// Materializar la fila en un objeto

        int32 ID;
        int32 QuestType;
        int32 QuestLevel;
        int32 MaxScalingLevel;
        int32 QuestPackageID;
        int32 MinLevel;
        int32  QuestSortID;
        int32 QuestInfoID;
        int32 SuggestedGroupNum;
        int32 RewardNextQuest;
        int32 RewardXPDifficulty;
        float  RewardXPMultiplier;
        int32 RewardMoney;
        int32 RewardMoneyDifficulty;
        float  RewardMoneyMultiplier;
        int32 RewardBonusMoney;
        int32 RewardDisplaySpell1;
        int32 RewardDisplaySpell2;
        int32 RewardDisplaySpell3;
        int32 RewardSpell;
        int32 RewardHonor;
        int32 RewardKillHonor;
        uint32 StartItem;
        uint32 RewardArtifactXPDifficulty;
        float RewardArtifactXPMultiplier;
        uint32 RewardArtifactCategoryID;
        uint32 Flags;
        uint32 FlagsEx;
        uint32 RewardItem1;
        uint32 RewardAmount1;
        uint32 RewardItem2;
        uint32 RewardAmount2;
        uint32 RewardItem3;
        uint32 RewardAmount3;
        uint32 RewardItem4;
        uint32 RewardAmount4;
        uint32 ItemDrop1;
        uint32 ItemDropQuantity1;
        uint32 ItemDrop2;
        uint32 ItemDropQuantity2;
        uint32 ItemDrop3;
        uint32 ItemDropQuantity3;
        uint32 ItemDrop4;
        uint32 ItemDropQuantity4;
        uint32 RewardChoiceItemID1;
        uint32 RewardChoiceItemQuantity1;
        uint32 RewardChoiceItemDisplayID1;
        uint32 RewardChoiceItemID2;
        uint32 RewardChoiceItemQuantity2;
        uint32 RewardChoiceItemDisplayID2;
        uint32 RewardChoiceItemID3;
        uint32 RewardChoiceItemQuantity3;
        uint32 RewardChoiceItemDisplayID3;
        uint32 RewardChoiceItemID4;
        uint32 RewardChoiceItemQuantity4;
        uint32 RewardChoiceItemDisplayID4;
        uint32 RewardChoiceItemID5;
        uint32 RewardChoiceItemQuantity5;
        uint32 RewardChoiceItemDisplayID5;
        uint32 RewardChoiceItemID6;
        uint32 RewardChoiceItemQuantity6;
        uint32 RewardChoiceItemDisplayID6;
        uint32 POIContinent;
        float  POIx;
        float  POIy;
        uint32 POIPriority;
        uint32 RewardTitle;
        uint32 RewardArenaPoints;
        uint32 RewardSkillLineID;
        uint32 RewardNumSkillUps;
        uint32 PortraitGiver;
        uint32 PortraitTurnIn;
        uint32 RewardFactionID1;
        uint32 RewardFactionValue1;
        uint32 RewardFactionOverride1;
        uint32 RewardFactionCapIn1;
        uint32 RewardFactionID2;
        uint32 RewardFactionValue2;
        uint32 RewardFactionOverride2;
        uint32 RewardFactionCapIn2;
        uint32 RewardFactionID3;
        uint32 RewardFactionValue3;
        uint32 RewardFactionOverride3;
        uint32 RewardFactionCapIn3;
        uint32 RewardFactionID4;
        uint32 RewardFactionValue4;
        uint32 RewardFactionOverride4;
        uint32 RewardFactionCapIn4;
        uint32 RewardFactionID5;
        uint32 RewardFactionValue5;
        uint32 RewardFactionOverride5;
        uint32 RewardFactionCapIn5;
        uint32 RewardFactionFlags;
        uint32 RewardCurrencyID1;
        uint32 RewardCurrencyQty1;
        uint32 RewardCurrencyID2;
        uint32 RewardCurrencyQty2;
        uint32 RewardCurrencyID3;
        uint32 RewardCurrencyQty3;
        uint32 RewardCurrencyID4;
        uint32 RewardCurrencyQty4;
        uint32 AcceptedSoundKitID;
        uint32 CompleteSoundKitID;
        uint32 AreaGroupID;
        uint32 TimeAllowed;
        uint64 AllowableRaces = UI64LIT(0xFFFFFFFFFFFFFFFF);
        uint32 QuestRewardID;
        uint32 Expansion;
        std::string LogTitle;
        std::string LogDescription;
        std::string QuestDescription;
        std::string AreaDescription;
        std::string PortraitGiverText;
        std::string PortraitGiverName;
        std::string PortraitTurnInText;
        std::string PortraitTurnInName;
        std::string QuestCompletionLog;
        uint32 VerifiedBuild;

        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `quest_template` WHERE Id = '%u';", aEntry);

        //Add the delete
        this->fCacheStream
            << "/* Step 1.1 Table  `quest_template` */\n"
            << "DELETE FROM  `quest_template` WHERE `Id` = " << aEntry << ";\n";

        if ( _Result )
        {
            bool _IsFirstTime = true;
            do
            {
                _Index = 0;
                _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                ID = _Fields [_Index++].GetInt32();
                QuestType = _Fields [_Index++].GetUInt8();
                QuestLevel = _Fields [_Index++].GetInt32();
                MaxScalingLevel = _Fields [_Index++].GetUInt8();
                QuestPackageID = _Fields [_Index++].GetInt32();
                MinLevel = _Fields [_Index++].GetInt32();
                QuestSortID = _Fields [_Index++].GetInt16();
                QuestInfoID = _Fields [_Index++].GetUInt16();
                SuggestedGroupNum = _Fields [_Index++].GetUInt8();
                RewardNextQuest = _Fields [_Index++].GetUInt32();
                RewardXPDifficulty = _Fields [_Index++].GetUInt32();
                RewardXPMultiplier = _Fields [_Index++].GetFloat();
                RewardMoney = _Fields [_Index++].GetUInt32();
                RewardMoneyDifficulty = _Fields [_Index++].GetUInt32();
                RewardMoneyMultiplier = _Fields [_Index++].GetFloat();
                RewardBonusMoney = _Fields [_Index++].GetUInt32();
                RewardDisplaySpell1 = _Fields [_Index++].GetUInt32();
                RewardDisplaySpell2 = _Fields [_Index++].GetUInt32();
                RewardDisplaySpell3 = _Fields [_Index++].GetUInt32();
                RewardSpell = _Fields [_Index++].GetUInt32();
                RewardHonor = _Fields [_Index++].GetUInt32();
                RewardKillHonor = _Fields [_Index++].GetUInt32();
                StartItem = _Fields [_Index++].GetUInt32();
                RewardArtifactXPDifficulty = _Fields [_Index++].GetUInt32();
                RewardArtifactXPMultiplier = _Fields [_Index++].GetFloat();
                RewardArtifactCategoryID = _Fields [_Index++].GetUInt32();
                Flags = _Fields [_Index++].GetUInt32();
                FlagsEx = _Fields [_Index++].GetUInt32();
                RewardItem1 = _Fields [_Index++].GetUInt32();
                RewardAmount1 = _Fields [_Index++].GetUInt32();
                RewardItem2 = _Fields [_Index++].GetUInt32();
                RewardAmount2 = _Fields [_Index++].GetUInt32();
                RewardItem3 = _Fields [_Index++].GetUInt32();
                RewardAmount3 = _Fields [_Index++].GetUInt32();
                RewardItem4 = _Fields [_Index++].GetUInt32();
                RewardAmount4 = _Fields [_Index++].GetUInt32();
                ItemDrop1 = _Fields [_Index++].GetUInt32();
                ItemDropQuantity1 = _Fields [_Index++].GetUInt32();
                ItemDrop2 = _Fields [_Index++].GetUInt32();
                ItemDropQuantity2 = _Fields [_Index++].GetUInt32();
                ItemDrop3 = _Fields [_Index++].GetUInt32();
                ItemDropQuantity3 = _Fields [_Index++].GetUInt32();
                ItemDrop4 = _Fields [_Index++].GetUInt32();
                ItemDropQuantity4 = _Fields [_Index++].GetUInt32();
                RewardChoiceItemID1 = _Fields [_Index++].GetUInt32();
                RewardChoiceItemQuantity1 = _Fields [_Index++].GetUInt32();
                RewardChoiceItemDisplayID1 = _Fields [_Index++].GetUInt32();
                RewardChoiceItemID2 = _Fields [_Index++].GetUInt32();
                RewardChoiceItemQuantity2 = _Fields [_Index++].GetUInt32();
                RewardChoiceItemDisplayID2 = _Fields [_Index++].GetUInt32();
                RewardChoiceItemID3 = _Fields [_Index++].GetUInt32();
                RewardChoiceItemQuantity3 = _Fields [_Index++].GetUInt32();
                RewardChoiceItemDisplayID3 = _Fields [_Index++].GetUInt32();
                RewardChoiceItemID4 = _Fields [_Index++].GetUInt32();
                RewardChoiceItemQuantity4 = _Fields [_Index++].GetUInt32();
                RewardChoiceItemDisplayID4 = _Fields [_Index++].GetUInt32();
                RewardChoiceItemID5 = _Fields [_Index++].GetUInt32();
                RewardChoiceItemQuantity5 = _Fields [_Index++].GetUInt32();
                RewardChoiceItemDisplayID5 = _Fields [_Index++].GetUInt32();
                RewardChoiceItemID6 = _Fields [_Index++].GetUInt32();
                RewardChoiceItemQuantity6 = _Fields [_Index++].GetUInt32();
                RewardChoiceItemDisplayID6 = _Fields [_Index++].GetUInt32();
                POIContinent = _Fields [_Index++].GetUInt32();
                POIx = _Fields [_Index++].GetFloat();
                POIy = _Fields [_Index++].GetFloat();
                POIPriority = _Fields [_Index++].GetUInt32();
                RewardTitle = _Fields [_Index++].GetUInt32();
                RewardArenaPoints = _Fields [_Index++].GetUInt32();
                RewardSkillLineID = _Fields [_Index++].GetUInt32();
                RewardNumSkillUps = _Fields [_Index++].GetUInt32();
                PortraitGiver = _Fields [_Index++].GetUInt32();
                PortraitTurnIn = _Fields [_Index++].GetUInt32();
                RewardFactionID1 = _Fields [_Index++].GetUInt32();
                RewardFactionValue1 = _Fields [_Index++].GetUInt32();
                RewardFactionOverride1 = _Fields [_Index++].GetUInt32();
                RewardFactionCapIn1 = _Fields [_Index++].GetUInt32();
                RewardFactionID2 = _Fields [_Index++].GetUInt32();
                RewardFactionValue2 = _Fields [_Index++].GetUInt32();
                RewardFactionOverride2 = _Fields [_Index++].GetUInt32();
                RewardFactionCapIn2 = _Fields [_Index++].GetUInt32();
                RewardFactionID3 = _Fields [_Index++].GetUInt32();
                RewardFactionValue3 = _Fields [_Index++].GetUInt32();
                RewardFactionOverride3 = _Fields [_Index++].GetUInt32();
                RewardFactionCapIn3 = _Fields [_Index++].GetUInt32();
                RewardFactionID4 = _Fields [_Index++].GetUInt32();
                RewardFactionValue4 = _Fields [_Index++].GetUInt32();
                RewardFactionOverride4 = _Fields [_Index++].GetUInt32();
                RewardFactionCapIn4 = _Fields [_Index++].GetUInt32();
                RewardFactionID5 = _Fields [_Index++].GetUInt32();
                RewardFactionValue5 = _Fields [_Index++].GetUInt32();
                RewardFactionOverride5 = _Fields [_Index++].GetUInt32();
                RewardFactionCapIn5 = _Fields [_Index++].GetUInt32();
                RewardFactionFlags = _Fields [_Index++].GetUInt32();
                RewardCurrencyID1 = _Fields [_Index++].GetUInt32();
                RewardCurrencyQty1 = _Fields [_Index++].GetUInt32();
                RewardCurrencyID2 = _Fields [_Index++].GetUInt32();
                RewardCurrencyQty2 = _Fields [_Index++].GetUInt32();
                RewardCurrencyID3 = _Fields [_Index++].GetUInt32();
                RewardCurrencyQty3 = _Fields [_Index++].GetUInt32();
                RewardCurrencyID4 = _Fields [_Index++].GetUInt32();
                RewardCurrencyQty4 = _Fields [_Index++].GetUInt32();
                AcceptedSoundKitID = _Fields [_Index++].GetUInt32();
                CompleteSoundKitID = _Fields [_Index++].GetUInt32();
                AreaGroupID = _Fields [_Index++].GetUInt32();
                TimeAllowed = _Fields [_Index++].GetUInt32();
                AllowableRaces = _Fields [_Index++].GetUInt64();
                QuestRewardID = _Fields [_Index++].GetUInt32();
                Expansion = _Fields [_Index++].GetUInt32();
                LogTitle = aQuestName = _Fields [_Index++].GetString();
                LogDescription = _Fields [_Index++].GetString();
                QuestDescription = _Fields [_Index++].GetString();
                AreaDescription = _Fields [_Index++].GetString();
                PortraitGiverText = _Fields [_Index++].GetString();
                PortraitGiverName = _Fields [_Index++].GetString();
                PortraitTurnInText = _Fields [_Index++].GetString();
                PortraitTurnInName = _Fields [_Index++].GetString();
                QuestCompletionLog = _Fields [_Index++].GetString();
                VerifiedBuild = _Fields [_Index++].GetUInt32();

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `quest_template` ("
                        << "`ID`, "
                        << "`QuestType`, "
                        << "`QuestLevel`, "
                        << "`MaxScalingLevel`, "
                        << "`QuestPackageID`, "
                        << "`MinLevel`, "
                        << "`QuestSortID`, "
                        << "`QuestInfoID`, "
                        << "`SuggestedGroupNum`, "
                        << "`RewardNextQuest`, "
                        << "`RewardXPDifficulty`, "
                        << "`RewardXPMultiplier`, "
                        << "`RewardMoney`, "
                        << "`RewardMoneyDifficulty`, "
                        << "`RewardMoneyMultiplier`, "
                        << "`RewardBonusMoney`, "
                        << "`RewardDisplaySpell1`, "
                        << "`RewardDisplaySpell2`, "
                        << "`RewardDisplaySpell3`, "
                        << "`RewardSpell`, "
                        << "`RewardHonor`, "
                        << "`RewardKillHonor`, "
                        << "`StartItem`, "
                        << "`RewardArtifactXPDifficulty`, "
                        << "`RewardArtifactXPMultiplier`, "
                        << "`RewardArtifactCategoryID`, "
                        << "`Flags`, "
                        << "`FlagsEx`, "
                        << "`RewardItem1`, "
                        << "`RewardAmount1`, "
                        << "`RewardItem2`, "
                        << "`RewardAmount2`, "
                        << "`RewardItem3`, "
                        << "`RewardAmount3`, "
                        << "`RewardItem4`, "
                        << "`RewardAmount4`, "
                        << "`ItemDrop1`, "
                        << "`ItemDropQuantity1`, "
                        << "`ItemDrop2`, "
                        << "`ItemDropQuantity2`, "
                        << "`ItemDrop3`, "
                        << "`ItemDropQuantity3`, "
                        << "`ItemDrop4`, "
                        << "`ItemDropQuantity4`, "
                        << "`RewardChoiceItemID1`, "
                        << "`RewardChoiceItemQuantity1`, "
                        << "`RewardChoiceItemDisplayID1`, "
                        << "`RewardChoiceItemID2`, "
                        << "`RewardChoiceItemQuantity2`, "
                        << "`RewardChoiceItemDisplayID2`, "
                        << "`RewardChoiceItemID3`, "
                        << "`RewardChoiceItemQuantity3`, "
                        << "`RewardChoiceItemDisplayID3`, "
                        << "`RewardChoiceItemID4`, "
                        << "`RewardChoiceItemQuantity4`, "
                        << "`RewardChoiceItemDisplayID4`, "
                        << "`RewardChoiceItemID5`, "
                        << "`RewardChoiceItemQuantity5`, "
                        << "`RewardChoiceItemDisplayID5`, "
                        << "`RewardChoiceItemID6`, "
                        << "`RewardChoiceItemQuantity6`, "
                        << "`RewardChoiceItemDisplayID6`, "
                        << "`POIContinent`, "
                        << "`POIx`, "
                        << "`POIy`, "
                        << "`POIPriority`, "
                        << "`RewardTitle`, "
                        << "`RewardArenaPoints`, "
                        << "`RewardSkillLineID`, "
                        << "`RewardNumSkillUps`, "
                        << "`PortraitGiver`, "
                        << "`PortraitTurnIn`, "
                        << "`RewardFactionID1`, "
                        << "`RewardFactionValue1`, "
                        << "`RewardFactionOverride1`, "
                        << "`RewardFactionCapIn1`, "
                        << "`RewardFactionID2`, "
                        << "`RewardFactionValue2`, "
                        << "`RewardFactionOverride2`, "
                        << "`RewardFactionCapIn2`, "
                        << "`RewardFactionID3`, "
                        << "`RewardFactionValue3`, "
                        << "`RewardFactionOverride3`, "
                        << "`RewardFactionCapIn3`, "
                        << "`RewardFactionID4`, "
                        << "`RewardFactionValue4`, "
                        << "`RewardFactionOverride4`, "
                        << "`RewardFactionCapIn4`, "
                        << "`RewardFactionID5`, "
                        << "`RewardFactionValue5`, "
                        << "`RewardFactionOverride5`, "
                        << "`RewardFactionCapIn5`, "
                        << "`RewardFactionFlags`, "
                        << "`RewardCurrencyID1`, "
                        << "`RewardCurrencyQty1`, "
                        << "`RewardCurrencyID2`, "
                        << "`RewardCurrencyQty2`, "
                        << "`RewardCurrencyID3`, "
                        << "`RewardCurrencyQty3`, "
                        << "`RewardCurrencyID4`, "
                        << "`RewardCurrencyQty4`, "
                        << "`AcceptedSoundKitID`, "
                        << "`CompleteSoundKitID`, "
                        << "`AreaGroupID`, "
                        << "`TimeAllowed`, "
                        << "`AllowableRaces`, "
                        << "`QuestRewardID`, "
                        << "`Expansion`, "
                        << "`LogTitle`, "
                        << "`LogDescription`, "
                        << "`QuestDescription`, "
                        << "`AreaDescription`, "
                        << "`PortraitGiverText`, "
                        << "`PortraitGiverName`, "
                        << "`PortraitTurnInText`, "
                        << "`PortraitTurnInName`, "
                        << "`QuestCompletionLog`, "
                        << "`VerifiedBuild`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";

                // Insertar los par?metros.
                this->fCacheStream
                    << "('" << ID << "',"
                    << " '" << QuestType << "',"
                    << " '" << QuestLevel << "',"
                    << " '" << MaxScalingLevel << "',"
                    << " '" << QuestPackageID << "',"
                    << " '" << MinLevel << "',"
                    << " '" << QuestSortID << "',"
                    << " '" << QuestInfoID << "',"
                    << " '" << SuggestedGroupNum << "',"
                    << " '" << RewardNextQuest << "',"
                    << " '" << RewardXPDifficulty << "',"
                    << " '" << RewardXPMultiplier << "',"
                    << " '" << RewardMoney << "',"
                    << " '" << RewardMoneyDifficulty << "',"
                    << " '" << RewardMoneyMultiplier << "',"
                    << " '" << RewardBonusMoney << "',"
                    << " '" << RewardDisplaySpell1 << "',"
                    << " '" << RewardDisplaySpell2 << "',"
                    << " '" << RewardDisplaySpell3 << "',"
                    << " '" << RewardSpell << "',"
                    << " '" << RewardHonor << "',"
                    << " '" << RewardKillHonor << "',"
                    << " '" << StartItem << "',"
                    << " '" << RewardArtifactXPDifficulty << "',"
                    << " '" << RewardArtifactXPMultiplier << "',"
                    << " '" << RewardArtifactCategoryID << "',"
                    << " '" << Flags << "',"
                    << " '" << FlagsEx << "',"
                    << " '" << RewardItem1 << "',"
                    << " '" << RewardAmount1 << "',"
                    << " '" << RewardItem2 << "',"
                    << " '" << RewardAmount2 << "',"
                    << " '" << RewardItem3 << "',"
                    << " '" << RewardAmount3 << "',"
                    << " '" << RewardItem4 << "',"
                    << " '" << RewardAmount4 << "',"
                    << " '" << ItemDrop1 << "',"
                    << " '" << ItemDropQuantity1 << "',"
                    << " '" << ItemDrop2 << "',"
                    << " '" << ItemDropQuantity2 << "',"
                    << " '" << ItemDrop3 << "',"
                    << " '" << ItemDropQuantity3 << "',"
                    << " '" << ItemDrop4 << "',"
                    << " '" << ItemDropQuantity4 << "',"
                    << " '" << RewardChoiceItemID1 << "',"
                    << " '" << RewardChoiceItemQuantity1 << "',"
                    << " '" << RewardChoiceItemDisplayID1 << "',"
                    << " '" << RewardChoiceItemID2 << "',"
                    << " '" << RewardChoiceItemQuantity2 << "',"
                    << " '" << RewardChoiceItemDisplayID2 << "',"
                    << " '" << RewardChoiceItemID3 << "',"
                    << " '" << RewardChoiceItemQuantity3 << "',"
                    << " '" << RewardChoiceItemDisplayID3 << "',"
                    << " '" << RewardChoiceItemID4 << "',"
                    << " '" << RewardChoiceItemQuantity4 << "',"
                    << " '" << RewardChoiceItemDisplayID4 << "',"
                    << " '" << RewardChoiceItemID5 << "',"
                    << " '" << RewardChoiceItemQuantity5 << "',"
                    << " '" << RewardChoiceItemDisplayID5 << "',"
                    << " '" << RewardChoiceItemID6 << "',"
                    << " '" << RewardChoiceItemQuantity6 << "',"
                    << " '" << RewardChoiceItemDisplayID6 << "',"
                    << " '" << POIContinent << "',"
                    << " '" << POIx << "',"
                    << " '" << POIy << "',"
                    << " '" << POIPriority << "',"
                    << " '" << RewardTitle << "',"
                    << " '" << RewardArenaPoints << "',"
                    << " '" << RewardSkillLineID << "',"
                    << " '" << RewardNumSkillUps << "',"
                    << " '" << PortraitGiver << "',"
                    << " '" << PortraitTurnIn << "',"
                    << " '" << RewardFactionID1 << "',"
                    << " '" << RewardFactionValue1 << "',"
                    << " '" << RewardFactionOverride1 << "',"
                    << " '" << RewardFactionCapIn1 << "',"
                    << " '" << RewardFactionID2 << "',"
                    << " '" << RewardFactionValue2 << "',"
                    << " '" << RewardFactionOverride2 << "',"
                    << " '" << RewardFactionCapIn2 << "',"
                    << " '" << RewardFactionID3 << "',"
                    << " '" << RewardFactionValue3 << "',"
                    << " '" << RewardFactionOverride3 << "',"
                    << " '" << RewardFactionCapIn3 << "',"
                    << " '" << RewardFactionID4 << "',"
                    << " '" << RewardFactionValue4 << "',"
                    << " '" << RewardFactionOverride4 << "',"
                    << " '" << RewardFactionCapIn4 << "',"
                    << " '" << RewardFactionID5 << "',"
                    << " '" << RewardFactionValue5 << "',"
                    << " '" << RewardFactionOverride5 << "',"
                    << " '" << RewardFactionCapIn5 << "',"
                    << " '" << RewardFactionFlags << "',"
                    << " '" << RewardCurrencyID1 << "',"
                    << " '" << RewardCurrencyQty1 << "',"
                    << " '" << RewardCurrencyID2 << "',"
                    << " '" << RewardCurrencyQty2 << "',"
                    << " '" << RewardCurrencyID3 << "',"
                    << " '" << RewardCurrencyQty3 << "',"
                    << " '" << RewardCurrencyID4 << "',"
                    << " '" << RewardCurrencyQty4 << "',"
                    << " '" << AcceptedSoundKitID << "',"
                    << " '" << CompleteSoundKitID << "',"
                    << " '" << AreaGroupID << "',"
                    << " '" << TimeAllowed << "',"
                    << " '" << AllowableRaces << "',"
                    << " '" << QuestRewardID << "',"
                    << " '" << Expansion << "',"
                    << " '" << this->SafeSQLParams(LogTitle) << "',"
                    << " '" << this->SafeSQLParams(LogDescription) << "',"
                    << " '" << this->SafeSQLParams(QuestDescription) << "',"
                    << " '" << this->SafeSQLParams(AreaDescription) << "',"
                    << " '" << this->SafeSQLParams(PortraitGiverText) << "',"
                    << " '" << this->SafeSQLParams(PortraitGiverName) << "',"
                    << " '" << this->SafeSQLParams(PortraitTurnInText) << "',"
                    << " '" << this->SafeSQLParams(PortraitTurnInName) << "',"
                    << " '" << this->SafeSQLParams(QuestCompletionLog) << "',"
                    << " '" << VerifiedBuild << "');";


            } while ( _Result->NextRow() );
            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            // Notificar al usuario q se exporto los quest_template de un quest
            this->fHandler->PSendSysMessage("    quest_template exported.");
        }
        else
            return false;

        return true;
    }

    void FlushToFile(std::string &aFileName, int aEntry, std::string &aCreatureName)
    {
        time_t _CurTime = time(NULL);
        tm* _LocalTm = localtime(&_CurTime);
        std::ostringstream _ExportHeader;

        _ExportHeader
            << "/*\n"
            << "SQL WOW-SNET				  \n"
            << "Desarrollado por:\n"
            << "Fecha: " << _LocalTm->tm_mday << "/" << _LocalTm->tm_mon << "/" << _LocalTm->tm_year << "\n"
            << "### Scripts Privados / Derechos Reservados WOW-SNET ########\n"
            << "### Datos SQL --------------------------------------------->*/\n"
            << "SET @CREATURE  	:= '" << this->SafeSQLParams(aCreatureName) << "';\n"
            << "SET @ENTRY 		:= '" << aEntry << "';\n"
            << "/*SET @MAP   		:= 530;       *//*(Outland)*/\n"
            << "/*SET @ZONE  		:= 6455;      *//*(Sunstrider Isle)*/\n"
            << "/*SET @AREA  		:= 3431;      *//*(Sunstrider Isle)*/\n"
            << "/*--------------------------------------------------------->*/\n"
            << "\n";

        FILE* fout = fopen(aFileName.c_str(), "w");
        fprintf(fout, "%s\n", _ExportHeader.str().c_str());
        fprintf(fout, "%s\n", this->fCacheStream.str().c_str());
        fclose(fout);
    }
    std::string CheckName(std::string &aInput)
    {
        //
        std::string _scape [] = { "\\", "/", ":", "*", "?", "<", ">", "|", "\"" };
        //
        std::string _aInput = aInput;
        //
        for ( auto itr : _scape )
        {
            _aInput = CheckScapeChar(_aInput, itr);
        }
        /* Return Value */
        return _aInput;
    }

    bool exportCreatureLootTemplate(uint32 aCreatureLootId, std::ostringstream &aDescriptions)
    {

        LocaleConstant defaultLocale = sWorld->GetDefaultDbcLocale();
        std::list<uint64> _itemsToExport;
        QueryResult _Result = WorldDatabase.PQuery("SELECT*  FROM `creature_loot_template` WHERE entry = '%u';", aCreatureLootId);

        //Add the delete
        this->fCacheStream
            << "/* Step 1.3 Table  `creature_loot_template */\n"
            << "DELETE FROM `creature_loot_template` WHERE `entry` = " << aCreatureLootId << ";\n";

        if ( _Result )
        {
            bool _IsFirstTime = true;
            int32 _ReferencesIndex = 0;
            int32 *_References = new int32 [_Result->GetRowCount()];
            do {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                        //
                                                        // Obtener cada uno de los par?metros de la tabla de la bd seg?n sus indices
                uint32 entry = _Fields [_Index++].GetUInt32();
                uint32 item = _Fields [_Index++].GetUInt32();
                uint32 Reference = _Fields [_Index++].GetUInt32();
                float  Chance = _Fields [_Index++].GetFloat();
                uint32 QuestRequired = _Fields [_Index++].GetUInt32();
                uint32 LootMode = uint32(_Fields [_Index++].GetUInt16());
                uint32 GroupId = uint32(_Fields [_Index++].GetUInt8());
                int32  MinCount = _Fields [_Index++].GetInt32();
                int32 MaxCount = int32(_Fields [_Index++].GetUInt8());
                std::string Comment = _Fields [_Index++].GetString();

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `creature_loot_template` ("
                        << "`entry`, "
                        << "`item`, "
                        << "`Reference`, "
                        << "`Chance`, "
                        << "`QuestRequired`, "
                        << "`LootMode`, "
                        << "`GroupId`, "
                        << "`MinCount`, "
                        << "`MaxCount`, "
                        << "`Comment`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";

                //
                // Insertar los par?metros.
                this->fCacheStream
                    << "('" << entry << "',"
                    << " '" << item << "',"
                    << " '" << Reference << "',"
                    << " '" << Chance << "',"
                    << " '" << QuestRequired << "',"
                    << " '" << LootMode << "',"
                    << " '" << GroupId << "',"
                    << " '" << MinCount << "',"
                    << " '" << MaxCount << "',"
                    << " '" << Comment << "')";

                //
                // Solo como comentario
                this->fCacheStream << " /* Item(" << item << "): " << GetIntemName(item, true) << ", ItemLevel: " << GetItemLevel(item).str().c_str() << ", RequiredLevel: " << GetRequiredLevel(item).str().c_str() << ", ItemQuality: " << GetItemQuality(item) << " */";
                //
                // exportar los reference templates
                if ( MinCount < 0 ) {
                    _References [_ReferencesIndex] = MinCount;
                    _ReferencesIndex++;
                }
                // exportar los items
                if ( MinCount > 0 )
                    _itemsToExport.push_back(item);
                //
            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //

            //
            //Export items corectly sorted.
            for ( auto _citem : _itemsToExport )
            {

                if ( ItemTemplate const* itemProto = sObjectMgr->GetItemTemplate(_citem) )
                {
                    aDescriptions
                        << itemProto->GetId() << "  "
                        << itemProto->GetQuality() << "  "
                        << GetItemQuality(_citem) << "  ";
                    //Decent way to read item price.
                    if ( itemProto->GetSellPrice() )
                    {
                        uint32 _gold = ( itemProto->GetSellPrice() / GOLD );
                        uint32 _silv = ( ( itemProto->GetSellPrice() % GOLD ) / SILVER );
                        uint32 _copp = ( ( itemProto->GetSellPrice() % GOLD ) % SILVER );
                        aDescriptions
                            << _gold << "g " << _silv << "s " << _copp << "c  ";
                    }
                    aDescriptions
                        << itemProto->GetBaseItemLevel() << "  "
                        << itemProto->GetBaseRequiredLevel() << "  "
                        << itemProto->GetName(defaultLocale) << "\n";
                }
            }

            //
            // Comment end.
            aDescriptions
                << "*/\n";

            //
            // Export Reference Loot Template
            for ( int i = 0; i < _ReferencesIndex; i++ )
                this->exportReferenceLootTemplate(abs(_References [i]), aDescriptions);

            delete [] _References;

            // Clear the list.
            _itemsToExport.clear();

            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    creature_loot_template exported.");
        }
        else
            return false;
        return true;
    }

    bool exportReferenceLootTemplate(uint32 aMinCountOrRef, std::ostringstream &aDescriptions)
    {
        LocaleConstant defaultLocale = sWorld->GetDefaultDbcLocale();
        std::list<uint64> _itemsToExport, _subLoot;
        QueryResult _Result = WorldDatabase.PQuery(
            "SELECT * FROM `reference_loot_template` WHERE entry = '%u';", aMinCountOrRef);

        //Add the delete
        this->fCacheStream
            << "/* Step 1.4 Table  `creature_loot_template */\n"
            << "DELETE FROM `reference_loot_template` WHERE `entry` = " << aMinCountOrRef << ";\n";

        if ( _Result )
        {
            bool _IsFirstTime = true;
            do {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                        //
                                                        // Obtener cada uno de los par?metros de la tabla de la bd seg?n sus indices
                uint32 entry = _Fields [_Index++].GetUInt32();
                uint32 item = _Fields [_Index++].GetUInt32();
                uint32 Reference = _Fields [_Index++].GetUInt32();
                float  Chance = _Fields [_Index++].GetFloat();
                uint32 QuestRequired = _Fields [_Index++].GetFloat();
                uint32 LootMode = uint32(_Fields [_Index++].GetUInt16());
                uint32 GroupId = uint32(_Fields [_Index++].GetUInt8());
                int32  MinCount = _Fields [_Index++].GetInt32();
                int32 MaxCount = int32(_Fields [_Index++].GetUInt8());
                std::string Comment = _Fields [_Index++].GetString();

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `reference_loot_template` ("
                        << "`entry`, "
                        << "`item`, "
                        << "`Reference`, "
                        << "`Chance`, "
                        << "`QuestRequired`, "
                        << "`LootMode`, "
                        << "`GroupId`, "
                        << "`MinCount`, "
                        << "`MaxCount`, "
                        << "`Comment`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";
                //
                // Insertar los par?metros.
                this->fCacheStream
                    << "('" << entry << "',"
                    << " '" << item << "',"
                    << " '" << Reference << "',"
                    << " '" << Chance << "',"
                    << " '" << QuestRequired << "',"
                    << " '" << LootMode << "',"
                    << " '" << GroupId << "',"
                    << " '" << MinCount << "',"
                    << " '" << MaxCount << "',"
                    << " '" << Comment << "')";

                //
                // Solo como comentario
                this->fCacheStream << " /* Item(" << item << "): " << GetIntemName(item, true) << ", ItemLevel: " << GetItemLevel(item).str().c_str() << ", RequiredLevel: " << GetRequiredLevel(item).str().c_str() << ", ItemQuality: " << GetItemQuality(item) << " */";

                //
                // exportar los items
                if ( MinCount < 0 )
                    _subLoot.push_back(abs(MinCount));
                else
                    _itemsToExport.push_back(item);
                //
            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";

            //
            // Description header.
            aDescriptions
                << "\n/*Reference Loot Template Items Data: Id - Quality - SellPrice - ItemLevel - RequiredLevel - Name */\n/*\n";

            //
            //Export items corectly sorted.
            for ( auto _citem : _itemsToExport )
            {

                if ( ItemTemplate const* itemProto = sObjectMgr->GetItemTemplate(_citem) )
                {
                    aDescriptions
                        << itemProto->GetId() << "  "
                        << itemProto->GetQuality() << "  "
                        << GetItemQuality(_citem) << "  ";
                    //Decent way to read item price.
                    if ( itemProto->GetSellPrice() )
                    {
                        uint32 _gold = ( itemProto->GetSellPrice() / GOLD );
                        uint32 _silv = ( ( itemProto->GetSellPrice() % GOLD ) / SILVER );
                        uint32 _copp = ( ( itemProto->GetSellPrice() % GOLD ) % SILVER );
                        aDescriptions
                            << _gold << "g " << _silv << "s " << _copp << "c  ";
                    }
                    aDescriptions
                        << itemProto->GetBaseItemLevel() << "  "
                        << itemProto->GetBaseRequiredLevel() << "  "
                        << itemProto->GetName(defaultLocale) << "\n";
                }
            }

            //
            // Comment end.
            aDescriptions
                << "*/\n";

            //
            // Export referenced loot template.
            for ( auto _cSub : _subLoot )
                exportReferenceLootTemplate(_cSub, aDescriptions);

            //
            // Clear the list.
            _itemsToExport.clear();
            _subLoot.clear();

            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    creature_loot_template exported.");
        }
        else
            return false;
        return true;
    }

    bool exportCreatureTemplateAddon(uint32 aTemplateAddon)
    {
        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `creature_template_addon` WHERE entry = '%u';", aTemplateAddon);

        //Add the delete
        this->fCacheStream
            << "/* Step 1.3 Table  creature_template_addon */\n"
            //<< "DELETE FROM creature_template_addon WHERE  `entry` = " << aTemplateAddon << ";\n";
            << "DELETE FROM creature_template_addon WHERE  `entry` = " << "@ENTRY" << ";\n";

        if ( _Result )
        {
            bool _IsFirstTime = true;
            do {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                        //
                                                        // Obtener cada uno de los par?metros de la tabla de la bd seg?n sus indices
                uint32 entry = _Fields [_Index++].GetUInt32();
                uint32 path_id = _Fields [_Index++].GetUInt32();
                uint32 mount = _Fields [_Index++].GetUInt32();
                uint32 bytes1 = _Fields [_Index++].GetUInt32();
                uint32 bytes2 = _Fields [_Index++].GetUInt32();
                uint32 emote = _Fields [_Index++].GetUInt32();
                int aiAnimKit = _Fields [_Index++].GetInt16();
                int movementAnimKit = _Fields [_Index++].GetInt16();
                int meleeAnimKit = _Fields [_Index++].GetInt16();
                std::string auras = _Fields [_Index++].GetString();

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `creature_template_addon` ("
                        << "`entry`,"
                        << "`path_id`,"
                        << "`mount`,"
                        << "`bytes1`,"
                        << "`bytes2`,"
                        << "`emote`,"
                        << "`aiAnimKit`,"
                        << "`movementAnimKit`,"
                        << "`meleeAnimKit`,"
                        << "`auras`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";
                //
                // Insertar los par?metros.
                this->fCacheStream
                    //<< "('" << entry << "',"
                    << "(" << "@ENTRY" << ","
                    << " '" << path_id << "',"
                    << " '" << mount << "',"
                    << " '" << bytes1 << "',"
                    << " '" << bytes2 << "',"
                    << " '" << emote << "',"
                    << " '" << aiAnimKit << "',"
                    << " '" << movementAnimKit << "',"
                    << " '" << meleeAnimKit << "',"
                    << " '" << auras << "')";

                //
                // Solo como comentario
                ;
            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    creature_template_addon exported.");
        }
        else
            return false;
        return true;
    }

    bool exportCreatureOnkillReputation(uint32 aCreatureOnkillReputation)
    {
        uint32 creature_id;
        int32  RewOnKillRepFaction1;
        int32  RewOnKillRepFaction2;
        int32  MaxStanding1;
        uint32 IsTeamAward1;
        int32  RewOnKillRepValue1;
        bool   MaxStanding2;
        uint32 IsTeamAward2;
        int32  RewOnKillRepValue2;
        uint32 TeamDependent;

        uint16 _Index;
        Field* _Fields;

        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `creature_onkill_reputation` WHERE creature_id = '%u';", aCreatureOnkillReputation);

        //Add the delete
        this->fCacheStream
            << "/* Step 2.1 Table  `creature_onkill_reputation */\n"
            //<< "DELETE FROM creature_onkill_reputation WHERE `creature_id` = " << aCreatureOnkillReputation << ";\n";
            << "DELETE FROM creature_onkill_reputation WHERE `creature_id` = " << "@ENTRY" << ";\n";

        if ( _Result )
        {
            bool _IsFirstTime = true;
            do {
                _Index = 0;
                _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                //
                                                // Obtener cada uno de los par?metros de la tabla de la bd seg?n sus indices
                creature_id = _Fields [_Index++].GetUInt32();
                RewOnKillRepFaction1 = int32(_Fields [_Index++].GetInt16());
                RewOnKillRepFaction2 = int32(_Fields [_Index++].GetInt16());
                MaxStanding1 = _Fields [_Index++].GetInt8();
                IsTeamAward1 = uint32(_Fields [_Index++].GetUInt8());
                RewOnKillRepValue1 = _Fields [_Index++].GetInt32();
                MaxStanding2 = _Fields [_Index++].GetBool();
                IsTeamAward2 = uint32(_Fields [_Index++].GetUInt8());
                RewOnKillRepValue2 = _Fields [_Index++].GetInt32();
                TeamDependent = uint32(_Fields [_Index++].GetUInt8());

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `creature_onkill_reputation` ("
                        << "`creature_id`,"
                        << "`RewOnKillRepFaction1`,"
                        << "`RewOnKillRepFaction2`,"
                        << "`MaxStanding1`,"
                        << "`IsTeamAward1`,"
                        << "`RewOnKillRepValue1`,"
                        << "`MaxStanding2`,"
                        << "`IsTeamAward2`,"
                        << "`RewOnKillRepValue2`,"
                        << "`TeamDependent`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";

                //
                // Insertar los par?metros.
                this->fCacheStream
                    //<< "('" << creature_id << "',"
                    << "(" << "@ENTRY" << ","
                    << " '" << RewOnKillRepFaction1 << "',"
                    << " '" << RewOnKillRepFaction2 << "',"
                    << " '" << MaxStanding1 << "',"
                    << " '" << IsTeamAward1 << "',"
                    << " '" << RewOnKillRepValue1 << "',"
                    << " '" << MaxStanding2 << "',"
                    << " '" << IsTeamAward2 << "',"
                    << " '" << RewOnKillRepValue2 << "',"
                    << " '" << TeamDependent << "')";

                //
                // Solo como comentario
                ;
            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    creature_onkill_reputation exported.");
        }
        else
            return false;
        return true;
    }


    bool exportSkinningLootTemplate(uint32 aSkinningLootTemplate, std::ostringstream &aDescriptions)
    {
        uint32 entry;
        uint32 item;
        uint32 Reference;
        float Chance;
        uint32 QuestRequired;
        uint32 LootMode;
        uint32 GroupId;
        int32 MinCount;
        uint32 MaxCount;
        std::string Comment;
        bool _IsFirstTime;
        uint16 _Index;
        Field* _Fields;


        LocaleConstant defaultLocale = sWorld->GetDefaultDbcLocale();
        std::list<uint64> _itemsToExport;
        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `skinning_loot_template` WHERE entry = '%u';", aSkinningLootTemplate);

        //Add the delete
        this->fCacheStream
            << "/* Step 2.4 Table  `skinning_loot_template */\n"
            //<< "DELETE FROM skinning_loot_template WHERE  `entry` = " << aSkinningLootTemplate << ";\n";
            << "DELETE FROM skinning_loot_template WHERE  `entry` = " << "@ENTRY" << ";\n";

        if ( _Result )
        {
            _IsFirstTime = true;
            do {
                _Index = 0;
                _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                //
                                                // Obtener cada uno de los par?metros de la tabla de la bd seg?n sus indices
                entry = _Fields [_Index++].GetUInt32();
                item = _Fields [_Index++].GetUInt32();
                Reference = _Fields [_Index++].GetUInt32();
                Chance = _Fields [_Index++].GetFloat();
                QuestRequired = _Fields [_Index++].GetUInt32();
                LootMode = _Fields [_Index++].GetUInt16();
                GroupId = _Fields [_Index++].GetUInt8();
                MinCount = _Fields [_Index++].GetInt32();
                MaxCount = _Fields [_Index++].GetUInt32();
                std::string Comment = _Fields [_Index++].GetString();

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `skinning_loot_template` ("
                        << "`entry`,"
                        << "`item`,"
                        << "`Reference`,"
                        << "`Chance`,"
                        << "`QuestRequired`,"
                        << "`LootMode`,"
                        << "`GroupId`,"
                        << "`MinCount`,"
                        << "`MaxCount`,"
                        << "`Comment`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";

                //
                // Insertar los par?metros.
                this->fCacheStream
                    //<< "('" << entry << "',"
                    << "(" << "@ENTRY" << ","
                    << " '" << item << "',"
                    << " '" << Reference << "',"
                    << " '" << Chance << "',"
                    << " '" << QuestRequired << "',"
                    << " '" << LootMode << "',"
                    << " '" << GroupId << "',"
                    << " '" << MinCount << "',"
                    << " '" << MaxCount << "',"
                    << " '" << Comment << "')";

                //
                // Solo como comentario
                //this->fCacheStream << "  /* Item(" << item << "): " << GetIntemName(item, true) << ", ItemLevel: " << GetItemLevel(item).str().c_str() << ", RequiredLevel: " << GetRequiredLevel(item).str().c_str() << ", ItemQuality: " << GetItemQuality(item) << " */";
                //
                // exportar los items
                _itemsToExport.push_back(item);
                //
            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //

            //
            //Export items corectly sorted.
            for ( auto _citem : _itemsToExport )
            {

                if ( ItemTemplate const* itemProto = sObjectMgr->GetItemTemplate(_citem) )
                {
                    aDescriptions
                        << itemProto->GetId() << "  "
                        << itemProto->GetQuality() << "  "
                        << GetItemQuality(_citem) << "  ";
                    //Decent way to read item price.
                    if ( itemProto->GetSellPrice() )
                    {
                        uint32 _gold = ( itemProto->GetSellPrice() / GOLD );
                        uint32 _silv = ( ( itemProto->GetSellPrice() % GOLD ) / SILVER );
                        uint32 _copp = ( ( itemProto->GetSellPrice() % GOLD ) % SILVER );
                        aDescriptions
                            << _gold << "g " << _silv << "s " << _copp << "c  ";
                    }
                    aDescriptions
                        << itemProto->GetBaseItemLevel() << "  "
                        << itemProto->GetBaseRequiredLevel() << "  "
                        << itemProto->GetName(defaultLocale) << "\n";
                }
            }

            // Clear the list.
            _itemsToExport.clear();

            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    skinning_loot_template exported.");
        }
        else
            return false;
        return true;
    }

    bool exportCreatureText(uint32 aEntry)
    {

        uint32 CreatureID;
        uint32 GroupID;
        uint32 ID;
        std::string Text;
        uint32 Type;
        uint32 Language;
        float Probability;
        uint32 Emote;
        uint32 Duration;
        uint32 Sound;
        uint32 BroadcastTextId;
        uint32 TextRange;
        std::string comment;


        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `creature_text` WHERE CreatureID = '%u';", aEntry);

        //Add the delete
        this->fCacheStream
            << "/* Step 1.6 Table  `creature_text */\n"
            //<< "DELETE FROM  `creature_text` WHERE `entry`= " << aEntry << ";\n";
            << "DELETE FROM  `creature_text` WHERE `CreatureID`= " << "@ENTRY" << ";\n";

        if ( _Result )
        {
            bool _IsFirstTime = true;
            do {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                        //
                                                        // Obtener cada uno de los par?metros de la tabla de la bd seg?n sus indices
                CreatureID = _Fields [_Index++].GetUInt32();
                GroupID = _Fields [_Index++].GetUInt8();
                ID = _Fields [_Index++].GetUInt8();
                Text = _Fields [_Index++].GetString();
                Type = _Fields [_Index++].GetUInt8();
                Language = _Fields [_Index++].GetUInt8();
                Probability = _Fields [_Index++].GetFloat();
                Emote = _Fields [_Index++].GetUInt32();
                Duration = _Fields [_Index++].GetUInt32();
                Sound = _Fields [_Index++].GetUInt32();
                BroadcastTextId = _Fields [_Index++].GetUInt32();
                TextRange = _Fields [_Index++].GetUInt32();
                comment = _Fields [_Index++].GetString();

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `creature_text` (`"
                        << "CreatureID`, "
                        << "`GroupID`, "
                        << "`ID`, "
                        << "`Text`, "
                        << "`Type`, "
                        << "`Language`, "
                        << "`Probability`, "
                        << "`Emote`, "
                        << "`Duration`, "
                        << "`Sound`, "
                        << "`BroadcastTextId`, "
                        << "`TextRange`, "
                        << "`comment`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";

                //
                // Insertar los par?metros.
                this->fCacheStream
                    //<< "('" << entry << "',"
                    << "(" << "@ENTRY" << ","
                    << " '" << GroupID << "',"
                    << " '" << ID << "',"
                    << " '" << this->SafeSQLParams(Text) << "',"
                    << " '" << Type << "',"
                    << " '" << Language << "',"
                    << " '" << Probability << "',"
                    << " '" << Emote << "',"
                    << " '" << Duration << "',"
                    << " '" << Sound << "',"
                    << " '" << BroadcastTextId << "',"
                    << " '" << TextRange << "',"
                    << " '" << this->SafeSQLParams(comment) << "')";

                //
                // Solo como comentario
                ;
            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    creature_text exported.");
        }
        else
            return false;
        return true;
    }


    bool exportSmartScripts(uint32 aEntry, uint16 aSourceType)		// se pasa el entry o el guid de la criatura
    {
        uint64 entry;
        int source_type;
        uint16 event_id;
        uint16 link;
        uint16 event_type;
        uint16 event_phase_mask;;
        uint16 event_chance;
        uint16 event_flags;

        uint32 event_param1;
        uint32 event_param2;
        uint32 event_param3;
        uint32 event_param4;
        std::string event_param_string;

        uint16 action_type;
        uint32 action_param1;
        uint32 action_param2;
        uint32 action_param3;
        uint32 action_param4;
        uint32 action_param5;
        uint32 action_param6;

        uint32 target_type;
        uint32 target_param1;
        uint32 target_param2;
        uint32 target_param3;
        float target_x;
        float target_y;
        float target_z;
        float target_o;

        std::string comment;
        uint16 _Index;
        Field* _Fields;

        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `smart_scripts` WHERE entryorguid = '%u' AND `source_type`= %u;", aEntry, aSourceType);

        //Add the delete
        this->fCacheStream
            << "/* Step 1.6 Table  `smart_scripts` */\n"
            << "DELETE FROM smart_scripts WHERE `entryorguid` = " << aEntry << " AND `source_type`= " << aSourceType << ";\n";

        if ( _Result )
        {
            bool _IsFirstTime = true;
            do {
                _Index = 0;
                _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                //
                                                // Obtener cada uno de los par?metros de la tabla de la bd seg?n sus indices
                entry = _Fields [_Index++].GetUInt64();
                source_type = _Fields [_Index++].GetInt8();
                event_id = _Fields [_Index++].GetUInt16();
                link = _Fields [_Index++].GetUInt16();
                event_type = _Fields [_Index++].GetUInt8();
                event_phase_mask = _Fields [_Index++].GetUInt8();
                event_chance = _Fields [_Index++].GetUInt8();
                event_flags = _Fields [_Index++].GetUInt8();

                event_param1 = _Fields [_Index++].GetUInt32();
                event_param2 = _Fields [_Index++].GetUInt32();
                event_param3 = _Fields [_Index++].GetUInt32();
                event_param4 = _Fields [_Index++].GetUInt32();
                event_param_string = _Fields [_Index++].GetString();

                action_type = _Fields [_Index++].GetUInt8();
                action_param1 = _Fields [_Index++].GetUInt32();
                action_param2 = _Fields [_Index++].GetUInt32();
                action_param3 = _Fields [_Index++].GetUInt32();
                action_param4 = _Fields [_Index++].GetUInt32();
                action_param5 = _Fields [_Index++].GetUInt32();
                action_param6 = _Fields [_Index++].GetUInt32();

                target_type = _Fields [_Index++].GetUInt8();
                target_param1 = _Fields [_Index++].GetUInt32();
                target_param2 = _Fields [_Index++].GetUInt32();
                target_param3 = _Fields [_Index++].GetUInt32();
                target_x = _Fields [_Index++].GetFloat();
                target_y = _Fields [_Index++].GetFloat();
                target_z = _Fields [_Index++].GetFloat();
                target_o = _Fields [_Index++].GetFloat();

                comment = _Fields [_Index++].GetString();

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `smart_scripts` ("
                        << "`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, "
                        << "`event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param_string`, "
                        << "`action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, "
                        << "`target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, "
                        << "`comment`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";
                //
                // Insertar los par?metros.
                this->fCacheStream
                    << "('" << entry << "',"
                    << " '" << source_type << "',"
                    << " '" << event_id << "',"
                    << " '" << link << "',"
                    << " '" << event_type << "',"
                    << " '" << event_phase_mask << "',"
                    << " '" << event_chance << "',"
                    << " '" << event_flags << "',"
                    << " '" << event_param1 << "',"
                    << " '" << event_param2 << "',"
                    << " '" << event_param3 << "',"
                    << " '" << event_param4 << "',"
                    << " '" << event_param_string << "',"
                    << " '" << action_type << "',"
                    << " '" << action_param1 << "',"
                    << " '" << action_param2 << "',"
                    << " '" << action_param3 << "',"
                    << " '" << action_param4 << "',"
                    << " '" << action_param5 << "',"
                    << " '" << action_param6 << "',"
                    << " '" << target_type << "',"
                    << " '" << target_param1 << "',"
                    << " '" << target_param2 << "',"
                    << " '" << target_param3 << "',"
                    << " '" << target_x << "',"
                    << " '" << target_y << "',"
                    << " '" << target_z << "',"
                    << " '" << target_o << "',"
                    << " '" << this->SafeSQLParams(comment) << "')";

                /*if (action_type == 80 && action_param1 != 0)
                this->exportSmartScripts(action_param1, 9);*/

                //
                // Solo como comentario
                ;
            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    smart_scripts exported.");
        }
        else
            return false;
        return true;
    }


    bool ExportSaiTimeActionList(uint32 ScriptID, uint32 Entry, uint32 SourceType)
    {
        QueryResult _Result;
        uint32 _rowCount = 1;
        uint32 ScriptEntry = Entry + 00;
        if ( ScriptID == ScriptEntry )
            QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `smart_scripts` WHERE entryorguid = '%u' AND `source_type`= %u;", ScriptID, SourceType);


    }

    bool exportCreatureQuestRelation(uint32 aCreatureIsQuestGiver, uint32 aQuestId) // Preguntar si se pasa el QuestGiver o el CreatureEntry
    {
        QueryResult _Result;
        uint32 _rowCount = 1;

        if ( aCreatureIsQuestGiver != 0 && aQuestId == 0 )
        {
            _Result = WorldDatabase.PQuery(
                "SELECT  "
                "`id`,  "
                "`quest` "
                "FROM `creature_queststarter` WHERE id = '%u';", aCreatureIsQuestGiver);

            //Add the delete
            this->fCacheStream
                << "/* Step 2.2 Table  `creature_queststarter */\n"
                //<< "DELETE FROM  `creature_queststarter` WHERE `id`= " << aCreatureIsQuestGiver << ";\n";
                << "DELETE FROM  `creature_queststarter` WHERE `id`= " << "@ENTRY" << ";\n";

        }
        else if ( aCreatureIsQuestGiver == 0 && aQuestId != 0 )
        {
            _Result = WorldDatabase.PQuery(
                "SELECT  "
                "`id`,  "
                "`quest` "
                "FROM `creature_queststarter` WHERE quest = '%u';", aQuestId);

            //Add the delete
            this->fCacheStream
                << "/* Step 2.2 Table  `creature_queststarter */\n"
                << "DELETE FROM  `creature_queststarter` WHERE `quest`= " << aQuestId << ";\n";

        }
        else
        {
            return false;
        }

        if ( _Result )
        {
            do {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                        //
                                                        // Obtener cada uno de los par?metros de la tabla de la bd seg?n sus indices
                uint32 id = _Fields [_Index++].GetUInt32();
                uint32 quest = _Fields [_Index++].GetUInt32();

                if ( _rowCount == 1 )
                {
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `creature_queststarter` ("
                        << "`id`, "
                        << "`quest`) VALUES \n";
                }

                //
                // Insertar los par?metros.
                this->fCacheStream
                    << "('" << id << "',"
                    << " '" << quest << "')";

                //
                //
                if ( _Result->GetRowCount() == _rowCount )
                    this->fCacheStream << "; ";
                else
                    this->fCacheStream << ", ";

                //
                // Solo como comentario
                this->fCacheStream << " /* " << "Quest(" << quest << "): " << this->GetQuestNameByEntry(quest) << " ,QuestProfession ID: " << this->GetQuestRequiredSkill(quest) << "[" << this->GetSkillNameByEntry(GetQuestRequiredSkill(quest)) << "]" << " */ \n";
                _rowCount++;
            } while ( _Result->NextRow() );

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //
            // Notificar al usuario q se exporto las opciones de menu de un gobject.
            this->fHandler->PSendSysMessage("    creature_queststarter exported.");
        }
        else
            return false;
        return true;
    }

    bool exportCreatureInvolvedRelation(uint32 aCreatureIsQuestGiver, uint32 aQuestId) // Preguntar si se pasa el QuestGiver o el CreatureEntry
    {
        QueryResult _Result;
        uint32 _rowCount = 1;

        if ( aCreatureIsQuestGiver != 0 && aQuestId == 0 )
        {
            _Result = WorldDatabase.PQuery(
                "SELECT  "
                "`id`,  "
                "`quest` "
                "FROM `creature_questender` WHERE id = '%u';", aCreatureIsQuestGiver);

            //Add the delete
            this->fCacheStream
                << "/* Step 2.2 Table  `creature_questender */\n"
                //<< "DELETE FROM  `creature_questender` WHERE `id`= " << aCreatureIsQuestGiver << ";\n";
                << "DELETE FROM  `creature_questender` WHERE `id`= " << "@ENTRY" << ";\n";

        }
        else if ( aCreatureIsQuestGiver == 0 && aQuestId != 0 )
        {
            _Result = WorldDatabase.PQuery(
                "SELECT  "
                "`id`,  "
                "`quest` "
                "FROM `creature_questender` WHERE quest = '%u';", aQuestId);

            //Add the delete
            this->fCacheStream
                << "/* Step 2.2 Table  `creature_questender */\n"
                << "DELETE FROM  `creature_questender` WHERE `quest`= " << aQuestId << ";\n";

        }
        else
        {
            return false;
        }

        if ( _Result )
        {
            do {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                        //
                                                        // Obtener cada uno de los par?metros de la tabla de la bd seg?n sus indices
                uint32 id = _Fields [_Index++].GetUInt32();
                uint32 quest = _Fields [_Index++].GetUInt32();

                if ( _rowCount == 1 )
                {
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `creature_questender` ("
                        << "`id`, "
                        << "`quest`) VALUES \n";
                }

                //
                // Insertar los par?metros.
                this->fCacheStream
                    << "('" << id << "',"
                    << " '" << quest << "')";

                //
                //
                if ( _Result->GetRowCount() == _rowCount )
                    this->fCacheStream << "; ";
                else
                    this->fCacheStream << ", ";

                //
                // Solo como comentario
                this->fCacheStream << " /* " << "Quest(" << quest << "): " << this->GetQuestNameByEntry(quest) << " ,QuestProfession ID: " << this->GetQuestRequiredSkill(quest) << "[" << this->GetSkillNameByEntry(GetQuestRequiredSkill(quest)) << "]" << " */ \n";
                _rowCount++;
            } while ( _Result->NextRow() );

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //
            // Notificar al usuario q se exporto las opciones de menu de un gobject.
            this->fHandler->PSendSysMessage("    creature_involvedrelation exported.");
        }
        else
            return false;
        return true;
    }


    bool exportCreatureDefaultTriner(uint32 Entry) // Preguntar si se pasa el QuestGiver o el CreatureEntry
    {
        bool _IsFirstTime;
        uint64 _Rows;
        uint16 _Index;
        Field* _Fields;

        uint32 CreatureId;
        uint32 TrainerId;

        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `creature_default_trainer` WHERE CreatureId = '%u' ORDER BY `CreatureId`;", Entry);
        //Add the delete
        this->fCacheStream
            << "/* Step 1.7 Table  `creature_default_trainer */\n"
            //<< "DELETE FROM creature_default_trainer WHERE  `CreatureId` = " << aEntry << ";\n";
            << "DELETE FROM creature_default_trainer WHERE  `CreatureId` = " << "@ENTRY" << ";\n";

        if ( _Result )
        {
            _IsFirstTime = true;
            _Rows = _Result->GetRowCount();

            do
            {
                _Index = 0;
                _Fields = _Result->Fetch();// Materializar la fila en un objeto

                                           // Obtener cada uno de los parámetros de la tabla de la bd según sus indices
                CreatureId = _Fields [_Index++].GetUInt32();
                TrainerId = _Fields [_Index++].GetUInt32();

                if ( _IsFirstTime )
                {
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `creature_default_trainer` ("
                        << "`CreatureId`,"
                        << "`TrainerId`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";
                //
                // Insertar los parámetros.
                this->fCacheStream
                    << "(" << CreatureId << ","
                    << " '" << TrainerId << "')";

            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    creature_default_trainer exported.");

        }
        else
            return false;
        return true;
    }

    bool exportCreatureSummonGroups(uint32 aSummonerId)
    {
        Field* _Fields;
        uint16 _Index;
        uint32 summonerId;
        uint32 summonerType;
        uint32 groupId;
        uint32 entry;
        float  position_x;
        float  position_y;
        float  position_z;
        float  orientation;
        uint32 summonType;
        uint32 summonTime;

        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `creature_summon_groups` WHERE summonerId = '%u';", aSummonerId);

        //Add the delete
        this->fCacheStream
            << "/* Step 3.3 Table  `creature_summon_groups` */\n"
            << "DELETE FROM  `creature_summon_groups` WHERE `summonerId` = @ENTRY AND `summonerType` = 0;\n";

        if ( _Result )
        {
            bool _IsFirstTime = true;
            do {
                _Index = 0;
                _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                //
                                                // Obtener cada uno de los parámetros de la tabla de la bd según sus indices
                summonerId = _Fields [_Index++].GetUInt32();
                summonerType = _Fields [_Index++].GetUInt8();
                groupId = _Fields [_Index++].GetUInt8();
                entry = _Fields [_Index++].GetUInt32();
                position_x = _Fields [_Index++].GetFloat();
                position_y = _Fields [_Index++].GetFloat();
                position_z = _Fields [_Index++].GetFloat();
                orientation = _Fields [_Index++].GetFloat();
                summonType = _Fields [_Index++].GetUInt8();
                summonTime = _Fields [_Index++].GetUInt32();

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `creature_summon_groups` ("
                        << "`summonerId`,"
                        << "`summonerType`,"
                        << "`groupId`,"
                        << "`entry`,"
                        << "`position_x`,"
                        << "`position_y`,"
                        << "`position_z`,"
                        << "`orientation`,"
                        << "`summonType`,"
                        << "`summonTime`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";

                //
                // Insertar los parámetros.
                this->fCacheStream
                    //<< "('" << summonerId << "',"
                    << "(" << "@ENTRY" << ","
                    << " '" << summonerType << "',"
                    << " '" << groupId << "',"
                    << " '" << entry << "',"
                    << " '" << position_x << "',"
                    << " '" << position_y << "',"
                    << " '" << position_z << "',"
                    << " '" << orientation << "',"
                    << " '" << summonType << "',"
                    << " '" << summonTime << "')";

                //
                // Solo como comentario1
                ;
            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    creature_summon_groups exported.");
        }
        else
            return false;
        return true;
    }

    bool exportPickpocketingLootTemplate(uint32 aSkinningLootTemplate, std::ostringstream &aDescriptions)
    {
        uint32 entry;
        uint32 item;
        uint32 Reference;
        float Chance;
        uint32 QuestRequired;
        uint32 LootMode;
        uint32 GroupId;
        int32 MinCount;
        uint32 MaxCount;
        std::string Comment;
        uint16 _Index;
        Field* _Fields;


        LocaleConstant defaultLocale = sWorld->GetDefaultDbcLocale();
        std::list<uint64> _itemsToExport;
        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `pickpocketing_loot_template` WHERE entry = '%u';", aSkinningLootTemplate);

        //Add the delete
        this->fCacheStream
            << "/* Step 2.4 Table  `pickpocketing_loot_template */\n"
            //<< "DELETE FROM pickpocketing_loot_template WHERE  `entry` = " << aSkinningLootTemplate << ";\n";
            << "DELETE FROM pickpocketing_loot_template WHERE  `entry` = " << "@ENTRY" << ";\n";

        if ( _Result )
        {
            bool _IsFirstTime = true;
            do {
                _Index = 0;
                _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                //
                                                // Obtener cada uno de los par?metros de la tabla de la bd seg?n sus indices
                entry = _Fields [_Index++].GetUInt32();
                item = _Fields [_Index++].GetUInt32();
                Reference = _Fields [_Index++].GetUInt32();
                Chance = _Fields [_Index++].GetFloat();
                QuestRequired = _Fields [_Index++].GetUInt32();
                LootMode = _Fields [_Index++].GetUInt16();
                GroupId = _Fields [_Index++].GetUInt8();
                MinCount = _Fields [_Index++].GetInt32();
                MaxCount = _Fields [_Index++].GetUInt32();
                std::string Comment = _Fields [_Index++].GetString();

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `pickpocketing_loot_template` ("
                        << "`entry`,"
                        << "`item`,"
                        << "`Reference`,"
                        << "`Chance`,"
                        << "`QuestRequired`,"
                        << "`LootMode`,"
                        << "`GroupId`,"
                        << "`MinCount`,"
                        << "`MaxCount`,"
                        << "`Comment`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";

                //
                // Insertar los par?metros.
                this->fCacheStream
                    //<< "('" << entry << "',"
                    << "(" << "@ENTRY" << ","
                    << " '" << item << "',"
                    << " '" << Reference << "',"
                    << " '" << Chance << "',"
                    << " '" << QuestRequired << "',"
                    << " '" << LootMode << "',"
                    << " '" << GroupId << "',"
                    << " '" << MinCount << "',"
                    << " '" << MaxCount << "',"
                    << " '" << Comment << "')";

                //
                // Solo como comentario
                this->fCacheStream << "  /* Item(" << item << "): " << GetIntemName(item, true) << ", ItemLevel: " << GetItemLevel(item).str().c_str() << ", RequiredLevel: " << GetRequiredLevel(item).str().c_str() << ", ItemQuality: " << GetItemQuality(item) << " */";
                //
                // exportar los items
                _itemsToExport.push_back(item);
                //
            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //

            //
            //Export items corectly sorted.
            for ( auto _citem : _itemsToExport )
            {

                if ( ItemTemplate const* itemProto = sObjectMgr->GetItemTemplate(_citem) )
                {
                    aDescriptions
                        << itemProto->GetId() << "  "
                        << itemProto->GetQuality() << "  "
                        << GetItemQuality(_citem) << "  ";
                    //Decent way to read item price.
                    if ( itemProto->GetSellPrice() )
                    {
                        uint32 _gold = ( itemProto->GetSellPrice() / GOLD );
                        uint32 _silv = ( ( itemProto->GetSellPrice() % GOLD ) / SILVER );
                        uint32 _copp = ( ( itemProto->GetSellPrice() % GOLD ) % SILVER );
                        aDescriptions
                            << _gold << "g " << _silv << "s " << _copp << "c  ";
                    }
                    aDescriptions
                        << itemProto->GetBaseItemLevel() << "  "
                        << itemProto->GetBaseRequiredLevel() << "  "
                        << itemProto->GetName(defaultLocale) << "\n";
                }
            }

            // Clear the list.
            _itemsToExport.clear();

            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    pickpocketing_loot_template exported.");
        }
        else
            return false;
        return true;
    }


    bool exportNpcSpellclickSpells(uint32 aSpellclickSpells)
    {
        uint32 npc_entry;
        uint32 spell_id;
        uint32 cast_flags;
        uint32 user_type;
        uint16 _Index;
        Field* _Fields;

        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `npc_spellclick_spells` WHERE npc_entry = '%u';", aSpellclickSpells);

        //Add the delete
        this->fCacheStream
            << "/* Step 2.5 Table  `npc_spellclick_spells */\n"
            //<< "DELETE FROM npc_spellclick_spells WHERE  `npc_entry` = " << aSpellclickSpells << ";\n";
            << "DELETE FROM npc_spellclick_spells WHERE  `npc_entry` = " << "@ENTRY" << ";\n";

        if ( _Result )
        {
            bool _IsFirstTime = true;
            do {
                _Index = 0;
                _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                //
                                                // Obtener cada uno de los parámetros de la tabla de la bd según sus indices
                npc_entry = _Fields [_Index++].GetUInt32();
                spell_id = _Fields [_Index++].GetUInt32();
                cast_flags = _Fields [_Index++].GetUInt8();
                user_type = _Fields [_Index++].GetUInt16();

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `npc_spellclick_spells` ("
                        << "`npc_entry`,"
                        << "`spell_id`,"
                        << "`cast_flags`,"
                        << "`user_type`) VALUES \n";
                }
                else
                    this->fCacheStream << ", " << " /*" << " Spell(" << spell_id << "): " << "*/" "\n";

                //
                // Insertar los parámetros.
                this->fCacheStream
                    //<< "('" << npc_entry << "',"
                    << "(" << "@ENTRY" << ","
                    << " '" << spell_id << "',"
                    << " '" << cast_flags << "',"
                    << " '" << user_type << "')";

                //
                // Solo como comentario
            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    npc_spellclick_spells exported.");
        }
        else
            return false;
        return true;
    }

    bool exportWaypoints(uint32 aEntry)		// se pasa el entry o el guid de la criatura
    {
        uint16 _Index;
        Field* _Fields;

        uint32 entry;
        uint32 pointid;
        float position_x;
        float position_y;
        float position_z;
        std::string point_comment;

        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `waypoints` WHERE entry = '%u';", aEntry);

        //Add the delete
        this->fCacheStream
            << "/* Step 1.8 Table  `waypoints */\n"
            //<< "DELETE FROM waypoints WHERE  `entry` = " << aEntry << ";\n";
            << "DELETE FROM waypoints WHERE  `entry` = " << "@ENTRY" << ";\n";

        if ( _Result )
        {
            bool _IsFirstTime = true;
            do {
                _Index = 0;
                _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                //
                                                // Obtener cada uno de los parámetros de la tabla de la bd según sus indices
                entry = _Fields [_Index++].GetUInt32();
                pointid = _Fields [_Index++].GetUInt32();
                position_x = _Fields [_Index++].GetFloat();
                position_y = _Fields [_Index++].GetFloat();
                position_z = _Fields [_Index++].GetFloat();
                point_comment = _Fields [_Index++].GetString();

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `waypoints` ("
                        << "`entry`,"
                        << "`pointid`,"
                        << "`position_x`,"
                        << "`position_y`,"
                        << "`position_z`,"
                        << "`point_comment`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";

                //
                // Insertar los parámetros.
                this->fCacheStream
                    //<< "('" << entry << "',"
                    << "(" << "@ENTRY" << ","
                    << " '" << pointid << "',"
                    << " '" << position_x << "',"
                    << " '" << position_y << "',"
                    << " '" << position_z << "',"
                    << " '" << this->SafeSQLParams(point_comment) << "')";

                //
                // Solo como comentario
                ;
            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";

            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    waypoints exported.");
        }
        else
            return false;
        return true;
    }

    bool exportGossipMenu(uint32 aEntry)
    {
        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `gossip_menu` WHERE MenuId = '%u';", aEntry);

        //Add the delete
        this->fCacheStream
            << "/* Step 2.7 Table  `gossip_menu */\n"
            << "DELETE FROM gossip_menu WHERE  `MenuId` = " << aEntry << ";\n";

        if ( _Result )
        {
            int _Rows = 0;
            bool _IsFirstTime = true;
            int* _Gossig = new int [_Result->GetRowCount()];

            do {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                                                        //
                                                        // Obtener cada uno de los parámetros de la tabla de la bd según sus indices
                uint32 entry = _Fields [_Index++].GetUInt32();
                uint32 TextId = _Fields [_Index++].GetUInt32();
                uint32 VerifiedBuild = _Fields [_Index++].GetUInt32();

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    //
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `gossip_menu` ("
                        << "`MenuId`,"
                        << "`TextId`,"
                        << "`VerifiedBuild`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";

                //
                // Insertar los parámetros.
                this->fCacheStream
                    << "(" << entry << ","
                    << "" << TextId << ","
                    << " " << VerifiedBuild << ")";



                _Gossig [_Rows++] = TextId;
                //
                // Solo como comentario
                ;
            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";

            for ( int i = 0; i < _Rows; i++ )
                this->exportNpcText(_Gossig [i]);

            //
            // Eliminar el buffer creado
            delete [] _Gossig;
            //
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            //
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    gossip_menu exported.");
        }
        else
            return false;
        return true;
    }
    bool ExportCreatureTemplateScaling(uint32 aEntry)
    {
        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `creature_template_scaling` WHERE Entry = '%u';", aEntry);
        //Add the delete
        this->fCacheStream
            << "/* Step 2.7 Table  `creature_template_scaling */\n"
            << "DELETE FROM creature_template_scaling WHERE  `Entry` = " << aEntry << ";\n";

        if ( _Result )
        {
            do
            {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                uint32 Entry = _Fields [_Index++].GetUInt32();
                uint32 LevelScalingMin = _Fields [_Index++].GetUInt32();
                uint32 LevelScalingMax = _Fields [_Index++].GetUInt32();
                int16  LevelScalingDeltaMin = _Fields [_Index++].GetInt16();
                uint32 LevelScalingDeltaMax = _Fields [_Index++].GetUInt32();
                uint32 VerifiedBuild = _Fields [_Index++].GetUInt32();

                // Agregar la query a la cache de almacenamiento.
                this->fCacheStream
                    << "INSERT INTO `creature_template_scaling` ("
                    << "`Entry`,"
                    << "`LevelScalingMin`,"
                    << "`LevelScalingMax`,"
                    << "`LevelScalingDeltaMin`,"
                    << "`LevelScalingDeltaMax`,"
                    << "`VerifiedBuild`) VALUES \n";
                // Insertar los parámetros.
                this->fCacheStream
                    << "('" << Entry << "',"
                    << " '" << LevelScalingMin << "',"
                    << " '" << LevelScalingMax << "',"
                    << " '" << LevelScalingDeltaMin << "',"
                    << " '" << LevelScalingDeltaMax << "',"
                    << " '" << VerifiedBuild << "');\n";

            } while ( _Result->NextRow() );
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    gossip_menu_opcion exported.");
        }
        else
            return false;
        return true;
    }

    bool ExportQuestTemplateAddon(uint32 aQuestID)
    {
        uint32 ID;
        uint32 MaxLevel;
        uint32 AllowableClasses;
        uint32 SourceSpellID;
        uint32 PrevQuestID;
        uint32 NextQuestID;
        uint32 ExclusiveGroup;
        uint32 RewardMailTemplateID;
        uint32 RewardMailDelay;
        uint32 RequiredSkillID;
        uint32 RequiredSkillPoints;
        uint32 RequiredMinRepFaction;
        uint32 RequiredMaxRepFaction;
        uint32 RequiredMinRepValue;
        uint32 RequiredMaxRepValue;
        uint32 ProvidedItemCount;
        uint32 SpecialFlags;
        std::string ScriptName;

        bool _IsFirstTime;
        uint16 _Index = 0;
        Field* _Fields;	// Materializar la fila en un objeto

        QueryResult _Result = WorldDatabase.PQuery(
            "SELECT * FROM `quest_template_addon` WHERE `ID` = '%u';", aQuestID);

        //Add the delete
        this->fCacheStream
            << "/* Step 3.4 Table  `quest_template_addon` */\n"
            << "DELETE FROM  `quest_template_addon` WHERE `ID` = " << aQuestID << ";\n";

        if ( _Result )
        {
            _IsFirstTime = true;
            do
            {
                _Index = 0;
                _Fields = _Result->Fetch();		// Materializar la fila en un objeto

                ID = _Fields [_Index++].GetUInt32();
                MaxLevel = _Fields [_Index++].GetUInt32();
                AllowableClasses = _Fields [_Index++].GetUInt16();
                SourceSpellID = _Fields [_Index++].GetUInt16();
                PrevQuestID = _Fields [_Index++].GetUInt16();
                NextQuestID = _Fields [_Index++].GetUInt16();
                ExclusiveGroup = _Fields [_Index++].GetUInt16();
                RewardMailTemplateID = _Fields [_Index++].GetUInt16();
                RewardMailDelay = _Fields [_Index++].GetUInt32();
                RequiredSkillID = _Fields [_Index++].GetUInt8();
                RequiredSkillPoints = _Fields [_Index++].GetUInt8();
                RequiredMinRepFaction = _Fields [_Index++].GetUInt8();
                RequiredMaxRepFaction = _Fields [_Index++].GetUInt8();
                RequiredMinRepValue = _Fields [_Index++].GetUInt16();
                RequiredMaxRepValue = _Fields [_Index++].GetUInt16();
                ProvidedItemCount = _Fields [_Index++].GetUInt8();
                SpecialFlags = _Fields [_Index++].GetUInt8();
                ScriptName = _Fields [_Index++].GetString();


                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `quest_template_addon` ("
                        << "`ID`,"
                        << "`MaxLevel`,"
                        << "`AllowableClasses`,"
                        << "`SourceSpellID`,"
                        << "`PrevQuestID`,"
                        << "`NextQuestID`,"
                        << "`ExclusiveGroup`,"
                        << "`RewardMailTemplateID`,"
                        << "`RewardMailDelay`,"
                        << "`RequiredSkillID`,"
                        << "`RequiredSkillPoints`,"
                        << "`RequiredMinRepFaction`,"
                        << "`RequiredMaxRepFaction`,"
                        << "`RequiredMinRepValue`,"
                        << "`RequiredMaxRepValue`,"
                        << "`ProvidedItemCount`,"
                        << "`SpecialFlags`,"
                        << "`ScriptName`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";
                // Insertar los parámetros.
                this->fCacheStream
                    << "('" << ID << "',"
                    << " '" << MaxLevel << "',"
                    << " '" << AllowableClasses << "',"
                    << " '" << SourceSpellID << "',"
                    << " '" << PrevQuestID << "',"
                    << " '" << NextQuestID << "',"
                    << " '" << ExclusiveGroup << "',"
                    << " '" << RewardMailTemplateID << "',"
                    << " '" << RewardMailDelay << "',"
                    << " '" << RequiredSkillID << "',"
                    << " '" << RequiredSkillPoints << "',"
                    << " '" << RequiredMinRepFaction << "',"
                    << " '" << RequiredMaxRepFaction << "',"
                    << " '" << RequiredMinRepValue << "',"
                    << " '" << RequiredMaxRepValue << "',"
                    << " '" << ProvidedItemCount << "',"
                    << " '" << SpecialFlags << "',"
                    << " '" << ScriptName << "')";


            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    quest_template_addon exported.");
        }
        else
            return true;
        return false;
    }
    bool ExportQuestObjective(uint32 _QuestID)
    {
        bool _IsFirstTime;
        uint32 ID;
        uint32 QuestID;
        uint32 Type;
        uint32 Order;
        uint32 StorageIndex;
        int32 ObjectID;
        int32 Amount;
        uint32 Flags;
        uint32 Flags2;
        float ProgressBarWeight;
        std::string Description;
        uint32 VerifiedBuild;


        QueryResult _Result = WorldDatabase.PQuery("SELECT * FROM `quest_objectives` WHERE `QuestID` = '%u';", _QuestID);
        //Add the delete
        this->fCacheStream
            << "DELETE FROM `quest_objectives` WHERE `QuestID` = " << "@ENTRY" << ";\n";

        if ( _Result )
        {
            _IsFirstTime = true;
            do
            {
                uint16 _Index = 0;
                Field* _Fields = _Result->Fetch();

                ID = _Fields [_Index++].GetUInt32();
                QuestID = _Fields [_Index++].GetUInt32();
                Type = _Fields [_Index++].GetUInt8();
                Order = _Fields [_Index++].GetUInt32();
                StorageIndex = _Fields [_Index++].GetInt8();
                ObjectID = _Fields [_Index++].GetInt32();
                Amount = _Fields [_Index++].GetUInt32();
                Flags = _Fields [_Index++].GetUInt32();
                Flags2 = _Fields [_Index++].GetUInt32();
                ProgressBarWeight = _Fields [_Index++].GetFloat();
                Description = _Fields [_Index++].GetString();
                VerifiedBuild = _Fields [_Index++].GetUInt32();

                if ( _IsFirstTime )
                {
                    _IsFirstTime = false;
                    // Agregar la query a la cache de almacenamiento.
                    this->fCacheStream
                        << "INSERT INTO `quest_objectives` ("
                        << "`ID` ,"
                        << "`QuestID` ,"
                        << "`Type` ,"
                        << "`Order` ,"
                        << "`StorageIndex` ,"
                        << "`ObjectID` ,"
                        << "`Amount` ,"
                        << "`Flags` ,"
                        << "`Flags2` ,"
                        << "`ProgressBarWeight` ,"
                        << "`Description` ,"
                        << "`VerifiedBuild`) VALUES \n";
                }
                else
                    this->fCacheStream << ", \n";
                // Insertar los parámetros.
                this->fCacheStream
                    << "(" << ID << ","
                    //<< " '" << "@ENTRY" << "',"
                    << " '" << QuestID << "',"
                    << " '" << Type << "',"
                    << " '" << Order << "',"
                    << " '" << StorageIndex << "',"
                    << " '" << ObjectID << "',"
                    << " '" << Amount << "',"
                    << " '" << Flags << "',"
                    << " '" << Flags2 << "',"
                    << " '" << ProgressBarWeight << "',"
                    << " '" << this->SafeSQLParams(Description) << "',"
                    << " '" << VerifiedBuild << "')";
                // Solo como comentario
                ;

            } while ( _Result->NextRow() );
            this->fCacheStream << "; \n";
            // Seperador (solo de bonito en el fichero)
            this->fCacheStream << "\n\n";
            // Notificar al usuario q se exporto las opciones de menu de una criatura.
            this->fHandler->PSendSysMessage("    quest_objectives exported.");
        }
        else
            return false;
        return true;
    }
    bool ExportGameObjectToSQLFile(uint32 aEntry)
    {

        std::string _GameObjectName;
        std::ostringstream _FileName;
        std::ostringstream _ItemsDescription;
        uint32 _StartTime = ::getMSTime();

        if ( this->exportGameObjectTemplate(aEntry, _GameObjectName) )
        {
            this->exportGameObject(aEntry);
            this->fCacheStream
                << "/*## Step 2: GObject Loots ###########################################*/\n\n";
            this->exportGameobjectLootTemplate(aEntry, _ItemsDescription);
            this->fCacheStream
                << "/* Step 2.6 GObject > Quest Items Data: ItemID - Quality - SellPrice - ItemLevel - RequiredLevel - Name */\n" << "/*\n"
                << _ItemsDescription.str().c_str() << "\n\n\n";
            this->exportGameObjectQuestRelation(aEntry, 0);/*gameobject_starter*/
            this->exportGameObjectInvolvedRelation(aEntry, 0);/*gameobject_questender*/
            this->fCacheStream
                << "/*## Step 3: GObjects Conditions #####################################*/\n\n"
                << "/*## Step 4: GObjects Needs to Work ##################################*/\n\n";
            this->exportGameObjectQuestRelation(aEntry, 0);
            this->exportGameObjectInvolvedRelation(aEntry, 0);

            //
            // Exportar para el fichero
            _FileName << "GameObject " << "[" << aEntry << "] " << CheckName(_GameObjectName) << ".sql";
            this->FlushToFile(_FileName.str(), aEntry, _GameObjectName);

            this->fHandler->PSendSysMessage("%s gameobject_template exported in: %u ms.", _GameObjectName.c_str(), ::GetMSTimeDiffToNow(_StartTime));
            return true;
        }
        this->fHandler->PSendSysMessage("exported gameobject_template entry: %u error.", aEntry);
        return false;


    }
    bool ExportQuestToSQLFile(uint32 aEntry)
    {
        std::string _QuestName;
        std::ostringstream _FileName;
        uint32 _StartTime = ::getMSTime();
        std::list<uint64> _rewardItems;
        LocaleConstant defaultLocale = sWorld->GetDefaultDbcLocale();
        if ( this->exportQuestTemplate(aEntry, _QuestName) )
        {
            this->fCacheStream << "/*## Step 2: Quest Givers ############################################*/\n\n";
            this->exportCreatureQuestRelation(0, aEntry);
            this->exportGameObjectQuestRelation(0, aEntry);

            this->fCacheStream << "/*## Step 3: Quest POIs ##############################################*/\n\n";

            this->exportQuestPoi(aEntry);
            this->exportQuestPoiPoints(aEntry);

            this->fCacheStream << "/*## Step 3: Quest Scripts ##############################################*/\n\n";



            this->fCacheStream << "/*## Step 4: Quest Receivers #########################################*/\n\n";

            this->exportCreatureInvolvedRelation(0, aEntry);
            this->exportGameObjectInvolvedRelation(0, aEntry);
            this->ExportQuestTemplateAddon(aEntry);
            this->ExportQuestObjective(aEntry);
            this->fCacheStream << "/*## Step 5: Quest Items Reward ######################################*/\n\n";
            this->fCacheStream << "/* Step 5.8 Reward Items Choice: Name - Quality - SellPrice - ItemLevel - RequiredLevel */\n";
            Quest const* _quest = sObjectMgr->GetQuestTemplate(aEntry);

            for ( int i = 0; i < 6; i++ )
            {
                if ( i == 0 )
                    this->fCacheStream << "/*\n";

                if ( _quest->RewardChoiceItemId [i] != 0 )
                    if ( ItemTemplate const* itemProto = sObjectMgr->GetItemTemplate(_quest->RewardChoiceItemId [i]) )
                    {
                        _rewardItems.push_back(itemProto->GetId());
                        this->fCacheStream
                            << itemProto->GetId() << "  "
                            << itemProto->GetQuality() << "  "
                            << GetItemQuality(itemProto->GetId()) << "  ";
                        if ( itemProto->GetSellPrice() )
                        {
                            uint32 _gold = ( itemProto->GetSellPrice() / GOLD );
                            uint32 _silv = ( ( itemProto->GetSellPrice() % GOLD ) / SILVER );
                            uint32 _copp = ( ( itemProto->GetSellPrice() % GOLD ) % SILVER );
                            this->fCacheStream
                                << _gold << "g " << _silv << "s " << _copp << "c  ";
                        }
                        this->fCacheStream
                            << itemProto->GetBaseItemLevel() << "  "
                            << itemProto->GetBaseRequiredLevel() << "  "
                            << itemProto->GetName(defaultLocale) << "\n";
                    }

                if ( i == 5 )
                    this->fCacheStream << "*/\n";
            }
            this->fCacheStream << "/* Step 5.9 Reward Items: Name - Quality - SellPrice - ItemLevel - RequiredLevel */\n";
            for ( int i = 0; i < 4; i++ )
            {
                if ( i == 0 )
                    this->fCacheStream << "/*\n";

                if ( _quest->RewardItemId [i] != 0 )
                    if ( ItemTemplate const* itemProto = sObjectMgr->GetItemTemplate(_quest->RewardItemId [i]) )
                    {
                        _rewardItems.push_back(itemProto->GetId());
                        this->fCacheStream
                            << itemProto->GetId() << "  "
                            << itemProto->GetQuality() << "  "
                            << GetItemQuality(itemProto->GetId()) << "  ";
                        if ( itemProto->GetSellPrice() )
                        {
                            uint32 _gold = ( itemProto->GetSellPrice() / GOLD );
                            uint32 _silv = ( ( itemProto->GetSellPrice() % GOLD ) / SILVER );
                            uint32 _copp = ( ( itemProto->GetSellPrice() % GOLD ) % SILVER );
                            this->fCacheStream
                                << _gold << "g " << _silv << "s " << _copp << "c  ";
                        }
                        this->fCacheStream
                            << itemProto->GetBaseItemLevel() << "  "
                            << itemProto->GetBaseRequiredLevel() << "  "
                            << itemProto->GetName(defaultLocale) << "\n";
                    }

                if ( i == 3 )
                    this->fCacheStream << "*/\n";
            }
            this->fCacheStream << "/*## Step 6: Quest Conditions ########################################*/\n\n";


            this->fCacheStream << "/*## Step 7: Quest Needs to Work #####################################*/\n\n";

            //
            // Exportar para el fichero
            _FileName << "Quest " << "[" << aEntry << "] " << CheckName(_QuestName) << ".sql";
            this->FlushToFile(_FileName.str(), aEntry, _QuestName);

            this->fHandler->PSendSysMessage("%s quest_template exported in: %u ms.", _QuestName.c_str(), ::GetMSTimeDiffToNow(_StartTime));
            return true;
        }
        this->fHandler->PSendSysMessage("exported quest_template entry: %u error.", aEntry);
        return false;
    }
    ///
    bool ExportToSQLFile(uint32 aEntry)
    {
        std::string _CreatureName;
        std::ostringstream _FileName;
        std::ostringstream _ItemsDescription;

        uint32 _StartTime = ::getMSTime();
        uint32 _CreatureEquipmentId, _CreatureLootId, _CreatureIsQuestGiver, _GossipMenuIdTemplate;

        // Limpiar el flujo y exportar todas las dependencias del identificador especificado.
        this->fCacheStream.clear();
        if ( this->exportCreatureTemplate(aEntry, &_CreatureLootId, &_CreatureEquipmentId, &_CreatureIsQuestGiver, &_GossipMenuIdTemplate, _CreatureName) )
        {

            this->exportCreatureTemplateAddon(aEntry);
            this->exportCreatureText(aEntry);
            this->exportSmartScripts(aEntry, 0);
            this->exportCreature(aEntry);

            _ItemsDescription
                << "/*\n";

            if ( _CreatureLootId != 0 )
                this->exportCreatureLootTemplate(_CreatureLootId, _ItemsDescription);

            this->exportCreatureOnkillReputation(aEntry);
            _ItemsDescription
                /*<< "/*Pickpocketing Loot Template Items Data: Id - Quality - SellPrice - ItemLevel - RequiredLevel - Name *///\n"
                << "/*\n";

            this->exportPickpocketingLootTemplate(aEntry, _ItemsDescription);
            _ItemsDescription << "*/\n";

            _ItemsDescription
                << "/*Skinning Loot Template Items Data: Id - Quality - SellPrice - ItemLevel - RequiredLevel - Name */\n"
                << "/*\n";

            this->exportSkinningLootTemplate(aEntry, _ItemsDescription);

            //_ItemsDescription << "*/\n";

            this->fCacheStream << _ItemsDescription.str().c_str() << "\n\n";
            // this->fCacheStream << "/*## Step 3: Creature Extras ##########################################*/\n\n";

            this->exportCreatureSummonGroups(aEntry);

            // this->fCacheStream << "/*## Step 4: Creature Gossip Menu Options #############################*/\n\n";

            this->exportGossipMenu(_GossipMenuIdTemplate);
            if ( _GossipMenuIdTemplate != 0 )
                this->exportGossipMenuOption(_GossipMenuIdTemplate);
            this->exportGossipMenuOptionAction(_GossipMenuIdTemplate);

            // this->fCacheStream << "/*## Step 5: Creature NPC Trainer / Vendor ############################*/\n\n";
            this->exportCreatureEquipTemplate(aEntry);
            this->exportNPCTrainer(aEntry);
            this->exportNPCVendor(aEntry);

            ///*this->fCacheStream
            //    << "/*## Step 6: Creature NPC Conditions ##################################*/\n\n"
            //    << "/* Step 6.9 Table `conditions` */\n"
            //    << "/*DELETE FROM  `conditions` WHERE `SourceTypeOrReferenceId` AND `SourceGroup`;\n"
            //    << "*/\n\n"
            //    << "/*## Step 7: Creature NPC Needs to Work ###############################*/\n\n";*/

            this->exportCreatureQuestRelation(aEntry, 0);
            this->exportCreatureInvolvedRelation(aEntry, 0);
            this->exportWaypoints(aEntry);
            this->exportNpcSpellclickSpells(aEntry);
            this->exportCreatureDefaultTriner(aEntry);
            this->ExportCreatureTemplateScaling(aEntry);

            _FileName << "Creature " << "[" << aEntry << "] " << CheckName(_CreatureName) << " " << ".sql";
            this->FlushToFile(_FileName.str(), aEntry, _CreatureName);
            //
            // Notificar q todo acabo ok
            this->fHandler->PSendSysMessage("%s creature exported in: %u ms.", _CreatureName.c_str(), ::getMSTime() - _StartTime);

            return true;
        }
        this->fHandler->PSendSysMessage("exported creature entry: %u error.", aEntry);
        return false;
    }
};

class export_commandscript : public CommandScript
{
public:
    export_commandscript() : CommandScript("export_commandscript") { }

    std::vector<ChatCommand> GetCommands() const override
    {
        static std::vector<ChatCommand> exportcommandTable =
        {
            { "quest",    rbac::RBAC_PERM_COMMAND_GUILD_CREATE,   true,  &HandleExportQuestCommand,           "" },
            { "go",       rbac::RBAC_PERM_COMMAND_GUILD_DELETE,   true,  &HandleExportGOCommand,              "" },
            { "Position", rbac::RBAC_PERM_COMMAND_GUILD_INVITE,   true,  &HandleExportPositionCommand,           "" },

            { "Creature", rbac::RBAC_PERM_COMMAND_GUILD_UNINVITE, true, &HandleExportCreatureCommand,         "" },
            /*{ "rank",     rbac::RBAC_PERM_COMMAND_GUILD_RANK,     true, &HandleGuildRankCommand,             "" },
            { "rename",   rbac::RBAC_PERM_COMMAND_GUILD_RENAME,   true, &HandleGuildRenameCommand,           "" },
            { "info",     rbac::RBAC_PERM_COMMAND_GUILD_INFO,     true, &HandleGuildInfoCommand,             "" },*/
        };
        static std::vector<ChatCommand> commandTable =
        {
            { "export", rbac::RBAC_PERM_COMMAND_GUILD,  true, NULL, "", exportcommandTable },
        };
        return commandTable;
    }


    /// Author:Mayor
    /// <summary>
    /// Ejecuta el comando de exportacin de coordenadas con identificador especificado La forma de ejecucin es .export position
    /// </summary>
    /// <param name="handler"></param>
    /// <param name="args"></param>
    static bool HandleExportPositionCommand(ChatHandler* aHandler, char const* aArgs)
    {
        // WorldObject* target = nullptr;
        Unit* target = aHandler->getSelectedUnit();


        std::ostringstream _positionData;
        float _posX, _posY, _posZ, _ori;
        uint32 _Map, _Zone, _Area;

        if ( target )
        {
            // Basic Position Data.
            _posX = target->GetPositionX();
            _posY = target->GetPositionY();
            _posZ = target->GetPositionZ();
            _ori = target->GetOrientation();
            _Map = target->GetMapId();

            // Generate Zone and Area.
            CommadExportHelper commanHelper;
            _Zone = commanHelper.GetZoneOrAreaID(_Map, _posX, _posY, _posZ, true);
            _Area = commanHelper.GetZoneOrAreaID(_Map, _posX, _posY, _posZ, false);

            //_positionData
            //    << "\n"
            //    << "/* PositionX, PositionY, PositionZ, Orientation, Map, Zone, Area */( " << target->GetName() << " )\n"
            //    << _posX << ", " << _posY << ", " << _posZ << ", " << _ori << ", " << _Map << ", " << _Zone << ", " << _Area << "\n";

            ///**/
            //_positionData
            //    << "\n"
            //    << "UPDATE `allowed_areas` SET `allowed_enter`='1' WHERE (`area_id`='" << _Zone << "');\n"
            //    << "UPDATE `allowed_areas` SET `allowed_enter`='1' WHERE (`zone_id`='" << _Zone << "');";

            _positionData
                /* << "SET @CREATURE  	:= 'Name of NPC';\n"
                << "SET @ENTRY 		:= 'ENTRY OF NPC';\n"*/
                << "INSERT INTO `waypoints`  VALUES  (@ENTRY,  pointid ," << _posX << ", " << _posY << ", " << _posZ << ", " << "'Comment'" ");\n";
            /**/

            // Write File
            FILE* fout = fopen("Positions.sql", "a");
            fprintf(fout, "%s\n", _positionData.str().c_str());
            fclose(fout);

            // Notify
            aHandler->PSendSysMessage("Position of %s exported to File \"Position\"", target->GetName());
        }

        return true;
    }
    static bool HandleExportQuestCommand(ChatHandler* aHandler, char const* aArgs)
    {
        if ( !*aArgs )
            return false;

        uint32 _QuestID;
        char const *_Id = aHandler->extractKeyFromLink(( char* )aArgs, "Hitem");
        if ( !_Id )
            return false;
        _QuestID = uint32(atol(_Id));

        CommandExportCreature _Export(aHandler);
        return _Export.ExportQuestToSQLFile(_QuestID);
    }
    static bool HandleExportGOAllCommand(ChatHandler* aHandler, const char* aArgs)
    {

        return true;
    }
    static bool HandleExportGOCommand(ChatHandler* aHandler, char const* aArgs)
    {

        if ( !*aArgs )
            return false;

        uint32 _GameObjID;
        char const *_Id = aHandler->extractKeyFromLink(( char* )aArgs, "Hitem");
        if ( !_Id )
            return false;
        _GameObjID = uint32(atol(_Id));

        CommandExportCreature _Export(aHandler);
        return _Export.ExportGameObjectToSQLFile(_GameObjID);
    }

    static bool HandleExportCreatureCommand(ChatHandler* aHandler, const char* aArgs)
    {
        Creature* _Target = aHandler->getSelectedCreature();

        if ( !*aArgs && !_Target )
        {
            aHandler->SendSysMessage("You most select a creature or enter an creature entry.");
            aHandler->SetSentErrorMessage(true);
            return false;
        }
        else if ( !*aArgs && _Target )
        {
            CommandExportCreature _Export(aHandler);
            _Export.ExportToSQLFile(_Target->GetEntry());
            return true;
        }
        else
        {
            uint64 _Entry;

            // strtoull doesn't exist on WIN
#if PLATFORM == PLATFORM_WINDOWS
            _Entry = _strtoui64(( char* )aArgs, NULL, 10);
#else
            _Entry = strtoull(( char* )aArgs, NULL, 10);
#endif

            CommandExportCreature _Export(aHandler);
            _Export.ExportToSQLFile(_Entry);
            return true;
        }
    }
};

static bool HandleExportCreatureAllCommand(ChatHandler* aHandler, const char* aArgs)
{
    //
    std::list<uint32> _creatureIDs;
    //
    QueryResult _Result = WorldDatabase.PQuery(
        "SELECT "
        "creature.id "
        "FROM "
        "creature "
        "GROUP BY "
        "creature.id");

    if ( _Result )
    {
        do {
            uint16 _Index = 0;
            Field* _Fields = _Result->Fetch();		// Materializar la fila en un objeto

            uint32 entry = _Fields [_Index++].GetUInt32();

            _creatureIDs.push_back(entry);

        } while ( _Result->NextRow() );
    }
    else
        return false;

    for ( auto itr : _creatureIDs )
    {
        CommandExportCreature _Export(aHandler);
        _Export.ExportToSQLFile(itr);
    }

    return true;
}

void AddSC_export_commandscript()
{
    new export_commandscript();
}
