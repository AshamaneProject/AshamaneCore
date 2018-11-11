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

#include "Creature.h"
#include "Player.h"
#include "ScriptedCreature.h"

enum StormwindQuests
{
    QUEST_TIDES_OF_WAR  = 46727
};

// 120756
class npc_anduin_tides_of_war : public ScriptedAI
{
public:
    npc_anduin_tides_of_war(Creature* creature) : ScriptedAI(creature) { }

    void MoveInLineOfSight(Unit* unit) override
    {
        if (Player* player = unit->ToPlayer())
            if (player->GetDistance(me) < 10.0f)
                if (player->HasQuest(QUEST_TIDES_OF_WAR) && !player->GetQuestObjectiveData(QUEST_TIDES_OF_WAR, 0))
                {
                    player->KilledMonsterCredit(me->GetEntry());
                    player->CastSpell(player, 240612, true);
                }
    }
};

// 4857
struct conversation_tides_of_war : public ConversationScript
{
    conversation_tides_of_war() : ConversationScript("conversation_tides_of_war") { }

    void OnConversationRemove(Conversation* conversation, Unit* creator) override
    {
        if (!creator)
            return;

        /*if (Creature* jaina = creator->FindNearestCreature(120590, 20.f))
            jaina->CastSpell()*/
    }
};

void AddSC_stormwind_city()
{
    RegisterCreatureAI(npc_anduin_tides_of_war);
}
