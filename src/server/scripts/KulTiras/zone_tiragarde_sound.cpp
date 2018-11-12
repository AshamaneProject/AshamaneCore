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
#include "GameObjectAI.h"
#include "Player.h"
#include "ScriptedCreature.h"
#include "ScriptedFollowerAI.h"
#include "ScriptMgr.h"
#include "TemporarySummon.h"
#include "Vehicle.h"

enum eTiragardeQuests
{
    QUEST_DAUGHTER_OF_THE_SEA   = 51341,
    QUEST_OUT_LIKE_FLYNN        = 47098,

    KILL_CREDIT_GET_DRESSED     = 138554,
    KILL_CREDIT_PULL_LEVER      = 138553,
    KILL_CREDIT_CELL_BLOCK_DOOR = 137923,
};

enum Intro
{
    SPELL_PROUDMOORE_KEEP_ESCORT    = 269772,
    SPELL_LADY_KATHERINE_MOVIE      = 241525,

    SPELL_TELEPORT_TO_TOL_DAGOR     = 241526,
    SPELL_PRISONER                  = 272512,
    SPELL_TOL_DAGOR_WAKE_UP         = 270081,

    SPELL_PUNCH_FLYNN               = 264918,
    SPELL_FLYNN_KNOCKOUT_JAILER     = 246555,
    SPELL_SUMMON_FLYNN_ESCORT       = 246931,

    SPELL_SCENE_FLYNN_JAILBREAK     = 246821,
    SPELL_SCENE_GETAWAY_BOAT_TRIGGER= 281331,
    
    SPELL_GETAWAY_CONVERSATION_1    = 247230,
    SPELL_GETAWAY_CONVERSATION_2    = 247275,

    NPC_FLYNN_BEGIN                 = 121239,
    NPC_FLYNN_ESCORT                = 124311,
    NPC_FLYNN_ESCAPE                = 124363,
    NPC_ASHVANE_JAILER_EVENT        = 124022,
    NPC_TAELIA                      = 124356,

    GOB_PRISON_BARS                 = 281878,
    GOB_PRISON_GATE                 = 301088,
    GOB_CELL_BLOCK_GATE             = 281902,

    MOVIE_LADY_KATHERINE            = 859,
};

// 120922 - Lady Jaina Proudmoore
struct npc_jaina_boralus_intro : public ScriptedAI
{
    npc_jaina_boralus_intro(Creature* creature) : ScriptedAI(creature) { }

    void sQuestAccept(Player* player, Quest const* quest) override
    {
        if (quest->ID == QUEST_DAUGHTER_OF_THE_SEA)
            player->CastSpell(player, SPELL_PROUDMOORE_KEEP_ESCORT, true);
    }
};

// 1954
class scene_jaina_to_proudmoore_keep : public SceneScript
{
public:
    scene_jaina_to_proudmoore_keep() : SceneScript("scene_jaina_to_proudmoore_keep") { }

    void OnSceneEnd(Player* player, uint32 /*sceneInstanceID*/, SceneTemplate const* /*sceneTemplate*/) override
    {
        player->AddMovieDelayedAction(MOVIE_LADY_KATHERINE, [player]()
        {
            player->CastSpell(player, SPELL_TELEPORT_TO_TOL_DAGOR, true);
            player->CastSpell(player, SPELL_PRISONER, true);
            player->CastSpell(player, SPELL_TOL_DAGOR_WAKE_UP, true);
        });

        player->CastSpell(player, SPELL_LADY_KATHERINE_MOVIE, true);
    }
};

// Prisoner - 272512
class aura_tol_dagor_intro_prisoner : public AuraScript
{
    PrepareAuraScript(aura_tol_dagor_intro_prisoner);

    void HandleApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
    {
        GetTarget()->RemoveGameObjectByEntry(GOB_PRISON_BARS);
        GetTarget()->RemoveGameObjectByEntry(GOB_PRISON_GATE);

        GetTarget()->SummonGameObject(GOB_PRISON_BARS, 145.772995f, -2707.709961f, 28.818899f, 0.942667f, QuaternionData(0.f, 0.f,  0.454075f, 0.890964f), 0, true);
        GetTarget()->SummonGameObject(GOB_PRISON_GATE, 146.242996f, -2699.399902f, 28.877800f, 5.663670f, QuaternionData(0.f, 0.f, -0.304828f, 0.952407f), 0, true);
    }

    void HandleRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
    {
        GetTarget()->RemoveGameObjectByEntry(GOB_PRISON_BARS);
        GetTarget()->RemoveGameObjectByEntry(GOB_PRISON_GATE);
    }

    void Register() override
    {
        OnEffectApply += AuraEffectApplyFn(aura_tol_dagor_intro_prisoner::HandleApply, EFFECT_0, SPELL_AURA_MOD_DAMAGE_PERCENT_DONE, AURA_EFFECT_HANDLE_REAL_OR_REAPPLY_MASK);
        OnEffectRemove += AuraEffectRemoveFn(aura_tol_dagor_intro_prisoner::HandleRemove, EFFECT_0, SPELL_AURA_MOD_DAMAGE_PERCENT_DONE, AURA_EFFECT_HANDLE_REAL);
    }
};

// 47098
struct quest_out_like_flynn : public QuestScript
{
    quest_out_like_flynn() : QuestScript("quest_out_like_flynn") { }

    // Called when a quest objective data change
    void OnQuestObjectiveChange(Player* player, Quest const* /*quest*/, QuestObjective const& objective, int32 /*oldAmount*/, int32 /*newAmount*/) override
    {
        if (objective.ObjectID == KILL_CREDIT_GET_DRESSED)
            player->RemoveAurasDueToSpell(SPELL_PRISONER);
        else if (objective.ObjectID == KILL_CREDIT_PULL_LEVER)
        {
            player->RemoveGameObjectByEntry(GOB_PRISON_BARS);
            player->RemoveGameObjectByEntry(GOB_PRISON_GATE);
        }
    }
};

// 121239 - Flynn Fairwind
struct npc_flynn_fairwind : public ScriptedAI
{
    npc_flynn_fairwind(Creature* creature) : ScriptedAI(creature) { }

    void sQuestAccept(Player* player, Quest const* quest) override
    {
        if (quest->ID == QUEST_OUT_LIKE_FLYNN)
        {
            if (Creature* flynn = player->SummonCreature(me->GetEntry(), me->GetPosition(), TEMPSUMMON_CORPSE_DESPAWN, 0, 0, true))
            {
                flynn->AI()->SetGUID(player->GetGUID());
                me->DestroyForPlayer(player);
            }
        }
    }

    void SetGUID(ObjectGuid guid, int32 /*action*/) override
    {
        m_playerGUID = guid;
        me->RemoveFlag64(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_QUESTGIVER);

        if (Creature* ashvaneJailer = me->SummonCreature(NPC_ASHVANE_JAILER_EVENT, 144.839996f, -2702.790039f, 28.961100f, 0.799371f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 2000, true))
            m_ashvaneJailerGUID = ashvaneJailer->GetGUID();

        me->GetScheduler().Schedule(1s, [this](TaskContext /*context*/)
        {
            me->GetMotionMaster()->MoveJump(142.033f, -2715.19f, 29.1884f, 0.0f, 19.2911f, 19.2911f);
        })
        .Schedule(2s, [this](TaskContext /*context*/)
        {
            me->GetMotionMaster()->MovePoint(2, 145.070679f, -2710.949463f, 29.187674f);
        })
        .Schedule(3s, [this](TaskContext /*context*/)
        {
            me->SetFacingToObject(GetPlayer());
            me->SetFlag64(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
        });
    }

    void SpellHit(Unit* caster, SpellInfo const* spell) override
    {
        if (spell->Id != SPELL_PUNCH_FLYNN)
            return;

        me->RemoveFlag64(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
        me->HandleEmoteCommand(EMOTE_ONESHOT_BEG);
        // Talk "Oh you brute"

        caster->ToPlayer()->KilledMonsterCredit(me->GetEntry());

        if (Creature* ashvaneJailer = GetAshvaneJailer())
        {
            me->GetScheduler().Schedule(2s, [this](TaskContext /*context*/)
            {
                // Talk "GUARD"
                me->SetByteValue(UNIT_FIELD_BYTES_1, UNIT_BYTES_1_OFFSET_STAND_STATE, UNIT_STAND_STATE_DEAD);
            });

            ashvaneJailer->GetScheduler().Schedule(3s, [](TaskContext context)
            {
                GetContextUnit()->GetMotionMaster()->MovePoint(1, 147.070480f, -2705.972412f, 29.189432f);
            })
            .Schedule(4s, [](TaskContext context)
            {
                GetContextUnit()->SetFacingTo(4.111071f);
            })
            .Schedule(5s, [](TaskContext context)
            {
                // Talk What's going on
                GetContextUnit()->HandleEmoteCommand(EMOTE_ONESHOT_EXCLAMATION);
            })
            .Schedule(6s, [](TaskContext context)
            {
                GetContextUnit()->HandleEmoteCommand(EMOTE_ONESHOT_USE_STANDING);
            })
            .Schedule(7s, [caster](TaskContext /*context*/)
            {
                if (GameObject* gob = caster->GetGameObjectByEntry(GOB_PRISON_BARS))
                    gob->UseDoorOrButton();
            })
            .Schedule(8s, [](TaskContext context)
            {
                GetContextUnit()->GetMotionMaster()->MovePoint(2, 143.408783f, -2710.396240f, 29.187752f);
                // Set hostile
            });

            me->GetScheduler().Schedule(9s, [this](TaskContext /*context*/)
            {
                me->SetByteValue(UNIT_FIELD_BYTES_1, UNIT_BYTES_1_OFFSET_STAND_STATE, UNIT_STAND_STATE_STAND);
            })
            .Schedule(10s, [this](TaskContext /*context*/)
            {
                me->CastSpell(nullptr, SPELL_FLYNN_KNOCKOUT_JAILER, false);
            })
            .Schedule(11s, [this](TaskContext /*context*/)
            {
                me->GetMotionMaster()->MovePoint(3, 165.596573f, -2707.874756f, 28.877989f);
            })
            .Schedule(14s, [this](TaskContext /*context*/)
            {
                me->SetFacingTo(2.540090f);
            });
        }
    }

private:
    Player* GetPlayer() { return ObjectAccessor::GetPlayer(*me, m_playerGUID); }
    Creature* GetAshvaneJailer() { return ObjectAccessor::GetCreature(*me, m_ashvaneJailerGUID); }

    ObjectGuid m_playerGUID;
    ObjectGuid m_ashvaneJailerGUID;
};

// 271938 - Cell Block Lever
struct go_toldagor_cell_block_lever : public GameObjectAI
{
    go_toldagor_cell_block_lever(GameObject* go) : GameObjectAI(go) { }

    bool GossipHello(Player* player, bool /*isUse*/) override
    {
        player->CastSpell(player, SPELL_SCENE_FLYNN_JAILBREAK, true);
        player->UnsummonCreatureByEntry(NPC_FLYNN_BEGIN);
        return false;
    }
};

// 1735
class scene_flynn_jailbreak : public SceneScript
{
public:
    scene_flynn_jailbreak() : SceneScript("scene_flynn_jailbreak") { }

    void OnSceneEnd(Player* player, uint32 /*sceneInstanceID*/, SceneTemplate const* /*sceneTemplate*/) override
    {
        player->CastSpell(player, SPELL_SUMMON_FLYNN_ESCORT, true);
    }
};

// 124311 - Flynn Fairwind (Quest follower)
struct npc_flynn_fairwind_follower : public FollowerAI
{
    npc_flynn_fairwind_follower(Creature* creature) : FollowerAI(creature) { }

    void Reset() override
    {
        me->GetScheduler().Schedule(1s, [this](TaskContext context)
        {
            if (me->FindNearestGameObject(GOB_CELL_BLOCK_GATE, 10.f))
            {
                SetFollowPaused(true);
                GetContextUnit()->GetMotionMaster()->MovePoint(1, 184.875366f, -2684.565918f, 29.504234f);
            }
            else
                context.Repeat();
        });
    }

    void MovementInform(uint32 type, uint32 pointId) override
    {
        if (type != POINT_MOTION_TYPE || pointId != 1)
            return;

        me->SetFacingTo(5.698150f);

        me->GetScheduler().Schedule(1s, [this](TaskContext /*context*/)
        {
            me->HandleEmoteCommand(EMOTE_ONESHOT_USE_STANDING);
        })
        .Schedule(2s, [this](TaskContext /*context*/)
        {
            if (GameObject* door = me->FindNearestGameObject(GOB_CELL_BLOCK_GATE, 10.f))
            {
                door->UseDoorOrButton();
                door->DestroyForPlayer(GetLeaderForFollower());
            }
        })
        .Schedule(4s, [this](TaskContext /*context*/)
        {
            SetFollowPaused(false);

            if (GameObject* door = me->FindNearestGameObject(GOB_CELL_BLOCK_GATE, 10.f))
                door->UseDoorOrButton();

            if (Player* player = GetLeaderForFollower())
                player->KilledMonsterCredit(KILL_CREDIT_CELL_BLOCK_DOOR);
        });
    }

    void UpdateFollowerAI(uint32) override
    {
        if (HasFollowState(STATE_FOLLOW_NONE))
            if (Unit* summoner = me->ToTempSummon()->GetSummoner())
                if (Player* player = summoner->ToPlayer())
                    StartFollow(player);

        if (!UpdateVictim())
            return;

        DoMeleeAttackIfReady();
    }
};

// 134922 - Kill Credit Enter Sewers
struct npc_tol_dagor_enter_sewer_credit : public ScriptedAI
{
    npc_tol_dagor_enter_sewer_credit(Creature* creature) : ScriptedAI(creature) { }

    void MoveInLineOfSight(Unit* unit) override
    {
        if (Player* player = unit->ToPlayer())
            if (player->GetDistance(me) < 5.0f)
                player->KilledMonsterCredit(me->GetEntry());
    }
};

// 124357 - Getaway Boat 
struct npc_tol_dagor_getaway_boat : public ScriptedAI
{
    npc_tol_dagor_getaway_boat(Creature* creature) : ScriptedAI(creature) { }

    Position boatPath[6] = {
        { 240.6500f, -2812.950f, -0.052747f },
        { 245.9427f, -2807.717f,  0.052747f },
        { 272.6615f, -2792.370f, -0.052747f },
        { 353.6458f, -2743.795f,  0.052747f },
        { 366.6493f, -2540.583f, -0.052747f },
        { 396.1441f, -2403.012f, -0.052747f },
    };

    void IsSummonedBy(Unit* unit) override
    {
        if (Player* player = unit->ToPlayer())
        {
            me->SetReactState(REACT_PASSIVE);
            player->EnterVehicle(me, 1);
            player->CastSpell(player, SPELL_SCENE_GETAWAY_BOAT_TRIGGER, true);

            player->GetScheduler().Schedule(1s, [this, player](TaskContext /*context*/)
            {
                player->PlayConversation(5336);
                me->GetMotionMaster()->MoveSmoothPath(1, boatPath, 6, false, true);
            });
        }
    }

    void MovementInform(uint32 type, uint32 pointId) override
    {
        if (type == EFFECT_MOTION_TYPE && pointId == 2)
        {
            if (Vehicle* meVehicle = me->GetVehicle())
                if (Unit* playerPassenger = meVehicle->GetPassenger(1))
                    playerPassenger->ExitVehicle(&Position(1053.48f, -627.64f, 0.54f, 2.523746f));
        }
    }
};

// 5336
// 5340
struct conversation_tol_dagor_escape : public ConversationScript
{
    conversation_tol_dagor_escape() : ConversationScript("conversation_tol_dagor_escape") { }

    void OnConversationCreate(Conversation* conversation, Unit* creator) override
    {
        if (Vehicle* boat = creator->GetVehicle())
        {
            if (Unit* taelia = boat->GetPassenger(0))
                conversation->AddActor(taelia->GetGUID(), 0, 59469);

            // Flynn only speak during the first conversation
            if (conversation->GetEntry() == 5336)
                if (Unit* flynn = boat->GetPassenger(2))
                    conversation->AddActor(flynn->GetGUID(), 1, 59472);
        }
    }
};

// 1746
class scene_tol_dagor_getaway_boat : public SceneScript
{
public:
    scene_tol_dagor_getaway_boat() : SceneScript("scene_tol_dagor_getaway_boat") { }

    Position boatPath[4] =
    {
        { 880.6389f, -585.5486f, -0.02336364f },
        { 998.2083f, -575.0087f, -0.03875812f },
        { 1025.792f, -619.1180f, -0.03875812f },
        { 1040.462f, -631.7864f, -0.03875812f },
    };

    void OnSceneTriggerEvent(Player* player, uint32 /*sceneInstanceID*/, SceneTemplate const* /*sceneTemplate*/, std::string const& triggerName) override
    {
        if (triggerName == "TeleportToMarket")
            if (Unit* vehicleBase = player->GetVehicleBase())
            {
                vehicleBase->GetMotionMaster()->MovementExpired();
                vehicleBase->NearTeleportTo(867.132f, -602.811f, -0.117634f, 1.536673f);
                vehicleBase->GetMotionMaster()->MoveSmoothPath(2, boatPath, 4, false, true);

                player->CastSpell(player, SPELL_GETAWAY_CONVERSATION_2, true);
            }
    }
};

void AddSC_zone_tiragarde_sound()
{
    RegisterCreatureAI(npc_jaina_boralus_intro);
    RegisterSceneScript(scene_jaina_to_proudmoore_keep);
    RegisterAuraScript(aura_tol_dagor_intro_prisoner);
    RegisterQuestScript(quest_out_like_flynn);
    RegisterCreatureAI(npc_flynn_fairwind);
    RegisterGameObjectAI(go_toldagor_cell_block_lever);
    RegisterSceneScript(scene_flynn_jailbreak);
    RegisterCreatureAI(npc_flynn_fairwind_follower);
    RegisterCreatureAI(npc_tol_dagor_enter_sewer_credit);
    RegisterCreatureAI(npc_tol_dagor_getaway_boat);
    RegisterConversationScript(conversation_tol_dagor_escape);
    RegisterSceneScript(scene_tol_dagor_getaway_boat);
}
