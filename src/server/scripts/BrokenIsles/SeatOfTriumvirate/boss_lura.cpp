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

#include "ScriptMgr.h"
#include "seat_of_triumvirate.h"

enum Spells
{
    // L'ura spells
    SPELL_CALL_TO_THE_VOID                  = 247795,   // L'ura start cast this spell on aggro.
    SPELL_DARKENED_SHROUD                   = 254020,   // After cast 247795, L'ura cast shroud on self and cast 245393.
    SPELL_NAARU_LAMNENT_CHANNELED           = 245393,   // Periodic channeled aura, cast 245396 and 247915.
    SPELL_NAARU_LAMNENT_PHASE_TWO           = 248535,   // Not channeled aura, used in phase two. Soft enrage aura.
    SPELL_BACKLASH                          = 247816,   // On Spellhit 250318 from Alleria Windrunner, L'ura interrupted cast 245393 and backlash on self. Als removed 254020.
    SPELL_VOID_BLAST                        = 245289,   // In all phases, L'ura periodic cast triggered on random target.
    SPELL_UMBRAL_CADENCE                    = 247930,   // Periodic cast this spell, dealt damage around caster.
    SPELL_GRAND_SHIFT                       = 249009,   // Calls all Remnants of Anguish from Greater Rift Warden jump on random target.
    
    // Greater Rift Warden spells
    SPELL_VOID_BOUND                        = 247835,   // Channeled aura protect void portal, don't allow Alleria cast Void Sever on this.
    SPELL_FRAGMENT_OF_DESPAIR               = 245164,   // Summon world trigger, cast 245165 trigger missile on trigger.
    SPELL_FRAGMENT_OF_DESPAIR_MISSILE       = 245165,   // Trigger Missile spell. If SpellMissTarget, cast 245178 on all target.
    SPELL_ERUPTING_DESPAIR                  = 245178,   // Strong damage. Close void zone!
    SPELL_CRASH_TARGETING_DESPAIR           = 245187,   // Areatrigger 10727 check player around. If no target, after hit 245165 cast 245178
    SPELL_CRASH_TARGETING_DESPAIR_VISUAL    = 245216,   // Visual Aura for Fragment of Despair Missile.
    SPELL_SORROW_SHOCK                      = 247948,   // Simple damage spell.
    
    // Void Portal
    SPELL_SUMMON_WANING_VOIDS               = 247909,   // Periodic cast 245235
    SPELL_FROM_THE_VOID                     = 245235,   // Periodic trigger 247911
    SPELL_FROM_THE_VOID_SUMMON              = 245236,   // Summon 123050.
    
    // Waning Void
    SPELL_DARK_LASHING                      = 254727,   // Proc 254728 on attack.
    SPELL_REMNANT_OF_ANGUISH_WANING_VOID    = 249058,   // Summon 123054 after defeat.
    
    // Remnant of Anguish
    SPELL_REMNANT_OF_ANGUISH_AT             = 245241,   // Create AT 10733
    SPELL_REMNANT_OF_ANGUISH_TICK           = 245242,   // Periodic damage. Don't stay in void zone.
    SPELL_REMNANT_OF_ANGUISH_MISSILE        = 249057,   // After L'ura cast 249009 - Grand Shift, Remnant of Anguish cast 249057 on random L'ura target.
    
    // Alleria Windrunner
    SPELL_VOID_SEVER                        = 247878,   // After defeated any Greater Rift Warden, Alleria cast this spell for close not protected portal and gain energy. After two cast close portal, cast 250318 on L'ura.
    SPELL_DARK_TORRENT                      = 250318,   // After reach energy point = 100, cast this spell on L'ura. Only on phase 1.
    SPELL_DARK_TORRENT_AT                   = 250319,   // AT for L'ura cast Backlash.
};

enum Npcs
{
    NPC_REMNANT_OF_ANGUISH                  = 123054,
    NPC_ALLERIA_WINDRUNNER_LURA             = 123187,
    NPC_GREATER_RIFT_WARDEN                 = 124745,
    NPC_WANING_VOID                         = 123050
};

// 122314
struct boss_lura : public BossAI
{
    boss_lura(Creature* creature) : BossAI(creature, DATA_LURA) { }

    void ScheduleTasks() override
    {
    }

    void ExecuteEvent(uint32 /*eventId*/) override
    {
    }
};

void AddSC_boss_lura()
{
    RegisterCreatureAI(boss_lura);
}
