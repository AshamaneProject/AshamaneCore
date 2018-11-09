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

#include "GameObjectAI.h"
#include "Player.h"
#include "ScriptedCreature.h"
#include "ScriptedFollowerAI.h"
#include "ScriptMgr.h"
#include "TemporarySummon.h"

enum eTiragardeQuests
{
    QUEST_DAUGHTER_OF_THE_SEA   = 51341,
    QUEST_OUT_LIKE_FLYNN        = 47098,

    KILL_CREDIT_GET_DRESSED     = 138554,
};

enum Intro
{
    SPELL_PROUDMOORE_KEEP_ESCORT    = 269772,
    SPELL_LADY_KATHERINE_MOVIE      = 241525,

    SPELL_TELEPORT_TO_TOL_DAGOR     = 241526,
    SPELL_PRISONER                  = 272512,
    SPELL_TOL_DAGOR_WAKE_UP         = 270081,

    SPELL_SUMMON_FLYNN_ESCAPE       = 246931,

    SPELL_SCENE_FLYNN_JAILBREAK     = 246821,

    NPC_FLYNN_BEGIN                 = 121239,
    NPC_FLYNN_ESCAPE                = 124311,

    MOVIE_LADY_KATHERINE            = 859,
};

// 120922 - Lady Jaina Proudmoore
struct npc_jaina_boralus_intro : public ScriptedAI
{
    npc_jaina_boralus_intro(Creature* creature) : ScriptedAI(creature) { }

    void sQuestAccept(Player* player, Quest const* quest)
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

    void OnSceneComplete(Player* player, uint32 /*sceneInstanceID*/, SceneTemplate const* /*sceneTemplate*/) override
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

// 47098
struct quest_out_like_flynn : public QuestScript
{
    quest_out_like_flynn() : QuestScript("quest_out_like_flynn") { }

    // Called when a quest objective data change
    void OnQuestObjectiveChange(Player* player, Quest const* /*quest*/, QuestObjective const& objective, int32 /*oldAmount*/, int32 /*newAmount*/) override
    {
        if (objective.ObjectID == KILL_CREDIT_GET_DRESSED)
            player->RemoveAurasDueToSpell(SPELL_PRISONER);
    }
};

// 121239 - Flynn Fairwind
struct npc_flynn_fairwind : public FollowerAI
{
    npc_flynn_fairwind(Creature* creature) : FollowerAI(creature) { }

    void sQuestAccept(Player* player, Quest const* quest) override
    {
        if (quest->ID == QUEST_OUT_LIKE_FLYNN)
        {
            if (Creature* flynn = me->SummonCreature(me->GetEntry(), me->GetPosition()))
            {
                flynn->AI()->DoAction(0);
                me->DestroyForPlayer(player);
            }
        }
    }

    void DoAction(int32 const action) override
    {
        me->GetMotionMaster()->MoveJump(142.033f, -2715.19f, 29.1884f, 0.0f, 19.2911f, 19.2911f);

        me->GetScheduler().Schedule(1s, [this](TaskContext context)
        {
            me->GetMotionMaster()->MovePoint(2, 143.0686f, -2713.593f, 29.4388f);
        });
    }
};

// 124311 - Flynn Fairwind (Quest follower)
struct npc_flynn_fairwind_follower : public FollowerAI
{
    npc_flynn_fairwind_follower(Creature* creature) : FollowerAI(creature) { }

    void IsSummonedBy(Unit* summoner) override
    {
        if (Player* player = summoner->ToPlayer())
            StartFollow(player);
    }

    void UpdateFollowerAI(uint32) override
    {

    }
};

// 271938 - Cell Block Lever
struct go_toldagor_cell_block_lever : public GameObjectAI
{
    go_toldagor_cell_block_lever(GameObject* go) : GameObjectAI(go) { }

    bool GossipHello(Player* player, bool /*isUse*/) override
    {
        player->CastSpell(player, SPELL_SCENE_FLYNN_JAILBREAK, true);
        return false;
    }
};

void AddSC_zone_tiragarde_sound()
{
    RegisterCreatureAI(npc_jaina_boralus_intro);
    RegisterSceneScript(scene_jaina_to_proudmoore_keep);
    RegisterQuestScript(quest_out_like_flynn);
    RegisterCreatureAI(npc_flynn_fairwind);
    RegisterCreatureAI(npc_flynn_fairwind_follower);
    RegisterGameObjectAI(go_toldagor_cell_block_lever);
}
