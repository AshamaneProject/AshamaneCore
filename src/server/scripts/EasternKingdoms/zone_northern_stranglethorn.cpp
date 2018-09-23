/*
* Copyright (C) 2017-2018 AshamaneProject <https://github.com/AshamaneProject>
* Copyright (C) 2011-2013 Project Trinity <http://www.projectTrinity.org/>
* Copyright (C) 2008-2013 Trinity <http://www.trinitycore.org/>
* Copyright (C) 2005-2013 MaNGOS <http://www.getmangos.com/>
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
*/

#include "ScriptMgr.h"
#include "Player.h"
#include "ScriptedCreature.h"
#include "SpellInfo.h"
#include "ScriptMgr.h"
#include "ScriptedEscortAI.h"
#include "ScriptedGossip.h"

enum AltarNaias
{
    NPC_NAIAS = 17207
};

class spell_summon_naias : public SpellScript
{
    PrepareSpellScript(spell_summon_naias);

    void HandleSendEvent(SpellEffIndex /*effIndex*/)
    {
        if (!GetCaster()->IsPlayer())
            return;
        GetCaster()->SummonCreature(NPC_NAIAS, -12130.5000, 958.9940, 4.87148, 5.02655);
    }

    void Register() override
    {
        OnEffectHit += SpellEffectFn(spell_summon_naias::HandleSendEvent, EFFECT_0, SPELL_EFFECT_SEND_EVENT);
    }
};


class npc_osborn_obnoticus : public CreatureScript
{
public:
    npc_osborn_obnoticus() : CreatureScript("npc_osborn_obnoticus") { }

    enum Data
    {
        QUEST_A_PHYSICAL_SPECIMEN  = 26747,
        NPC_BLOODLORD_MANDOKIR     = 42790
    };

    bool OnQuestReward(Player* player, Creature* creature, Quest const* quest, uint32 opt) override
    {
        switch (quest->GetQuestId())
        {
        case QUEST_A_PHYSICAL_SPECIMEN:
            player->SummonCreature(NPC_BLOODLORD_MANDOKIR, -11306.80f, -194.917f, 75.3878f, 2.92012f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 90000, true);
            break;
        }

        return true;
    }

    struct npc_osborn_obnoticusAI : public ScriptedAI
    {
        npc_osborn_obnoticusAI(Creature* creature) : ScriptedAI(creature) { }

    private:
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_osborn_obnoticusAI(creature);
    }
};

class npc_bloodlord_mandokir : public CreatureScript
{
public:
    npc_bloodlord_mandokir() : CreatureScript("npc_bloodlord_mandokir") { }

    enum Data
    {
        QUEST_BLOODLORD_MANDOKIR = 26748
    };

    bool OnQuestReward(Player* player, Creature* creature, Quest const* quest, uint32 opt) override
    {
        switch (quest->GetQuestId())
        {
        case QUEST_BLOODLORD_MANDOKIR:
            creature->DespawnOrUnsummon();
            break;
        }

        return true;
    }

    struct npc_bloodlord_mandokirAI : public ScriptedAI
    {
        npc_bloodlord_mandokirAI(Creature* creature) : ScriptedAI(creature) { }

    private:
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_bloodlord_mandokirAI(creature);
    }
};

void AddSC_northern_stranglethorn()
{
    RegisterSpellScript(spell_summon_naias);
    new npc_osborn_obnoticus();
    new npc_bloodlord_mandokir();
}
