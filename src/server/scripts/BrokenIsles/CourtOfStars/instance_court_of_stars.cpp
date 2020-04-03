/*
 * Copyright (C) 2017-2019 AshamaneProject <https://github.com/AshamaneProject>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 *  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "ScriptMgr.h"
#include "InstanceScript.h"
#include "court_of_stars.h"

ObjectData const creatureData[] =
{
    { BOSS_PATROL_CAPTAIN_GERDO, DATA_PATROL_CAPTAIN_GERDO },
    { BOSS_TALIXAE_FLAMEWREATH,  DATA_TALIXAE_FLAMEWREATH },
    { BOSS_ADVISOR_MELANDRUS,    DATA_ADVISOR_MELANDRUS },
    { 0, 0 } // END
};

class instance_court_of_stars : public InstanceMapScript
{
public:
    instance_court_of_stars() : InstanceMapScript(COSScriptName, 1571) { }

    struct instance_court_of_stars_InstanceScript : public InstanceScript
    {
        instance_court_of_stars_InstanceScript(InstanceMap* map) : InstanceScript(map)
        {
            SetHeaders(DataHeader);
            SetBossNumber(EncounterCount);
            LoadObjectData(creatureData, nullptr);
            _melandrusGUID = ObjectGuid::Empty;
            _talixaeGUID = ObjectGuid::Empty;
            _captainGerdoGUID = ObjectGuid::Empty;
            _jazshariuGUID = _imacutyaGUID = _baalgarGUID = ObjectGuid::Empty;
            _enforcersDead = 0;
        }

        void OnCreatureCreate(Creature* creature) override
        {
            if (!creature)
                return;

            switch (creature->GetEntry())
            {
                case BOSS_PATROL_CAPTAIN_GERDO:
                    _captainGerdoGUID = creature->GetGUID();
                    break;

                case NPC_FLASK_OF_THE_SOLEMN_NIGHT:
                    FlaskOfTheSolemnNightGUID = creature->GetGUID();
                    break;

                case BOSS_TALIXAE_FLAMEWREATH:
                    _talixaeGUID = creature->GetGUID();
                    break;

                case BOSS_ADVISOR_MELANDRUS:
                    _melandrusGUID = creature->GetGUID();
                    break;

                case NPC_BAALGAR:
                    _baalgarGUID = creature->GetGUID();
                    break;

                case NPC_IMACUTYA:
                    _imacutyaGUID = creature->GetGUID();
                    break;

                case NPC_JAZSHARIU:
                    _jazshariuGUID = creature->GetGUID();
                    break;
            }
        }

        void ActivateTalixaeMinion()
        {
            switch (_enforcersDead)
            {
                case 1:
                {
                    Creature* talixae = instance->GetCreature(_talixaeGUID);
                    if (talixae)
                        talixae->AI()->Talk(0);

                    if (Creature* imacutya = instance->GetCreature(_imacutyaGUID))
                    {
                        imacutya->SetHomePosition(_enforcerPos);
                        imacutya->GetMotionMaster()->MoveTargetedHome();
                    }
                    RemoveAurasBuffs();
                    break;
                }

                case 2:
                {
                    Creature* talixae = instance->GetCreature(_talixaeGUID);
                    if (talixae)
                        talixae->AI()->Talk(1);

                    if (Creature* baalgar = instance->GetCreature(_baalgarGUID))
                    {
                        baalgar->SetHomePosition(_enforcerPos);
                        baalgar->GetMotionMaster()->MoveTargetedHome();
                    }
                    RemoveAurasBuffs();
                    break;
                }

                case 3:
                {
                    Creature* talixae = instance->GetCreature(_talixaeGUID);
                    if (talixae)
                        talixae->AI()->Talk(2);

                    if (Creature* jazshariu = instance->GetCreature(_jazshariuGUID))
                    {
                        jazshariu->SetHomePosition(_enforcerPos);
                        jazshariu->GetMotionMaster()->MoveTargetedHome();
                    }
                    RemoveAurasBuffs();
                    break;
                }

                default : break;
            }
        }

        void OnUnitDeath(Unit* unit) override
        {
            if (!unit)
                return;

            switch (unit->GetEntry())
            {
                case NPC_FELBOUND_ENFORCER:
                    _enforcersDead++;
                    _enforcerPos = unit->GetPosition();
                    ActivateTalixaeMinion();
                    break;

                case NPC_IMACUTYA:
                    RemoveAurasBuffs();
                    break;

                case NPC_JAZSHARIU:
                    RemoveAurasBuffs();
                    break;

                case NPC_BAALGAR:
                    RemoveAurasBuffs();
                    break;
            }
        }

        void RemoveAurasBuffs()
        {
            if (Creature* talixae = instance->GetCreature(_talixaeGUID))
                talixae->AI()->DoAction(1);
        }

        ObjectGuid GetGuidData(uint32 type) const override
        {
            switch (type)
            {
                case DATA_PATROL_CAPTAIN_GERDO: return _captainGerdoGUID;
                case DATA_FLASK_OF_THE_SOLEMN_NIGHT: return FlaskOfTheSolemnNightGUID;
                case DATA_TALIXAE_FLAMEWREATH: return _talixaeGUID;
                case DATA_ADVISOR_MELANDRUS: return _melandrusGUID;

                default : break;
            }

            return ObjectGuid::Empty;
        }

    private:
        ObjectGuid _captainGerdoGUID;
        ObjectGuid _talixaeGUID;
        ObjectGuid _melandrusGUID;
        ObjectGuid FlaskOfTheSolemnNightGUID;
        ObjectGuid _baalgarGUID, _imacutyaGUID, _jazshariuGUID;
        uint8 _enforcersDead;
        Position _enforcerPos;

    };

    InstanceScript* GetInstanceScript(InstanceMap* map) const override
    {
        return new instance_court_of_stars_InstanceScript(map);
    }
};

void AddSC_instance_court_of_stars()
{
    new instance_court_of_stars();
}
