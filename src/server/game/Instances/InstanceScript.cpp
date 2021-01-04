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

#include "InstanceScript.h"
#include "AreaBoundary.h"
#include "AchievementMgr.h"
#include "ChallengeModeMgr.h"
#include "ChallengeModePackets.h"
#include "Creature.h"
#include "CreatureAI.h"
#include "CreatureAIImpl.h"
#include "DatabaseEnv.h"
#include "GameObject.h"
#include "Group.h"
#include "InstancePackets.h"
#include "InstanceScenario.h"
#include "LFGMgr.h"
#include "Log.h"
#include "Map.h"
#include "MiscPackets.h"
#include "ObjectMgr.h"
#include "Pet.h"
#include "PhasingHandler.h"
#include "Player.h"
#include "RBAC.h"
#include "ScriptMgr.h"
#include "ScriptReloadMgr.h"
#include "World.h"
#include "WorldSession.h"
#include <sstream>
#include <cstdarg>
#include "SpellMgr.h"

BossBoundaryData::~BossBoundaryData()
{
    for (const_iterator it = begin(); it != end(); ++it)
        delete it->Boundary;
}

InstanceScript::InstanceScript(InstanceMap* map) : instance(map), completedEncounters(0), _instanceSpawnGroups(sObjectMgr->GetSpawnGroupsForInstance(map->GetId())),
_entranceId(0), _temporaryEntranceId(0), _combatResurrectionTimer(0), _combatResurrectionCharges(0), _combatResurrectionTimerStarted(false),
_challengeModeStarted(false), _challengeModeLevel(0), _challengeModeStartTime(0), _challengeModeDeathCount(0)
{
    _scriptType = ZONE_SCRIPT_TYPE_INSTANCE;

#ifdef TRINITY_API_USE_DYNAMIC_LINKING
    uint32 scriptId = sObjectMgr->GetInstanceTemplate(map->GetId())->ScriptId;
    auto const scriptname = sObjectMgr->GetScriptName(scriptId);
    ASSERT(!scriptname.empty());
   // Acquire a strong reference from the script module
   // to keep it loaded until this object is destroyed.
    module_reference = sScriptMgr->AcquireModuleReferenceOfScriptName(scriptname);
#endif // #ifndef TRINITY_API_USE_DYNAMIC_LINKING
}

void InstanceScript::SaveToDB()
{
    if (InstanceScenario* scenario = instance->GetInstanceScenario())
        scenario->SaveToDB();

    std::string data = GetSaveData();
    if (data.empty())
        return;

    CharacterDatabasePreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_UPD_INSTANCE_DATA);
    stmt->setUInt32(0, GetCompletedEncounterMask());
    stmt->setString(1, data);
    stmt->setUInt32(2, _entranceId);
    stmt->setUInt32(3, instance->GetInstanceId());
    CharacterDatabase.Execute(stmt);
}

bool InstanceScript::IsEncounterInProgress() const
{
    for (std::vector<BossInfo>::const_iterator itr = bosses.begin(); itr != bosses.end(); ++itr)
        if (itr->state == IN_PROGRESS)
            return true;

    return false;
}

void InstanceScript::OnCreatureCreate(Creature* creature)
{
    AddObject(creature, true);
    AddMinion(creature, true);

    Difficulty difficulty = instance->GetDifficultyID();
    if (difficulty != DIFFICULTY_NONE)
        if (InstanceDifficultyMultiplier const* multiplier = sObjectMgr->GetInstanceDifficultyMultiplier(instance->GetId(), difficulty))
            creature->SetBaseHealth(creature->GetMaxHealth() * multiplier->healthMultiplier);

    if (IsChallengeModeStarted())
        if (!creature->IsPet())
            CastChallengeCreatureSpell(creature);
}

void InstanceScript::OnCreatureRemove(Creature* creature)
{
    AddObject(creature, false);
    AddMinion(creature, false);
}

void InstanceScript::OnGameObjectCreate(GameObject* go)
{
    AddObject(go, true);
    AddDoor(go, true);
}

void InstanceScript::OnGameObjectRemove(GameObject* go)
{
    AddObject(go, false);
    AddDoor(go, false);
}

ObjectGuid InstanceScript::GetObjectGuid(uint32 type) const
{
    ObjectGuidMap::const_iterator i = _objectGuids.find(type);
    if (i != _objectGuids.end())
        return i->second;
    return ObjectGuid::Empty;
}

ObjectGuid InstanceScript::GetGuidData(uint32 type) const
{
    return GetObjectGuid(type);
}

Creature* InstanceScript::GetCreature(uint32 type)
{
    return instance->GetCreature(GetObjectGuid(type));
}

GameObject* InstanceScript::GetGameObject(uint32 type)
{
    return instance->GetGameObject(GetObjectGuid(type));
}

void InstanceScript::OnPlayerEnter(Player* player)
{
    if (IsChallengeModeStarted())
    {
        WorldPackets::ChallengeMode::ChangePlayerDifficultyResult changePlayerDifficultyResult(11);
        changePlayerDifficultyResult.InstanceDifficultyID = instance->GetId();
        changePlayerDifficultyResult.DifficultyRecID = DIFFICULTY_MYTHIC_KEYSTONE;
        player->SendDirectMessage(changePlayerDifficultyResult.Write());

        SendChallengeModeStart(player);
        SendChallengeModeElapsedTimer(player);
        SendChallengeModeDeathCount(player);

        CastChallengePlayerSpell(player);
    }
}

void InstanceScript::OnPlayerExit(Player* player)
{
    player->RemoveAurasDueToSpell(SPELL_CHALLENGER_BURDEN);
}

void InstanceScript::OnPlayerDeath(Player* /*player*/)
{
    if (IsChallengeModeStarted())
    {
        ++_challengeModeDeathCount;

        SendChallengeModeElapsedTimer();
        SendChallengeModeDeathCount();
    }
}

void InstanceScript::SetHeaders(std::string const& dataHeaders)
{
    for (char header : dataHeaders)
        if (isalpha(header))
            headers.push_back(header);
}

void InstanceScript::LoadBossBoundaries(BossBoundaryData const& data)
{
    for (BossBoundaryEntry const& entry : data)
        if (entry.BossId < bosses.size())
            bosses[entry.BossId].boundary.push_back(entry.Boundary);
}

void InstanceScript::LoadMinionData(MinionData const* data)
{
    while (data->entry)
    {
        if (data->bossId < bosses.size())
            minions.insert(std::make_pair(data->entry, MinionInfo(&bosses[data->bossId])));

        ++data;
    }
    TC_LOG_DEBUG("scripts", "InstanceScript::LoadMinionData: " UI64FMTD " minions loaded.", uint64(minions.size()));
}

void InstanceScript::LoadDoorData(DoorData const* data)
{
    while (data->entry)
    {
        if (data->bossId < bosses.size())
            doors.insert(std::make_pair(data->entry, DoorInfo(&bosses[data->bossId], data->type)));

        ++data;
    }
    TC_LOG_DEBUG("scripts", "InstanceScript::LoadDoorData: " UI64FMTD " doors loaded.", uint64(doors.size()));
}

void InstanceScript::LoadObjectData(ObjectData const* creatureData, ObjectData const* gameObjectData)
{
    if (creatureData)
        LoadObjectData(creatureData, _creatureInfo);

    if (gameObjectData)
        LoadObjectData(gameObjectData, _gameObjectInfo);

    TC_LOG_DEBUG("scripts", "InstanceScript::LoadObjectData: " SZFMTD " objects loaded.", _creatureInfo.size() + _gameObjectInfo.size());
}

void InstanceScript::LoadObjectData(ObjectData const* data, ObjectInfoMap& objectInfo)
{
    while (data->entry)
    {
        ASSERT(objectInfo.find(data->entry) == objectInfo.end());
        objectInfo[data->entry] = data->type;
        ++data;
    }
}

void InstanceScript::UpdateDoorState(GameObject* door)
{
    DoorInfoMapBounds range = doors.equal_range(door->GetEntry());
    if (range.first == range.second)
        return;

    bool open = true;
    for (; range.first != range.second && open; ++range.first)
    {
        DoorInfo const& info = range.first->second;
        switch (info.type)
        {
            case DOOR_TYPE_ROOM:
                open = (info.bossInfo->state != IN_PROGRESS);
                break;
            case DOOR_TYPE_PASSAGE:
                open = (info.bossInfo->state == DONE);
                break;
            case DOOR_TYPE_SPAWN_HOLE:
                open = (info.bossInfo->state == IN_PROGRESS);
                break;
            default:
                break;
        }
    }

    door->SetGoState(open ? GO_STATE_ACTIVE : GO_STATE_READY);
}

void InstanceScript::UpdateMinionState(Creature* minion, EncounterState state)
{
    switch (state)
    {
        case NOT_STARTED:
            if (!minion->IsAlive())
                minion->Respawn();
            else if (minion->IsInCombat())
                minion->AI()->EnterEvadeMode();
            break;
        case IN_PROGRESS:
            if (!minion->IsAlive())
                minion->Respawn();
            else if (!minion->GetVictim())
                minion->AI()->DoZoneInCombat();
            break;
        default:
            break;
    }
}

void InstanceScript::UpdateSpawnGroups()
{
    if (!_instanceSpawnGroups)
        return;
    enum states { BLOCK, SPAWN, FORCEBLOCK };
    std::unordered_map<uint32, states> newStates;
    for (auto it = _instanceSpawnGroups->begin(), end = _instanceSpawnGroups->end(); it != end; ++it)
    {
        InstanceSpawnGroupInfo const& info = *it;
        states& curValue = newStates[info.SpawnGroupId]; // makes sure there's a BLOCK value in the map
        if (curValue == FORCEBLOCK) // nothing will change this
            continue;
        if (!((1 << GetBossState(info.BossStateId)) & info.BossStates))
            continue;
        if (info.Flags & InstanceSpawnGroupInfo::FLAG_BLOCK_SPAWN)
            curValue = FORCEBLOCK;
        else if (info.Flags & InstanceSpawnGroupInfo::FLAG_ACTIVATE_SPAWN)
            curValue = SPAWN;
    }
    for (auto const& pair : newStates)
    {
        uint32 const groupId = pair.first;
        bool const doSpawn = (pair.second == SPAWN);
        if (instance->IsSpawnGroupActive(groupId) == doSpawn)
            continue; // nothing to do here
        // if we should spawn group, then spawn it...
        if (doSpawn)
            instance->SpawnGroupSpawn(groupId);
        else // otherwise, set it as inactive so it no longer respawns (but don't despawn it)
            instance->SetSpawnGroupActive(groupId, false);
    }
}

BossInfo* InstanceScript::GetBossInfo(uint32 id)
{
    ASSERT(id < bosses.size());
    return &bosses[id];
}

void InstanceScript::AddObject(Creature* obj, bool add)
{
    ObjectInfoMap::const_iterator j = _creatureInfo.find(obj->GetEntry());
    if (j != _creatureInfo.end())
        AddObject(obj, j->second, add);
    else
        AddObject(obj, obj->GetEntry(), add);
}

void InstanceScript::AddObject(GameObject* obj, bool add)
{
    ObjectInfoMap::const_iterator j = _gameObjectInfo.find(obj->GetEntry());
    if (j != _gameObjectInfo.end())
        AddObject(obj, j->second, add);
    else
        AddObject(obj, obj->GetEntry(), add);
}

void InstanceScript::AddObject(WorldObject* obj, uint32 type, bool add)
{
    if (add)
        _objectGuids[type] = obj->GetGUID();
    else
    {
        ObjectGuidMap::iterator i = _objectGuids.find(type);
        if (i != _objectGuids.end() && i->second == obj->GetGUID())
            _objectGuids.erase(i);
    }
}

void InstanceScript::AddDoor(GameObject* door, bool add)
{
    DoorInfoMapBounds range = doors.equal_range(door->GetEntry());
    if (range.first == range.second)
        return;

    for (; range.first != range.second; ++range.first)
    {
        DoorInfo const& data = range.first->second;

        if (add)
        {
            data.bossInfo->door[data.type].insert(door->GetGUID());
        }
        else
            data.bossInfo->door[data.type].erase(door->GetGUID());
    }

    if (add)
        UpdateDoorState(door);
}

void InstanceScript::AddMinion(Creature* minion, bool add)
{
    MinionInfoMap::iterator itr = minions.find(minion->GetEntry());
    if (itr == minions.end())
        return;

    if (add)
        itr->second.bossInfo->minion.insert(minion->GetGUID());
    else
        itr->second.bossInfo->minion.erase(minion->GetGUID());
}

bool InstanceScript::SetBossState(uint32 id, EncounterState state)
{
    if (id < bosses.size())
    {
        BossInfo* bossInfo = &bosses[id];
        if (bossInfo->state == TO_BE_DECIDED) // loading
        {
            bossInfo->state = state;
            TC_LOG_DEBUG("scripts", "InstanceScript: Initialize boss %u state as %s (map %u, %u).", id, GetBossStateName(state), instance->GetId(), instance->GetInstanceId());
            return false;
        }
        else
        {
            if (bossInfo->state == state)
                return false;

            if (bossInfo->state == DONE)
            {
                TC_LOG_ERROR("map", "InstanceScript: Tried to set instance state from %s back to %s for map %u, instance id %u. Blocked!", GetBossStateName(bossInfo->state), GetBossStateName(state), instance->GetId(), instance->GetInstanceId());
                return false;
            }

            if (state == DONE)
                for (GuidSet::iterator i = bossInfo->minion.begin(); i != bossInfo->minion.end(); ++i)
                    if (Creature* minion = instance->GetCreature(*i))
                        if (minion->isWorldBoss() && minion->IsAlive())
                            return false;

            switch (state)
            {
                case NOT_STARTED:
                {
                    if (bossInfo->state == IN_PROGRESS)
                    {
                        ResetCombatResurrections();
                        SendEncounterEnd();
                    }
                    break;
                }
                case IN_PROGRESS:
                {
                    uint32 resInterval = GetCombatResurrectionChargeInterval();
                    InitializeCombatResurrections(1, resInterval);
                    SendEncounterStart(1, 9, resInterval, resInterval);

                    DoOnPlayers([](Player* player)
                    {
                        if (player->IsAlive())
                            player->ProcSkillsAndAuras(nullptr, PROC_FLAG_ENCOUNTER_START, PROC_FLAG_NONE, PROC_SPELL_TYPE_MASK_ALL, PROC_SPELL_PHASE_NONE, PROC_HIT_NONE, nullptr, nullptr, nullptr);
                    });

                    break;
                }
                case FAIL:
                case DONE:
                    ResetCombatResurrections();
                    SendEncounterEnd();
                    break;
                default:
                    break;
            }

            bossInfo->state = state;
            SaveToDB();
        }

        for (uint32 type = 0; type < MAX_DOOR_TYPES; ++type)
            for (GuidSet::iterator i = bossInfo->door[type].begin(); i != bossInfo->door[type].end(); ++i)
                if (GameObject* door = instance->GetGameObject(*i))
                    UpdateDoorState(door);

        GuidSet minions = bossInfo->minion; // Copy to prevent iterator invalidation (minion might be unsummoned in UpdateMinionState)
        for (GuidSet::iterator i = minions.begin(); i != minions.end(); ++i)
            if (Creature* minion = instance->GetCreature(*i))
                UpdateMinionState(minion, state);

        UpdateSpawnGroups();
        return true;
    }
    return false;
}

bool InstanceScript::_SkipCheckRequiredBosses(Player const* player /*= nullptr*/) const
{
    return player && player->GetSession()->HasPermission(rbac::RBAC_PERM_SKIP_CHECK_INSTANCE_REQUIRED_BOSSES);
}

void InstanceScript::Create()
{
    for (size_t i = 0; i < bosses.size(); ++i)
        SetBossState(i, NOT_STARTED);
    UpdateSpawnGroups();
}

void InstanceScript::Load(char const* data)
{
    if (!data)
    {
        OUT_LOAD_INST_DATA_FAIL;
        return;
    }

    OUT_LOAD_INST_DATA(data);

    std::istringstream loadStream(data);

    if (ReadSaveDataHeaders(loadStream))
    {
        ReadSaveDataBossStates(loadStream);
        ReadSaveDataMore(loadStream);
    }
    else
        OUT_LOAD_INST_DATA_FAIL;

    OUT_LOAD_INST_DATA_COMPLETE;
}

bool InstanceScript::ReadSaveDataHeaders(std::istringstream& data)
{
    for (char header : headers)
    {
        char buff;
        data >> buff;

        if (header != buff)
            return false;
    }

    return true;
}

void InstanceScript::ReadSaveDataBossStates(std::istringstream& data)
{
    uint32 bossId = 0;
    for (std::vector<BossInfo>::iterator i = bosses.begin(); i != bosses.end(); ++i, ++bossId)
    {
        uint32 buff;
        data >> buff;
        if (buff == IN_PROGRESS || buff == FAIL || buff == SPECIAL)
            buff = NOT_STARTED;

        if (buff < TO_BE_DECIDED)
            SetBossState(bossId, EncounterState(buff));
    }
    UpdateSpawnGroups();
}

std::string InstanceScript::GetSaveData()
{
    OUT_SAVE_INST_DATA;

    std::ostringstream saveStream;

    WriteSaveDataHeaders(saveStream);
    WriteSaveDataBossStates(saveStream);
    WriteSaveDataMore(saveStream);

    OUT_SAVE_INST_DATA_COMPLETE;

    return saveStream.str();
}

void InstanceScript::WriteSaveDataHeaders(std::ostringstream& data)
{
    for (char header : headers)
        data << header << ' ';
}

void InstanceScript::WriteSaveDataBossStates(std::ostringstream& data)
{
    for (BossInfo const& bossInfo : bosses)
        data << uint32(bossInfo.state) << ' ';
}

void InstanceScript::HandleGameObject(ObjectGuid guid, bool open, GameObject* go /*= nullptr*/)
{
    if (!go)
        go = instance->GetGameObject(guid);
    if (go)
        go->SetGoState(open ? GO_STATE_ACTIVE : GO_STATE_READY);
    else
        TC_LOG_DEBUG("scripts", "InstanceScript: HandleGameObject failed");
}

void InstanceScript::UpdateOperations(uint32 const diff)
{
    for (auto itr = timedDelayedOperations.begin(); itr != timedDelayedOperations.end(); itr++)
    {
        itr->first -= diff;

        if (itr->first < 0)
        {
            itr->second();
            itr->second = nullptr;
        }
    }

    uint32 timedDelayedOperationCountToRemove = std::count_if(std::begin(timedDelayedOperations), std::end(timedDelayedOperations), [](const std::pair<int32, std::function<void()>> & pair) -> bool
    {
        return pair.second == nullptr;
    });

    for (uint32 i = 0; i < timedDelayedOperationCountToRemove; i++)
    {
        auto itr = std::find_if(std::begin(timedDelayedOperations), std::end(timedDelayedOperations), [](const std::pair<int32, std::function<void()>> & p_Pair) -> bool
        {
            return p_Pair.second == nullptr;
        });

        if (itr != std::end(timedDelayedOperations))
            timedDelayedOperations.erase(itr);
    }

    if (timedDelayedOperations.empty() && !emptyWarned)
    {
        emptyWarned = true;
        LastOperationCalled();
    }
}

void InstanceScript::DoUseDoorOrButton(ObjectGuid guid, uint32 withRestoreTime /*= 0*/, bool useAlternativeState /*= false*/)
{
    if (!guid)
        return;

    if (GameObject* go = instance->GetGameObject(guid))
    {
        if (go->GetGoType() == GAMEOBJECT_TYPE_DOOR || go->GetGoType() == GAMEOBJECT_TYPE_BUTTON)
        {
            if (go->getLootState() == GO_READY)
                go->UseDoorOrButton(withRestoreTime, useAlternativeState);
            else if (go->getLootState() == GO_ACTIVATED)
                go->ResetDoorOrButton();
        }
        else
            TC_LOG_ERROR("scripts", "InstanceScript: DoUseDoorOrButton can't use gameobject entry %u, because type is %u.", go->GetEntry(), go->GetGoType());
    }
    else
        TC_LOG_DEBUG("scripts", "InstanceScript: DoUseDoorOrButton failed");
}

void InstanceScript::DoCloseDoorOrButton(ObjectGuid guid)
{
    if (!guid)
        return;

    if (GameObject* go = instance->GetGameObject(guid))
    {
        if (go->GetGoType() == GAMEOBJECT_TYPE_DOOR || go->GetGoType() == GAMEOBJECT_TYPE_BUTTON)
        {
            if (go->getLootState() == GO_ACTIVATED)
                go->ResetDoorOrButton();
        }
        else
            TC_LOG_ERROR("scripts", "InstanceScript: DoCloseDoorOrButton can't use gameobject entry %u, because type is %u.", go->GetEntry(), go->GetGoType());
    }
    else
        TC_LOG_DEBUG("scripts", "InstanceScript: DoCloseDoorOrButton failed");
}

void InstanceScript::DoRespawnGameObject(ObjectGuid guid, uint32 timeToDespawn /*= MINUTE*/)
{
    if (GameObject* go = instance->GetGameObject(guid))
    {
        switch (go->GetGoType())
        {
            case GAMEOBJECT_TYPE_DOOR:
            case GAMEOBJECT_TYPE_BUTTON:
            case GAMEOBJECT_TYPE_TRAP:
            case GAMEOBJECT_TYPE_FISHINGNODE:
                // not expect any of these should ever be handled
                TC_LOG_ERROR("scripts", "InstanceScript: DoRespawnGameObject can't respawn gameobject entry %u, because type is %u.", go->GetEntry(), go->GetGoType());
                return;
            default:
                break;
        }

        if (go->isSpawned())
            return;

        go->SetRespawnTime(timeToDespawn);
    }
    else
        TC_LOG_DEBUG("scripts", "InstanceScript: DoRespawnGameObject failed");
}

void InstanceScript::DoUpdateWorldState(uint32 uiStateId, uint32 uiStateData)
{
    DoOnPlayers([uiStateId, uiStateData](Player* player)
    {
        player->SendUpdateWorldState(uiStateId, uiStateData);
    });
}

// Send Notify to all players in instance
void InstanceScript::DoSendNotifyToInstance(char const* format, ...)
{
    va_list ap;
    va_start(ap, format);
    char buff[1024];
    vsnprintf(buff, 1024, format, ap);
    va_end(ap);

    DoOnPlayers([buff](Player* player)
    {
        if (WorldSession * session = player->GetSession())
            session->SendNotification("%s", buff);
    });
}

// Update Achievement Criteria for all players in instance
void InstanceScript::DoUpdateCriteria(CriteriaTypes type, uint32 miscValue1 /*= 0*/, uint32 miscValue2 /*= 0*/, Unit* unit /*= nullptr*/)
{
    DoOnPlayers([type, miscValue1, miscValue2, unit](Player* player)
    {
        player->UpdateCriteria(type, miscValue1, miscValue2, 0, unit);
    });
}

// Start timed achievement for all players in instance
void InstanceScript::DoStartCriteriaTimer(CriteriaTimedTypes type, uint32 entry)
{
    DoOnPlayers([type, entry](Player* player)
    {
        player->StartCriteriaTimer(type, entry);
    });
}

// Stop timed achievement for all players in instance
void InstanceScript::DoStopCriteriaTimer(CriteriaTimedTypes type, uint32 entry)
{
    DoOnPlayers([type, entry](Player* player)
    {
        player->RemoveCriteriaTimer(type, entry);
    });
}

// Remove Auras due to Spell on all players in instance
void InstanceScript::DoRemoveAurasDueToSpellOnPlayers(uint32 spell)
{
    DoOnPlayers([spell](Player* player)
    {
        player->RemoveAurasDueToSpell(spell);

        if (Pet* pet = player->GetPet())
            pet->RemoveAurasDueToSpell(spell);
    });
}

// Kill all players with this aura in the instance
void InstanceScript::DoKillPlayersWithAura(uint32 spell)
{
    DoOnPlayers([spell](Player* player)
    {
        if (player->HasAura(spell))
            player->Kill(player);
    });
}

// Cast spell on all players in instance
void InstanceScript::DoCastSpellOnPlayers(uint32 spell, Unit* caster /*= nullptr*/, bool triggered /*= true*/)
{
    DoOnPlayers([spell, caster, triggered](Player* player)
    {
        Unit* spellCaster = caster ? caster : player;
        spellCaster->CastSpell(player, spell, triggered);
    });
}

// Cast spell on all players in instance
void InstanceScript::DoPlayScenePackageIdOnPlayers(uint32 scenePackageId)
{
    DoOnPlayers([scenePackageId](Player* player)
    {
        player->GetSceneMgr().PlaySceneByPackageId(scenePackageId);
    });
}
void InstanceScript::DoRemoveForcedMovementsOnPlayers(ObjectGuid forceGuid)
{
    DoOnPlayers([forceGuid](Player* player)
    {
        player->RemoveMovementForce(forceGuid);
    });
}

bool InstanceScript::ServerAllowsTwoSideGroups()
{
    return sWorld->getBoolConfig(CONFIG_ALLOW_TWO_SIDE_INTERACTION_GROUP);
}

CreatureGroup* InstanceScript::SummonCreatureGroup(uint32 creatureGroupID, std::list<TempSummon*>* list /*= nullptr*/)
{
    bool createTempList = !list;
    if (createTempList)
        list = new std::list<TempSummon*>;

    instance->SummonCreatureGroup(creatureGroupID, list);

    for (TempSummon* summon : *list)
        summonBySummonGroupIDs[creatureGroupID].push_back(summon->GetGUID());

    if (createTempList)
    {
        delete list;
        list = nullptr;
    }

    return GetCreatureGroup(creatureGroupID);
}

CreatureGroup* InstanceScript::GetCreatureGroup(uint32 creatureGroupID)
{
    for (ObjectGuid guid : summonBySummonGroupIDs[creatureGroupID])
        if (Creature* summon = instance->GetCreature(guid))
            return summon->GetFormation();

    return nullptr;
}

bool InstanceScript::IsCreatureGroupWiped(uint32 creatureGroupID)
{
    for (ObjectGuid guid : summonBySummonGroupIDs[creatureGroupID])
        if (Creature* summon = instance->GetCreature(guid))
            if (summon->IsAlive())
                return false;

    return true;
}

void InstanceScript::DespawnCreatureGroup(uint32 creatureGroupID)
{
    for (ObjectGuid guid : summonBySummonGroupIDs[creatureGroupID])
        if (Creature* summon = instance->GetCreature(guid))
            summon->DespawnOrUnsummon();

    summonBySummonGroupIDs.erase(creatureGroupID);
}

void InstanceScript::DoOnPlayers(std::function<void(Player*)>&& function)
{
    Map::PlayerList const& plrList = instance->GetPlayers();

    if (!plrList.isEmpty())
        for (Map::PlayerList::const_iterator i = plrList.begin(); i != plrList.end(); ++i)
            if (Player* player = i->GetSource())
                function(player);
}

void InstanceScript::DoSetAlternatePowerOnPlayers(int32 value)
{
    DoOnPlayers([value](Player* player)
    {
        player->SetPower(POWER_ALTERNATE_POWER, value);
    });
}

void InstanceScript::DoModifyPlayerCurrencies(uint32 id, int32 value)
{
    DoOnPlayers([id, value](Player* player)
    {
        player->ModifyCurrency(id, value);
    });
}

void InstanceScript::DoNearTeleportPlayers(const Position pos, bool casting /*=false*/)
{
    DoOnPlayers([pos, casting](Player* player)
    {
        player->NearTeleportTo(pos.GetPositionX(), pos.GetPositionY(), pos.GetPositionZ(), pos.GetOrientation(), casting);
    });
}

void InstanceScript::DoKilledMonsterCredit(uint32 questId, uint32 entry, ObjectGuid guid/* =0*/)
{
    DoOnPlayers([questId, entry, guid](Player* player)
    {
        if (player->GetQuestStatus(questId) == QUEST_STATUS_INCOMPLETE)
            player->KilledMonsterCredit(entry, guid);
    });
}

// Complete Achievement for all players in instance
void InstanceScript::DoCompleteAchievement(uint32 achievement)
{
    AchievementEntry const* achievementEntry = sAchievementStore.LookupEntry(achievement);
    if (!achievementEntry)
    {
        TC_LOG_ERROR("scripts", "DoCompleteAchievement called for not existing achievement %u", achievement);
        return;
    }

    DoOnPlayers([achievementEntry](Player* player)
    {
        player->CompletedAchievement(achievementEntry);
    });
}

void InstanceScript::DoStartMovie(uint32 movieId)
{
    MovieEntry const* movieEntry = sMovieStore.LookupEntry(movieId);
    if (!movieEntry)
    {
        TC_LOG_ERROR("scripts", "DoStartMovie called for not existing movieId %u", movieId);
        return;
    }

    DoOnPlayers([movieId](Player* player)
    {
        player->SendMovieStart(movieId);
    });
}

void InstanceScript::DoPlayConversation(uint32 conversationId)
{
    DoOnPlayers([conversationId](Player* player)
    {
        player->PlayConversation(conversationId);
    });
}

void InstanceScript::DoDelayedConversation(uint32 delay, uint32 conversationId)
{
    DoOnPlayers([delay, conversationId](Player* player)
    {
        player->AddDelayedConversation(delay, conversationId);
    });
}

void InstanceScript::DoAddItemByClassOnPlayers(uint8 classId, uint32 itemId, uint32 count)
{
    DoOnPlayers([classId, itemId, count](Player* player)
    {
        if (player->getClass() == classId)
            player->AddItem(itemId, count);
    });
}

void InstanceScript::DoSendScenarioEvent(uint32 eventId)
{
    if (!instance->GetPlayers().isEmpty())
        if (Player* player = instance->GetPlayers().begin()->GetSource())
            player->GetScenario()->SendScenarioEvent(player, eventId);
}

// Update Achievement Criteria for all players in instance
void InstanceScript::DoUpdateAchievementCriteria(CriteriaTypes type, uint32 miscValue1 /*= 0*/, uint32 miscValue2 /*= 0*/, Unit* unit /*= NULL*/)
{
    DoOnPlayers([type, miscValue1, miscValue2, unit](Player* player)
    {
        player->GetAchievementMgr()->UpdateCriteria(type, miscValue1, miscValue2, 0, unit);
    });
}

// Add aura on all players in instance
void InstanceScript::DoAddAuraOnPlayers(uint32 spell)
{
    DoOnPlayers([spell](Player* player)
    {
        player->AddAura(spell, player);
    });
}

// Do combat stop on all players in instance
void InstanceScript::DoCombatStopOnPlayers()
{
    DoOnPlayers([](Player* player)
    {
        if (player->IsInCombat())
            player->CombatStop();
    });
}

bool InstanceScript::CheckAchievementCriteriaMeet(uint32 criteria_id, Player const* /*source*/, Unit const* /*target*/ /*= nullptr*/, uint32 /*miscvalue1*/ /*= 0*/)
{
    TC_LOG_ERROR("misc", "Achievement system call InstanceScript::CheckAchievementCriteriaMeet but instance script for map %u not have implementation for achievement criteria %u",
        instance->GetId(), criteria_id);
    return false;
}

void InstanceScript::SetEntranceLocation(uint32 worldSafeLocationId)
{
    _entranceId = worldSafeLocationId;
    if (_temporaryEntranceId)
        _temporaryEntranceId = 0;
}

void InstanceScript::SendEncounterUnit(uint32 type, Unit* unit /*= nullptr*/, uint8 priority)
{
    switch (type)
    {
        case ENCOUNTER_FRAME_ENGAGE:                    // SMSG_INSTANCE_ENCOUNTER_ENGAGE_UNIT
        {
            if (!unit)
                return;

            WorldPackets::Instance::InstanceEncounterEngageUnit encounterEngageMessage;
            encounterEngageMessage.Unit = unit->GetGUID();
            encounterEngageMessage.TargetFramePriority = priority;
            instance->SendToPlayers(encounterEngageMessage.Write());
            break;
        }
        case ENCOUNTER_FRAME_DISENGAGE:                 // SMSG_INSTANCE_ENCOUNTER_DISENGAGE_UNIT
        {
            if (!unit)
                return;

            WorldPackets::Instance::InstanceEncounterDisengageUnit encounterDisengageMessage;
            encounterDisengageMessage.Unit = unit->GetGUID();
            instance->SendToPlayers(encounterDisengageMessage.Write());
            break;
        }
        case ENCOUNTER_FRAME_UPDATE_PRIORITY:           // SMSG_INSTANCE_ENCOUNTER_CHANGE_PRIORITY
        {
            if (!unit)
                return;

            WorldPackets::Instance::InstanceEncounterChangePriority encounterChangePriorityMessage;
            encounterChangePriorityMessage.Unit = unit->GetGUID();
            encounterChangePriorityMessage.TargetFramePriority = priority;
            instance->SendToPlayers(encounterChangePriorityMessage.Write());
            break;
        }
        default:
            break;
    }
}

void InstanceScript::SendEncounterStart(uint32 inCombatResCount /*= 0*/, uint32 maxInCombatResCount /*= 0*/, uint32 inCombatResChargeRecovery /*= 0*/, uint32 nextCombatResChargeTime /*= 0*/)
{
    WorldPackets::Instance::InstanceEncounterStart encounterStartMessage;
    encounterStartMessage.InCombatResCount = inCombatResCount;
    encounterStartMessage.MaxInCombatResCount = maxInCombatResCount;
    encounterStartMessage.CombatResChargeRecovery = inCombatResChargeRecovery;
    encounterStartMessage.NextCombatResChargeTime = nextCombatResChargeTime;

    instance->SendToPlayers(encounterStartMessage.Write());
}

void InstanceScript::SendEncounterEnd()
{
    WorldPackets::Instance::InstanceEncounterEnd encounterEndMessage;
    instance->SendToPlayers(encounterEndMessage.Write());
}

void InstanceScript::SendBossKillCredit(uint32 encounterId)
{
    WorldPackets::Instance::BossKill bossKillCreditMessage;
    bossKillCreditMessage.DungeonEncounterID = encounterId;

    instance->SendToPlayers(bossKillCreditMessage.Write());
}

bool InstanceScript::IsWipe() const
{
    Map::PlayerList const& PlayerList = instance->GetPlayers();

    if (PlayerList.isEmpty())
        return true;

    for (Map::PlayerList::const_iterator Itr = PlayerList.begin(); Itr != PlayerList.end(); ++Itr)
    {
        Player* player = Itr->GetSource();

        if (!player)
            continue;

        if (player->IsAlive() && !player->IsGameMaster())
            return false;
    }

    return true;
}

void InstanceScript::UpdateEncounterState(EncounterCreditType type, uint32 creditEntry, Unit* /*source*/)
{
    DungeonEncounterList const* encounters = sObjectMgr->GetDungeonEncounterList(instance->GetId(), instance->GetDifficultyID());
    if (!encounters)
        return;

    uint32 dungeonId = 0;

    for (DungeonEncounterList::const_iterator itr = encounters->begin(); itr != encounters->end(); ++itr)
    {
        DungeonEncounter const* encounter = *itr;
        if (encounter->creditType == type && encounter->creditEntry == creditEntry)
        {
            completedEncounters |= 1 << encounter->dbcEntry->Bit;

            if (InstanceScenario* scenario = instance->ToInstanceMap()->GetInstanceScenario())
            {
                Map::PlayerList const& players = instance->GetPlayers();

                if (players.begin() != players.end())
                    scenario->UpdateCriteria(CRITERIA_TYPE_COMPLETE_DUNGEON_ENCOUNTER, encounter->dbcEntry->ID, 0, 0, nullptr, players.begin()->GetSource());
            }

            if (encounter->lastEncounterDungeon)
            {
                dungeonId = encounter->lastEncounterDungeon;
                TC_LOG_DEBUG("lfg", "UpdateEncounterState: Instance %s (instanceId %u) completed encounter %s. Credit Dungeon: %u",
                    instance->GetMapName(), instance->GetInstanceId(), encounter->dbcEntry->Name[sWorld->GetDefaultDbcLocale()], dungeonId);
                break;
            }
        }
    }

    if (dungeonId)
    {
        Map::PlayerList const& players = instance->GetPlayers();
        for (Map::PlayerList::const_iterator i = players.begin(); i != players.end(); ++i)
        {
            if (Player* player = i->GetSource())
                if (Group* grp = player->GetGroup())
                    if (grp->isLFGGroup())
                    {
                        sLFGMgr->FinishDungeon(grp->GetGUID(), dungeonId, instance);
                        return;
                    }
        }
    }
}

void InstanceScript::UpdateEncounterStateForKilledCreature(uint32 creatureId, Unit* source)
{
    UpdateEncounterState(ENCOUNTER_CREDIT_KILL_CREATURE, creatureId, source);
}

void InstanceScript::UpdateEncounterStateForSpellCast(uint32 spellId, Unit* source)
{
    UpdateEncounterState(ENCOUNTER_CREDIT_CAST_SPELL, spellId, source);
}

void InstanceScript::UpdatePhasing()
{
    DoOnPlayers([](Player* player)
    {
        PhasingHandler::SendToPlayer(player);
    });
}

/*static*/ char const* InstanceScript::GetBossStateName(uint8 state)
{
    // See enum EncounterState in InstanceScript.h
    switch (state)
    {
        case NOT_STARTED:
            return "NOT_STARTED";
        case IN_PROGRESS:
            return "IN_PROGRESS";
        case FAIL:
            return "FAIL";
        case DONE:
            return "DONE";
        case SPECIAL:
            return "SPECIAL";
        case TO_BE_DECIDED:
            return "TO_BE_DECIDED";
        default:
            return "INVALID";
    }
}

void InstanceScript::UpdateCombatResurrection(uint32 diff)
{
    if (!_combatResurrectionTimerStarted)
        return;

    if (_combatResurrectionTimer <= diff)
        AddCombatResurrectionCharge();
    else
        _combatResurrectionTimer -= diff;
}

void InstanceScript::InitializeCombatResurrections(uint8 charges /*= 1*/, uint32 interval /*= 0*/)
{
    _combatResurrectionCharges = charges;
    if (!interval)
        return;

    _combatResurrectionTimer = interval;
    _combatResurrectionTimerStarted = true;
}

void InstanceScript::AddCombatResurrectionCharge()
{
    ++_combatResurrectionCharges;
    _combatResurrectionTimer = GetCombatResurrectionChargeInterval();

    WorldPackets::Instance::InstanceEncounterGainCombatResurrectionCharge gainCombatResurrectionCharge;
    gainCombatResurrectionCharge.InCombatResCount = _combatResurrectionCharges;
    gainCombatResurrectionCharge.CombatResChargeRecovery = _combatResurrectionTimer;
    instance->SendToPlayers(gainCombatResurrectionCharge.Write());
}

void InstanceScript::UseCombatResurrection()
{
    --_combatResurrectionCharges;

    instance->SendToPlayers(WorldPackets::Instance::InstanceEncounterInCombatResurrection().Write());
}

void InstanceScript::ResetCombatResurrections()
{
    _combatResurrectionCharges = 0;
    _combatResurrectionTimer = 0;
    _combatResurrectionTimerStarted = false;
}

uint32 InstanceScript::GetCombatResurrectionChargeInterval() const
{
    uint32 interval = 0;
    if (uint32 playerCount = instance->GetPlayers().getSize())
        interval = 90 * MINUTE * IN_MILLISECONDS / playerCount;

    return interval;
}

class ChallengeModeWorker
{
public:
    ChallengeModeWorker(InstanceScript* instance) : _instance(instance) { }

    void Visit(std::unordered_map<ObjectGuid, Creature*>& creatureMap)
    {
        for (auto const& p : creatureMap)
        {
            if (p.second->IsInWorld() && !p.second->IsPet())
            {
                if (!p.second->IsAlive())
                    p.second->Respawn();

                _instance->CastChallengeCreatureSpell(p.second);
            }
        }
    }

    template<class T>
    void Visit(std::unordered_map<ObjectGuid, T*>&) { }

private:
    InstanceScript* _instance;
};

void InstanceScript::StartChallengeMode(uint8 level)
{
    MapChallengeModeEntry const* mapChallengeModeEntry = sChallengeModeMgr->GetMapChallengeModeEntry(instance->GetId());
    if (!mapChallengeModeEntry)
        return;

    if (IsChallengeModeStarted())
        return;

    if (GetCompletedEncounterMask() != 0)
        return;

    _challengeModeStarted = true;
    _challengeModeLevel = level;

    instance->SendToPlayers(WorldPackets::ChallengeMode::ChangePlayerDifficultyResult(5).Write());

    // Add the health/dmg modifier aura to all creatures
    ChallengeModeWorker worker(this);
    TypeContainerVisitor<ChallengeModeWorker, MapStoredObjectTypesContainer> visitor(worker);
    visitor.Visit(instance->GetObjectsStore());

    // Tp back all players to begin
    Position entranceLocation;
    if (WorldSafeLocsEntry const* entranceSafeLocEntry = sObjectMgr->GetWorldSafeLoc(GetEntranceLocation()))
        entranceLocation.Relocate(entranceSafeLocEntry->Loc);
    else if (AreaTriggerTeleportStruct const* areaTrigger = sObjectMgr->GetMapEntranceTrigger(instance->GetId()))
        entranceLocation.Relocate(areaTrigger->target_X, areaTrigger->target_Y, areaTrigger->target_Z, areaTrigger->target_Orientation);
    DoNearTeleportPlayers(entranceLocation);

    if (_challengeModeDoorPosition.is_initialized())
        instance->SummonGameObject(GOB_CHALLENGER_DOOR, *_challengeModeDoorPosition, QuaternionData(), WEEK);

    WorldPackets::ChallengeMode::ChangePlayerDifficultyResult changePlayerDifficultyResult(11);
    changePlayerDifficultyResult.InstanceDifficultyID = instance->GetId();
    changePlayerDifficultyResult.DifficultyRecID = DIFFICULTY_MYTHIC_KEYSTONE;
    instance->SendToPlayers(changePlayerDifficultyResult.Write());

    instance->SendToPlayers(WorldPackets::ChallengeMode::Reset(instance->GetId()).Write());

    WorldPackets::Misc::StartTimer startTimer;
    startTimer.Type = WorldPackets::Misc::StartTimer::TIMER_TYPE_CHALLENGE;
    startTimer.TotalTime = 10;
    startTimer.TimeLeft = 10;
    instance->SendToPlayers(startTimer.Write());

    SendChallengeModeStart();

    DoOnPlayers([this](Player* player)
    {
        CastChallengePlayerSpell(player);
    });

    AddTimedDelayedOperation(10000, [this]()
    {
        _challengeModeStartTime = getMSTime();

        SendChallengeModeElapsedTimer();

        if (GameObject* door = GetGameObject(GOB_CHALLENGER_DOOR))
            DoUseDoorOrButton(door->GetGUID(), WEEK);
    });
}

void InstanceScript::CompleteChallengeMode()
{
    MapChallengeModeEntry const* mapChallengeModeEntry = sChallengeModeMgr->GetMapChallengeModeEntry(instance->GetId());
    if (!mapChallengeModeEntry)
        return;

    uint32 totalDuration = GetChallengeModeCurrentDuration();

    // Todo : Send stats

    uint8 mythicIncrement = 0;

    for (uint8 i = 0; i < 3; ++i)
        if (uint32(mapChallengeModeEntry->CriteriaCount[i]) > totalDuration)
            ++mythicIncrement;

    DoOnPlayers([this, mythicIncrement](Player* player)
    {
        player->AddChallengeKey(sChallengeModeMgr->GetRandomChallengeId(), std::max(_challengeModeLevel + mythicIncrement, 1));
    });

    WorldPackets::ChallengeMode::Complete complete;
    complete.Duration = totalDuration;
    complete.MapId = instance->GetId();
    complete.ChallengeId = mapChallengeModeEntry->ID;
    complete.ChallengeLevel = _challengeModeLevel + mythicIncrement;
    instance->SendToPlayers(complete.Write());

    // Achievements only if timer respected
    if (mythicIncrement)
    {
        if (_challengeModeLevel >= 2)
            DoCompleteAchievement(11183);

        if (_challengeModeLevel >= 5)
            DoCompleteAchievement(11184);

        if (_challengeModeLevel >= 10)
            DoCompleteAchievement(11185);

        if (_challengeModeLevel >= 15)
        {
            DoCompleteAchievement(11162);
            DoCompleteAchievement(11224);
        }
    }

    SpawnChallengeModeRewardChest();

    DoOnPlayers([this](Player* player)
    {
        sChallengeModeMgr->Reward(player, _challengeModeLevel);
    });
}

uint32 InstanceScript::GetChallengeModeCurrentDuration() const
{
    return uint32(GetMSTimeDiffToNow(_challengeModeStartTime) / 1000) + (5 * _challengeModeDeathCount);
}

void InstanceScript::SendChallengeModeStart(Player* player/* = nullptr*/) const
{
    MapChallengeModeEntry const* mapChallengeModeEntry = sChallengeModeMgr->GetMapChallengeModeEntry(instance->GetId());
    if (!mapChallengeModeEntry)
        return;

    WorldPackets::ChallengeMode::Start start;
    start.MapId = instance->GetId();
    start.ChallengeId = mapChallengeModeEntry->ID;
    start.ChallengeLevel = _challengeModeLevel;
    instance->SendToPlayers(start.Write());

    if (player)
        player->SendDirectMessage(start.Write());
    else
        instance->SendToPlayers(start.Write());
}

void InstanceScript::SendChallengeModeDeathCount(Player* player/* = nullptr*/) const
{
    WorldPackets::ChallengeMode::UpdateDeathCount updateDeathCount;
    updateDeathCount.DeathCount = _challengeModeDeathCount;

    if (player)
        player->SendDirectMessage(updateDeathCount.Write());
    else
        instance->SendToPlayers(updateDeathCount.Write());
}

void InstanceScript::SendChallengeModeElapsedTimer(Player* player/* = nullptr*/) const
{
    WorldPackets::Misc::StartElapsedTimer startElapsedTimer;
    startElapsedTimer.TimerID = 1;
    startElapsedTimer.CurrentDuration = GetChallengeModeCurrentDuration();

    if (player)
        player->SendDirectMessage(startElapsedTimer.Write());
    else
        instance->SendToPlayers(startElapsedTimer.Write());
}

void InstanceScript::CastChallengeCreatureSpell(Creature* creature)
{
    CustomSpellValues values;
    values.AddSpellMod(SPELLVALUE_BASE_POINT0, sChallengeModeMgr->GetHealthMultiplier(_challengeModeLevel));
    values.AddSpellMod(SPELLVALUE_BASE_POINT1, sChallengeModeMgr->GetDamageMultiplier(_challengeModeLevel));

    // Affixes
    values.AddSpellMod(SPELLVALUE_BASE_POINT2,  0); // 6 Raging
    values.AddSpellMod(SPELLVALUE_BASE_POINT3,  0); // 7 Bolstering
    values.AddSpellMod(SPELLVALUE_BASE_POINT4,  0); // 9 Tyrannical
    values.AddSpellMod(SPELLVALUE_BASE_POINT5,  0); //
    values.AddSpellMod(SPELLVALUE_BASE_POINT6,  0); //
    values.AddSpellMod(SPELLVALUE_BASE_POINT7,  0); // 3 Volcanic
    values.AddSpellMod(SPELLVALUE_BASE_POINT8,  0); // 4 Necrotic
    values.AddSpellMod(SPELLVALUE_BASE_POINT9,  0); // 10 Fortified
    values.AddSpellMod(SPELLVALUE_BASE_POINT10, 0); // 8 Sanguine
    values.AddSpellMod(SPELLVALUE_BASE_POINT11, 0); // 14 Quaking
    values.AddSpellMod(SPELLVALUE_BASE_POINT12, 0); // 13 Explosive
    values.AddSpellMod(SPELLVALUE_BASE_POINT13, 0); // 11 Bursting

    creature->CastCustomSpell(SPELL_CHALLENGER_MIGHT, values, creature, TRIGGERED_FULL_MASK);
}

void InstanceScript::CastChallengePlayerSpell(Player* player)
{
    CustomSpellValues values;

    // Affixes
    values.AddSpellMod(SPELLVALUE_BASE_POINT1,  0); // 12 Grievous
    values.AddSpellMod(SPELLVALUE_BASE_POINT2,  0); // 2 Skittish
    values.AddSpellMod(SPELLVALUE_BASE_POINT3,  0); //

    player->CastCustomSpell(SPELL_CHALLENGER_BURDEN, values, player, TRIGGERED_FULL_MASK);
}

bool InstanceHasScript(WorldObject const* obj, char const* scriptName)
{
    if (InstanceMap* instance = obj->GetMap()->ToInstanceMap())
        return instance->GetScriptName() == scriptName;

    return false;
}
