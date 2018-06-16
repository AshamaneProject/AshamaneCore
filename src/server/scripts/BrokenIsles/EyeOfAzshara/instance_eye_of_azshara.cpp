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

#include "GameObject.h"
#include "Player.h"
#include "ScriptMgr.h"
#include "InstanceScript.h"
#include "eye_of_azshara.h"

struct instance_eye_of_azshara : public InstanceScript
{
    instance_eye_of_azshara(InstanceMap* map) : InstanceScript(map), _deadArcanistCount(0), _deadBossCount(0), _deadNagasCount(0)
    {
        SetHeaders(DataHeader);
        SetBossNumber(EncounterCount);
    }

    void OnCreatureCreate(Creature* creature) override
    {
        InstanceScript::OnCreatureCreate(creature);

        switch (creature->GetEntry())
        {
            case NPC_HATECOIL_ARCANIST:
            {
                if (creature->isDead())
                    incrementDeadArcanistCount();
                break;
            }
            case NPC_LADY_HATECOIL:
            {
                _ladyHatecoilGUID = creature->GetGUID();
                if (_deadArcanistCount >= 2) // If 2 arcanists are dead, remove Lady Hatecoil's shield
                    creature->AI()->DoAction(1);
                if (creature->isDead() && ++_deadBossCount >= 4)
                    releaseWrath();
                break;
            }
            case NPC_SERPENTRIX:
            {
                if (creature->isDead() && ++_deadBossCount >= 4)
                    releaseWrath();
                break;
            }
            case NPC_WARLORD_PARJESH:
            {
                if (creature->isDead() && ++_deadBossCount >= 4)
                    releaseWrath();
                break;
            }
            case NPC_KING_DEEPBEARD:
            {
                if (creature->isDead() && ++_deadBossCount >= 4)
                    releaseWrath();
                break;
            }
            case NPC_WRATH_OF_AZSHARA:
            {
                _wrathGUID = creature->GetGUID();
                if (_deadBossCount >= 4)
                    releaseWrath();
                if (_deadNagasCount >= 4)
                    removeNonAttackableFromWrath();
                break;
            }
            case NPC_RITUALIST_LESHA:
            case NPC_CHANNELER_VARISZ:
            case NPC_BINDER_ASHIOI:
            case NPC_MYSTIC_SSAVEH:
            {
                _nagasGUIDs.push_back(creature->GetGUID());
                if (creature->isDead())
                    ++_deadNagasCount;
                if (_deadNagasCount >= 4)
                    removeNonAttackableFromWrath();
                break;
            }
            case NPC_SAND_DUNE:
            {
                _sandDuneGUIDs.push_back(creature->GetGUID());
                break;
            }
        }
    }

    void OnGameObjectCreate(GameObject* go) override
    {
        InstanceScript::OnGameObjectCreate(go);

        switch (go->GetEntry())
        {
            case GO_BUBBLE:
            {
                _bubbleGUID = go->GetGUID();
                if (_deadBossCount >= 4)
                    releaseWrath();
                break;
            }
        }
    }

    void SetData(uint32 type, uint32 /*data*/) override
    {
        if (type == DATA_ARCANIST_DIED) // A Hatecoil Arcanist died
            incrementDeadArcanistCount();
        else if (type == DATA_RESPAWN_DUNES) // Called by Lady Hatecoil when she resets
        {
            for (auto guid : _sandDuneGUIDs) {
                if (Creature* sandDune = instance->GetCreature(guid))
                    sandDune->Respawn();
            }
        }
        else if (type == DATA_REMOVE_BUBBLE && ++_deadBossCount >= 4)
            releaseWrath();
        else if (type == DATA_NAGA_DIED && ++_deadNagasCount >= 4)
            removeNonAttackableFromWrath();
    }

private:
    uint8 _deadArcanistCount;
    uint8 _deadBossCount;
    uint8 _deadNagasCount; // Only for the 4 nagas around Wrath of Azshara

    ObjectGuid _ladyHatecoilGUID;
    ObjectGuid _wrathGUID;
    ObjectGuid _bubbleGUID;

    GuidVector _sandDuneGUIDs;
    GuidVector _nagasGUIDs; // The 4 nagas around Wrath of Azshara

    void incrementDeadArcanistCount()
    {
        if (++_deadArcanistCount >= 2 && !_ladyHatecoilGUID.IsEmpty()) // If 2 arcanists are dead, remove Lady Hatecoil's shield
        {
            if (Creature* ladyHatecoil = instance->GetCreature(_ladyHatecoilGUID))
                ladyHatecoil->AI()->DoAction(1);
        }
    }

    // Remove the bubble and the non-attackable flags from the 4 nagas
    void releaseWrath()
    {
        if (!_bubbleGUID.IsEmpty())
        {
            if (GameObject* bubble = instance->GetGameObject(_bubbleGUID))
            {
                bubble->SetRespawnTime(0);
                bubble->Delete();
            }

            bool allDead = true;
            for (auto guid : _nagasGUIDs)
            {
                if (Creature* naga = instance->GetCreature(guid))
                {
                    naga->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
                    naga->RemoveAurasDueToSpell(SPELL_TEMPEST_ATTUNEMENT);

                    if (naga->IsAlive())
                        allDead = false;
                }
            }

            if (allDead) // If all nagas are dead, remove the non attackable flag from the boss
            {
                removeNonAttackableFromWrath();
            }
        }
    }

    void removeNonAttackableFromWrath()
    {
        if (Creature* wrath = instance->GetCreature(_wrathGUID))
            wrath->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC);
    }
};

void AddSC_instance_eye_of_azshara()
{
    RegisterInstanceScript(instance_eye_of_azshara, 1456);
}
