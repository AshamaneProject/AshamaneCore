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

#include "Conversation.h"
#include "Creature.h"
#include "Player.h"
#include "ScriptedCreature.h"

enum StormwindQuests
{
    QUEST_TIDES_OF_WAR                          = 46727,

    SPELL_KILL_CREDIT_REPORT_ANDUIN             = 269581,
    SPELL_CONVERSATION_TIDES_OF_WAR_MAIN        = 240612,
    SPELL_CONVERSATION_TIDES_OF_WAR_POST_MOVIE  = 281343,
    SPELL_STORMWIND_TO_BORALUS_TRANSITION       = 240872,

    NPC_TIDES_OF_WAR_JAINA                      = 120590,
    NPC_VISION_OF_SAILOR_MEMORY                 = 139645,
};

// 120756
class npc_anduin_tides_of_war : public ScriptedAI
{
public:
    npc_anduin_tides_of_war(Creature* creature) : ScriptedAI(creature) { }

    void MoveInLineOfSight(Unit* unit) override
    {
        Player* player = unit->ToPlayer();
        if (!player)
            return;

        if (player->GetDistance(me) > 10.0f)
            return;

        if (!player->HasQuest(QUEST_TIDES_OF_WAR) || player->GetQuestObjectiveData(QUEST_TIDES_OF_WAR, 0))
            return;

        if (Creature* jaina = me->FindNearestCreature(NPC_TIDES_OF_WAR_JAINA, 20.f))
            if (player->SummonCreature(NPC_TIDES_OF_WAR_JAINA, *jaina, TEMPSUMMON_TIMED_DESPAWN, 300000, 0, true))
                jaina->DestroyForPlayer(player);

        player->CastSpell(player, SPELL_KILL_CREDIT_REPORT_ANDUIN, true);
        player->CastSpell(player, SPELL_CONVERSATION_TIDES_OF_WAR_MAIN, true);

        player->GetScheduler().Schedule(47s, [](TaskContext context)
        {
            if (Unit* jaina = GetContextPlayer()->GetSummonedCreatureByEntry(NPC_TIDES_OF_WAR_JAINA))
                jaina->CastSpell(jaina, 54219, true);
        })
        .Schedule(50s, [](TaskContext context)
        {
            GetContextPlayer()->SummonCreature(NPC_VISION_OF_SAILOR_MEMORY, -8373.799805f, 245.410004f, 156.882996f, 0.f, TEMPSUMMON_TIMED_DESPAWN, 300000, true);
        });

        player->RemoveMovieDelayedAction(858);
        player->AddMovieDelayedAction(858, [player]()
        {
            if (Creature* jaina = player->GetSummonedCreatureByEntry(NPC_TIDES_OF_WAR_JAINA))
                jaina->CastStop();

            if (Creature* visionMemory = player->GetSummonedCreatureByEntry(NPC_VISION_OF_SAILOR_MEMORY))
                visionMemory->DespawnOrUnsummon();

            player->CastSpell(player, SPELL_CONVERSATION_TIDES_OF_WAR_POST_MOVIE, true);

            player->GetScheduler().Schedule(42s, [](TaskContext context)
            {
                if (Creature* jaina = GetContextPlayer()->GetSummonedCreatureByEntry(NPC_TIDES_OF_WAR_JAINA))
                {
                    jaina->GetMotionMaster()->MovePoint(1, -8386.692383f, 262.086212f, 155.347122f);
                    jaina->DespawnOrUnsummon(2000);
                }
            })
            .Schedule(45s, [](TaskContext context)
            {
                GetContextPlayer()->PlayConversation(4896);
            });
        });
    }
};

// 4857
// 8709
struct conversation_tides_of_war : public ConversationScript
{
    conversation_tides_of_war() : ConversationScript("conversation_tides_of_war") { }

    void OnConversationCreate(Conversation* conversation, Unit* creator) override
    {
        if (Unit* jaina = creator->GetSummonedCreatureByEntry(NPC_TIDES_OF_WAR_JAINA))
            conversation->AddActor(jaina->GetGUID(), conversation->GetEntry() == 8709 ? 1 : 3);
    }
};

// 120590
class npc_jaina_tides_of_war : public ScriptedAI
{
public:
    npc_jaina_tides_of_war(Creature* creature) : ScriptedAI(creature) { }

    bool GossipSelect(Player* player, uint32 /*menuId*/, uint32 /*gossipListId*/) override
    {
        player->CastSpell(player, SPELL_STORMWIND_TO_BORALUS_TRANSITION, true);
        return false;
    }
};

// 240876
class aura_stormwind_to_harbor_teleport : public AuraScript
{
    PrepareAuraScript(aura_stormwind_to_harbor_teleport);

    void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
    {
        uint32 triggerSpell = GetEffectInfo(EFFECT_1)->BasePoints;
        GetTarget()->GetScheduler().Schedule(1s, GetSpellInfo()->Id, [triggerSpell](TaskContext context)
        {
            if (Player* player = GetContextPlayer())
            {
                if (!player->IsBeingTeleported())
                {
                    player->CastSpell(player, triggerSpell, true);
                    return;
                }
            }

            context.Repeat();
        });
    }

    void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
    {
        GetTarget()->GetScheduler().CancelGroup(GetSpellInfo()->Id);
    }

    void Register() override
    {
        OnEffectApply += AuraEffectApplyFn(aura_stormwind_to_harbor_teleport::OnApply, EFFECT_1, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
        OnEffectRemove += AuraEffectRemoveFn(aura_stormwind_to_harbor_teleport::OnRemove, EFFECT_1, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
    }
};

void AddSC_stormwind_city()
{
    RegisterCreatureAI(npc_anduin_tides_of_war);
    RegisterConversationScript(conversation_tides_of_war);
    RegisterCreatureAI(npc_jaina_tides_of_war);
    RegisterAuraScript(aura_stormwind_to_harbor_teleport);
}
