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
#include "ScriptMgr.h"

enum eTiragardeQuests
{
    QUEST_DAUGHTER_OF_THE_SEA   = 51341,
    QUEST_OUT_LIKE_FLYNN        = 47098,
};

enum Intro
{
    SPELL_PROUDMOORE_KEEP_ESCORT    = 269772,
    SPELL_LADY_KATHERINE_MOVIE      = 241525,

    SPELL_TELEPORT_TO_TOL_DAGOR     = 241526,
    SPELL_PRISONER                  = 272512,
    SPELL_TOL_DAGOR_WAKE_UP         = 270081,

    SPELL_SCENE_FLYNN_JAILBREAK     = 246821,

    MOVIE_LADY_KATHERINE            = 859
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

// 121239 - Flynn Fairwind
struct npc_flynn_fairwind : public ScriptedAI
{
    npc_flynn_fairwind(Creature* creature) : ScriptedAI(creature) { }

    void sQuestAccept(Player* /*player*/, Quest const* quest)
    {
        if (quest->ID == QUEST_OUT_LIKE_FLYNN)
            ;
    }
};

// 271938 - Cell Block Lever
struct go_toldagor_cell_block_lever : public GameObjectAI
{
    go_toldagor_cell_block_lever(GameObject* go) : GameObjectAI(go) { }

    bool GossipHello(Player* player, bool /*isUse*/)
    {
        player->CastSpell(player, SPELL_SCENE_FLYNN_JAILBREAK, true);
        return false;
    }
};

void AddSC_zone_tiragarde_sound()
{
    RegisterCreatureAI(npc_jaina_boralus_intro);
    RegisterSceneScript(scene_jaina_to_proudmoore_keep);
    RegisterCreatureAI(npc_flynn_fairwind);
    RegisterGameObjectAI(go_toldagor_cell_block_lever);
}
