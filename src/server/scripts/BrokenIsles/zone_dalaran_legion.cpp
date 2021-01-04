/*
 * Copyright (C) 2017-2018 AshamaneProject <https://github.com/AshamaneProject>
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

#include "Conversation.h"
#include "GameObject.h"
#include "MapManager.h"
#include "ObjectMgr.h"
#include "PhasingHandler.h"
#include "GameObjectAI.h"
#include "Player.h"
#include "ScriptMgr.h"
#include "SpellMgr.h"
#include "ScriptedCreature.h"
#include "SpellScript.h"
#include "ScriptedEscortAI.h"
#include "ScriptedGossip.h"
#include "Log.h"
#include "AchievementMgr.h"
#include "Vehicle.h"
#include "CombatAI.h"

/*
 * Dalaran above Karazhan
 *
 * Legion Intro
 */

enum
{
    PHASE_DALARAN_KARAZHAN  = 5829,
    QUEST_BLINK_OF_AN_EYE   = 44663,
};

// TODO : All this script is temp fix,
// remove it when legion start quests are properly fixed
class OnLegionArrival : public PlayerScript
{
public:
    OnLegionArrival() : PlayerScript("OnLegionArrival") { }

    enum
    {
        SPELL_MAGE_LEARN_GUARDIAN_HALL_TP   = 204287,
        SPELL_WAR_LEARN_JUMP_TO_SKYHOLD     = 192084,
        SPELL_DRUID_CLASS_HALL_TP           = 204874,
        SPELL_CREATE_CLASS_HALL_ALLIANCE    = 185506,
        SPELL_CREATE_CLASS_HALL_HORDE       = 192191,

        CONVERSATION_KHADGAR_BLINK_OF_EYE   = 3827,
    };

    void OnLogin(Player* player, bool firstLogin) override
    {
        // Can happen in recovery cases
        if (player->getLevel() >= 100 && firstLogin)
            HandleLegionArrival(player);
    }

    void OnLevelChanged(Player* player, uint8 oldLevel) override
    {
        if (oldLevel < 100 && player->getLevel() >= 100)
            HandleLegionArrival(player);
    }

    void HandleLegionArrival(Player* player)
    {
        switch (player->getClass())
        {
            case CLASS_MAGE:
                player->CastSpell(player, SPELL_MAGE_LEARN_GUARDIAN_HALL_TP, true);
                break;
            case CLASS_WARRIOR:
                player->CastSpell(player, SPELL_WAR_LEARN_JUMP_TO_SKYHOLD, true);
                break;
            case CLASS_DRUID:
                player->CastSpell(player, SPELL_DRUID_CLASS_HALL_TP, true);
                break;
            case CLASS_HUNTER:
                player->m_taxi.SetTaximaskNode(1848); // Hunter Class Hall
                break;
            default:
                break;
        }

        player->CastSpell(player, player->IsInAlliance() ? SPELL_CREATE_CLASS_HALL_ALLIANCE : SPELL_CREATE_CLASS_HALL_HORDE, true);

        if (player->GetQuestStatus(QUEST_BLINK_OF_AN_EYE) == QUEST_STATUS_NONE)
        {
            Conversation::CreateConversation(CONVERSATION_KHADGAR_BLINK_OF_EYE, player, player->GetPosition(), { player->GetGUID() });

            if (const Quest* quest = sObjectMgr->GetQuestTemplate(QUEST_BLINK_OF_AN_EYE))
                player->AddQuest(quest, nullptr);
        }
    }
};

class On110Arrival : public PlayerScript
{
public:
    On110Arrival() : PlayerScript("On110Arrival") { }

    enum
    {
        QUEST_UNITING_THE_ISLES     = 43341,
    };

    void OnLogin(Player* player, bool firstLogin) override
    {
        // Can happen in recovery cases
        if (player->getLevel() >= 110 && firstLogin)
            Handle110Arrival(player);
    }

    void OnLevelChanged(Player* player, uint8 oldLevel) override
    {
        if (oldLevel < 110 && player->getLevel() >= 110)
            Handle110Arrival(player);
    }

    void Handle110Arrival(Player* player)
    {
        if (player->GetQuestStatus(QUEST_UNITING_THE_ISLES) == QUEST_STATUS_NONE)
            if (const Quest* quest = sObjectMgr->GetQuestTemplate(QUEST_UNITING_THE_ISLES))
                player->AddQuest(quest, nullptr);
    }
};

// 228329 & 228330 - T?l?portation
class spell_dalaran_teleportation : public SpellScript
{
    PrepareSpellScript(spell_dalaran_teleportation);

    void EffectTeleportDalaranKarazhan(SpellEffIndex effIndex)
    {
        if (Player* player = GetCaster()->ToPlayer())
        {
            if (player->getLevel() < 100 || player->GetQuestStatus(QUEST_BLINK_OF_AN_EYE) != QUEST_STATUS_INCOMPLETE)
                PreventHitEffect(effIndex);
            else
            {
                if (SpellTargetPosition const* targetPosition = sSpellMgr->GetSpellTargetPosition(GetSpellInfo()->Id, effIndex))
                    if (Map* map = sMapMgr->FindMap(targetPosition->target_mapId, 0))
                        map->LoadGrid(targetPosition->target_X, targetPosition->target_Y);
            }
        }
    }

    void EffectTeleportDalaranLegion(SpellEffIndex effIndex)
    {
        if (Player* player = GetCaster()->ToPlayer())
            if (player->getLevel() < 100 || player->GetQuestStatus(QUEST_BLINK_OF_AN_EYE) == QUEST_STATUS_INCOMPLETE)
                PreventHitEffect(effIndex);
    }

    void Register() override
    {
        OnEffectLaunch += SpellEffectFn(spell_dalaran_teleportation::EffectTeleportDalaranKarazhan, EFFECT_0, SPELL_EFFECT_TRIGGER_SPELL);
        OnEffectLaunch += SpellEffectFn(spell_dalaran_teleportation::EffectTeleportDalaranLegion, EFFECT_1, SPELL_EFFECT_TRIGGER_SPELL);
    }
};

// 113986 - Khadgar
class npc_dalaran_karazhan_khadgar : public CreatureScript
{
public:
    npc_dalaran_karazhan_khadgar() : CreatureScript("npc_dalaran_karazhan_khadgar") { }

    enum
    {
        SPELL_PLAY_DALARAN_TELEPORTATION_SCENE = 227861
    };

    bool OnGossipSelect(Player* player, Creature* /*creature*/, uint32 /*uiSender*/, uint32 /*uiAction*/) override
    {
        player->CastSpell(player, SPELL_PLAY_DALARAN_TELEPORTATION_SCENE, true);
        return true;
    }
};

class scene_dalaran_kharazan_teleportion : public SceneScript
{
public:
    scene_dalaran_kharazan_teleportion() : SceneScript("scene_dalaran_kharazan_teleportion") { }

    void OnSceneTriggerEvent(Player* player, uint32 /*sceneInstanceID*/, SceneTemplate const* /*sceneTemplate*/, std::string const& triggerName) override
    {
        if (triggerName == "invisibledalaran")
            PhasingHandler::AddPhase(player, PHASE_DALARAN_KARAZHAN);
    }

    void OnSceneEnd(Player* player, uint32 /*sceneInstanceID*/, SceneTemplate const* /*sceneTemplate*/) override
    {
        player->KilledMonsterCredit(114506);
        player->TeleportTo(1220, -827.82f, 4369.25f, 738.64f, 1.893364f);
    }
};

/*
 * Legion Dalaran
 */

// Zone 8392
class zone_legion_dalaran_underbelly : public ZoneScript
{
public:
    zone_legion_dalaran_underbelly() : ZoneScript("zone_legion_dalaran_underbelly") { }

    void OnPlayerEnter(Player* player) override
    {
        player->SeamlessTeleportToMap(MAP_DALARAN_UNDERBELLY);
    }

    void OnPlayerExit(Player* player) override
    {
        if (player->GetMapId() == MAP_DALARAN_UNDERBELLY)
            player->SeamlessTeleportToMap(MAP_BROKEN_ISLANDS);
    }
};

class CastEventTP : public BasicEvent
{
public:
    CastEventTP(Unit* caster, uint32 spellId, bool trigger) :
        _caster(caster), _spellId(spellId), _trigger(trigger) { }

    bool Execute(uint64 /*time*/, uint32 /*diff*/)
    {
        if (_caster)
            _caster->CastSpell(_caster, _spellId, _trigger);
        return true;
    }

private:
    Unit * _caster;
    uint32 _spellId;
    bool _trigger;
};

// 108868 7.x.x
class npc_hunter_talua : public CreatureScript
{
public:
    npc_hunter_talua() : CreatureScript("npc_hunter_talua") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 /*action*/) override
    {
        if (player->getLevel() < 98 || player->getClass() != CLASS_HUNTER)
            return true;

        if (Pet* pet = player->GetPet())
            player->RemovePet(nullptr, PET_SAVE_NOT_IN_SLOT, false);

        player->CastSpell(player, 216213, true);
        player->m_Events.AddEvent(new CastEventTP(player, 216216, true), player->m_Events.CalculateTime(10000));

        return true;
    }
};

class npc_great_eagle : public CreatureScript
{
public:
    npc_great_eagle() : CreatureScript("npc_great_eagle") { }

    struct npc_great_eagleAI : public ScriptedAI
    {
        npc_great_eagleAI(Creature* creature) : ScriptedAI(creature) { }

        uint8 curID;
        void Reset()
        {
        }

        void SpellHit(Unit* caster, SpellInfo const* spell) override
        {
            me->GetMotionMaster()->MoveDistract(1000);
            me->GetMotionMaster()->MovePoint(1, -854.9718f, 4185.322f, 754.1122f);
        }

        void MovementInform(uint32 type, uint32 id)
        {
            if (type != POINT_MOTION_TYPE)
                return;

            switch (id)
            {
            case 1:
                me->DespawnOrUnsummon(0);
                break;
            }
        }
    };
    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_great_eagleAI(creature);
    }
};

enum ChoicesAndKillcredits
{
    HUNTER_CHOICE                           = 240,
    HUNTER_ARTIFACT_QUEST_KILLCREDIT        = 104634,
    ROGUE_CHOICE                            = 280,
    ROGUE_ARTIFACT_QUEST_KILLCREDIT         = 105953,
    PALADIN_CHOICE                          = 235,
    PALADIN_ARTIFACT_QUEST_KILLCREDIT       = 90369,
    DEATH_KNIGHT_CHOICE                     = 253,
    DEATH_KNIGHT_ARTIFACT_QUEST_KILLCREDIT  = 101441,
    PRIEST_CHOICE                           = 248,
    PRIEST_ARTIFACT_QUEST_KILLCREDIT        = 100583,
    DEMON_HUNTER_CHOICE                     = 255,
    DEMON_HUNTER_ARTIFACT_QUEST_KILLCREDIT  = 105177,
    MAGE_CHOICE                             = 265,
    MAGE_ARTIFACT_QUEST_KILLCREDIT          = 103037,
    WARLOCK_CHOICE                          = 245,
    WARLOCK_ARTIFACT_QUEST_KILLCREDIT       = 101095,
    WARRIOR_CHOICE                          = 236,
    WARRIOR_ARTIFACT_QUEST_KILLCREDIT       = 100583,
    SHAMAN_CHOICE                           = 266,
    SHAMAN_ARTIFACT_QUEST_KILLCREDIT        = 96527,
    MONK_CHOICE                             = 242,
    MONK_ARTIFACT_QUEST_KILLCREDIT          = 100438,
};

class player_artifact_choice : public PlayerScript
{
public:
    player_artifact_choice() : PlayerScript("player_artifact_choice") { }

    void OnCompleteQuestChoice(Player* player, uint32 choiceId, uint32 /*responseId*/)
    {
        switch (choiceId)
        {
            case HUNTER_CHOICE:
                player->KilledMonsterCredit(HUNTER_ARTIFACT_QUEST_KILLCREDIT);
                break;
            case ROGUE_CHOICE:
                player->KilledMonsterCredit(ROGUE_ARTIFACT_QUEST_KILLCREDIT);
                break;
            case PALADIN_CHOICE:
                player->KilledMonsterCredit(PALADIN_ARTIFACT_QUEST_KILLCREDIT);
                break;
            case DEATH_KNIGHT_CHOICE:
                player->KilledMonsterCredit(DEATH_KNIGHT_ARTIFACT_QUEST_KILLCREDIT);
                break;
            case PRIEST_CHOICE:
                player->KilledMonsterCredit(PRIEST_ARTIFACT_QUEST_KILLCREDIT);
                break;
            case DEMON_HUNTER_CHOICE:
                player->KilledMonsterCredit(DEMON_HUNTER_ARTIFACT_QUEST_KILLCREDIT);
                break;
            case MAGE_CHOICE:
                player->KilledMonsterCredit(MAGE_ARTIFACT_QUEST_KILLCREDIT);
                break;
            case WARLOCK_CHOICE:
                player->KilledMonsterCredit(WARLOCK_ARTIFACT_QUEST_KILLCREDIT);
                break;
            case WARRIOR_CHOICE:
                player->KilledMonsterCredit(WARRIOR_ARTIFACT_QUEST_KILLCREDIT);
                break;
            case SHAMAN_CHOICE:
                player->KilledMonsterCredit(SHAMAN_ARTIFACT_QUEST_KILLCREDIT);
                break;
            case MONK_CHOICE:
                player->KilledMonsterCredit(MONK_ARTIFACT_QUEST_KILLCREDIT);
                break;
        }

    }
};

// quest 38970
class npc_tele_q38970 : public CreatureScript
{
public:
    npc_tele_q38970() : CreatureScript("npc_tele_q38970") { }
     struct npc_tele_q38970AI : public ScriptedAI
    {
        npc_tele_q38970AI(Creature* creature) : ScriptedAI(creature) { }
         void MoveInLineOfSight(Unit* who) override
        {
            if (Player* player = who->ToPlayer())
            {
                if (player->GetQuestStatus(38970) == QUEST_STATUS_INCOMPLETE)
                {
                    if (player->IsInDist(me, 2.0f))
                    {
                       player->KilledMonsterCredit(94259);
                    }
                }
            }
        }
    };
     CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_tele_q38970AI(creature);
    }
};

class npc_quest_48954 : public CreatureScript
{
public:
    npc_quest_48954() : CreatureScript("npc_quest_48954") { }

    bool OnQuestReward(Player* player, Creature* creature, const Quest *_Quest, uint32 /*slot*/) override
    {
        if (_Quest->GetQuestId() == 48954)
        {
            if (AchievementEntry const *ForgedforBattle = sAchievementStore.LookupEntry(11991))
            {
                player->CompletedAchievement(ForgedforBattle);
            }
        }

        return true;
    }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_quest_48954AI(creature);
    }

    struct npc_quest_48954AI : public ScriptedAI
    {
        npc_quest_48954AI(Creature* creature) : ScriptedAI(creature) { }
    };
};

class npc_quest_49032 : public CreatureScript
{
public:
    npc_quest_49032() : CreatureScript("npc_quest_49032") { }

    bool OnQuestReward(Player* player, Creature* creature, const Quest *_Quest, uint32 /*slot*/) override
    {
        if (_Quest->GetQuestId() == 49032)
        {
            if (AchievementEntry const *ForgedforBattle = sAchievementStore.LookupEntry(10853))
            {
                player->CompletedAchievement(ForgedforBattle);
            }
        }

        return true;
    }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_quest_49032AI(creature);
    }

    struct npc_quest_49032AI : public ScriptedAI
    {
        npc_quest_49032AI(Creature* creature) : ScriptedAI(creature) { }
    };
};

// quest 47223
class npc_tele_q47223 : public CreatureScript
{
public:
    npc_tele_q47223() : CreatureScript("npc_tele_q47223") { }
     struct npc_tele_q47223AI : public ScriptedAI
    {
        npc_tele_q47223AI(Creature* creature) : ScriptedAI(creature) { }
         void MoveInLineOfSight(Unit* who) override
        {
            if (Player* player = who->ToPlayer())
            {
                if (player->GetQuestStatus(47223) == QUEST_STATUS_INCOMPLETE)
                {
                    if (player->IsInDist(me, 2.0f))
                    {
                       player->KilledMonsterCredit(122006);
                    }
                }
            }
        }
    };
     CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_tele_q47223AI(creature);
    }
};

// quest 48507
class npc_tele_q48507 : public CreatureScript
{
public:
    npc_tele_q48507() : CreatureScript("npc_tele_q48507") { }
     struct npc_tele_q48507AI : public ScriptedAI
    {
        npc_tele_q48507AI(Creature* creature) : ScriptedAI(creature) { }
         void MoveInLineOfSight(Unit* who) override
        {
            if (Player* player = who->ToPlayer())
            {
                if (player->GetQuestStatus(48507) == QUEST_STATUS_INCOMPLETE)
                {
                    if (player->IsInDist(me, 2.0f))
                    {
                       player->KilledMonsterCredit(124365);
                    }
                }
            }
        }
    };
     CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_tele_q48507AI(creature);
    }
};

// quest 42454
class npc_tele_q42454 : public CreatureScript
{
public:
    npc_tele_q42454() : CreatureScript("npc_tele_q42454") { }
     struct npc_tele_q42454AI : public ScriptedAI
    {
        npc_tele_q42454AI(Creature* creature) : ScriptedAI(creature) { }
         void MoveInLineOfSight(Unit* who) override
        {
            if (Player* player = who->ToPlayer())
            {
                if (player->GetQuestStatus(42454) == QUEST_STATUS_INCOMPLETE)
                {
                    if (player->IsInDist(me, 2.0f))
                    {
                       player->KilledMonsterCredit(107587);
                    }
                }
            }
        }
    };
     CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_tele_q42454AI(creature);
    }
};

// Quest In the blink of an eye 44663
// 114561
class npc_khadgar_upgraded_servant : public CreatureScript
{
public:
    npc_khadgar_upgraded_servant() : CreatureScript("npc_khadgar_upgraded_servant") { }

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
    {
        if (quest->GetQuestId() == 44663)
        {

            player->CastSpell(player, 225203, true);

            player->KilledMonsterCredit(113762, ObjectGuid::Empty);
            player->KilledMonsterCredit(114506, ObjectGuid::Empty);
        }

        return true;
    }
};

// 86563
// 86563
class npc_archmage_khadgar_86563 : public CreatureScript
{
public:
    npc_archmage_khadgar_86563() : CreatureScript("npc_archmage_khadgar_86563") { }

    enum eNpc
    {
        QUEST_DOWN_TO_AZSUNA = 41220,
        SPELL_TAXI_DALARAN_AZSUNA_ALLIANCE = 205098,
        SPELL_TAXI_DALARAN_AZSUNA_HORDE = 205203,
    };

    bool OnGossipSelect(Player* player, Creature* /*creature*/, uint32 /*sender*/, uint32 /*action*/) override
    {
        if (player->HasQuest(QUEST_DOWN_TO_AZSUNA) || player->GetQuestStatus(QUEST_DOWN_TO_AZSUNA) == QUEST_STATUS_INCOMPLETE)
            player->CastSpell(player, player->IsInAlliance() ? SPELL_TAXI_DALARAN_AZSUNA_ALLIANCE : SPELL_TAXI_DALARAN_AZSUNA_HORDE, true); // KillCredit & SendTaxi

        return true;
    }

    bool OnQuestAccept(Player* /*player*/, Creature* creature, Quest const* quest) override
    {
        if (quest->GetQuestId() == QUEST_DOWN_TO_AZSUNA)
        {
            creature->AI()->Talk(1);
        }
        return true;
    }
};

// npc 90417 for the quest 41804 'Ask and You Shall Receive'
class npc_archmage_khadgar_90417 : public CreatureScript {
public:
    npc_archmage_khadgar_90417() : CreatureScript("npc_archmage_khadgar_90417") { }

    enum Khadgar {
        QUEST_ASK_AND_YOU_SHALL_RECEIVE = 41804,
        QUEST_RETURN_TO_JACE = 41806,
        SPELL_CRYSTALLIZED_SOUL = 208510,
        PHASE_NONE = 0,
        PHASE_CONTINUE = -1,
        DATA_EVENT_STARTER_GUID = 0,
        SAY_KHADGAR_1 = 3,
        SAY_KHADGAR_2 = 4,
        SAY_KHADGAR_3 = 5,
        SAY_KHADGAR_4 = 6,
        SAY_KHADGAR_5 = 7,
        SAY_KHADGAR_6 = 8,
        SAY_KHADGAR_7 = 9,
        SAY_KHADGAR_8 = 10,
        WP_START = 1,
        WP_START_WALK = 4,
        WP_IN_THE_MIDDLE = 10,
        WP_AT_FIRST_CHEST = 11,
        WP_AT_SECOND_CHEST = 15,
        WP_AT_HOME = 21,
        PHASE_WAIT_IN_MIDDLE = 1,
        PHASE_SEEK_IN_FIRST_CHEST_1 = 2,
        PHASE_SEEK_IN_FIRST_CHEST_2 = 3,
        PHASE_SEEK_IN_FIRST_CHEST_3 = 4,
        PHASE_SEEK_IN_SECOND_CHEST_1 = 5,
        PHASE_SEEK_IN_SECOND_CHEST_2 = 6,
        PHASE_SEEK_IN_SECOND_CHEST_3 = 7,
        PHASE_SEEK_IN_SECOND_CHEST_4 = 8,
        PHASE_MOVE_HOME = 9,
        PHASE_DESPAWN = 10,
        GO_CRYSTALLIZED_SOUL = 248521,
    };

    struct npc_archmage_khadgar_90417_AI : public EscortAI
    {
        npc_archmage_khadgar_90417_AI(Creature* creature) : EscortAI(creature)
        {
            Initialize();
        }

        void Initialize()
        {
            _phase = PHASE_NONE;
            _moveTimer = 0;
        }

        void QuestAccept(Player* player, Quest const* quest) override
        {
            if (quest->GetQuestId() == QUEST_ASK_AND_YOU_SHALL_RECEIVE)
            {
                SetGUID(player->GetGUID(), DATA_EVENT_STARTER_GUID);
                Talk(SAY_KHADGAR_1);
                Start(false, true, player->GetGUID(), quest);
            }
            if (quest->GetQuestId() == QUEST_RETURN_TO_JACE)
            {
                Talk(SAY_KHADGAR_8);
            }
        }

        ObjectGuid GetGUID(int32 type) const override
        {
            if (type == DATA_EVENT_STARTER_GUID)
                return _eventStarterGuid;

            return ObjectGuid::Empty;
        }

        void SetGUID(ObjectGuid guid, int32 type) override
        {
            switch (type)
            {
            case DATA_EVENT_STARTER_GUID:
                _eventStarterGuid = guid;
                break;
            default:
                break;
            }
        }

        void Reset() override
        {
            me->SetWalk(false);
            Initialize();
            _events.Reset();
        }

        void UpdateAI(uint32 diff) override
        {
            _events.Update(diff);

            if (UpdateVictim())
            {
                DoMeleeAttackIfReady();
            }

            if (HasEscortState(STATE_ESCORT_NONE))
                return;

            EscortAI::UpdateAI(diff);

            if (_phase)
            {
                if (_moveTimer <= diff)
                {
                    switch (_phase)
                    {
                    case PHASE_CONTINUE:
                        SetEscortPaused(false);
                        _moveTimer = 0 * IN_MILLISECONDS;
                        _phase = PHASE_NONE;
                        break;
                    case PHASE_WAIT_IN_MIDDLE:
                        _moveTimer = 0 * IN_MILLISECONDS;
                        _phase = PHASE_CONTINUE;
                        break;
                    case PHASE_SEEK_IN_FIRST_CHEST_1:
                        me->HandleEmoteCommand(EMOTE_STATE_USESTANDING);
                        Talk(SAY_KHADGAR_3);
                        _moveTimer = 7 * IN_MILLISECONDS;
                        _phase = PHASE_SEEK_IN_FIRST_CHEST_2;
                        break;
                    case PHASE_SEEK_IN_FIRST_CHEST_2:
                        me->HandleEmoteCommand(EMOTE_STATE_NONE);
                        me->SetFacingTo(5.1576f);
                        Talk(SAY_KHADGAR_4);
                        _moveTimer = 3 * IN_MILLISECONDS;
                        _phase = PHASE_SEEK_IN_FIRST_CHEST_3;
                        break;
                    case PHASE_SEEK_IN_FIRST_CHEST_3:
                        SetEscortPaused(false);
                        _moveTimer = 0 * IN_MILLISECONDS;
                        _phase = PHASE_NONE;
                        break;
                    case PHASE_SEEK_IN_SECOND_CHEST_1:
                        me->HandleEmoteCommand(EMOTE_STATE_USESTANDING);
                        Talk(SAY_KHADGAR_5);
                        _moveTimer = 7 * IN_MILLISECONDS;
                        _phase = PHASE_SEEK_IN_SECOND_CHEST_2;
                        break;
                    case PHASE_SEEK_IN_SECOND_CHEST_2:
                        me->HandleEmoteCommand(EMOTE_STATE_NONE);
                        Talk(SAY_KHADGAR_6);
                        _moveTimer = 6 * IN_MILLISECONDS;
                        _phase = PHASE_SEEK_IN_SECOND_CHEST_3;
                        break;
                    case PHASE_SEEK_IN_SECOND_CHEST_3:
                        me->CastSpell(me, SPELL_CRYSTALLIZED_SOUL);
                        me->SummonGameObject(GO_CRYSTALLIZED_SOUL, -829.154f, 4653.472f, 768.774f, 1.46863f, QuaternionData(), 60);
                        if (Player* player = ObjectAccessor::GetPlayer(*me, _eventStarterGuid))
                        {
                            player->KilledMonsterCredit(90417, ObjectGuid::Empty);
                        }
                        me->SetFacingTo(1.9587f);
                        Talk(SAY_KHADGAR_7);
                        _moveTimer = 5 * IN_MILLISECONDS;
                        _phase = PHASE_SEEK_IN_SECOND_CHEST_4;
                        break;
                    case PHASE_SEEK_IN_SECOND_CHEST_4:
                        SetEscortPaused(false);
                        _moveTimer = 0 * IN_MILLISECONDS;
                        _phase = PHASE_NONE;
                        break;
                    case PHASE_DESPAWN:
                        me->Respawn(false);
                        break;
                    default:
                        break;
                    }
                }
                else if (!me->IsInCombat())
                    _moveTimer -= diff;
            }
        }

        void WaypointReached(uint32 waypointId, uint32 /*pathId*/) override
        {
            Player* player = GetPlayerForEscort();
            if (!player)
                return;

            switch (waypointId)
            {
            case WP_START_WALK:
                _moveTimer = 0 * IN_MILLISECONDS;
                _phase = PHASE_NONE;
                me->SetWalk(true);
                me->SetUnitMovementFlags(MOVEMENTFLAG_WALKING);
                break;
            case WP_IN_THE_MIDDLE:
                SetEscortPaused(true);
                me->SetFacingTo(2.3671f);
                Talk(SAY_KHADGAR_2);
                _moveTimer = 5 * IN_MILLISECONDS;
                _phase = PHASE_WAIT_IN_MIDDLE;
                break;
            case WP_AT_FIRST_CHEST:
                SetEscortPaused(true);
                me->SetFacingTo(3.6316f);
                _moveTimer = 0.2 * IN_MILLISECONDS;
                _phase = PHASE_SEEK_IN_FIRST_CHEST_1;
                break;
            case WP_AT_SECOND_CHEST:
                SetEscortPaused(true);
                _moveTimer = 0.2 * IN_MILLISECONDS;
                _phase = PHASE_SEEK_IN_SECOND_CHEST_1;
                break;
            case WP_AT_HOME:
                _moveTimer = 0.2 * IN_MILLISECONDS;
                _phase = PHASE_DESPAWN;
                break;
            default:
                break;
            }
        }

    private:
        int8 _phase;
        uint32 _moveTimer;
        ObjectGuid _eventStarterGuid;
        GuidList _explosivesGuids;
        EventMap _events;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_archmage_khadgar_90417_AI(creature);
    }
};
enum
{
    QUEST_ESTABLISHING_A_CONNECTION = 41807,
    KILLCREDIT_ACTIVATE_COMMUNICATOR = 104907,
    KILLCREDIT_REPORT_RECEIVED = 104908,
    SPELL_ACTIVATE_LEGION_COMMUNICATOR = 37020,
    EVENT_START_ANIM = 1,
    DATA_COMMUNICATOR_ACTIVATED = 21,
    DATA_REPORT_RECEIVED = 22,
    DATA_GARBLED_POSITION = 23,
    DATA_GARBLED_INCOMING = 24,
    SPELL_SUMMON_ALLARI = 207795,
};
// npc 99262 for the quest 41807 'Establishing A Connection'
class npc_jace_darkweaver_99262 : public CreatureScript
{
public:
    npc_jace_darkweaver_99262() : CreatureScript("npc_jace_darkweaver_99262") { }

    enum eJace
    {
        SAY_JACE_1 = 0,
        SAY_JACE_2 = 1,
        SAY_ALTRUIS_1 = 0,
    };

    bool OnQuestReward(Player* player, Creature* creature, Quest const* quest, uint32 /*opt*/) override
    {
        if (quest->GetQuestId() == QUEST_ESTABLISHING_A_CONNECTION)
            if (Creature* altruis = creature->FindNearestCreature(99254, 15.0f))
                altruis->AI()->Talk(SAY_ALTRUIS_1);
        return true;
    }

    struct npc_jace_darkweaver_99262_AI : public ScriptedAI
    {
        npc_jace_darkweaver_99262_AI(Creature* creature) : ScriptedAI(creature) {
            me->SetReactState(REACT_PASSIVE);
        }

        void SetData(uint32 id, uint32 /*value*/) override
        {
            switch (id)
            {
            case DATA_COMMUNICATOR_ACTIVATED:
                Talk(SAY_JACE_1);
                break;
            case DATA_REPORT_RECEIVED:
                Talk(SAY_JACE_2);
                break;
            }
        }

    private:
        EventMap _events;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_jace_darkweaver_99262_AI(creature);
    }
};

// gameobject 251528 for the quest 41807 'Establishing A Connection'
class go_legion_communicator : public GameObjectScript
{
public:
    go_legion_communicator() : GameObjectScript("go_legion_communicator") { }

    enum eAllari {
        EVENT_TALK_JACE_00 = 1,
        EVENT_TALK_JACE_01 = 2,
        EVENT_TALK_PART_00 = 3,
        EVENT_TALK_PART_01 = 4,
        EVENT_GIVE_CREDIT = 5,
        NPC_ALLARI_SOULEATER = 104909,
    };

    bool OnGossipHello(Player* player, GameObject* go) override
    {
        if (player->HasQuest(QUEST_ESTABLISHING_A_CONNECTION) &&
            !player->GetQuestObjectiveData(QUEST_ESTABLISHING_A_CONNECTION, 0))
        {
            Position allariPosition = { go->GetPositionX(), go->GetPositionY(), 747.019f, 0.385333f };
            player->SummonCreature(NPC_ALLARI_SOULEATER, allariPosition, TEMPSUMMON_TIMED_DESPAWN, 30000);
        }

        return false;
    }

    struct go_legion_communicator_AI : public GameObjectAI
    {
        go_legion_communicator_AI(GameObject* go) : GameObjectAI(go) { }

        EventMap    _events;
        ObjectGuid  _playerGUID;
        ObjectGuid  _allariGUID;
        ObjectGuid  _jaceGUID;

        void Reset() override
        {
            _playerGUID = ObjectGuid::Empty;
            _allariGUID = ObjectGuid::Empty;
            _jaceGUID = ObjectGuid::Empty;
        }

        void OnLootStateChanged(uint32 /*state*/, Unit* unit) override
        {
            if (unit)
                if (unit->ToPlayer()->HasQuest(QUEST_ESTABLISHING_A_CONNECTION) &&
                    !unit->ToPlayer()->GetQuestObjectiveData(QUEST_ESTABLISHING_A_CONNECTION, 0))
                    if (Creature* allari = me->FindNearestCreature(104909, 3.0f))
                        if (Creature* jace = me->FindNearestCreature(99262, 5.0f))
                            if (Player* player = unit->ToPlayer())
                            {
                                _playerGUID = player->GetGUID();
                                _allariGUID = allari->GetGUID();
                                _jaceGUID = jace->GetGUID();
                                _events.ScheduleEvent(EVENT_TALK_JACE_00, 1000);
                                _events.RescheduleEvent(EVENT_TALK_PART_00, 7000);
                            }
        }

        void UpdateAI(uint32 diff) override
        {
            _events.Update(diff);

            while (uint32 eventId = _events.ExecuteEvent())
            {
                switch (eventId)
                {
                case EVENT_TALK_JACE_00:
                {
                    if (Creature* jace = ObjectAccessor::GetCreature(*me, _jaceGUID))
                        if (Player* player = ObjectAccessor::GetPlayer(*me, _playerGUID))
                        {
                            jace->AI()->SetData(DATA_COMMUNICATOR_ACTIVATED, DATA_COMMUNICATOR_ACTIVATED);
                            player->KilledMonsterCredit(KILLCREDIT_ACTIVATE_COMMUNICATOR, ObjectGuid::Empty);
                        }
                    break;
                }
                case EVENT_TALK_PART_00:
                {
                    if (Creature* allari = ObjectAccessor::GetCreature(*me, _allariGUID))
                        if (Player* player = ObjectAccessor::GetPlayer(*me, _playerGUID))
                            allari->AI()->SetData(DATA_GARBLED_POSITION, DATA_GARBLED_POSITION);
                    _events.ScheduleEvent(EVENT_TALK_PART_01, 6000);
                    break;
                }
                case EVENT_TALK_PART_01:
                {
                    if (Creature* allari = ObjectAccessor::GetCreature(*me, _allariGUID))
                        if (Player* player = ObjectAccessor::GetPlayer(*me, _playerGUID))
                            allari->AI()->SetData(DATA_GARBLED_INCOMING, DATA_GARBLED_INCOMING);
                    _events.ScheduleEvent(EVENT_GIVE_CREDIT, 2000);
                    break;
                }
                case EVENT_GIVE_CREDIT:
                {
                    if (Creature* allari = ObjectAccessor::GetCreature(*me, _allariGUID))
                        if (Player* player = ObjectAccessor::GetPlayer(*me, _playerGUID))
                        {
                            player->KilledMonsterCredit(KILLCREDIT_REPORT_RECEIVED, ObjectGuid::Empty);
                            allari->DespawnOrUnsummon(Seconds(2));
                        }
                    _events.ScheduleEvent(EVENT_TALK_JACE_01, 2000);
                    break;
                }
                case EVENT_TALK_JACE_01:
                {
                    if (Creature* jace = ObjectAccessor::GetCreature(*me, _jaceGUID))
                        if (Player* player = ObjectAccessor::GetPlayer(*me, _playerGUID))
                            jace->AI()->SetData(DATA_REPORT_RECEIVED, DATA_REPORT_RECEIVED);
                    break;
                }
                default:
                    break;
                }
            }
        }
    };

    GameObjectAI* GetAI(GameObject* go) const override
    {
        return new go_legion_communicator_AI(go);
    }
};

// npc 104909 for the quest 41807 'Establishing A Connection'
class npc_allari_souleater_104909 : public CreatureScript
{
public:
    npc_allari_souleater_104909() : CreatureScript("npc_allari_souleater_104909") { }

    enum eAllari {
        SAY_ALLARI_1 = 0,
        SAY_ALLARI_2 = 1,
    };

    struct npc_allari_souleater_104909_AI : public ScriptedAI
    {
        npc_allari_souleater_104909_AI(Creature* creature) : ScriptedAI(creature) {
            me->SetEmoteState(Emote::EMOTE_STATE_READY2H);
        }

        void SetData(uint32 id, uint32 /*value*/) override
        {
            switch (id)
            {
            case DATA_GARBLED_POSITION:
                Talk(SAY_ALLARI_1);
                break;
            case DATA_GARBLED_INCOMING:
                Talk(SAY_ALLARI_2);
                break;
            }
        }

    private:
        EventMap _events;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_allari_souleater_104909_AI(creature);
    }
};

// quest 38564
class npc_tele_q38564 : public CreatureScript
{
public:
    npc_tele_q38564() : CreatureScript("npc_tele_q38564") { }
     struct npc_tele_q38564AI : public ScriptedAI
    {
        npc_tele_q38564AI(Creature* creature) : ScriptedAI(creature) { }
         void MoveInLineOfSight(Unit* who) override
        {
            if (Player* player = who->ToPlayer())
            {
                if (player->GetQuestStatus(38564) == QUEST_STATUS_INCOMPLETE)
                {
                    if (player->IsInDist(me, 2.0f))
                    {
                       player->KilledMonsterCredit(92925);
                    }
                }
            }
        }
    };
     CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_tele_q38564AI(creature);
    }
};

struct npc_credit_portal_taken_110409 : public ScriptedAI
{
    npc_credit_portal_taken_110409(Creature* creature) : ScriptedAI(creature) { }

    void MoveInLineOfSight(Unit* who) override
    {
        if (!who || !who->IsInWorld())
            return;
        if (!me->IsWithinDist(who, 15.0f, false))
            return;
        Player* player = who->GetCharmerOrOwnerPlayerOrPlayerItself();
        if (!player)
            return;
            player->KilledMonsterCredit(me->GetEntry());
            player->KilledMonsterCredit(97481);
    }
};

enum Spells
{
    SPELL_TRESPASSER_A = 225512,
    SPELL_TRESPASSER_H = 225574,
};

enum NPCs // All outdoor guards are within 35.0f of these NPCs
{
    NPC_APPLEBOUGH_A = 96990,
    NPC_SWEETBERRY_H = 96784,
    NPC_GILNEAN_GUARD = 108323,
    NPC_FORSAKEN_GUARD = 103626,
};

struct npc_guard_dalaran_legion : public ScriptedAI
{
    npc_guard_dalaran_legion(Creature* creature) : ScriptedAI(creature)
    {
        creature->AddUnitFlag(UNIT_FLAG_NON_ATTACKABLE);
        creature->ApplySpellImmune(0, IMMUNITY_DAMAGE, SPELL_SCHOOL_NORMAL, true);
        creature->ApplySpellImmune(0, IMMUNITY_DAMAGE, SPELL_SCHOOL_MASK_MAGIC, true);
    }

    void MoveInLineOfSight(Unit* who) override
    {
        if (!who || !who->IsInWorld() || who->GetZoneId() != 7502)
            return;

        if (!me->IsWithinDist(who, 65.0f, false))
            return;

        Player* player = who->GetCharmerOrOwnerPlayerOrPlayerItself();

        if (!player || player->IsGameMaster() || player->IsBeingTeleported())
            return;

        switch (me->GetEntry())
        {
        case NPC_GILNEAN_GUARD:
            if (player->GetTeam() == HORDE)              // Horde unit found in Alliance area
            {
                if (GetClosestCreatureWithEntry(me, NPC_APPLEBOUGH_A, 32.0f))
                {
                    if (me->isInBackInMap(who, 12.0f))   // In my line of sight, "outdoors", and behind me
                        player->CastSpell(player, SPELL_TRESPASSER_A, true); // Teleport the Horde unit out
                }
                else                                      // In my line of sight, and "indoors"
                {
                    if (me->isInFrontInMap(who, 12.0f))
                        player->CastSpell(player, SPELL_TRESPASSER_A, true);    // Teleport the Horde unit out
                }

            }
            break;
        case NPC_FORSAKEN_GUARD:
            if (player->GetTeam() == ALLIANCE)           // Alliance unit found in Horde area
            {
                if (GetClosestCreatureWithEntry(me, NPC_SWEETBERRY_H, 32.0f))
                {
                    if (me->isInBackInMap(who, 12.0f))   // In my line of sight, "outdoors", and behind me
                        player->CastSpell(player, SPELL_TRESPASSER_H, true); // Teleport the Alliance unit out
                }
                else                                      // In my line of sight, and "indoors"
                {
                    if (me->isInFrontInMap(who, 12.0f))
                        player->CastSpell(player, SPELL_TRESPASSER_H, true);     // Teleport the Alliance unit out
                }
            }
            break;
        }
        return;
    }
};

///A Mysterious Note 266619 QUEST 45185
class go_a_mysterious_note : public GameObjectScript
{
public:
    go_a_mysterious_note() : GameObjectScript("go_a_mysterious_note") { }

    bool OnGossipHello(Player* player, GameObject* /*go*/) override
    {
        if (player->HasQuest(45185))
            player->CastSpell(player, 231604, true);
        return false;
    }
};

enum
{
    ///Druid Quest
    ///start  from Archdruid Hamuul Runetotem once you arrive in Dalaran
    QUEST_A_SUMMONS_FROM_MOONGLADE = 40643,
    NPC_ARCHDRUID_HAMUUL_RUNETOTEM = 101061,

    ///quest 47221 The Hand of Fate
    QUEST_A_THE_HAND_OF_FATE = 47221,
    QUEST_H_THE_HAND_OF_FATE = 47835,
    CONVERSATION_A_THE_HAND_OF_FATE = 4904,
    CONVERSATION_H_THE_HAND_OF_FATE = 5337,

    QUEST_THE_DALARAN_FOUNTAIN = 40961,
    NPC_NAT_PAGLE = 88317,

    ///Paradin Quest
    ///start  from Archdruid Hamuul Runetotem once you arrive in Dalaran
    QUEST_AN_URGENT_GATHERING = 38710,
    NPC_LORD_MAXWELL_TYROSUS = 92909,

    ///Mage Quest
    NPC_EMISSARY_AULDBRIDGE_111109 = 111109,
    NPC_MERYL_FELSTORM_102700 = 102700,

    CONVERSATION_MAGE_QUEST_START = 1263,
    QUEST_FELSTORMS_PLEA = 41035, /// after quest 44184 In the Blink of an Eye complete

    ///Death Knight Quest
    QUEST_THE_CALL_TO_WAR = 40714,
    SEPLL_CONVERSATION_THE_CALL_TO_WAR = 200226,

    ///Roge Quest
    NPC_RAVENHOLDT_COURIER_102018 = 102018,
    QUEST_CALL_OF_THE_UNCROWNED = 40832,

    ///Hunter Quest
    NPC_SNOWFEATHER_100786 = 100786,
    QUEST_NEEDS_OF_THE_HUNTERS = 40384,

    ///DH Quest
    NPC_KORVAS_BLOODTHORN_99343 = 99343,
    QUEST_CALL_OF_THE_ILLIDARI_39261 = 39261,
    QUEST_CALL_OF_THE_ILLIDARI_39047 = 39047,

    ///Monk Quest before the storm
    NPC_INITIATE_DA_NEL = 98519,
    QUEST_DA_NEL = 12103,

    ///Priest Quest
    NPC_A_HOODED_PRIESTESS = 102333, ///A
    NPC_H_HOODED_PRIESTESS = 101344, ///H
    QUEST_PRIESTLY_MATTERS = 40705,

    ///WARLOCK Quest
    NPC_RITSSYN_FLAMESCOWL_103506 = 103506,
    QUEST_THE_SIXTH = 40716,

    ///WARRIOR Quest
    NPC_EITRIGG_93775 = 93775,
    NPC_SERGEANT_DALTON_108961 = 108961,
    QUEST_H_A_DESPERATE_PLEA = 41052,
    QUEST_A_AN_IMPORTANT_MISSION = 42814,

};
//
class zone_legion_dalaran: public ZoneScript
{
public:
    zone_legion_dalaran() : ZoneScript("zone_legion_dalaran") { }
    uint32 _insideNpc;
    uint32 _killCredit;
    Creature* creature;
    Position _positon;


    void OnTempSummonNPC(uint32 insideNpc, Player* player)
    {
        _insideNpc = insideNpc;
        if (creature = player->FindNearestCreature(_insideNpc, 100.0f))
        {
            // TODO : Remove this line when phasing is done properly
            creature->DestroyForPlayer(player);
        }

        _positon = Position(player->GetPositionX() + 20, player->GetPositionY() + 20, player->GetPositionZ());
        //   _positon= player->GetPosition();


        if (TempSummon* personalCreature = player->SummonCreature(_insideNpc, _positon, TEMPSUMMON_TIMED_DESPAWN, 60000, 0, true))
        {
            //personalCreature->GetMotionMaster()->MoveCloserAndStop(personalCreature->GetEntry(), player, 5.0f);
            personalCreature->GetMotionMaster()->MoveFollow(player, PET_FOLLOW_DIST, personalCreature->GetFollowAngle());
            // TODO : personalCreature->Talk(0);
        }
    }
    void OnTempSummonNPCOnPOS(uint32 insideNpc, Player* player,Position npcPos)
    {
        _insideNpc = insideNpc;
        if (creature = player->FindNearestCreature(_insideNpc, 100.0f))
        {
            // TODO : Remove this line when phasing is done properly
            creature->DestroyForPlayer(player);
        }

        _positon = npcPos;
        TempSummon* personalCreature = player->SummonCreature(_insideNpc, _positon, TEMPSUMMON_TIMED_DESPAWN, 3600000, 0, true);
    }
    enum BROKEN_ISLES_PATHFINDE
    {
        SPELL_BROKEN_ISLES_PATHFINDER_1 = 226342,
        SPELL_BROKEN_ISLES_PATHFINDER_2 = 233368,

    };

    void OnPlayerEnter(Player* player) override
    {
        if (player->HasAchieved(11190))//[BROKEN_ISLES_PATHFINDER]
        {
            //226342 SPELL_BROKEN_ISLES_PATHFINDER_1
            player->LearnSpell(SPELL_BROKEN_ISLES_PATHFINDER_1, true);
        }
        if (player->HasAchieved(11446))//[BROKEN_ISLES_PATHFINDER]
        {
            //233368 SPELL_BROKEN_ISLES_PATHFINDER_2
            player->LearnSpell(SPELL_BROKEN_ISLES_PATHFINDER_2, true);
        }

        //AGUS ARRAIVE
        if (player->IsInAlliance() && player->GetQuestStatus(QUEST_A_THE_HAND_OF_FATE) == QUEST_STATUS_NONE && player->getLevel() >= 110 && player->GetZoneId() == 7502)
        {
            Conversation::CreateConversation(CONVERSATION_A_THE_HAND_OF_FATE, player, player->GetPosition(), { player->GetGUID() });

            if (const Quest* quest = sObjectMgr->GetQuestTemplate(QUEST_A_THE_HAND_OF_FATE))
                player->AddQuest(quest, nullptr);
        }
        if (player->IsInHorde() && player->GetQuestStatus(QUEST_A_THE_HAND_OF_FATE) == QUEST_STATUS_NONE && player->getLevel() >= 110 && player->GetZoneId() == 7502)
        {
            Conversation::CreateConversation(CONVERSATION_H_THE_HAND_OF_FATE, player, player->GetPosition(), { player->GetGUID() });

            if (const Quest* quest = sObjectMgr->GetQuestTemplate(QUEST_H_THE_HAND_OF_FATE))
                player->AddQuest(quest, nullptr);
        }


        if (player->GetQuestStatus(QUEST_BLINK_OF_AN_EYE) == QUEST_STATUS_REWARDED && player->getLevel() >= 98 && player->GetZoneId() == 7502)
        {
            //Druid Quest
            if (player->getClass() == CLASS_DRUID && player->GetQuestStatus(QUEST_A_SUMMONS_FROM_MOONGLADE) == QUEST_STATUS_NONE)
            {
                OnTempSummonNPC(NPC_ARCHDRUID_HAMUUL_RUNETOTEM, player);
            }
            //Paladin Quest
            if (player->getClass() == CLASS_PALADIN && player->GetQuestStatus(QUEST_AN_URGENT_GATHERING) == QUEST_STATUS_NONE)
            {
                OnTempSummonNPC(NPC_LORD_MAXWELL_TYROSUS, player);
            }
            //Mage Quest phase 4598
            if (player->getClass() == CLASS_MAGE && player->GetQuestStatus(QUEST_FELSTORMS_PLEA) == QUEST_STATUS_NONE)
            {
                Conversation::CreateConversation(CONVERSATION_MAGE_QUEST_START, player, player->GetPosition(), { player->GetGUID() });

                if (const Quest* quest = sObjectMgr->GetQuestTemplate(QUEST_FELSTORMS_PLEA))
                    player->AddQuest(quest, nullptr);
            }
            //Death Knight Quest ServerToClient: SMSG_SPELL_START (0x2C3A) Length: 101 ConnIdx: 0 Time: 06/06/2018 13:41:43.782 Number: 6386
            if (player->getClass() == CLASS_DEATH_KNIGHT && player->GetQuestStatus(QUEST_THE_CALL_TO_WAR) == QUEST_STATUS_NONE)
            {
                player->CastSpell(player, SEPLL_CONVERSATION_THE_CALL_TO_WAR, true);
                if (const Quest* quest = sObjectMgr->GetQuestTemplate(QUEST_THE_CALL_TO_WAR))
                    player->AddQuest(quest, nullptr);

            }
            //Hunter Quest
            if (player->getClass() == CLASS_HUNTER && player->GetQuestStatus(QUEST_NEEDS_OF_THE_HUNTERS) == QUEST_STATUS_NONE)
            {
                OnTempSummonNPC(NPC_SNOWFEATHER_100786, player);
            }
            //DEMON_HUNTER Quest
            if (player->getClass() == CLASS_DEMON_HUNTER && (player->GetQuestStatus(QUEST_CALL_OF_THE_ILLIDARI_39261) == QUEST_STATUS_NONE || player->GetQuestStatus(QUEST_CALL_OF_THE_ILLIDARI_39047) == QUEST_STATUS_NONE))
            {
                ///DH Quest
                OnTempSummonNPC(NPC_KORVAS_BLOODTHORN_99343, player);
            }
            //WARRIOR Quest
            if (player->getClass() == CLASS_WARRIOR)
            {
                if (player->IsInAlliance() && player->GetQuestStatus(QUEST_A_AN_IMPORTANT_MISSION) == QUEST_STATUS_NONE)
                    OnTempSummonNPC(NPC_SERGEANT_DALTON_108961, player);
                if (player->IsInHorde() && player->GetQuestStatus(QUEST_H_A_DESPERATE_PLEA) == QUEST_STATUS_NONE)
                    OnTempSummonNPC(NPC_EITRIGG_93775, player);
            }
            //ROGUE Quest
            if (player->getClass() == CLASS_ROGUE && player->GetQuestStatus(QUEST_CALL_OF_THE_UNCROWNED) == QUEST_STATUS_NONE)
            {
                OnTempSummonNPC(NPC_RAVENHOLDT_COURIER_102018, player);
            }
            //Priest Quest
            if (player->getClass() == CLASS_PRIEST && player->GetQuestStatus(QUEST_PRIESTLY_MATTERS) == QUEST_STATUS_NONE)
            {
                uint32 priestNpc = player->IsInAlliance() ? NPC_A_HOODED_PRIESTESS : NPC_H_HOODED_PRIESTESS;
                OnTempSummonNPC(priestNpc, player);
            }
            //SHAMAN Quest
            if (player->getClass() == CLASS_SHAMAN && player->GetQuestStatus(QUEST_THE_CALL_TO_WAR) == QUEST_STATUS_NONE)
            {

            }
            //WARLOCK Quest
            if (player->getClass() == CLASS_WARLOCK && player->GetQuestStatus(QUEST_THE_SIXTH) == QUEST_STATUS_NONE)
            {
                OnTempSummonNPC(NPC_RITSSYN_FLAMESCOWL_103506, player);
            }
            //MONK Quest
            if (player->getClass() == CLASS_MONK && player->GetQuestStatus(QUEST_DA_NEL) == QUEST_STATUS_NONE)
            {
                OnTempSummonNPC(NPC_INITIATE_DA_NEL, player);
            }

            //achievement 10596 npc 88317
            if (player->HasAchieved(10596) && player->GetQuestStatus(QUEST_THE_DALARAN_FOUNTAIN) == QUEST_STATE_COMPLETE )
            {
                OnTempSummonNPC(NPC_NAT_PAGLE, player);
            }
        }

    }

    void OnPlayerExit(Player* player) override
    {

        if (creature = player->FindNearestCreature(_insideNpc, 100.0f))
        {
            // TODO : Remove this line when phasing is done properly
            creature->DestroyForPlayer(player);
        }
    }
};

enum CLASS_PHASE
{
    PHASE_CLASS_WARRIOR_HORDE = 7300,
    PHASE_CLASS_WARRIOR_ALIANCE = 7302,
    PHASE_CLASS_PALADIN = 7319,
    PHASE_CLASS_HUNTER_1 = 7341,
    PHASE_CLASS_HUNTER_2 = 6763,
    PHASE_CLASS_ROGUE = 4,
    PHASE_CLASS_PRIEST = 5,
    PHASE_CLASS_DEATH_KNIGHT = 6,
    //PHASE_CLASS_SHAMAN = 7,
    PHASE_CLASS_MAGE = 8,
    PHASE_CLASS_WARLOCK = 9,
    PHASE_CLASS_MONK = 10,
    //PHASE_CLASS_DRUID = 11,
    PHASE_CLASS_DEMON_HUNTER = 12
};
class PhaseOnDaralanArea : public PlayerScript
{
public:
    PhaseOnDaralanArea() : PlayerScript("PhaseOnDaralanArea") { }

    void OnPlayerUpdateAreaAlternate(Player* player, uint32 newArea, uint32 /*oldArea*/)
    {
        if (player->GetAreaId() == 7505 && player->getClass() == CLASS_PALADIN)
            PhasingHandler::AddPhase(player, PHASE_CLASS_PALADIN);
        if (player->getClass() == CLASS_HUNTER)
        {
            if (player->GetAreaId() == 7502 || player->GetAreaId() == 7505)
                PhasingHandler::AddPhase(player, PHASE_CLASS_HUNTER_1);
            if (player->GetAreaId() == 7505)
                PhasingHandler::AddPhase(player, PHASE_CLASS_HUNTER_2);
        }
        if (player->GetAreaId() == 7502 && player->getClass() == CLASS_WARRIOR)
        {
            if(player->IsInHorde() && player->HasQuest(QUEST_H_A_DESPERATE_PLEA))
                PhasingHandler::AddPhase(player, PHASE_CLASS_WARRIOR_HORDE);
            if (player->IsInAlliance() && player->HasQuest(QUEST_A_AN_IMPORTANT_MISSION))
                PhasingHandler::AddPhase(player, PHASE_CLASS_WARRIOR_ALIANCE);
        }


    }
};

struct npc_emissary_auldbridge_111109 : public ScriptedAI
{
    npc_emissary_auldbridge_111109(Creature* creature) : ScriptedAI(creature) { Initialize(); }
    enum Texts
    {
        SAY_FIRST_LINE = 0, ///
        SAY_SECOND_LINE = 1,///
        SAY_THIRD_LINE = 2, ///
    };
    enum DataTypes
    {
        DATA_TALK_1 = 1,
        DATA_TALK_2 = 2,
        DATA_TALK_3 = 3,
        DATA_GIVE_QUEST_CHECK = 4,
    };

    void Initialize()
    {
        m_playerGUID = ObjectGuid::Empty;
    }

    void QuestReward(Player* player, Quest const* quest, uint32 /*opt*/)  override
    {
        if (quest->GetQuestId() == QUEST_BLINK_OF_AN_EYE)
        {
                m_playerGUID = player->GetGUID();
                events.ScheduleEvent(DATA_TALK_1, 1s);
        }
    }
    void UpdateAI(uint32 diff) override
    {
        events.Update(diff);
        while (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {
                case DATA_TALK_1:
                {
                    Talk(SAY_FIRST_LINE);
                    events.ScheduleEvent(DATA_TALK_2, 3s);
                    break;
                }
                case DATA_TALK_2:
                {
                    Talk(SAY_SECOND_LINE);
                    events.ScheduleEvent(DATA_TALK_3, 3s);
                    break;
                }
                case DATA_TALK_3:
                {
                    Talk(SAY_THIRD_LINE);
                    events.ScheduleEvent(DATA_GIVE_QUEST_CHECK, 3s);
                    break;
                }
                case DATA_GIVE_QUEST_CHECK:
                {
                    CheckQuestGive();
                    break;
                }
            }
        }
    }
    void OnTempSummonNPC(uint32 insideNpc, Player* player)
    {
        if (Creature* creature = player->FindNearestCreature(insideNpc, 100.0f))
        {
            creature->DespawnOrUnsummon(1000);
            //creature->DestroyForPlayer(player);
        }
        Position _positon = me->GetPosition();
        GetPositionWithDistInFront(me, 15.f, _positon);

        if (TempSummon* personalCreature = player->SummonCreature(insideNpc, _positon, TEMPSUMMON_TIMED_DESPAWN, 60000, 0, true))
        {
            personalCreature->GetMotionMaster()->MoveFollow(player, PET_FOLLOW_DIST, personalCreature->GetFollowAngle());
        }
    }
    void CheckQuestGive()
    {

        if (!m_playerGUID.IsEmpty())
        {
            if (Player* player = ObjectAccessor::GetPlayer(*me, m_playerGUID))
                if (player->GetQuestStatus(QUEST_BLINK_OF_AN_EYE) == QUEST_STATUS_REWARDED && player->getLevel() >= 98 && player->GetZoneId() == 7502 && player->IsInWorld() || player->IsAlive())
                {
                    //Druid Quest
                    if (player->getClass() == CLASS_DRUID && player->GetQuestStatus(QUEST_A_SUMMONS_FROM_MOONGLADE) == QUEST_STATUS_NONE)
                    {
                        OnTempSummonNPC(NPC_ARCHDRUID_HAMUUL_RUNETOTEM, player);
                    }
                    //Paladin Quest
                    if (player->getClass() == CLASS_PALADIN && player->GetQuestStatus(QUEST_AN_URGENT_GATHERING) == QUEST_STATUS_NONE)
                    {
                        OnTempSummonNPC(NPC_LORD_MAXWELL_TYROSUS, player);
                    }
                    //Mage Quest phase 4598
                    if (player->getClass() == CLASS_MAGE && player->GetQuestStatus(QUEST_FELSTORMS_PLEA) == QUEST_STATUS_NONE)
                    {
                        Conversation::CreateConversation(CONVERSATION_MAGE_QUEST_START, player, player->GetPosition(), { player->GetGUID() });

                        if (const Quest* quest = sObjectMgr->GetQuestTemplate(QUEST_FELSTORMS_PLEA))
                            player->AddQuest(quest, nullptr);
                    }
                    //Death Knight Quest ServerToClient: SMSG_SPELL_START (0x2C3A) Length: 101 ConnIdx: 0 Time: 06/06/2018 13:41:43.782 Number: 6386
                    if (player->getClass() == CLASS_DEATH_KNIGHT && player->GetQuestStatus(QUEST_THE_CALL_TO_WAR) == QUEST_STATUS_NONE)
                    {
                        player->CastSpell(player, SEPLL_CONVERSATION_THE_CALL_TO_WAR, true);
                        if (const Quest* quest = sObjectMgr->GetQuestTemplate(QUEST_THE_CALL_TO_WAR))
                            player->AddQuest(quest, nullptr);

                    }
                    //Hunter Quest
                    if (player->getClass() == CLASS_HUNTER && player->GetQuestStatus(QUEST_NEEDS_OF_THE_HUNTERS) == QUEST_STATUS_NONE)
                    {
                        OnTempSummonNPC(NPC_SNOWFEATHER_100786, player);
                    }
                    //DEMON_HUNTER Quest
                    if (player->getClass() == CLASS_DEMON_HUNTER && (player->GetQuestStatus(QUEST_CALL_OF_THE_ILLIDARI_39261) == QUEST_STATUS_NONE || player->GetQuestStatus(QUEST_CALL_OF_THE_ILLIDARI_39047) == QUEST_STATUS_NONE ) )
                    {
                        ///DH Quest
                        OnTempSummonNPC(NPC_KORVAS_BLOODTHORN_99343, player);
                    }
                    //WARRIOR Quest
                    if (player->getClass() == CLASS_WARRIOR)
                    {
                        if(player->IsInAlliance()&& player->GetQuestStatus(QUEST_A_AN_IMPORTANT_MISSION) == QUEST_STATUS_NONE)
                            OnTempSummonNPC(NPC_SERGEANT_DALTON_108961, player);
                        if (player->IsInHorde() && player->GetQuestStatus(QUEST_H_A_DESPERATE_PLEA) == QUEST_STATUS_NONE)
                            OnTempSummonNPC(NPC_EITRIGG_93775, player);
                    }
                    //ROGUE Quest
                    if (player->getClass() == CLASS_ROGUE && player->GetQuestStatus(QUEST_CALL_OF_THE_UNCROWNED) == QUEST_STATUS_NONE)
                    {
                        OnTempSummonNPC(NPC_RAVENHOLDT_COURIER_102018, player);
                    }
                    //Priest Quest
                    if (player->getClass() == CLASS_PRIEST && player->GetQuestStatus(QUEST_PRIESTLY_MATTERS) == QUEST_STATUS_NONE)
                    {
                        uint32 priestNpc = player->IsInAlliance() ? NPC_A_HOODED_PRIESTESS : NPC_H_HOODED_PRIESTESS;
                        OnTempSummonNPC(priestNpc, player);
                    }
                    //SHAMAN Quest
                    if (player->getClass() == CLASS_SHAMAN && player->GetQuestStatus(QUEST_THE_CALL_TO_WAR) == QUEST_STATUS_NONE)
                    {

                    }
                    //WARLOCK Quest
                    if (player->getClass() == CLASS_WARLOCK && player->GetQuestStatus(QUEST_THE_SIXTH) == QUEST_STATUS_NONE)
                    {
                        OnTempSummonNPC(NPC_RITSSYN_FLAMESCOWL_103506, player);
                    }
                    //MONK Quest
                    if (player->getClass() == CLASS_MONK && player->GetQuestStatus(QUEST_DA_NEL) == QUEST_STATUS_NONE)
                    {
                         OnTempSummonNPC(NPC_INITIATE_DA_NEL, player);
                    }
                }

        }

        //RemovePlayer();
    }
private:
    EventMap events;
    std::set<ObjectGuid> pList;
    ObjectGuid   m_playerGUID;
};

#define GOSSIP_HELLO_ALTURAS1 "There's no time to explain. Let us inside the hold, warden."
#define GOSSIP_HELLO_ALTURAS2 "Let us inside or I'll show you the difference."
#define GOSSIP_HELLO_ALTURAS3 "Do you want to find out?"
#define GOSSIP_HELLO_ALTURAS4 "What do you have to lose either way?"
class npc_warden_alturas : public CreatureScript
{
public:
    npc_warden_alturas() : CreatureScript("npc_warden_alturas") { }

    enum {
        TEXT_ALLOW_ENTER = 3,
        EVENT_TELEPORT_VIOLETHOLD = 11,
        EVENT_START_MOVE = 12,
        EVENT_MOVE_TO_GATES = 13,
        EVENT_TELEPORT = 14,
        EVENT_RESET = 15,
        DATA_START_EVENT = 21,
    };

    bool _diffsPicked = false;
    bool _noTimePicked = false;

    bool OnGossipHello(Player* player, Creature* creature) override
    {
        if (player->GetQuestStatus(41121) == QUEST_STATUS_INCOMPLETE && !_diffsPicked && !_noTimePicked)
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, GOSSIP_HELLO_ALTURAS1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);

        if (player->GetQuestStatus(41121) == QUEST_STATUS_INCOMPLETE && !_diffsPicked)
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, GOSSIP_HELLO_ALTURAS2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);

        if (player->GetQuestStatus(41121) == QUEST_STATUS_INCOMPLETE && _diffsPicked)
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, GOSSIP_HELLO_ALTURAS3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);

        if (player->GetQuestStatus(41121) == QUEST_STATUS_INCOMPLETE && _diffsPicked)
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, GOSSIP_HELLO_ALTURAS4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);

        SendGossipMenuFor(player, player->GetGossipTextId(creature), creature->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action) override
    {
        if (!player)
            return false;

        player->PlayerTalkClass->ClearMenus();

        if (action == GOSSIP_ACTION_INFO_DEF + 1)
        {
            _noTimePicked = true;
            creature->AI()->Talk(0);
            creature->SetStandState(UNIT_STAND_STATE_STAND);
            CloseGossipMenuFor(player);
        }

        if (action == GOSSIP_ACTION_INFO_DEF + 2)
        {
            _diffsPicked = true;
            creature->SetStandState(UNIT_STAND_STATE_STAND);
            CloseGossipMenuFor(player);
        }

        if (action == GOSSIP_ACTION_INFO_DEF + 3)
        {
            creature->AI()->Talk(2);
            player->KilledMonsterCredit(96313);
            creature->AI()->SetData(DATA_START_EVENT, DATA_START_EVENT);
            CloseGossipMenuFor(player);
        }

        if (action == GOSSIP_ACTION_INFO_DEF + 4)
        {
            creature->AI()->Talk(1);
            player->KilledMonsterCredit(96313);
            creature->AI()->SetData(DATA_START_EVENT, DATA_START_EVENT);
            CloseGossipMenuFor(player);
        }

        return true;
    }

    bool OnQuestAccept(Player* /*player*/, Creature* /*creature*/, Quest const* quest) override
    {
        if (quest->GetQuestId() == 41121)
        {
            _diffsPicked = false;
            _noTimePicked = false;
        }

        return true;
    }

    struct npc_warden_alturas_AI : public ScriptedAI
    {
        npc_warden_alturas_AI(Creature* creature) : ScriptedAI(creature) {
            Initialize();
        }

        void Reset() override
        {
            _events.Reset();
        }

        void Initialize() {}

        void UpdateAI(uint32 diff) override
        {
            UpdateVictim();
            _events.Update(diff);

            while (uint32 eventId = _events.ExecuteEvent())
            {
                switch (eventId)
                {
                case EVENT_TELEPORT_VIOLETHOLD: {
                    Talk(TEXT_ALLOW_ENTER, me->GetOwner());
                    _events.ScheduleEvent(EVENT_START_MOVE, 4000);
                    break;
                }
                case EVENT_START_MOVE: {
                    _events.ScheduleEvent(EVENT_MOVE_TO_GATES, 2000);
                    me->AddUnitMovementFlag(MOVEMENTFLAG_WALKING);
                    me->SetOrientation(4.0119f);
                    break;
                }
                case EVENT_MOVE_TO_GATES: {
                    _events.ScheduleEvent(EVENT_TELEPORT, 3000);
                    me->GetMotionMaster()->MovePoint(2, -958.91f, 4326.97f, 740.20f);
                    break;
                }
                case EVENT_TELEPORT: {
                    _events.ScheduleEvent(EVENT_RESET, 1500);
                    me->CastSpell(me, 52096, true); // cosmetic-teleport-effect
                    break;
                }
                case EVENT_RESET: {
                    me->AI()->Reset();
                    _events.CancelEvent(EVENT_TELEPORT_VIOLETHOLD);
                    _events.CancelEvent(EVENT_START_MOVE);
                    _events.CancelEvent(EVENT_MOVE_TO_GATES);
                    _events.CancelEvent(EVENT_TELEPORT);
                    me->DespawnOrUnsummon(5000, Seconds(3));
                    break;
                }
                default:
                    break;
                }
            }
            // no melee attacks
        }

        void SetData(uint32 id, uint32 /*value*/) override
        {
            switch (id)
            {
                case DATA_START_EVENT:
                {
                    _events.ScheduleEvent(EVENT_TELEPORT_VIOLETHOLD, 3000);
                    break;
                }
            }
        }

    private:
        EventMap _events;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_warden_alturas_AI(creature);
    }
};

class go_violethold_entrance_portal : public GameObjectScript
{
public:
    go_violethold_entrance_portal() : GameObjectScript("go_violethold_entrance_portal")
    {
        checkTimer = 1000;
        giveKillCredit = 1000;
    }

    uint32 checkTimer;
    uint32 giveKillCredit;

    void OnUpdate(GameObject* p_Object, uint32 diff) override
    {
        if (checkTimer < diff)
        {
            checkTimer -= diff;
            return;
        }

        checkTimer = 1000;
        giveKillCredit = 1000;

        std::list<Player*> playerList;
        GetPlayerListInGrid(playerList, p_Object, 2.0f);

        for (Player* player : playerList)
        {
            if (player->GetQuestStatus(41121) == QUEST_STATUS_INCOMPLETE)
            {
                player->KilledMonsterCredit(95731, ObjectGuid::Empty);
                player->TeleportTo(1494, 1293.185f, -262.720f, 44.364f, 0.307976f);
            }
        }
    }
};

// npc 94324 for the DH Artifact Acquisition Scenarios
Position const brokenShorePath[] =
{
    { -845.682f, 4253.238f, 754.557f },
    { -845.679f, 4253.229f, 756.223f },
    { -845.679f, 4253.229f, 759.037f },
    { -845.046f, 4249.666f, 759.037f },
    { -840.329f, 4223.146f, 759.037f },
    { -831.249f, 4173.871f, 723.158f }
};
size_t const pathSize = std::extent<decltype(brokenShorePath)>::value;

class npc_illidari_felbat_94324 : public CreatureScript
{
public:
    npc_illidari_felbat_94324() : CreatureScript("npc_illidari_felbat_94324") { }

    enum eFelBal {
        EVENT_START_BROKENSHORE_PATH = 1,
        EVENT_START_SURAMAR_PATH = 2,
        EVENT_TELEPORT_BROKENSHORE = 3,
        EVENT_TELEPORT_SURAMAR = 4,
        SPELL_RIDE_VEHICLE_HARD_CODED = 46598,
        QUEST_THE_HUNT_1 = 39247,
        QUEST_THE_HUNT_2 = 41119,
        QUEST_VENGEANCE_WILL_BE_OURS_1 = 40249,
        QUEST_VENGEANCE_WILL_BE_OURS_2 = 41863,
    };

    struct npc_illidari_felbat_94324_AI : public VehicleAI
    {
        npc_illidari_felbat_94324_AI(Creature* creature) : VehicleAI(creature) { }

        void Reset() override
        {
            _events.Reset();
            _playerGUID = ObjectGuid::Empty;
        }

        void PassengerBoarded(Unit* passenger, int8 /*seatId*/, bool apply) override
        {
            if (apply && passenger->GetTypeId() == TYPEID_PLAYER) {
                _playerGUID = passenger->ToPlayer()->GetGUID();

                if (passenger->ToPlayer()->HasQuest(QUEST_THE_HUNT_1) || passenger->ToPlayer()->HasQuest(QUEST_THE_HUNT_2)) {
                    _events.ScheduleEvent(EVENT_TELEPORT_SURAMAR, Seconds(1));
                }

                if (passenger->ToPlayer()->HasQuest(QUEST_VENGEANCE_WILL_BE_OURS_1) || passenger->ToPlayer()->HasQuest(QUEST_VENGEANCE_WILL_BE_OURS_2)) {
                    _events.ScheduleEvent(EVENT_START_BROKENSHORE_PATH, Seconds(1));
                }
            }
        }

        void MovementInform(uint32 type, uint32 pointId) override
        {
            if (type == EFFECT_MOTION_TYPE && pointId == pathSize)
                _events.ScheduleEvent(EVENT_TELEPORT_BROKENSHORE, 200);
        }

        void UpdateAI(uint32 diff) override
        {
            _events.Update(diff);

            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            while (uint32 eventId = _events.ExecuteEvent())
            {
                switch (eventId)
                {
                case EVENT_START_BROKENSHORE_PATH:
                    me->GetMotionMaster()->MoveSmoothPath(uint32(pathSize), brokenShorePath, pathSize, false, true);
                    break;
                case EVENT_TELEPORT_BROKENSHORE:
                    me->RemoveAllAuras();
                    if (Player* player = ObjectAccessor::GetPlayer(*me, _playerGUID)) {
                        player->KilledMonsterCredit(99250);
                        player->TeleportTo(1500, Position(-2379.679f, 174.2f, 3.5625f, 3.733872f));
                    }
                    me->GetMotionMaster()->MoveTargetedHome();
                    break;
                case EVENT_TELEPORT_SURAMAR:
                    if (Player* player = ObjectAccessor::GetPlayer(*me, _playerGUID)) {
                        player->KilledMonsterCredit(94321); // 52391
                        player->TeleportTo(1498, Position(1263.69f, 5236.659f, 93.531f, 2.73693f));
                    }
                    break;
                default:
                    break;
                }
            }
        }
    private:
        EventMap _events;
        ObjectGuid _playerGUID;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_illidari_felbat_94324_AI(creature);
    }
};

struct npc_Gryphon_108973 : public ScriptedAI
{
    npc_Gryphon_108973(Creature* creature) : ScriptedAI(creature)
    {
        me->SetAIAnimKitId(0);
    }

    void OnSpellClick(Unit* clicker, bool& /*result*/)
    {
        if (Player* player = clicker->ToPlayer())
        {
            if (player->HasQuest(42815))
            {
                me->SetAIAnimKitId(4061);
                player->CastSpell(player, 197879, true);
                player->AddDelayedTeleport(2000, 1500, Position(-2379.679f, 174.2f, 3.5625f, 3.733872f));
            }
        }
    }
};

// npc 109196 (Jace Darkweaver) for the quest 42869 ('Eternal Vigil') and 42872 ('Securing The Way')
class npc_jace_darkweaver_109196 : public CreatureScript
{
public:
    npc_jace_darkweaver_109196() : CreatureScript("npc_jace_darkweaver_109196") { }

    enum eJace {
        QUEST_ETERNAL_VIGIL = 42869,
        QUEST_SECURING_THE_WAY = 42872,
        SPELL_SENTENCE_TO_DEATH = 217376,
    };

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest) override
    {
        if (quest->GetQuestId() == QUEST_SECURING_THE_WAY) {
            player->CastSpell(player, SPELL_SENTENCE_TO_DEATH, true);
        }

        return true;
    }

    struct npc_jace_darkweaver_109196_AI : public ScriptedAI
    {
        npc_jace_darkweaver_109196_AI(Creature* creature) : ScriptedAI(creature) {}

        void MoveInLineOfSight(Unit* unit) override
        {
            if (Player* player = unit->ToPlayer())
                if (player->GetDistance(me) < 25.0f)
                    if (player->GetQuestStatus(QUEST_ETERNAL_VIGIL) == QUEST_STATUS_INCOMPLETE) {
                        player->CompleteQuest(QUEST_ETERNAL_VIGIL);
                    }
        }

    private:
        EventMap _events;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_jace_darkweaver_109196_AI(creature);
    }
};

// Remove Action Button when player abandoned the quest
class q_securing_the_way : public QuestScript
{
public:
    q_securing_the_way() : QuestScript("q_securing_the_way") { }

    void OnQuestStatusChange(Player* player, Quest const* /*quest*/, QuestStatus /*oldStatus*/, QuestStatus newStatus) override
    {
        if (newStatus == QUEST_STATUS_NONE)
        {
            player->RemoveAurasDueToSpell(217376);
        }
    }
};

// 217377 Sentence To Death
class spell_redoubt_sentence_to_death : public SpellScript
{
    PrepareSpellScript(spell_redoubt_sentence_to_death);

    void HandleOnCast()
    {
        if (Player* player = GetCaster()->ToPlayer())
        {
            if (Creature* Asha = player->FindNearestCreature(102798, 50.0f))
                Asha->AI()->SetData(63, 63);
            if (Creature* Belath = player->FindNearestCreature(102797, 50.0f))
                Belath->AI()->SetData(64, 64);
        }
    }

    void Register() override
    {
        OnCast += SpellCastFn(spell_redoubt_sentence_to_death::HandleOnCast);
    }
};

struct npc_redoubt_asha : public ScriptedAI
{
    npc_redoubt_asha(Creature* creature) : ScriptedAI(creature) { }

    enum eAsha {
        DATA_ACTION_START = 63,
        EVENT_RELEASE_SOULS = 1,
        SPELL_ANQUISHED_SOUL = 203699,
        SPELL_EYE_BEAM_01 = 194326,
    };

    void SetData(uint32 id, uint32 /*value*/) override
    {
        switch (id)
        {
        case DATA_ACTION_START:
            me->CastSpell(me, 194326, true);
            break;
        default:
            break;
        }
    }

    void KillCapturedWrathguard() {
        if (Creature* capturedDemon = me->FindNearestCreature(109247, me->GetVisibilityRange(), true)) {
            for (uint8 i = 0; i < 3; i++) {
                capturedDemon->CastSpell(-964.113f, 4066.09f, 648.118f, SPELL_ANQUISHED_SOUL, true);
            }
            capturedDemon->DisappearAndDie();
        }
    }

    void UpdateAI(uint32 diff) override
    {
        _events.Update(diff);

        while (uint32 eventId = _events.ExecuteEvent())
        {
            switch (eventId)
            {
            case EVENT_RELEASE_SOULS:
                KillCapturedWrathguard();
                break;
            default:
                break;
            }
        }
    }
private:
    EventMap _events;
};

struct npc_redoubt_belath : public ScriptedAI
{
    npc_redoubt_belath(Creature* creature) : ScriptedAI(creature) { }

    enum eBelath {
        DATA_ACTION_START = 64,
        EVENT_RELEASE_SOULS = 1,
        SPELL_ANQUISHED_SOUL = 203789,
        SPELL_EYE_BEAM_01 = 194326,
    };

    void SetData(uint32 id, uint32 /*value*/) override
    {
        switch (id)
        {
        case DATA_ACTION_START:
            me->CastSpell(me, SPELL_EYE_BEAM_01, true);
            _events.ScheduleEvent(EVENT_RELEASE_SOULS, 1000);
            break;
        default:
            break;
        }
    }

    void KillImprisonedImps() {
        std::list<Creature*> imprisonedImps;
        me->GetCreatureListWithEntryInGrid(imprisonedImps, 109252, me->GetVisibilityRange());
        for (std::list<Creature*>::const_iterator itr = imprisonedImps.begin(); itr != imprisonedImps.end(); ++itr)
        {
            (*itr)->ToCreature()->CastSpell(-964.113f, 4066.09f, 648.118f, SPELL_ANQUISHED_SOUL, true);
            (*itr)->ToCreature()->DisappearAndDie();
        }
    }

    void UpdateAI(uint32 diff) override
    {
        _events.Update(diff);

        while (uint32 eventId = _events.ExecuteEvent())
        {
            switch (eventId)
            {
            case EVENT_RELEASE_SOULS:
                KillImprisonedImps();
                break;
            default:
                break;
            }
        }
    }
    private:
        EventMap _events;
};

// 215782 back to black temple
class spell_redoubt_teleport_to_dh_ch : public SpellScript
{
    PrepareSpellScript(spell_redoubt_teleport_to_dh_ch);

    enum eQuest {
        QUEST_RETURN_TO_MARDUM_41221 = 41221,
        QUEST_RETURN_TO_MARDUM_41033 = 41033,
    };

    void HandleOnCast()
    {
        if (Player* player = GetCaster()->ToPlayer()) {
            if (player->GetQuestStatus(QUEST_RETURN_TO_MARDUM_41221) == QUEST_STATUS_INCOMPLETE)
                player->CompleteQuest(QUEST_RETURN_TO_MARDUM_41221);

            if (player->GetQuestStatus(QUEST_RETURN_TO_MARDUM_41033) == QUEST_STATUS_INCOMPLETE)
                player->CompleteQuest(QUEST_RETURN_TO_MARDUM_41033);

            player->GetAchievementMgr()->UpdateCriteria(CRITERIA_TYPE_BE_SPELL_TARGET, 215782, 0, 0, player);
        }
    }

    void Register() override
    {
        OnCast += SpellCastFn(spell_redoubt_teleport_to_dh_ch::HandleOnCast);
    }
};

void AddSC_dalaran_legion()
{
    new OnLegionArrival();
    new On110Arrival();

    RegisterSpellScript(spell_dalaran_teleportation);
    new npc_dalaran_karazhan_khadgar();
    new scene_dalaran_kharazan_teleportion();
    new zone_legion_dalaran_underbelly();
    new npc_hunter_talua();
    new npc_great_eagle();
    new player_artifact_choice();
    new npc_tele_q38970();
    new npc_quest_48954();
    new npc_tele_q42454();
    new npc_quest_49032();
    new npc_tele_q47223();
    new npc_tele_q48507();
    new npc_archmage_khadgar_86563();
    new npc_archmage_khadgar_90417();
    new npc_jace_darkweaver_99262();
    new npc_khadgar_upgraded_servant();
    new npc_tele_q38564();
    RegisterCreatureAI(npc_guard_dalaran_legion);
    new go_a_mysterious_note();
    RegisterCreatureAI(npc_credit_portal_taken_110409);
    new zone_legion_dalaran();
    new PhaseOnDaralanArea();
    RegisterCreatureAI(npc_emissary_auldbridge_111109);
    new npc_warden_alturas();
    new go_legion_communicator();
    new npc_allari_souleater_104909();
    new go_violethold_entrance_portal();
    new npc_illidari_felbat_94324();
    new npc_jace_darkweaver_109196();
    new q_securing_the_way();
    RegisterSpellScript(spell_redoubt_sentence_to_death);
    RegisterCreatureAI(npc_redoubt_asha);
    RegisterCreatureAI(npc_redoubt_belath);
    RegisterSpellScript(spell_redoubt_teleport_to_dh_ch);
    RegisterCreatureAI(npc_Gryphon_108973);
}
