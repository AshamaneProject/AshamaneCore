/*
* Copyright (C) 2008-2018 TrinityCore <https://www.trinitycore.org/>
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

#include "ScriptMgr.h"
#include "Player.h"
#include "ScriptedCreature.h"
#include "MotionMaster.h"
#include "ObjectAccessor.h"
#include "SpellScript.h"

enum MosshideRep
{
	QUEST_AXISOFAWFUL       = 26868,
	SPELL_MURLOC_PHEROMONE  = 82799,
	NPC_MOSSHIDE_CREDIT     = 44266,
    NPC_MOSSHIDE_REP        = 44262
};


class spell_murloc_pheromone : public SpellScript
{
    PrepareSpellScript(spell_murloc_pheromone);

    void SelectTarget(WorldObject*& target)
    {
        target = GetCaster()->FindNearestCreature(NPC_MOSSHIDE_REP, 25.0f, true);
    }

    SpellCastResult CheckRequirement()
    {
        Creature* moss = GetCaster()->FindNearestCreature(NPC_MOSSHIDE_REP, 25.0f, true);

        if (!moss)
            return SPELL_FAILED_INCORRECT_AREA;
        return SPELL_CAST_OK;
    }

    void HandleDummy(SpellEffIndex /*effIndex*/)
    {
        Unit* hitUnit = GetHitUnit();
        if (!hitUnit || !GetCaster()->IsPlayer())
            return;

        if (Creature* target = hitUnit->ToCreature())
        {
            switch (target->GetEntry())
            {
            case NPC_MOSSHIDE_REP:
                GetCaster()->ToPlayer()->RewardPlayerAndGroupAtEvent(NPC_MOSSHIDE_CREDIT, GetCaster());
                break;
            default:
                break;
            }
        }
    }

    void Register() override
    {
        OnObjectTargetSelect += SpellObjectTargetSelectFn(spell_murloc_pheromone::SelectTarget, EFFECT_0, TARGET_UNIT_NEARBY_ENTRY);
        OnEffectHitTarget += SpellEffectFn(spell_murloc_pheromone::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
        OnCheckCast += SpellCheckCastFn(spell_murloc_pheromone::CheckRequirement);
    }
};

struct npc_mosshide_representative : public ScriptedAI
{
    npc_mosshide_representative(Creature* creature) : ScriptedAI(creature) {}

    void SpellHit(Unit* caster, const SpellInfo* spell) override
    {
        if (spell->Id != SPELL_MURLOC_PHEROMONE)
            return;

        Player* player = caster->ToPlayer();
        if (player && player->GetQuestStatus(QUEST_AXISOFAWFUL) == QUEST_STATUS_INCOMPLETE)
        {
            player->KilledMonsterCredit(NPC_MOSSHIDE_CREDIT, ObjectGuid::Empty);
        }
    }

};


enum eHuldar
{
    QUEST_RESUPPLY_EXCAVATION = 13639,
    NPC_HULDAR                = 2057,
    QUEST_PROTECT_SHIPMENT    = 309,
    ACTION_START_EVENT        = 1,
    NPC_DARK_IRON_AMBUSHER    = 1981,
    NPC_SAEAN                 = 1380,
    SPELL_SHIPMENT_CREDIT     = 62980
};

class npc_huldar : public CreatureScript
{
public:
    npc_huldar() : CreatureScript("npc_huldar") {}

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_huldarAI(creature);
    }

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest) override
    {
        switch (quest->GetQuestId())
        {
        case QUEST_PROTECT_SHIPMENT:
            creature->AI()->SetGUID(player->GetGUID());
            creature->AI()->DoAction(ACTION_START_EVENT);
            break;
        }

        return true;
    }

    struct npc_huldarAI : public ScriptedAI
    {
        ObjectGuid PlayerGUID;
        npc_huldarAI(Creature* creature) : ScriptedAI(creature) {}

        void SetGUID(ObjectGuid guid, int32 /*id*/) override
        {
            PlayerGUID = guid;
        }

        void DoAction(int32 action) override
        {
            switch (action)
            {
            case ACTION_START_EVENT:
                me->SummonCreature(NPC_DARK_IRON_AMBUSHER, -5699.78f, -3565.10f, 308.514f, 1.67945f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 90000, true);
                me->SummonCreature(NPC_DARK_IRON_AMBUSHER, -5694.87f, -3559.27f, 307.216f, 2.15854f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 90000, true);
                me->SummonCreature(NPC_SAEAN, -5697.07f, -3562.87f, 307.883f, 1.93863f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 90000, true);
                if (Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID))
                {
                    player->CastSpell(player, SPELL_SHIPMENT_CREDIT, true);
                }
                break;
            }
        }

        void MoveInLineOfSight(Unit* who) override
        {
            ScriptedAI::MoveInLineOfSight(who);

            if (who->GetTypeId() != TYPEID_PLAYER)
                return;

            if (who->ToPlayer()->GetQuestStatus(QUEST_RESUPPLY_EXCAVATION) == QUEST_STATUS_INCOMPLETE)
            {
                who->ToPlayer()->KilledMonsterCredit(NPC_HULDAR, ObjectGuid::Empty);
            }
        }
    };
};

enum DwarvenArtifacts
{
    NPC_IRONBAND_TABLET      = 33487,
    NPC_IRONBAND_SANDAL      = 33485,
    NPC_IRONBAND_LIBERTY     = 33486,
    QUEST_HAND_OFF_THE_GOODS = 13650
};

class npc_ironband_tablet : public CreatureScript
{
public:
    npc_ironband_tablet() : CreatureScript("npc_ironband_tablet") {}

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_ironband_tabletAI(creature);
    }

    struct npc_ironband_tabletAI : public ScriptedAI
    {
        npc_ironband_tabletAI(Creature* creature) : ScriptedAI(creature) {}

        void MoveInLineOfSight(Unit* who) override
        {
            ScriptedAI::MoveInLineOfSight(who);

            if (who->GetTypeId() != TYPEID_PLAYER)
                return;

            if (who->ToPlayer()->GetQuestStatus(QUEST_HAND_OFF_THE_GOODS) == QUEST_STATUS_INCOMPLETE)
            {
                who->ToPlayer()->KilledMonsterCredit(NPC_IRONBAND_TABLET, ObjectGuid::Empty);
            }
        }
    };
};

class npc_ironband_sandal : public CreatureScript
{
public:
    npc_ironband_sandal() : CreatureScript("npc_ironband_sandal") {}

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_ironband_sandalAI(creature);
    }

    struct npc_ironband_sandalAI : public ScriptedAI
    {
        npc_ironband_sandalAI(Creature* creature) : ScriptedAI(creature) {}

        void MoveInLineOfSight(Unit* who) override
        {
            ScriptedAI::MoveInLineOfSight(who);

            if (who->GetTypeId() != TYPEID_PLAYER)
                return;

            if (who->ToPlayer()->GetQuestStatus(QUEST_HAND_OFF_THE_GOODS) == QUEST_STATUS_INCOMPLETE)
            {
                who->ToPlayer()->KilledMonsterCredit(NPC_IRONBAND_SANDAL, ObjectGuid::Empty);
            }
        }
    };
};

class npc_ironband_liberty : public CreatureScript
{
public:
    npc_ironband_liberty() : CreatureScript("npc_ironband_liberty") {}

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_ironband_libertyAI(creature);
    }

    struct npc_ironband_libertyAI : public ScriptedAI
    {
        npc_ironband_libertyAI(Creature* creature) : ScriptedAI(creature) {}

        void MoveInLineOfSight(Unit* who) override
        {
            ScriptedAI::MoveInLineOfSight(who);

            if (who->GetTypeId() != TYPEID_PLAYER)
                return;

            if (who->ToPlayer()->GetQuestStatus(QUEST_HAND_OFF_THE_GOODS) == QUEST_STATUS_INCOMPLETE)
            {
                who->ToPlayer()->KilledMonsterCredit(NPC_IRONBAND_LIBERTY, ObjectGuid::Empty);
            }
        }
    };
};

enum AndoBlastenheimer
{
    QUEST_WINDS_LOCH_MODAN  = 27116,
    SPELL_SUMMON_SKYSTRIDER = 83980,
    NPC_SKYSTRIDER          = 44572,
    SPELL_SKYSTRIDER_FLAMES = 83984,
    SPELL_RIDE_VEHICLE      = 46598
};

Position const striderWaypoints[] =
{
    { -5027.062f, -3609.341f, 298.3368f },
    { -5022.421f, -3608.176f, 298.2664f },
    { -5017.780f, -3607.010f, 298.196f },
    { -5012.820f, -3612.410f, 298.175f },
    { -5003.470f, -3618.950f, 298.419f },
    { -5005.520f, -3633.210f, 301.351f },
    { -5005.900f, -3651.180f, 304.547f }, // last ground position
    { -4977.370f, -3649.060f, 305.986f },
    { -4875.530f, -3641.770f, 312.875f },
    { -4804.860f, -3594.520f, 309.681f },
    { -4786.060f, -3543.530f, 311.514f },
    { -4765.980f, -3421.280f, 317.070f },
    { -4710.740f, -3246.950f, 325.014f },
    { -4565.150f, -3138.970f, 312.098f },
    { -4510.380f, -3213.140f, 307.681f },
    { -4561.530f, -3298.220f, 297.820f },
    { -4795.280f, -3304.000f, 305.320f },
    { -4785.830f, -3106.710f, 323.709f },
    { -4725.100f, -2932.050f, 340.654f },
    { -4755.760f, -2804.530f, 336.070f },
    { -4807.600f, -2701.550f, 332.376f },
    { -4815.010f, -2707.960f, 334.449f }
};

class npc_ando_blastenheimer : public CreatureScript
{
public:
    npc_ando_blastenheimer() : CreatureScript("npc_ando_blastenheimer") {}

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_ando_blastenheimerAI(creature);
    }

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest) override
    {
        switch (quest->GetQuestId())
        {
        case QUEST_WINDS_LOCH_MODAN:
            creature->AI()->SetGUID(player->GetGUID());
            creature->AI()->DoAction(ACTION_START_EVENT);
            break;
        }

        return true;
    }

    struct npc_ando_blastenheimerAI : public ScriptedAI
    {
        ObjectGuid PlayerGUID;
        ObjectGuid StriderGUID;

        npc_ando_blastenheimerAI(Creature* creature) : ScriptedAI(creature) {}

        void SetGUID(ObjectGuid guid, int32 /*id*/) override
        {
            PlayerGUID = guid;
        }

        void DoAction(int32 action) override
        {
            switch (action)
            {
            case ACTION_START_EVENT:
                if (Player* player = ObjectAccessor::GetPlayer(*me, PlayerGUID))
                {
                    player->CastSpell(player, SPELL_SUMMON_SKYSTRIDER, true);
                    if (Unit* skystrider = me->FindNearestCreature(NPC_SKYSTRIDER, 10.0f, true))
                    {
                        StriderGUID = skystrider->GetGUID();
                        player->CastSpell(skystrider, SPELL_RIDE_VEHICLE, true);
                        skystrider->GetMotionMaster()->MoveSmoothPath(0, striderWaypoints, 22, false, true);
                    }
                }
                break;
            }
        }
    };
};

void AddSC_loch_modan()
{
    RegisterSpellScript(spell_murloc_pheromone);
    RegisterCreatureAI(npc_mosshide_representative);
    new npc_huldar();
    new npc_ironband_tablet();
    new npc_ironband_sandal();
    new npc_ironband_liberty();
    new npc_ando_blastenheimer();
}
