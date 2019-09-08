/*
 * Copyright (C) 2017-2019 AshamaneProject <https://github.com/AshamaneProject>
 * Copyright (C) 2008-2019 TrinityCore <https://www.trinitycore.org/>
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

/*
* Scripts for spells with SPELLFAMILY_WARLOCK and SPELLFAMILY_GENERIC spells used by warlock players.
* Ordered alphabetically using scriptname.
* Scriptnames of files in this file should be prefixed with "spell_warl_".
*/

#include "AreaTrigger.h"
#include "AreaTriggerAI.h"
#include "AreaTriggerTemplate.h"
#include "SpellPackets.h"
#include "ObjectAccessor.h"
#include "ObjectMgr.h"
#include "CellImpl.h"
#include "DatabaseEnv.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Pet.h"
#include "GameObject.h"
#include "GameObjectAI.h"
#include "ScriptMgr.h"
#include "SpellScript.h"
#include "Unit.h"
#include "SpellAuraEffects.h"
#include "SpellAuras.h"
#include "Spell.h"
#include "PetAI.h"
#include "Player.h"
#include "ScriptedCreature.h"
#include "SpellHistory.h"
#include "SpellMgr.h"
#include "PassiveAI.h"
#include "CombatAI.h"
#include "GridNotifiers.h"
#include "Item.h"
#include <G3D/Vector3.h>

enum ProjectWarlockSpells
{
    // ADDED IN MOP
    SPELL_WARLOCK_DARK_BARGAIN_DOT                  = 110914,
    SPELL_WARLOCK_DEMONIC_GATEWAY_JUMP_GREEN        = 113896,
    SPELL_WARLOCK_DEMONIC_GATEWAY_JUMP_PURPLE       = 120729,
    SPELL_WARLOCK_DEMONIC_GATEWAY_COUNTER           = 113901,
    SPELL_WARLOCK_DEMONIC_GATEWAY_DEBUFF            = 113942,
    SEPLL_WARLOCK_DEMONIC_GATEWAY_VISUAL            = 113900,
    SPELL_WARLOCK_DEMONIC_GATEWAY_SUMMON_GREEN      = 113886,
    SPELL_WARLOCK_DEMONIC_GATEWAY_SUMMON_PURPLE     = 113890,
    SPELL_WARLOCK_DEMONIC_GATEWAY_ACTIVATE          = 113902,
    SPELL_WARLOCK_GLYPH_OF_GATEWAY_ATTUNEMENT       = 135557,
    SPELL_WARLOCK_HAND_OF_GULDAN                    = 105174,
    SPELL_WARLOCK_HAND_OF_GULDAN_DAMAGE             = 86040,
    SPELL_WARLOCK_SHADOWFLAME                       = 47960,
    SPELL_WARLOCK_FEAR_FLEE                         = 118699,
    SPELL_WARLOCK_FEAR_ROOT                         = 130616,
    SPELL_WARLOCK_HAVOC                             = 80240,
    SPELL_WARLOCK_CHAOS_BOLT                        = 116858,
    SPELL_WARLOCK_CONFLAGRATE                       = 17962,
    SPELL_WARLOCK_CONFLAGRATE_ENERGIZE              = 245330,
    SPELL_WARLOCK_CONFLAGRATE_ROARING_BLAZE         = 265931,
    SPELL_WARLOCK_CONFLAGRATE_FIRE_AND_BRIMSTONE    = 108685,
    SPELL_WARLOCK_IMMOLATE                          = 348,
    SPELL_WARLOCK_IMMOLATE_FIRE_AND_BRIMSTONE       = 108686,
    SPELL_WARLOCK_INCINERATE                        = 29722,
    SPELL_WARLOCK_INCINERATE_FIRE_AND_BRIMSTONE     = 114654,
    SPELL_WARLOCK_SHADOWBURN                        = 17877,
    SPELL_WARLOCK_HELLFIRE_DAMAGE                   = 5857,
    SPELL_WARLOCK_HELLFIRE                          = 1949,
    SPELL_WARLOCK_CURSE_OF_ENFEEBLEMENT             = 109466,
    SPELL_WARLOCK_MORTAL_COIL                       = 6789,
    SPELL_WARLOCK_COMMAND_DEMON_OVERRIDE            = 119904,
    SPELL_WARLOCK_PET_GRIMOIRE_SINGE_MAGIC          = 132411,
    SPELL_WARLOCK_PET_GRIMOIRE_SHADOW_BULWARK       = 132413,
    SPELL_WARLOCK_PET_GRIMOIRE_WHIPLASH             = 137706,
    SPELL_WARLOCK_PET_GRIMOIRE_SPELL_LOCK           = 132409,
    SPELL_WARLOCK_PET_GRIMOIRE_PURSUIT              = 132410,
    SPELL_WARLOCK_SOULSHARD_ENERGIZE                = 87388,
    SPELL_WARLOCK_METAMORPHOSIS                     = 103958,
    SPELL_WARLOCK_METAMORPHOSIS_SPELL_REPLACEMENTS  = 103965,
    SPELL_WARLOCK_METAMORPHOSIS_ADDITIONAL_AURA     = 54879,
    SPELL_WARLOCK_METAMORPHOSIS_ADDITIONAL_AURA_2   = 54817,
    SPELL_WARLOCK_DEMONIC_LEAP_JUMP                 = 54785,
    SPELL_WARLOCK_PET_DOOMBOLT                      = 85692,
    SPELL_WARLOCK_SHADOWBURN_ENERGIZE               = 29341,
    SPELL_WARLOCK_CORRUPTION                        = 172,
    SPELL_WARLOCK_CORRUPTION_TRIGGERED              = 146739,
    SPELL_WARLOCK_UNSTABLE_AFFLICTION               = 30108,
    SPELL_WARLOCK_DEMONIC_CIRCLE_SUMMON             = 48018,
    SPELL_WARLOCK_DEMONIC_CIRCLE_SUMMON_METAMORPH   = 104135,
    SPELL_WARLOCK_DRAIN_SOUL                        = 198590,
    SPELL_WARLOCK_MALEFIC_GRASP                     = 103103,
    SPELL_WARLOCK_BACKDRAFT_TRIGGERED               = 117828,
    SPELL_WARLOCK_FLASHOVER_AURA                    = 267115,
    SPELL_WARLOCK_BACKLESH_TRIGGERED                = 34936,
    SPELL_WARLOCK_MASTERY_EMEBERSTORM               = 77220,
    SPELL_WARLOCK_SHADOW_BOLT                       = 686,
    SPELL_WARLOCK_SHADOW_BOLT_SHOULSHARD            = 194192,
    SPELL_WARLOCK_SHADOW_EMBRACE                    = 32388,
    SPELL_WARLOCK_SHADOW_EMBRACE_BUFF               = 32390,
    SPELL_WARLOCK_GLYPH_OF_SHADOW_BOLT              = 56240,
    SPELL_WARLOCK_WILD_IMP_SUMMON                   = 104317,
    SPELL_WARLOCK_SIPHON_LIFE_HEAL                  = 63106,
    SPELL_WARLOCK_GLYPH_OF_HEALTHSTONE              = 56224,
    SPELL_WARLOCK_CREATE_HEALTHSTONE                = 23517,
    SPELL_WARLOCK_SOUL_LINK_HEAL                    = 108447,
    SPELL_WARLOCK_SOUL_LINK_TALENT                  = 108415,
    SPELL_WARLOCK_RAGING_SOUL                       = 148463,
    SPELL_WARLOCK_DARK_APOTHEOSIS                   = 114168,
    SPELL_WARLOCK_RAIN_OF_FIRE_AFTERMATH_TRIGGERED  = 104233,
    SPELL_WARLOCK_SOUL_LINK_BUFF                    = 108446,
    SPELL_WARLOCK_DEMONIC_FURY_GENERATE             = 104314,
    SPELL_WARLOCK_DRAIN_LIFE                        = 689,
    SPELL_WARLOCK_DRAIN_LIFE_HEAL                   = 89653,
    SPELL_WARLOCK_GLYPH_OF_DEMON_TRAINING           = 56249,
    SPELL_WARLOCK_IMMOLATION                        = 19483,
    SPELL_WARLOCK_DEMONIC_REBIRTH_COOLDOWN_MARKER   = 89140,
    SPELL_WARLOCK_SEED_OF_CORRUPTION                = 27243,
    SPELL_WARLOCK_SEED_OF_CORRUPTION_DETONATION     = 27285,
    SPELL_WARLOCK_SEED_OF_CORRUPTION_SOULBURN       = 114790,
    SPELL_WARLOCK_BLOOD_HORROR_TRIGGERED            = 137143,
    SPELL_WARLOCK_GLYPH_OF_NIGHTMARES               = 56232,
    SPELL_WARLOCK_GLYPH_OF_NIGHTMARES_TRIGGERED     = 143314,
    SPELL_WARLOCK_SHADOW_TRANCE                     = 17941,
    SPELL_WARLOCK_HARVEST_LIFE                      = 108371,
    SPELL_WARLOCK_HOWL_OF_TERROR                    = 5484,
    SPELL_WARLOCK_GRIMOIRE_OF_SUPREMACY             = 152107,
    SPELL_WARLOCK_GRIMOIRE_OF_SACRIFICE             = 108503,
    SPELL_WARLOCK_DOOM                              = 603,
    SPELL_WARLOCK_SOUL_FIRE                         = 6353,
    SPELL_WARLOCK_SOUL_FIRE_METAMORPHOSIS           = 104027,
    SPELL_WARLOCK_GLYPH_OF_FELGUARD                 = 56246,

    // Soul Swap
    SPELL_WARLOCK_SOUL_SWAP_BUFF                    = 86211,
    SPELL_WARLOCK_SOUL_SWAP_VISUAL                  = 92795,
    SPELL_WARLOCK_SOUL_SWAP_NO_COST                 = 92794,

    // Dark Apotheosis spells
    SPELL_WARLOCK_TWILIGHT_WARD                     = 6229,
    SPELL_WARLOCK_FURY_WARD                         = 119839,
    SPELL_WARLOCK_SOULSHATTER                       = 29858,
    SPELL_WARLOCK_PROVOCATION                       = 97827,
    SPELL_WARLOCK_SHADOWBOLT                        = 686,
    SPELL_WARLOCK_DEMONIC_SLASH                     = 114175,
    SPELL_WARLOCK_FEAR                              = 5782,
    SPELL_WARLOCK_SLEEP                             = 104045,

    // triggered at spell tick
    SPELL_WARLOCK_AGONY_SPELL_TICK_TRIGGERED        = 131737,
    SPELL_WARLOCK_UNSTABLE_AFFLICTION_TICK_TRIGGERED= 131736,
    SPELL_WARLOCK_CORRUPTION_TICK_TRIGGERED         = 131740,

    // Soulburn
    SPELL_WARLOCK_SOULBURN                          = 74434,
    SPELL_WARLOCK_SOULBURN_UNENDING_BREATH          = 104242,
    SPELL_WARLOCK_SOULBURN_DEMONIC_CIRCLE           = 79438,

    SPELL_WARLOCK_GLYPH_OF_FEAR                     = 56244,
    SPELL_WARLOCK_GLYPH_OF_HAVOC                    = 146962,
    SPELL_WARLOCK_PET_FEL_FIREBOLT                  = 104318,

    // pet spells
    SPELL_WARLOCK_PET_LESSER_INVISIBILITY           = 7870,
    SPELL_WARLOCK_PET_FIREBOLT                      = 3110,
    SPELL_WARLOCK_PET_FELSTORM                      = 89751,
    SPELL_WARLOCK_PET_LEGION_STRIKE                 = 30213,
    SPELL_WARLOCK_PET_SHADOW_BITE                   = 54049,
    SPELL_WARLOCK_PET_WHIPLASH                      = 6360,
    SPELL_WARLOCK_PET_FELLASH                       = 115770,
    SPELL_WARLOCK_PET_LASH_OF_PAIN                  = 7814,
    SPELL_WARLOCK_PET_TORMENT                       = 3716,

    // set bonuses
    SPELL_WARLOCK_PVP_4P_BONUS                      = 143395,
    SPELL_WARLOCK_T14_BONUS                         = 123141,
    SPELL_WARLOCK_T15_2P_BONUS                      = 138129,
    SPELL_WARLOCK_T15_2P_BONUS_TRIGGERED            = 138483,
    SPELL_WARLOCK_T16_4P                            = 145091,
    SPELL_WARLOCK_T16_4P_TRIGGERED                  = 145164,
    SPELL_WARLOCK_T16_4P_INTERNAL_CD                = 145165,


    // ADDED IN LEGION
    SPELL_WARLOCK_DARKGLARE_EYE_BEAM                = 205231,
    SPELL_WARLOCK_DARKGLARE_SUMMON                  = 205180,
    SPELL_WARLOCK_TEAR_CHAOS_BARRAGE                = 187394,
    SPELL_WARLOCK_TEAR_CHAOS_BOLT                   = 215279,
    SPELL_WARLOCK_TEAR_SHADOW_BOLT                  = 196657,
    SPELL_WARLOCK_IMMOLATE_DOT                      = 157736,
    SPELL_WARLOCK_CHANNEL_DEMONFIRE_ACTIVATOR       = 228312,
    SPELL_WARLOCK_CHANNEL_DEMONFIRE_DAMAGE          = 196448,
    SPELL_WARLOCK_DEADWIND_HARVERST                 = 216708,
    SPELL_WARLOCK_TORMENTED_SOULS                   = 216695,
    SPELL_WARLOCK_THALKIELS_CONSUMPTION_DAMAGE      = 211715,
    SPELL_WARLOCK_PHANTOM_SINGULARITY_DAMAGE        = 205246,
    SPELL_WARLOCK_SOUL_FLAME_PROC                   = 199581,
    SPELL_WARLOCK_WRATH_OF_CONSUMPTION_PROC         = 199646,
    SPELL_WARLOCK_ETERNAL_STRUGGLE_PROC             = 196304,
    SPELL_WARLOCK_DEVOURER_OF_LIFE_PROC             = 215165,
    SPELL_WARLOCK_CONFLAGRATION_OF_CHAOS            = 196546,
    SPELL_WARLOCK_SOULSNATCHER_PROC                 = 196234,
    SPELL_WARLOCK_DIMENSIONAL_RIFT                  = 196586,
    SPELL_WARLOCK_DRAIN_SOUL_ENERGIZE               = 205292,
    SPELL_WARLOCK_HEALTH_FUNNEL_HEAL                = 217979,
    SPELL_WARLOCK_IMMOLATION_TRIGGERED              = 20153,
    SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT1          = 233490,
    SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT2          = 233496,
    SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT3          = 233497,
    SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT4          = 233498,
    SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT5          = 233499,
    SPELL_WARLOCK_UNSTABLE_AFFLICTION_DISPEL        = 196364,
    SPELL_WARLOCK_UNSTABLE_AFFLICTION_RANK2         = 231791,
    SPELL_WARLOCK_UNSTABLE_AFFLICTION_ENERGIZE      = 31117,
    SPELL_WARLOCK_SOUL_LEECH_SHIELD                 = 108366,
    SPELL_WARLOCK_CALL_DREADSTALKERS_SUMMON         = 193331,
    SPELL_WARLOCK_DREADSTALKER_CHARGE               = 194247,
    SPELL_WARLOCK_DEMONWRATH_AURA                   = 193440,
    SPELL_WARLOCK_DEMONWRATH_ENERGIZE               = 194379,
    SPELL_WARLOCK_DOOM_ENERGIZE                     = 193318,
    SPELL_WARLOCK_RAIN_OF_FIRE_DAMAGE               = 42223,
    SPELL_WARLOCK_CONTAGION                         = 196105,
    SPELL_WARLOCK_CONTAGION_DEBUFF                  = 233494,
    SPELL_WARLOCK_ABSOLUTE_CORRUPTION               = 196103,
    SPELL_WARLOCK_SOW_THE_SEEDS                     = 196226,
    SPELL_WARLOCK_DEMON_SKIN                        = 219272,
    SPELL_WARLOCK_SOUL_EFFIGY_AURA                  = 205247,
    SPELL_WARLOCK_SOUL_EFFIGY_DAMAGE                = 205260,
    SPELL_WARLOCK_SOUL_EFFIGY_VISUAL                = 205277,
    SPELL_WARLOCK_DEMONWRATH_DAMAGE                 = 193439,
    SPELL_WARLOCK_IMPENDING_DOOM                    = 196270,
    SPELL_WARLOCK_IMPROVED_DREADSTALKERS            = 196272,
    SPELL_WARLOCK_IMPLOSION_JUMP                    = 205205,
    SPELL_WARLOCK_IMPLOSION_DAMAGE                  = 196278,
    SPELL_WARLOCK_HAND_OF_DOOM                      = 196283,
    SPELL_WARLOCK_POWER_TRIP                        = 196605,
    SPELL_WARLOCK_POWER_TRIP_ENERGIZE               = 216125,
    SPELL_WARLOCK_GRIMOIRE_OF_SYNERGY               = 171982,
    SPELL_WARLOCK_EYE_LASER                         = 205231,
    SPELL_WARLOCK_BACKDRAFT                         = 196406,
    SPELL_WARLOCK_ROARING_BLAZE                     = 205184,
    SPELL_WARLOCK_FIREBOLT_BONUS                    = 231795,
    SPELL_WARLOCK_ESSENCE_DRAIN                     = 221711,
    SPELL_WARLOCK_ESSENCE_DRAIN_DEBUFF              = 221715,
    SPELL_WARLOCK_CASTING_CIRCLE_BUFF               = 221705,
    SPELL_WARLOCK_SOULSHATTER_ENERGIZE              = 212921,
    SPELL_WARLOCK_SOULSHATTER_HASTE                 = 236471,
    SPELL_WARLOCK_ROT_AND_DECAY                     = 212371,
    SPELL_WARLOCK_CURSE_OF_SHADOWS_DAMAGE           = 236615,
    SPELL_WARLOCK_SINGE_MAGIC                       = 212620,
    SPELL_WARLOCK_FEL_LORD_CLEAVE                   = 213688,
    SPELL_WARLOCK_SUMMON_OBSERVER                   = 201996,
    SPELL_WARLOCK_OBSERVER_AURA                     = 212580,
    SPELL_WARLOCK_LASERBEAM                         = 212529,
    SPELL_WARLOCK_FEL_FISSURE_DEBUFF                = 200587,
    SPELL_WARLOCK_BANE_OF_HAVOC_DEBUFF              = 200548,
    SPELL_WARLOCK_FATAL_ECHOES                      = 199257,
    SPELL_WARLOCK_SWEET_SOULS                       = 199220,
    SPELL_WARLOCK_SWEET_SOULS_HEAL                  = 199221,
    SPELL_WARLOCK_COMPOUNDING_HORROR                = 199281,
    SPELL_WARLOCK_COMPOUNDING_HORROR_DAMAGE         = 231489,
    SPELL_WARLOCK_SHARPENED_DREADFANGS              = 211123,
    SPELL_WARLOCK_SHARPENED_DREADFANGS_BUFF         = 215111,
    SPELL_WARLOCK_SOUL_SKIN                         = 218567,
    SPELL_WARLOCK_DOOM_DOUBLED                      = 218572,
    SPELL_WARLOCK_INFERNAL_FURNACE                  = 211119,
    SPELL_WARLOCK_STOLEN_POWER                      = 211530,
    SPELL_WARLOCK_STOLEN_POWER_COUNTER              = 211529,
    SPELL_WARLOCK_STOLEN_POWER_BUFF                 = 211583,
    SPELL_WARLOCK_THE_EXPANDABLES                   = 211219,
    SPELL_WARLOCK_THE_EXPANDABLES_BUFF              = 211218,
    SPELL_WARLOCK_THALKIES_DISCORD_DAMAGE           = 211727,
    SPELL_WARLOCK_IMPERATOR                         = 211158,
    SPELL_WARLOCK_PLANESWALKER                      = 196675,
    SPELL_WARLOCK_PLANESWALKER_BUFF                 = 196674,
    SPELL_WARLOCK_LORD_OF_THE_FLAMES_CD             = 226802,
    SPELL_WARLOCK_LORD_OF_THE_FLAMES                = 224103,
    SPELL_WARLOCK_LORD_OF_THE_FLAMES_SUMMON         = 224105,
    SPELL_WARLOCK_DEMONOLOGY_WARLOCK                = 137044,

    SPELL_WARLOCK_ERADICATION_AURA                  = 196412,
    SPELL_WARLOCK_ERADICATION_DEBUF                 = 196414,

    SPELL_WARLOCK_INTERNAL_COMBUSTION_TALENT_AURA   = 266134,
    SPELL_WARLOCK_INTERNAL_COMBUSTION_DMG           = 266136,

    SPELL_ARENA_DAMPENING                           = 110310,
    SPELL_WARLOCK_SOUL_SHARDS_AURA                  = 246985,
    SPELL_WARLOCK_AGONY                             = 980,
    SPELL_WARLOCK_AGONY_SOUL_SHARD_DRIVER           = 251404,
    SPELL_WARLOCK_AGONY_ENERGIZE                    = 17941,
    SPELL_DEATHBOLT                                 = 264106,
    SPELL_CORRUPTION_DOT                            = 146739,
    SPELL_ABSOLUTE_CORRUPTION_BUFF                  = 196103,
    SPELL_DARK_PACT                                 = 108416,
    SPELL_SOUL_CONDUIT                              = 215941,
    SPELL_SOUL_CONDUIT_ENERGIZE                     = 215942,
    SPELL_SHADOW_BOLT                               = 686,
    SPELL_NIGHTFALL_AURA                            = 108558,
    SPELL_NIGHTFALL_BUFF                            = 264571,

    SPELL_INCINERATE                                = 29722,
    SPELL_INCINERATE_NORMAL_ENERGIZE                = 244670,
    SPELL_WARLOCK_FIRE_AND_BRIMSTONE                = 196408,
    SPELL_CONFLAGRATE                               = 17962,
    SPELL_CONFLAGRATE_ENERGIZE                      = 245330,
    SPELL_ERADICATION_BUFF                          = 196412,
    SPELL_ERADICATION_DEBUFF                        = 196414,
    SPELL_CHAOS_BOLT                                = 116858,
    SPELL_DEMONBOLT                                 = 264178,
    SPELL_DEMONBOLT_ENERGIZE                        = 280127,
    SPELL_SOULFIRE                                  = 6353,
    SPELL_SOULFIRE_ENERGIZE                         = 281490,
    SPELL_RAIN_OF_FIRE_DAMAGE_OF_TICK               = 42223,
    SPELL_INFERNO_AURA                              = 270545,
    SPELL_RAIN_OF_FIRE_ENERGIZE                     = 270548,

    SPELL_WARLOCK_UNENDING_RESOLVE_AURA             = 104773,
    SPELL_WARLOCK_CASTING_CIRCLE                    = 221703,
};

enum FreakzWarlockNPCs
{
    NPC_WARLOCK_DEMONIC_GATEWAY_PURPLE              = 59271,
    NPC_WARLOCK_DEMONIC_GATEWAY_GREEN               = 59262,
    // pets
    NPC_WARLOCK_PET_IMP         = 416,
    NPC_WARLOCK_PET_FEL_IMP     = 58959,
    NPC_WARLOCK_PET_VOIDWALKER  = 1860,
    NPC_WARLOCK_PET_VOIDLORD    = 58960,
    NPC_WARLOCK_PET_SUCCUBUS    = 1863,
    NPC_WARLOCK_PET_SHIVARRA    = 58963,
    NPC_WARLOCK_PET_FEL_HUNTER  = 417,
    NPC_WARLOCK_PET_OBSERVER    = 58964,
    NPC_WARLOCK_PET_FELGUARD    = 17252,
    NPC_WARLOCK_PET_WRATHGUARD  = 58965,
};

enum FreakzWarlockSpellVisuals
{
    VISUAL_MALEFIC_GRASP        = 25955,
};

// ================================================================== ADDED IN MOP ==================================================================
enum FreakzWarlockEvents
{
    EVENT_WARLOCK_DEMONIC_GATEWAY_UPDATE_CHARGES = 1,
};

// Command Demon, called by Cauterize Master 119905, Disarm 119907, Whiplash 119909, Fellash 119913,
// Spell Lock 119910, Optical Blast 119911, Felstorm 119914, Wrathstorm 119915, Meteor Strike 171152, Shadow Lock 171140
class spell_warlock_command_demon : public SpellScriptLoader
{
    public:
        spell_warlock_command_demon() : SpellScriptLoader("spell_warlock_command_demon") { }

        class spell_warlock_command_demon_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_command_demon_SpellScript);

            Pet * GetPet()
            {
                Player * caster = GetCaster()->ToPlayer();
                if (!caster || caster->getClass() != CLASS_WARLOCK)
                    return NULL;
                Pet * pet = caster->GetPet();
                return pet;
            }

            uint32 GetSpellId()
            {
                // spell id stored in basepoints of EFFECT_0
                return GetSpellInfo()->GetEffect(EFFECT_0)->BasePoints;
            }

            SpellCastResult CheckCast()
            {
                Pet * pet = GetPet();
                if (!pet)
                    return SPELL_FAILED_CANT_DO_THAT_RIGHT_NOW;
                uint32 spellId = GetSpellId();
                if (!spellId)
                    return SPELL_FAILED_CANT_DO_THAT_RIGHT_NOW;

                if (!GetCaster())
                    return SPELL_FAILED_BAD_TARGETS;

                Player * player = GetCaster()->ToPlayer();
                Unit * victim = GetVictim(player, pet);
                WorldLocation const* dest = GetExplTargetDest();

                if (!sSpellMgr->GetSpellInfo(spellId) || (!victim && !dest))
                    return SPELL_FAILED_CANT_DO_THAT_RIGHT_NOW;

                Spell * spell = new Spell(pet, sSpellMgr->GetSpellInfo(spellId), TRIGGERED_NONE);
                SpellCastTargets targets;
                targets.SetUnitTarget(victim);
                if (dest)
                    targets.SetDst(*dest);
                spell->InitExplicitTargets(targets);
                SpellCastResult res = spell->CheckCast(true);
                delete spell;
                if (res != SPELL_CAST_OK && res != SPELL_FAILED_OUT_OF_RANGE)
                    return res;

                return SPELL_CAST_OK;
            }

            Unit * GetVictim(Player * player, Pet * pet)
            {
                Unit * victim = pet->GetVictim();
                if (!victim)
                    victim = GetExplTargetUnit();
                if (!victim)
                    victim = player->GetVictim();
                if (!victim)
                    victim = player->GetSelectedUnit();
                if (!victim)
                    victim = pet;
                return victim;
            }

            void HandleAfterCast()
            {
                Pet * pet = GetPet();
                if (!pet)
                    return;
                Player * player = GetCaster()->ToPlayer();

                // spell id stored in basepoints of EFFECT_0
                uint32 spellId = GetSpellId();
                if (!spellId)
                    return;

                switch (spellId)
                {
                    case SPELL_WARLOCK_PET_WHIPLASH:
                    case SPELL_WARLOCK_PET_FELLASH:
                    {
                        WorldLocation const* dest = GetExplTargetDest();
                        if (!dest)
                            break;
                        Spell * spell = new Spell(pet, sSpellMgr->GetSpellInfo(spellId), TRIGGERED_NONE);
                        SpellCastTargets targets;
                        targets.SetDst(*dest);
                        spell->prepare(&targets);
                        break;
                    }
                    default:
                    {
                        Unit * victim = GetVictim(player, pet);
                        player->GetSession()->HandlePetActionHelper(pet, ObjectGuid::Empty, spellId, ACT_ENABLED, victim->GetGUID(), Position());
                        break;
                    }
                }

                // add visual cooldown
                int32 cooldown = sSpellMgr->GetSpellInfo(spellId)->GetRecoveryTime();
                player->GetSpellHistory()->AddCooldown(spellId, 0, std::chrono::milliseconds(cooldown));
            }

            void Register() override
            {
                OnCheckCast += SpellCheckCastFn(spell_warlock_command_demon_SpellScript::CheckCast);
                AfterCast += SpellCastFn(spell_warlock_command_demon_SpellScript::HandleAfterCast);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_command_demon_SpellScript();
        }
};

// Dark Bargain - 110913
class spell_warlock_dark_bargain : public SpellScriptLoader
{
    public:
        spell_warlock_dark_bargain() : SpellScriptLoader("spell_warlock_dark_bargain") { }

        class spell_warlock_dark_bargain_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_dark_bargain_AuraScript);

            int32 absorbedDamage;

            void CalculateAmount(AuraEffect const* /*aurEff*/, int32& /*amount*/, bool & /*canBeRecalculated*/)
            {
                absorbedDamage = 0;
            }

            void Absorb(AuraEffect* aurEff, DamageInfo & dmgInfo, uint32 & absorbAmount)
            {
                PreventDefaultAction();

                uint32 damage = dmgInfo.GetDamage();
                absorbAmount = damage;
                absorbedDamage += damage;
                aurEff->SetAmount(aurEff->GetAmount() + damage);

                dmgInfo.AbsorbDamage(damage);
            }

            void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                if (Unit * owner = GetUnitOwner())
                {
                    uint32 duration = sSpellMgr->GetSpellInfo(SPELL_WARLOCK_DARK_BARGAIN_DOT)->GetMaxDuration() / IN_MILLISECONDS;
                    if (duration)
                        absorbedDamage /= duration; // tick per second
                    owner->CastCustomSpell(owner, SPELL_WARLOCK_DARK_BARGAIN_DOT, &absorbedDamage, NULL, NULL, true);
                }
            }

            void Register() override
            {
                 DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_warlock_dark_bargain_AuraScript::CalculateAmount, EFFECT_0, SPELL_AURA_SCHOOL_ABSORB);
                 OnEffectAbsorb += AuraEffectAbsorbFn(spell_warlock_dark_bargain_AuraScript::Absorb, EFFECT_0);
                 AfterEffectRemove += AuraEffectRemoveFn(spell_warlock_dark_bargain_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_SCHOOL_ABSORB, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_dark_bargain_AuraScript();
        }
};

// Demonic Gateway - 111771
class spell_warlock_demonic_gateway : public SpellScriptLoader
{
    public:
        spell_warlock_demonic_gateway() : SpellScriptLoader("spell_warlock_demonic_gateway") { }

        class spell_warlock_demonic_gateway_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_demonic_gateway_SpellScript);

            void HandleLaunch(SpellEffIndex /*effIndex*/)
            {
                Unit * caster = GetCaster();

                // despawn all other gateways
                std::list<Creature*> targets1, targets2;
                caster->GetCreatureListWithEntryInGrid(targets1, NPC_WARLOCK_DEMONIC_GATEWAY_GREEN, 200.0f);
                caster->GetCreatureListWithEntryInGrid(targets2, NPC_WARLOCK_DEMONIC_GATEWAY_PURPLE, 200.0f);
                targets1.insert(targets1.end(), targets2.begin(), targets2.end());
                for (auto target : targets1)
                {
                    if (target->GetOwnerGUID() != caster->GetGUID())
                        continue;
                    target->DespawnOrUnsummon(1); // despawn at next tick
                }

                if (WorldLocation const* dest = GetExplTargetDest()) {
                    caster->CastSpell(caster, SPELL_WARLOCK_DEMONIC_GATEWAY_SUMMON_PURPLE, true);
                    caster->CastSpell(*dest, SPELL_WARLOCK_DEMONIC_GATEWAY_SUMMON_GREEN, true);
                }
            }

            SpellCastResult CheckRequirement()
            {
                // don't allow during Arena Preparation
                if (GetCaster()->HasAura(SPELL_ARENA_PREPARATION))
                    return SPELL_FAILED_CANT_DO_THAT_RIGHT_NOW;

                // check if player can reach the location
                Spell * spell = GetSpell();
                if (spell->m_targets.HasDst())
                {
                    Position pos;
                    pos = spell->m_targets.GetDst()->_position.GetPosition();
                    Unit * caster = GetCaster();

                    if (caster->GetPositionZ() + 6.0f < pos.GetPositionZ() ||
                        caster->GetPositionZ() - 6.0f > pos.GetPositionZ())
                        return SPELL_FAILED_NOPATH;
                }

                return SPELL_CAST_OK;
            }

            void HandleVisual(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                WorldLocation const* dest = GetExplTargetDest();
                if (!caster || !dest)
                    return;

                Position pos = dest->GetPosition();

                caster->SendPlaySpellVisual(pos, 20.f, 63644);
            }

            void Register() override
            {
                OnEffectLaunch += SpellEffectFn(spell_warlock_demonic_gateway_SpellScript::HandleVisual, EFFECT_0, SPELL_EFFECT_SUMMON);
                OnEffectLaunch += SpellEffectFn(spell_warlock_demonic_gateway_SpellScript::HandleLaunch, EFFECT_1, SPELL_EFFECT_DUMMY);
                OnCheckCast += SpellCheckCastFn(spell_warlock_demonic_gateway_SpellScript::CheckRequirement);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_demonic_gateway_SpellScript();
        }
};

class npc_warlock_demonic_gateway : public CreatureScript
{
    public:
        npc_warlock_demonic_gateway() : CreatureScript("npc_warlock_demonic_gateway") { }

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_warlock_demonic_gatewayAI(creature);
        }

        struct npc_warlock_demonic_gatewayAI : public CreatureAI
        {
            npc_warlock_demonic_gatewayAI(Creature* creature) : CreatureAI(creature) { }

            EventMap events;
            bool firstTick = true;

            void UpdateAI(uint32 /*diff*/) override
            {
                if (firstTick)
                {
                    me->CastSpell(me, SEPLL_WARLOCK_DEMONIC_GATEWAY_VISUAL, true);

                    me->SetInteractSpellId(SPELL_WARLOCK_DEMONIC_GATEWAY_ACTIVATE);
                    me->AddUnitFlag(UNIT_FLAG_NON_ATTACKABLE);
                    me->AddNpcFlag(UNIT_NPC_FLAG_SPELLCLICK);
                    me->SetReactState(ReactStates::REACT_PASSIVE);
                    me->SetControlled(true, UNIT_STATE_ROOT);

                    firstTick = false;
                }
            }

            void OnSpellClick(Unit* player, bool& /*result*/) override
            {
                // don't allow using the gateway while having specific auras
                uint32 aurasToCheck[4] = { 121164, 121175, 121176, 121177 }; // Orbs of Power @ Temple of Kotmogu
                for (auto auraToCheck : aurasToCheck)
                    if (player->HasAura(auraToCheck))
                        return;

                TeleportTarget(player, true);
                return;
            }

            void TeleportTarget(Unit * target, bool allowAnywhere)
            {
                Unit * owner = me->GetOwner();
                if (!owner)
                    return;

                // only if target stepped through the portal
                if (!allowAnywhere && me->GetDistance2d(target) > 1.0f)
                    return;
                // check if target wasn't recently teleported
                if (target->HasAura(SPELL_WARLOCK_DEMONIC_GATEWAY_DEBUFF))
                    return;
                // only if in same party
                if (!target->IsInRaidWith(owner))
                    return;
                // not allowed while CC'ed
                if (!target->CanFreeMove())
                    return;

                uint32 otherGateway = me->GetEntry() == NPC_WARLOCK_DEMONIC_GATEWAY_GREEN ? NPC_WARLOCK_DEMONIC_GATEWAY_PURPLE : NPC_WARLOCK_DEMONIC_GATEWAY_GREEN;
                uint32 teleportSpell = me->GetEntry() == NPC_WARLOCK_DEMONIC_GATEWAY_GREEN ? SPELL_WARLOCK_DEMONIC_GATEWAY_JUMP_GREEN : SPELL_WARLOCK_DEMONIC_GATEWAY_JUMP_PURPLE;
                std::list<Creature*> gateways;
                me->GetCreatureListWithEntryInGrid(gateways, otherGateway, 100.0f);
                for (auto gateway : gateways)
                {
                    if (gateway->GetOwnerGUID() != me->GetOwnerGUID())
                        continue;

                    target->CastSpell(gateway, teleportSpell, true);
                    if (target->HasAura(SPELL_WARLOCK_PLANESWALKER))
                        target->CastSpell(target, SPELL_WARLOCK_PLANESWALKER_BUFF, true);
                    // Item - Warlock PvP Set 4P Bonus: "Your allies can use your Demonic Gateway again 15 sec sooner"
                    if (int32 amount = owner->GetAuraEffectAmount(SPELL_WARLOCK_PVP_4P_BONUS, EFFECT_0))
                        if (Aura * aura = target->GetAura(SPELL_WARLOCK_DEMONIC_GATEWAY_DEBUFF))
                            aura->SetDuration(aura->GetDuration() - amount * IN_MILLISECONDS);
                    break;
                }
            }
        };
};

// Fear - 5782
class spell_warlock_fear : public SpellScriptLoader
{
    public:
        spell_warlock_fear() : SpellScriptLoader("spell_warlock_fear") { }

        class spell_warlock_fear_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_fear_SpellScript);

            void HandleHit(SpellEffIndex /*effIndex*/)
            {
                Unit * caster = GetCaster();
                caster->CastSpell(GetHitUnit(), caster->HasAura(SPELL_WARLOCK_GLYPH_OF_FEAR) ? SPELL_WARLOCK_FEAR_ROOT : SPELL_WARLOCK_FEAR_FLEE, true);
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_warlock_fear_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_fear_SpellScript();
        }
};

// Life Tap - 1454
class spell_warlock_life_tap : public SpellScriptLoader
{
    public:
        spell_warlock_life_tap() : SpellScriptLoader("spell_warlock_life_tap") { }

        class spell_warlock_life_tap_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_life_tap_SpellScript);

            void HandleHit(SpellEffIndex effIndex)
            {
                int32 damage = CalculatePct(GetCaster()->GetMaxHealth(), GetSpellInfo()->GetEffect(effIndex)->CalcValue());
                SetHitDamage(damage); // energize
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_warlock_life_tap_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_ENERGIZE);
            }
        };

        class spell_warlock_life_tap_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_life_tap_AuraScript);

            void CalculateAmount(AuraEffect const* aurEff, int32 & amount, bool & /*canBeRecalculated*/)
            {
                // for Glyph of Life Tap "Your Life Tap no longer consumes health, but instead absorbs(TOTAL_HEALTH * 0.15) healing received. This effect stacks."
                int32 oldAmount = GetCaster()->GetAuraEffectAmount(GetSpellInfo()->Id, aurEff->GetEffIndex());
                amount = CalculatePct(GetCaster()->GetMaxHealth(), amount) + oldAmount;
            }

            void Register() override
            {
                DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_warlock_life_tap_AuraScript::CalculateAmount, EFFECT_2, SPELL_AURA_SCHOOL_HEAL_ABSORB);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_life_tap_AuraScript();
        }

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_life_tap_SpellScript();
        }
};

// Immolation Aura - 104025
class spell_warlock_immolation_aura : public SpellScriptLoader
{
    public:
        spell_warlock_immolation_aura() : SpellScriptLoader("spell_warlock_immolation_aura") { }

        class spell_warlock_immolation_aura_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_immolation_aura_AuraScript);

            void CalculateAmount(AuraEffect const* /*aurEff*/, int32& /*amount*/, bool & /*canBeRecalculated*/)
            {
            }

            void PeriodicTick(AuraEffect const* /*aurEff*/)
            {
                if (Unit * caster = GetCaster())
                    caster->CastSpell(caster, SPELL_WARLOCK_HELLFIRE_DAMAGE, true);
            }

            void Register() override
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_warlock_immolation_aura_AuraScript::PeriodicTick, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_immolation_aura_AuraScript();
        }
};

// 104318 - Fel Firebolt @ Wild Imp
class spell_warlock_fel_firebolt_wild_imp : public SpellScriptLoader
{
    public:
        spell_warlock_fel_firebolt_wild_imp() : SpellScriptLoader("spell_warlock_fel_firebolt_wild_imp") { }

        class spell_warlock_fel_firebolt_wild_imp_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_fel_firebolt_wild_imp_SpellScript);

            void HandleHit(SpellEffIndex /*effIndex*/)
            {
                // "Increases damage dealt by your Wild Imps' Firebolt by 10%."
                if (Unit * owner = GetCaster()->GetOwner())
                {
                    if (uint32 pct = owner->GetAuraEffectAmount(SPELL_WARLOCK_INFERNAL_FURNACE, EFFECT_0))
                        SetHitDamage(GetHitDamage() + CalculatePct(GetHitDamage(), pct));

                    if (owner->HasAura(SPELL_WARLOCK_STOLEN_POWER))
                    {
                        if (Aura* aur = owner->AddAura(SPELL_WARLOCK_STOLEN_POWER_COUNTER, owner))
                        {
                            if (aur->GetStackAmount() == 100)
                            {
                                owner->CastSpell(owner, SPELL_WARLOCK_STOLEN_POWER_BUFF, true);
                                aur->Remove();
                            }
                        }
                    }
                }
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_warlock_fel_firebolt_wild_imp_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_fel_firebolt_wild_imp_SpellScript();
        }
};

// Wild Imp - 55659
class npc_warlock_wild_imp : public CreatureScript
{
    public:
        npc_warlock_wild_imp() : CreatureScript("npc_warlock_wild_imp") { }

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_warlock_wild_impAI(creature);
        }

        struct npc_warlock_wild_impAI : public ScriptedAI
        {
            npc_warlock_wild_impAI(Creature* creature) : ScriptedAI(creature) { }

            uint32 attacks;
            float maxDistance;
            void Reset() override
            {
                me->SetControlled(true, UNIT_STATE_ROOT);
                maxDistance = sSpellMgr->GetSpellInfo(SPELL_WARLOCK_PET_FEL_FIREBOLT)->RangeEntry->RangeMax[0];
                attacks = 10;
                if (me->GetOwner() && me->GetOwner()->HasAura(SPELL_WARLOCK_THE_EXPANDABLES))
                    me->CastSpell(me, SPELL_WARLOCK_THE_EXPANDABLES, true);
                if (me->GetOwner() && me->GetOwner()->HasAura(SPELL_WARLOCK_IMPERATOR))
                    me->CastSpell(me, SPELL_WARLOCK_IMPERATOR, true);
            }

            void UpdateAI(uint32 /*diff*/) override
            {
                Unit * victim = NULL;
                if (Unit * owner = me->GetOwner())
                {
                    victim = owner->GetVictim();
                    if (!victim)
                        if (Player * player = owner->ToPlayer())
                            victim = player->GetSelectedUnit();
                }
                if (!victim || me->IsFriendlyTo(victim))
                {
                    me->SetControlled(false, UNIT_STATE_ROOT);
                    return;
                }
                if (me->IsNonMeleeSpellCast(true, false))
                    return;
                if (!attacks)
                    me->DespawnOrUnsummon();
                else
                {
                    if (me->GetDistance(victim) > maxDistance)
                    {
                        me->SetControlled(false, UNIT_STATE_ROOT);
                        return;
                    }
                    me->SetControlled(true, UNIT_STATE_ROOT);
                    me->CastSpell(victim, SPELL_WARLOCK_PET_FEL_FIREBOLT, false, NULL, NULL, me->GetOwnerGUID());
                    // decrease counter only if spell actually started to be cast (maybe target was out of LoS / etc)
                    if (me->IsNonMeleeSpellCast(true))
                        attacks--;
                }
            }
        };
};

// Grimoire of Sacrifice - 108503
class spell_warlock_grimoire_of_sacrifice : public SpellScriptLoader
{
    public:
        spell_warlock_grimoire_of_sacrifice() : SpellScriptLoader("spell_warlock_grimoire_of_sacrifice") { }

        class spell_warlock_grimoire_of_sacrifice_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_grimoire_of_sacrifice_SpellScript);

            void HandleHit(SpellEffIndex /*effIndex*/)
            {
                Player * player = GetCaster()->ToPlayer();
                if (!player)
                    return;
                Unit * pet = player->GetPet();
                if (!pet)
                    return;

                player->RemoveAura(SPELL_WARLOCK_COMMAND_DEMON_OVERRIDE);

                int32 spellId = 0;
                switch (pet->GetEntry())
                {
                    case NPC_WARLOCK_PET_IMP:
                        spellId = SPELL_WARLOCK_PET_GRIMOIRE_SINGE_MAGIC;
                        break;
                    case NPC_WARLOCK_PET_FEL_HUNTER:
                        spellId = SPELL_WARLOCK_PET_GRIMOIRE_SPELL_LOCK;
                        break;
                    case NPC_WARLOCK_PET_SUCCUBUS:
                        spellId = SPELL_WARLOCK_PET_GRIMOIRE_WHIPLASH;
                        break;
                    case NPC_WARLOCK_PET_VOIDWALKER:
                        spellId = SPELL_WARLOCK_PET_GRIMOIRE_SHADOW_BULWARK;
                        break;
                    case NPC_WARLOCK_PET_FELGUARD:
                        spellId = SPELL_WARLOCK_PET_GRIMOIRE_PURSUIT;
                        break;
                }

                if (spellId)
                    player->CastCustomSpell(player, SPELL_WARLOCK_COMMAND_DEMON_OVERRIDE, &spellId, NULL, NULL, true);

                // add temporary cooldown so it won't trigger Demonic Rebirth
                player->GetSpellHistory()->AddCooldown(SPELL_WARLOCK_DEMONIC_REBIRTH_COOLDOWN_MARKER, 0, std::chrono::seconds(1));
            }

            SpellCastResult CheckRequirement()
            {
                Player * player = GetCaster()->ToPlayer();
                if (!player)
                    return SPELL_FAILED_DONT_REPORT;
                Unit * pet = player->GetPet();
                if (!pet)
                    return SPELL_FAILED_NO_PET;
                if (!pet->IsWithinLOSInMap(player))
                    return SPELL_FAILED_LINE_OF_SIGHT;
                if (pet->GetDistance2d(player) > 100)
                    return SPELL_FAILED_OUT_OF_RANGE;

                return SPELL_CAST_OK;
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_warlock_grimoire_of_sacrifice_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_INSTAKILL);
                OnCheckCast += SpellCheckCastFn(spell_warlock_grimoire_of_sacrifice_SpellScript::CheckRequirement);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_grimoire_of_sacrifice_SpellScript();
        }
};

// Healthstone - 6262
class spell_warlock_healthstone_heal : public SpellScriptLoader
{
    public:
        spell_warlock_healthstone_heal() : SpellScriptLoader("spell_warlock_healthstone_heal") { }

        class spell_warlock_healthstone_heal_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_healthstone_heal_SpellScript);

            void HandleOnHit()
            {
                // Glyph of Healthstone
                if (GetCaster()->HasAura(SPELL_WARLOCK_GLYPH_OF_HEALTHSTONE))
                {
                    PreventHitHeal();
                    return;
                }

                Unit* caster = GetCaster();
                if (!caster || !caster->ToPlayer())
                    return;

                std::list<Unit*> allies;
                GetCaster()->GetFriendlyUnitListInRange(allies, 100.f);

                for (Unit* unit : allies)
                    if (unit->ToPlayer()->IsInSameRaidWith(caster->ToPlayer()))
                        if (uint32 pct = unit->GetAuraEffectAmount(SPELL_WARLOCK_SWEET_SOULS, EFFECT_0))
                            unit->CastCustomSpell(SPELL_WARLOCK_SWEET_SOULS_HEAL, SPELLVALUE_BASE_POINT0, pct, unit, true);
            }

            void Register() override
            {
                OnHit += SpellHitFn(spell_warlock_healthstone_heal_SpellScript::HandleOnHit);
            }
        };

        class spell_warlock_healthstone_heal_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_healthstone_heal_AuraScript);

            void CalculateAmount(AuraEffect const* aurEff, int32 & amount, bool &)
            {
                Unit * caster = GetCaster();
                if (!caster)
                    return;

                amount = 0;
                // Glyph of Healthstone
                if (Aura * glyph = caster->GetAura(SPELL_WARLOCK_GLYPH_OF_HEALTHSTONE))
                {
                    int32 heal = int32(CalculatePct(GetCaster()->GetMaxHealth(), GetSpellInfo()->GetEffect(EFFECT_1)->CalcValue(caster)));
                    // manually calculate total ticks because aura duration isn't set yet by glyph's spellmod, it's still 0 when this code executes
                    int32 totalTicks = glyph->GetEffect(EFFECT_1)->GetAmount() / aurEff->GetPeriod();
                    amount = heal / totalTicks;
                }
            }

            void Register() override
            {
                DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_warlock_healthstone_heal_AuraScript::CalculateAmount, EFFECT_1, SPELL_AURA_PERIODIC_HEAL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_healthstone_heal_AuraScript();
        }

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_healthstone_heal_SpellScript();
        }
};

// Doomguard - 11859, Terrorguard - 59000
class npc_warlock_doomguard : public CreatureScript
{
    public:
        npc_warlock_doomguard() : CreatureScript("npc_warlock_doomguard") { }

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_warlock_doomguardAI(creature);
        }

        struct npc_warlock_doomguardAI : public ScriptedAI
        {
            npc_warlock_doomguardAI(Creature* creature) : ScriptedAI(creature) { }

            EventMap events;
            float maxDistance;

            void Reset()
            {
                me->SetClass(CLASS_ROGUE);
                me->SetPowerType(POWER_ENERGY);
                me->SetMaxPower(POWER_ENERGY, 200);
                me->SetPower(POWER_ENERGY, 200);

                events.Reset();
                events.ScheduleEvent(1, 300);

                me->SetControlled(true, UNIT_STATE_ROOT);
                maxDistance = sSpellMgr->GetSpellInfo(SPELL_WARLOCK_PET_DOOMBOLT)->RangeEntry->RangeMax[0];
            }

            void UpdateAI(uint32 diff)
            {
                UpdateVictim();
                if (Unit * owner = me->GetOwner())
                    if (Unit * victim = owner->GetVictim())
                        me->Attack(victim, false);

                events.Update(diff);

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case 1:
                            if (!me->GetVictim())
                            {
                                me->SetControlled(false, UNIT_STATE_ROOT);
                                events.ScheduleEvent(eventId, 100);
                                return;
                            }
                            me->SetControlled(true, UNIT_STATE_ROOT);
                            me->CastSpell(me->GetVictim(), SPELL_WARLOCK_PET_DOOMBOLT, false, NULL, NULL, me->GetOwnerGUID());
                            events.ScheduleEvent(eventId, 3100);
                            break;
                    }
                }
            }
        };
};
// 85692 - Doom Bolt
class spell_warlock_doomguard_doom_bolt : public SpellScriptLoader
{
    public:
        spell_warlock_doomguard_doom_bolt() : SpellScriptLoader("spell_warlock_doomguard_doom_bolt") { }

        class spell_warlock_doomguard_doom_bolt_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_doomguard_doom_bolt_SpellScript);

            void HandleHit(SpellEffIndex /*effIndex*/)
            {
                // "Deals 20% additional damage to targets below 20% health"
                if (GetHitUnit()->HasAuraState(AURA_STATE_HEALTHLESS_20_PERCENT))
                {
                    uint32 damage = GetHitDamage();
                    AddPct(damage, GetSpellInfo()->GetEffect(EFFECT_1)->BasePoints);
                    SetHitDamage(damage);
                }
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_warlock_doomguard_doom_bolt_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_doomguard_doom_bolt_SpellScript();
        }
};

// 103103 - Malefic Grasp
class spell_warlock_malefic_grasp : public SpellScriptLoader
{
    public:
        spell_warlock_malefic_grasp() : SpellScriptLoader("spell_warlock_malefic_grasp") { }

        class spell_warlock_malefic_grasp_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_malefic_grasp_AuraScript);

            void PeriodicTick(AuraEffect const* /*aurEff*/)
            {
                Unit * target = GetUnitOwner();
                Unit * caster = GetCaster();
                if (!target || !caster)
                    return;

                caster->SendPlaySpellVisual(target->GetGUID(), VISUAL_MALEFIC_GRASP);
            }

            void Register() override
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_warlock_malefic_grasp_AuraScript::PeriodicTick, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_malefic_grasp_AuraScript();
        }
};

// 119678 - Soul Swap (Soulburn)
class spell_warlock_soul_swap_soulburn : public SpellScriptLoader
{
    public:
        spell_warlock_soul_swap_soulburn() : SpellScriptLoader("spell_warlock_soul_swap_soulburn") { }

        class spell_warlock_soul_swap_soulburn_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_soul_swap_soulburn_SpellScript);

            void HandleHit(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                uint32 spellsToCast[3] = { SPELL_WARLOCK_AGONY, SPELL_WARLOCK_CORRUPTION_TRIGGERED, SPELL_WARLOCK_UNSTABLE_AFFLICTION };
                Unit * target = GetHitUnit();
                Unit * caster = GetCaster();
                caster->Variables.Set("Spells.MustHit", true);
                for (auto spellId : spellsToCast)
                {
                    Spell * spell = new Spell(caster, sSpellMgr->GetSpellInfo(spellId), TRIGGERED_FULL_MASK);
                    spell->Variables.Set("ForceIgnoreMoving", true);
                    SpellCastTargets targets;
                    targets.SetUnitTarget(target);
                    spell->prepare(&targets);
                }
                caster->Variables.Remove("Spells.MustHit");
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_warlock_soul_swap_soulburn_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_soul_swap_soulburn_SpellScript();
        }
};

// 5697 - Unending Breath
class spell_warlock_unending_breath : public SpellScriptLoader
{
    public:
        spell_warlock_unending_breath() : SpellScriptLoader("spell_warlock_unending_breath") { }

        class spell_warlock_unending_breath_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_unending_breath_SpellScript);

            void HandleHit(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                Unit * caster = GetCaster();
                if (Unit * target = GetHitUnit())
                    if (caster->HasAura(SPELL_WARLOCK_SOULBURN))
                        caster->CastSpell(target, SPELL_WARLOCK_SOULBURN_UNENDING_BREATH, true);
            }

            void Register() override
            {
                OnEffectLaunchTarget += SpellEffectFn(spell_warlock_unending_breath_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_APPLY_AURA);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_unending_breath_SpellScript();
        }
};

// 116858 - Chaos Bolt
// 215279 - Chaos Tear's Chaos Bolt
class spell_warlock_chaos_bolt : public SpellScriptLoader
{
    public:
        spell_warlock_chaos_bolt() : SpellScriptLoader("spell_warlock_chaos_bolt") { }

        class spell_warlock_chaos_bolt_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_chaos_bolt_SpellScript);

            void HandleLaunch(SpellEffIndex /*effIndex*/)
            {
                Player* caster = GetCaster()->ToPlayer();
                if (!caster)
                    return;
                // snapshot critical strike chance
                caster->Variables.Set<float>("Spells.ChaosBoltCriticalChance", caster->m_activePlayerData->SpellCritPercentage);
            }

            void HandleHitTarget(SpellEffIndex /*effIndex*/)
            {
                Player * caster = GetCaster()->ToPlayer();
                Unit* target = GetHitUnit();
                if (!caster || !target)
                    return;

                if (caster->HasAura(SPELL_WARLOCK_INTERNAL_COMBUSTION_TALENT_AURA)) {
                    int32 maxDuration = sSpellMgr->GetSpellInfo(SPELL_WARLOCK_INTERNAL_COMBUSTION_TALENT_AURA)->GetEffect(EFFECT_0)->BasePoints * 1000;
                    if (AuraApplication * immolate = target->GetAuraApplication(SPELL_WARLOCK_IMMOLATE_DOT, caster->GetGUID())) {
                        AuraEffect *pDamageEffect = immolate->GetBase()->GetEffect(EFFECT_0);
                        int32 damageToRetain = pDamageEffect->GetDamage();
                        if (immolate->GetBase()->GetDuration() < maxDuration) {
                            damageToRetain *= pDamageEffect->GetTotalTicks() - pDamageEffect->GetTickNumber();
                        } else {
                            damageToRetain *= maxDuration / pDamageEffect->GetPeriod();
                        }
                        immolate->GetBase()->ModDuration(-maxDuration);
                        caster->CastCustomSpell(target, SPELL_WARLOCK_INTERNAL_COMBUSTION_DMG, &damageToRetain, NULL, NULL, true);
                    }
                }

                if (caster->HasAura(SPELL_WARLOCK_ERADICATION_AURA)) {
                    caster->CastSpell(target, SPELL_WARLOCK_ERADICATION_DEBUF, true);
                }
            }

            void Register() override
            {
                OnEffectLaunchTarget += SpellEffectFn(spell_warlock_chaos_bolt_SpellScript::HandleLaunch, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
                OnEffectHitTarget += SpellEffectFn(spell_warlock_chaos_bolt_SpellScript::HandleHitTarget, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_chaos_bolt_SpellScript();
        }
};

// 63106 - Siphon Life @ Glyph of Siphon Life
class spell_warlock_siphon_life : public SpellScriptLoader
{
    public:
        spell_warlock_siphon_life() : SpellScriptLoader("spell_warlock_siphon_life") { }

        class spell_warlock_siphon_life_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_siphon_life_SpellScript);

            void HandleHit(SpellEffIndex effIndex)
            {
                Unit * caster = GetCaster();
                uint32 heal = caster->SpellHealingBonusDone(caster, GetSpellInfo(), caster->CountPctFromMaxHealth(GetSpellInfo()->GetEffect(effIndex)->BasePoints), HEAL, GetEffectInfo());
                heal /= 100; // 0.5%
                heal = caster->SpellHealingBonusTaken(caster, GetSpellInfo(), heal, HEAL, GetEffectInfo());
                SetHitHeal(heal);
                PreventHitDefaultEffect(effIndex);
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_warlock_siphon_life_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_HEAL_PCT);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_siphon_life_SpellScript();
        }
};

// Raging Soul handled via Dark Soul: Instability (113858) \ Knowledge (113861) \ Misery (113860)
class spell_warlock_4p_t14_pve : public SpellScriptLoader
{
    public:
        spell_warlock_4p_t14_pve() : SpellScriptLoader("spell_warlock_4p_t14_pve") { }

        class spell_warlock_4p_t14_pve_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_4p_t14_pve_SpellScript);

            void HandleAfterCast()
            {
                if (Unit* caster = GetCaster())
                {
                    if (caster->HasAura(SPELL_WARLOCK_T14_BONUS))
                        caster->CastSpell(caster, SPELL_WARLOCK_RAGING_SOUL, true);
                }
            }

            void Register() override
            {
                OnCast += SpellCastFn(spell_warlock_4p_t14_pve_SpellScript::HandleAfterCast);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_4p_t14_pve_SpellScript();
        }
};

// Unbound Will - 108482
class spell_warlock_unbound_will : public SpellScriptLoader
{
    public:
        spell_warlock_unbound_will() : SpellScriptLoader("spell_warlock_unbound_will") { }

        class spell_warlock_unbound_will_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_unbound_will_SpellScript);

            void HandleOnHit()
            {
                if (Player* player = GetCaster()->ToPlayer())
                {
                    player->RemoveMovementImpairingAuras();

                    std::vector<uint32> auraTypes;
                    auraTypes.push_back(SPELL_AURA_MOD_CONFUSE);
                    auraTypes.push_back(SPELL_AURA_MOD_FEAR);
                    auraTypes.push_back(SPELL_AURA_MOD_STUN);
                    auraTypes.push_back(SPELL_AURA_MOD_ROOT);
                    auraTypes.push_back(SPELL_AURA_TRANSFORM);

                    Aura* auraToSkip = NULL;
                    std::vector<uint32> aurasToSkip;
                    aurasToSkip.push_back(144574); // Corrupted Prison @ Sha of Pride @ Siege of Orgrimmar
                    aurasToSkip.push_back(144636); // Corrupted Prison @ Sha of Pride @ Siege of Orgrimmar
                    aurasToSkip.push_back(144683); // Corrupted Prison @ Sha of Pride @ Siege of Orgrimmar
                    aurasToSkip.push_back(144684); // Corrupted Prison @ Sha of Pride @ Siege of Orgrimmar
                    for (auto aura : aurasToSkip)
                    {
                        auraToSkip = player->GetAura(aura);
                        if (auraToSkip)
                            break;
                    }

                    for (auto auraType : auraTypes)
                        player->RemoveAurasByType((AuraType)auraType, ObjectGuid::Empty, auraToSkip);
                }
            }

            void Register() override
            {
                OnHit += SpellHitFn(spell_warlock_unbound_will_SpellScript::HandleOnHit);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_unbound_will_SpellScript();
        }
};

// 6358 - Seduction, 115268 - Mesmerize
class spell_warlock_seduction : public SpellScriptLoader
{
    public:
        spell_warlock_seduction() : SpellScriptLoader("spell_warlock_seduction") { }

        class spell_warlock_seduction_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_seduction_AuraScript);

            void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                // Glyph of Demon Training
                Unit * target = GetTarget();
                Unit * caster = GetCaster();
                if (!caster)
                    return;
                if (Unit * owner = caster->GetOwner())
                {
                    if (owner->HasAura(SPELL_WARLOCK_GLYPH_OF_DEMON_TRAINING))
                    {
                        target->RemoveAurasByType(SPELL_AURA_PERIODIC_DAMAGE);
                        target->RemoveAurasByType(SPELL_AURA_PERIODIC_DAMAGE_PERCENT);
                    }
                }

                // remove invisibility from Succubus on successful cast
                caster->RemoveAura(SPELL_WARLOCK_PET_LESSER_INVISIBILITY);
            }

            void Register() override
            {
                OnEffectApply += AuraEffectApplyFn(spell_warlock_seduction_AuraScript::OnApply, EFFECT_0, SPELL_AURA_MOD_STUN, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_seduction_AuraScript();
        }
};

// 3110 - Firebolt
class spell_warlock_imp_firebolt : public SpellScriptLoader
{
    public:
        spell_warlock_imp_firebolt() : SpellScriptLoader("spell_warlock_imp_firebolt") { }

        class spell_warlock_imp_firebolt_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_imp_firebolt_SpellScript);

            void HandleHit(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                Unit* target = GetHitUnit();
                if (!caster || !caster->GetOwner() || !target)
                    return;

                Unit* owner = caster->GetOwner();
                int32 damage = GetHitDamage();
                if (target->HasAura(SPELL_WARLOCK_IMMOLATE_DOT, owner->GetGUID()))
                    AddPct(damage, owner->GetAuraEffectAmount(SPELL_WARLOCK_FIREBOLT_BONUS, EFFECT_0));

                SetHitDamage(damage);
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_warlock_imp_firebolt_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_imp_firebolt_SpellScript();
        }
};

class npc_warlock_infernal : public CreatureScript
{
    public:
        npc_warlock_infernal() : CreatureScript("npc_warlock_infernal") { }

        struct npc_warlock_infernalAI : public ScriptedAI
        {
            npc_warlock_infernalAI(Creature *c) : ScriptedAI(c)
            {
            }

            Position spawnPos;

            void Reset() override
            {
                spawnPos = me->GetPosition();

                // if we leave default state (ASSIST) it will passively be controlled by warlock
                me->SetReactState(REACT_PASSIVE);

                // melee damage
                if (Unit * owner = me->GetOwner())
                    if (Player * player = owner->ToPlayer())
                    {
                        bool isLordSummon = me->GetEntry() == 108452;

                        uint32 spellPower = player->SpellBaseDamageBonusDone(SPELL_SCHOOL_MASK_FIRE);
                        uint32 dmg = CalculatePct(spellPower, isLordSummon ? 30 : 50);
                        uint32 diff = CalculatePct(dmg, 10);
                        me->SetBaseWeaponDamage(BASE_ATTACK, MINDAMAGE, dmg - diff);
                        me->SetBaseWeaponDamage(BASE_ATTACK, MAXDAMAGE, dmg + diff);

                        if (isLordSummon)
                            return;

                        if (player->HasAura(SPELL_WARLOCK_LORD_OF_THE_FLAMES) && !player->HasAura(SPELL_WARLOCK_LORD_OF_THE_FLAMES_CD))
                        {
                            std::vector<float> angleOffsets{ float(M_PI) / 2.f, float(M_PI), 3.f * float(M_PI) / 2.f };
                            for (uint32 i = 0; i < 3; ++i)
                                player->CastSpell(me, SPELL_WARLOCK_LORD_OF_THE_FLAMES_SUMMON, true);

                            player->CastSpell(player, SPELL_WARLOCK_LORD_OF_THE_FLAMES_CD, true);
                        }
                    }
            }

            void UpdateAI(uint32 /*diff*/) override
            {
                if (!me->HasAura(SPELL_WARLOCK_IMMOLATION))
                    DoCast(SPELL_WARLOCK_IMMOLATION);

                // "The Infernal deals strong area of effect damage, and will be drawn to attack targets near the impact point"
                if (!me->GetVictim())
                {
                    std::list<Unit*> targets;
                    Unit* preferredTarget = NULL;
                    float prefferedDist = 100.0f;
                    me->GetAttackableUnitListInRange(targets, 100.0f);
                    for (auto target : targets)
                    {
                        float dist = target->GetDistance2d(spawnPos.GetPositionX(), spawnPos.GetPositionY());
                        if (dist < prefferedDist)
                        {
                            preferredTarget = target;
                            prefferedDist = dist;
                        }
                    }
                    if (preferredTarget)
                        me->AI()->AttackStart(preferredTarget);
                }

                DoMeleeAttackIfReady();
            }
        };

        CreatureAI *GetAI(Creature *creature) const
        {
            return new npc_warlock_infernalAI(creature);
        }
};

// 103964 - Touch of Chaos
class spell_warlock_touch_of_chaos : public SpellScriptLoader
{
    public:
        spell_warlock_touch_of_chaos() : SpellScriptLoader("spell_warlock_touch_of_chaos") { }

        class spell_warlock_touch_of_chaos_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_touch_of_chaos_SpellScript);

            void HandleHit(SpellEffIndex /*effIndex*/)
            {
                if (Aura * aura = GetHitUnit()->GetAura(SPELL_WARLOCK_CORRUPTION_TRIGGERED, GetCaster()->GetGUID()))
                    aura->ModDuration(6 * IN_MILLISECONDS);
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_warlock_touch_of_chaos_SpellScript::HandleHit, EFFECT_1, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_touch_of_chaos_SpellScript();
        }
};

// 27243 - Seed of Corruption
class spell_warlock_seed_of_corruption : public SpellScriptLoader
{
    public:
        spell_warlock_seed_of_corruption() : SpellScriptLoader("spell_warlock_seed_of_corruption") { }

        class spell_warlock_seed_of_corruption_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_seed_of_corruption_SpellScript);

            void FilterTargets(std::list<WorldObject*>& unitList)
            {
                Unit* caster = GetCaster();
                Unit* explTarget = GetExplTargetUnit();
                if (!caster || !explTarget)
                    return;

                if (uint32 maxTargets = caster->GetAuraEffectAmount(SPELL_WARLOCK_SOW_THE_SEEDS, EFFECT_0))
                {
                    if (unitList.size() > maxTargets + 1)
                        unitList.resize(maxTargets + 1);
                    return;
                }

                if (!explTarget->HasAura(SPELL_WARLOCK_SEED_OF_CORRUPTION, caster->GetGUID()))
                {
                    unitList.clear();
                    unitList.push_back(explTarget);
                    return;
                }

                WorldObject* target = NULL;
                for (WorldObject* wobj : unitList)
                {
                    Unit* unit = wobj->ToUnit();
                    if (!unit)
                        continue;

                    if (unit->HasAura(SPELL_WARLOCK_SEED_OF_CORRUPTION, caster->GetGUID()))
                        continue;

                    target = wobj;
                    break;
                }

                if (!target)
                    target = explTarget;

                unitList.clear();
                unitList.push_back(target);
            }

            void PreventVisual(SpellEffIndex effIndex)
            {
                Unit* caster = GetCaster();
                Unit* target = GetHitUnit();
                if (!caster || !target)
                    return;

                if (target->HasAura(SPELL_WARLOCK_SEED_OF_CORRUPTION, caster->GetGUID()) && !caster->HasAura(SPELL_WARLOCK_SOW_THE_SEEDS))
                    PreventHitEffect(effIndex);
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_warlock_seed_of_corruption_SpellScript::PreventVisual, EFFECT_0, SPELL_EFFECT_DUMMY);
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_warlock_seed_of_corruption_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_DEST_AREA_ENEMY);
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_warlock_seed_of_corruption_SpellScript::FilterTargets, EFFECT_2, TARGET_UNIT_DEST_AREA_ENEMY);
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_warlock_seed_of_corruption_SpellScript::FilterTargets, EFFECT_3, TARGET_UNIT_DEST_AREA_ENEMY);
            }
        };

        class spell_warlock_seed_of_corruption_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_seed_of_corruption_AuraScript);

            void OnProc(AuraEffect const* aurEff, ProcEventInfo& eventInfo)
            {
                Unit * caster = GetCaster();
                if (!caster)
                    return;
                PreventDefaultAction();
                uint32 damage = eventInfo.GetDamageInfo()->GetDamage();
                Unit * victim = eventInfo.GetDamageInfo()->GetVictim();
                Unit * attacker = eventInfo.GetDamageInfo()->GetAttacker();

                if (attacker != caster)
                    return;

                int32 remainingAmount = aurEff->GetAmount() - damage;
                if (remainingAmount <= 0)
                {
                    DetonateIfPossible(caster, victim);
                }
                else
                    GetEffect(EFFECT_2)->SetAmount(remainingAmount);
            }

            void CalculateAmount(AuraEffect const* /*aurEff*/, int32 & amount, bool & /*canBeRecalculated*/)
            {
                // "When the target takes $SPS * $s1 / 100 damage from your spells"
                if (Unit* caster = GetCaster())
                {
                    if (Player* playerCaster = caster->ToPlayer())
                    {
                        uint32 spellPowerForSchool = playerCaster->m_activePlayerData->ModDamageDonePos[SPELL_SCHOOL_SHADOW] - playerCaster->m_activePlayerData->ModDamageDoneNeg[SPELL_SCHOOL_SHADOW];
                        amount += CalculatePct(spellPowerForSchool, sSpellMgr->GetSpellInfo(SPELL_WARLOCK_SEED_OF_CORRUPTION)->GetEffect(EFFECT_0)->BasePoints);
                    }
                }
            }

            void PeriodicTick(AuraEffect const* /*aurEff*/)
            {
                Unit* caster = GetCaster();
                Unit* victim = GetUnitOwner();
                if (!caster || !victim)
                    return;

                DetonateIfPossible(caster, victim);
            }

            void DetonateIfPossible(Unit* caster, Unit* victim)
            {
                if (!GetAura()->Variables.Exist("_alreadyDetonated"))
                {
                    GetAura()->Variables.Set("_alreadyDetonated", 0);
                    Remove();
                    caster->CastSpell(victim, SPELL_WARLOCK_SEED_OF_CORRUPTION_DETONATION, true);
                }
            }

            void Register() override
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_warlock_seed_of_corruption_AuraScript::PeriodicTick, EFFECT_1, SPELL_AURA_PERIODIC_DUMMY);
                DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_warlock_seed_of_corruption_AuraScript::CalculateAmount, EFFECT_2, SPELL_AURA_DUMMY);
                OnEffectProc += AuraEffectProcFn(spell_warlock_seed_of_corruption_AuraScript::OnProc, EFFECT_2, SPELL_AURA_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_seed_of_corruption_SpellScript();
        }

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_seed_of_corruption_AuraScript();
        }
};

// 111397 - Blood Horror
class spell_warlock_blood_horror : public SpellScriptLoader
{
    public:
        spell_warlock_blood_horror() : SpellScriptLoader("spell_warlock_blood_horror") { }

        class spell_warlock_blood_horror_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_blood_horror_AuraScript);

            void OnProc(AuraEffect const* /*aurEff*/, ProcEventInfo& eventInfo)
            {
                Unit * caster = GetCaster();
                Unit * target = eventInfo.GetDamageInfo()->GetAttacker();
                if (!caster || !target)
                    return;

                // prevent charge drop by default, will be enabled if proc is valid
                //PreventChargeDrop();

                // don't proc from Heroic Leap damage
                if (auto procSpell = eventInfo.GetDamageInfo()->GetSpellInfo())
                    if (procSpell->Id == 52174)
                        return;

                // triggered only by players or non-pet creatures
                if (target->ToPlayer() || (target->ToCreature() && !target->GetCharmerOrOwnerPlayerOrPlayerItself()))
                {
                    caster->CastSpell(target, SPELL_WARLOCK_BLOOD_HORROR_TRIGGERED, true);
                    // allow charge drop
                    //PreventChargeDrop(false);
                }
            }

            void Register() override
            {
                OnEffectProc += AuraEffectProcFn(spell_warlock_blood_horror_AuraScript::OnProc, EFFECT_0, SPELL_AURA_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_blood_horror_AuraScript();
        }
};

// 114168 - Dark Apotheosis
class spell_warlock_dark_apotheosis : public SpellScriptLoader
{
    public:
        spell_warlock_dark_apotheosis() : SpellScriptLoader("spell_warlock_dark_apotheosis") { }

        class spell_warlock_dark_apotheosis_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_dark_apotheosis_AuraScript);

            int32 initialDemonicFury;
            bool Load() override
            {
                initialDemonicFury = 0;

                return true;
            }

            void ReplaceSpells(bool apply)
            {
                Unit * caster = GetCaster();
                if (!caster)
                    return;
                Player * player = caster->ToPlayer();
                if (!player)
                    return;

                std::map<uint32, uint32> spells;
                spells[SPELL_WARLOCK_SHADOWBOLT] = SPELL_WARLOCK_DEMONIC_SLASH;

                for (auto spell : spells)
                {
                    uint32 oldSpell = spell.first;
                    uint32 newSpell = spell.second;
                    if (apply)
                        player->SendSupercededSpell(oldSpell, newSpell);
                    else
                        player->SendSupercededSpell(newSpell, oldSpell);
                    player->LearnSpell(newSpell, true);
                }

                std::vector<uint32> auras;
                auras.push_back(SPELL_WARLOCK_METAMORPHOSIS_SPELL_REPLACEMENTS);
                auras.push_back(SPELL_WARLOCK_METAMORPHOSIS_ADDITIONAL_AURA);
                auras.push_back(SPELL_WARLOCK_METAMORPHOSIS_ADDITIONAL_AURA_2);
                for (auto aura : auras)
                {
                    if (apply)
                        player->CastSpell(player, aura, true);
                    else
                        player->RemoveAura(aura);
                }

                // disable some overrides
                if (Aura * aura = player->GetAura(SPELL_WARLOCK_METAMORPHOSIS_SPELL_REPLACEMENTS))
                {
                    std::vector<uint32> effects;
                    effects.push_back(EFFECT_1); // Corruption => Doom
                    effects.push_back(EFFECT_3); // Hand of Gul'dan => Chaos Wave
                    for (auto effect : effects)
                        if (AuraEffect * aurEff = aura->GetEffect(effect))
                            aurEff->SetAmount(0);
                }

                // apply Metamorphosis form, needed for Fury Ward
                if (apply)
                    player->SetShapeshiftForm(FORM_METAMORPHOSIS);
                else
                    player->SetShapeshiftForm(FORM_NONE);
            }

            void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                ReplaceSpells(true);
                if (Unit * caster = GetCaster())
                    initialDemonicFury = caster->GetPower(POWER_DEMONIC_FURY);
            }

            void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                ReplaceSpells(false);

                // remove all gained demonic fury
                if (Unit * caster = GetCaster())
                {
                    int32 currentFury = caster->GetPower(POWER_DEMONIC_FURY);
                    if (currentFury > initialDemonicFury)
                        caster->SetPower(POWER_DEMONIC_FURY, initialDemonicFury);
                }
            }

            void CalculateAmount(AuraEffect const* /*aurEff*/, int32 & /*amount*/, bool & /*canBeRecalculated*/)
            {
                Unit * caster = GetCaster();
                if (!caster)
                    return;
                // from Mastery: Master Demonologist tooltip this should be the formula, but it seems to OP, make a custom formula based on a retail screenshot
                // "Reduces the damage you take while in Dark Apotheosis form by ${ $114168m6 + ($77219m1 / ($77219m1 + $114168m1)) * 100 }.2%][]"
                /*float mastery = PROJECT::Mastery::CalculateBonusFloat(caster, 0.0f, -TALENT_SPEC_WARLOCK_DEMONOLOGY, EFFECT_0);
                amount = CalculatePct(mastery, 84) * -1;*/
            }

            void Register() override
            {
                OnEffectApply += AuraEffectApplyFn(spell_warlock_dark_apotheosis_AuraScript::OnApply, EFFECT_4, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
                OnEffectRemove += AuraEffectRemoveFn(spell_warlock_dark_apotheosis_AuraScript::OnRemove, EFFECT_4, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
                DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_warlock_dark_apotheosis_AuraScript::CalculateAmount, EFFECT_1, SPELL_AURA_MOD_DAMAGE_PERCENT_TAKEN);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_dark_apotheosis_AuraScript();
        }
};

// 114175 - Demonic Slash
class spell_warlock_demonic_slash : public SpellScriptLoader
{
    public:
        spell_warlock_demonic_slash() : SpellScriptLoader("spell_warlock_demonic_slash") { }

        class spell_warlock_demonic_slash_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_demonic_slash_SpellScript);

            void HandleAfterCast()
            {
                // manually give 60 Demonic Fury, should be done automatically by spell power system, spell has -60 Demonic Fury cost
                Unit * caster = GetCaster();
                caster->EnergizeBySpell(caster, GetSpellInfo()->Id, 60, POWER_DEMONIC_FURY);
            }

            void Register() override
            {
                AfterCast += SpellCastFn(spell_warlock_demonic_slash_SpellScript::HandleAfterCast);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_demonic_slash_SpellScript();
        }
};

// 3026 - Use Soulstone
class spell_warlock_use_soulstone : public SpellScriptLoader
{
    public:
        spell_warlock_use_soulstone() : SpellScriptLoader("spell_warlock_use_soulstone") { }

        class spell_warlock_use_soulstone_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_use_soulstone_SpellScript);

            void HandleHit(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                Player * player = GetCaster()->ToPlayer();
                if (!player)
                    return;
                Unit * originalCaster = GetOriginalCaster();

                // already have one active request
                if (player->IsResurrectRequested())
                    return;

                int32 healthPct = GetSpellInfo()->GetEffect(EFFECT_1)->CalcValue(originalCaster);
                int32 manaPct = GetSpellInfo()->GetEffect(EFFECT_0)->CalcValue(originalCaster);

                uint32 health = player->CountPctFromMaxHealth(healthPct);
                uint32 mana = 0;
                if (player->GetMaxPower(POWER_MANA) > 0)
                    mana = CalculatePct(player->GetMaxPower(POWER_MANA), manaPct);

                player->ResurrectPlayer(0.0f);
                player->SetHealth(health);
                player->SetPower(POWER_MANA, mana);
                player->SetPower(POWER_RAGE, 0);
                player->SetPower(POWER_ENERGY, player->GetMaxPower(POWER_ENERGY));
                player->SetPower(POWER_FOCUS, 0);
                player->SpawnCorpseBones();
            }

            void Register() override
            {
                OnEffectHit += SpellEffectFn(spell_warlock_use_soulstone_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_SELF_RESURRECT);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_use_soulstone_SpellScript();
        }
};

// 56232 - Glyph of Nightmares
class spell_warlock_glyph_of_nightmares : public SpellScriptLoader
{
    public:
        spell_warlock_glyph_of_nightmares() : SpellScriptLoader("spell_warlock_glyph_of_nightmares") { }

        class spell_warlock_glyph_of_nightmares_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_glyph_of_nightmares_AuraScript);

            void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                Unit * target = GetTarget();
                if (target->HasAura(SPELL_WARLOCK_GLYPH_OF_NIGHTMARES))
                    target->CastSpell(target, SPELL_WARLOCK_GLYPH_OF_NIGHTMARES_TRIGGERED, true);
            }

            void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                GetTarget()->RemoveAura(SPELL_WARLOCK_GLYPH_OF_NIGHTMARES_TRIGGERED);
            }

            void Register() override
            {
                OnEffectRemove += AuraEffectRemoveFn(spell_warlock_glyph_of_nightmares_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_MOUNTED, AURA_EFFECT_HANDLE_REAL);
                OnEffectApply += AuraEffectApplyFn(spell_warlock_glyph_of_nightmares_AuraScript::OnApply, EFFECT_0, SPELL_AURA_MOUNTED, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_glyph_of_nightmares_AuraScript();
        }
};

// 111898 - Grimoire: Felguard
class spell_warlock_grimoire_felguard : public SpellScriptLoader
{
    public:
        spell_warlock_grimoire_felguard() : SpellScriptLoader("spell_warlock_grimoire_felguard") { }

        class spell_warlock_grimoire_felguard_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_grimoire_felguard_SpellScript);

            SpellCastResult CheckRequirement()
            {
                Player * caster = GetCaster()->ToPlayer();
                if (!caster)
                    return SPELL_FAILED_CANT_DO_THAT_RIGHT_NOW;
                // allow only in Demonology spec
                if (caster->GetSpecializationId() != TALENT_SPEC_WARLOCK_DEMONOLOGY)
                    return SPELL_FAILED_NO_SPEC;

                return SPELL_CAST_OK;
            }

            void Register() override
            {
                OnCheckCast += SpellCheckCastFn(spell_warlock_grimoire_felguard_SpellScript::CheckRequirement);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_grimoire_felguard_SpellScript();
        }
};

// 108359 - Dark Regeneration
class spell_warlock_dark_regeneration : public SpellScriptLoader
{
    public:
        spell_warlock_dark_regeneration() : SpellScriptLoader("spell_warlock_dark_regeneration") { }

        class spell_warlock_dark_regeneration_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_dark_regeneration_SpellScript);

            void HandleAfterCast()
            {
                // "Restores 30% of you and your pet's maximum health and increases all healing received by 25% over 12 seconds"
                if (Player * player = GetCaster()->ToPlayer())
                    if (Pet * pet = player->GetPet())
                        pet->CastSpell(pet, GetSpellInfo()->Id, true);
            }

            void Register() override
            {
                AfterCast += SpellCastFn(spell_warlock_dark_regeneration_SpellScript::HandleAfterCast);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_dark_regeneration_SpellScript();
        }
};

// Called by Dark Soul - 77801 ( Generic ), 113858 ( Instability ), 113860 ( Misery ), 113861 ( Knowledge )
class spell_warlock_t15_2p_bonus : public SpellScriptLoader
{
    public:
        spell_warlock_t15_2p_bonus() : SpellScriptLoader("spell_warlock_t15_2p_bonus") { }

        class spell_warlock_t15_2p_bonus_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_t15_2p_bonus_SpellScript);

            void HandleAfterCast()
            {
                if (Unit* caster = GetCaster())
                {
                    if (caster->HasAura(SPELL_WARLOCK_T15_2P_BONUS)) // Check if caster has bonus aura
                        caster->AddAura(SPELL_WARLOCK_T15_2P_BONUS_TRIGGERED, caster);
                }
            }

            void Register() override
            {
                AfterCast += SpellCastFn(spell_warlock_t15_2p_bonus_SpellScript::HandleAfterCast);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_t15_2p_bonus_SpellScript();
        }
};

// 689 - Drain Life, 89420 - Drain Life @ Soulburn, 103990 - Drain Life @ Metamorphosis
class spell_warlock_drain_life : public SpellScriptLoader
{
    public:
        spell_warlock_drain_life() : SpellScriptLoader("spell_warlock_drain_life") { }

        class spell_warlock_drain_life_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_drain_life_AuraScript);

            void PeriodicTick(AuraEffect const* /*aurEff*/)
            {
                Unit * caster = GetCaster();
                if (!caster)
                    return;
                int32 healPct = GetSpellInfo()->GetEffect(EFFECT_1)->BasePoints;
                int32 healAmount = CalculatePct(caster->GetMaxHealth(), healPct);
                // Harvest Life
                if (Aura * harvestLife = caster->GetAura(SPELL_WARLOCK_HARVEST_LIFE))
                    AddPct(healAmount, harvestLife->GetSpellInfo()->GetEffect(EFFECT_1)->BasePoints);

                caster->CastCustomSpell(caster, SPELL_WARLOCK_DRAIN_LIFE_HEAL, &healAmount, NULL, NULL, true);
            }

            void Register() override
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_warlock_drain_life_AuraScript::PeriodicTick, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_drain_life_AuraScript();
        }
};

// 112891 - Howl of Terror
class spell_warlock_howl_of_terror : public SpellScriptLoader
{
    public:
        spell_warlock_howl_of_terror() : SpellScriptLoader("spell_warlock_howl_of_terror") { }

        class spell_warlock_howl_of_terror_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_howl_of_terror_AuraScript);

            void OnProc(AuraEffect const* /*aurEff*/, ProcEventInfo& /*eventInfo*/)
            {
                Player * target = GetUnitOwner()->ToPlayer();
                if (!target)
                    return;
                if (!target->GetSpellHistory()->HasCooldown(SPELL_WARLOCK_HOWL_OF_TERROR))
                    return;
                if (target->GetSpellHistory()->HasCooldown(GetSpellInfo()->Id))
                    return;
                target->GetSpellHistory()->AddCooldown(GetSpellInfo()->Id, 0, std::chrono::seconds(1));

                // "When hit by a damaging attack, the cooldown on Howl of Terror is reduced by 1 sec"
                target->GetSpellHistory()->ModifyCooldown(SPELL_WARLOCK_HOWL_OF_TERROR, std::chrono::seconds(-1));
            }

            void Register() override
            {
                OnEffectProc += AuraEffectProcFn(spell_warlock_howl_of_terror_AuraScript::OnProc, EFFECT_0, SPELL_AURA_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_howl_of_terror_AuraScript();
        }
};

// 86211 - Soul Swap (buff)
class spell_warlock_soul_swap_buff : public SpellScriptLoader
{
    public:
        spell_warlock_soul_swap_buff() : SpellScriptLoader("spell_warlock_soul_swap_buff") { }

        class spell_warlock_soul_swap_buff_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_soul_swap_buff_AuraScript);

            bool Load() override
            {
                originalTarget = ObjectGuid::Empty;
                return true;
            }

        public:

            struct dot
            {
                uint32 spellId;
                uint32 duration;
                uint32 stackAmount;
                int32 initialAmplitude[MAX_SPELL_EFFECTS];
            };
            std::list<dot> dots;
            ObjectGuid originalTarget;

            void AddDot(Aura * aura)
            {
                dot currentDot;
                currentDot.spellId = aura->GetId();
                currentDot.duration = aura->GetDuration();
                currentDot.stackAmount = aura->GetStackAmount();
                for (int i = 0; i < MAX_SPELL_EFFECTS; i++)
                {
                    currentDot.initialAmplitude[i] = 0;
                    if (AuraEffect * aurEff = aura->GetEffect(i))
                        currentDot.initialAmplitude[i] = aurEff->GetPeriod();
                }
                dots.push_back(currentDot);
            }

            void Register() override
            {
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_soul_swap_buff_AuraScript();
        }
};

// 86121 - Soul Swap
class spell_warlock_soul_swap : public SpellScriptLoader
{
    public:
        spell_warlock_soul_swap() : SpellScriptLoader("spell_warlock_soul_swap") { }

        class spell_warlock_soul_swap_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_soul_swap_SpellScript);

            std::vector<uint32> eligibleDots;

            bool Load() override
            {
                eligibleDots.push_back(SPELL_WARLOCK_AGONY);
                eligibleDots.push_back(SPELL_WARLOCK_CORRUPTION_TRIGGERED);
                eligibleDots.push_back(SPELL_WARLOCK_UNSTABLE_AFFLICTION);
                eligibleDots.push_back(SPELL_WARLOCK_SEED_OF_CORRUPTION);
                eligibleDots.push_back(SPELL_WARLOCK_SEED_OF_CORRUPTION_SOULBURN);
                eligibleDots.push_back(SPELL_WARLOCK_DOOM);

                return true;
            }

            SpellCastResult CheckRequirement()
            {
                ObjectGuid casterGuid = GetCaster()->GetGUID();
                Unit * target = GetExplTargetUnit();
                if (!target)
                    return SPELL_FAILED_BAD_TARGETS;
                for (auto eligibleDot : eligibleDots)
                    if (target->HasAura(eligibleDot, casterGuid))
                        return SPELL_CAST_OK;
                return SPELL_FAILED_BAD_TARGETS;
            }

            void HandleHit(SpellEffIndex /*effIndex*/)
            {
                Unit * target = GetHitUnit();
                Unit * caster = GetCaster();

                Aura * aura = caster->AddAura(SPELL_WARLOCK_SOUL_SWAP_BUFF, caster);
                if (!aura)
                    return;

                spell_warlock_soul_swap_buff::spell_warlock_soul_swap_buff_AuraScript* auraScript = dynamic_cast<spell_warlock_soul_swap_buff::spell_warlock_soul_swap_buff_AuraScript*>(aura->GetScriptByName("spell_warlock_soul_swap_buff"));
                if (!auraScript)
                    return;

                auraScript->originalTarget = target->GetGUID();

                // visual from target to caster
                target->CastSpell(caster, SPELL_WARLOCK_SOUL_SWAP_VISUAL, true);

                for (auto eligibleDot : eligibleDots)
                    if (Aura * currentAura = target->GetAura(eligibleDot, caster->GetGUID()))
                        auraScript->AddDot(currentAura);
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_warlock_soul_swap_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_DUMMY);
                OnCheckCast += SpellCheckCastFn(spell_warlock_soul_swap_SpellScript::CheckRequirement);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_soul_swap_SpellScript();
        }
};

// 86213 - Soul Swap Exhale
class spell_warlock_soul_swap_exhale : public SpellScriptLoader
{
    public:
        spell_warlock_soul_swap_exhale() : SpellScriptLoader("spell_warlock_soul_swap_exhale") { }

        class spell_warlock_soul_swap_exhale_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_soul_swap_exhale_SpellScript);

            void HandleHit(SpellEffIndex /*effIndex*/)
            {
                Unit * target = GetHitUnit();
                Unit * caster = GetCaster();

                Aura * aura = caster->GetAura(SPELL_WARLOCK_SOUL_SWAP_BUFF);
                if (!aura)
                    return;

                spell_warlock_soul_swap_buff::spell_warlock_soul_swap_buff_AuraScript* auraScript = dynamic_cast<spell_warlock_soul_swap_buff::spell_warlock_soul_swap_buff_AuraScript*>(aura->GetScriptByName("spell_warlock_soul_swap_buff"));
                if (!auraScript)
                    return;

                caster->CastSpell(caster, SPELL_WARLOCK_SOUL_SWAP_NO_COST, true);

                // hack for SPELL_AURA_MOD_ATTACKER_SPELL_HIT_CHANCE (spells like Cloak of Shadows) / SPELL_AURA_DEFLECT_SPELLS (Deterrence)
                int32 hitChance = 100 + target->GetTotalAuraModifierByMiscMask(SPELL_AURA_MOD_ATTACKER_SPELL_HIT_CHANCE, GetSpellInfo()->GetSchoolMask());
                if (hitChance <= 0 || target->HasAuraType(SPELL_AURA_DEFLECT_SPELLS) || target->HasAuraType(SPELL_AURA_SPELL_MAGNET))
                    return;

                for (auto dot : auraScript->dots)
                {
                    if (auto currentAura = caster->AddAura(dot.spellId, target))
                    {
                        // set stack amount
                        currentAura->SetStackAmount(dot.stackAmount);

                        // set remaining duration
                        // set InitialMaxDurationAfterHaste here because we manually added the aura
                        currentAura->Variables.Set("InitialMaxDurationAfterHaste", currentAura->GetDuration());
                        currentAura->SetDuration(dot.duration);

                        // snapshots
                        for (int effIndex = 0; effIndex < MAX_SPELL_EFFECTS; effIndex++)
                            if (AuraEffect * aurEff = currentAura->GetEffect(effIndex))
                                aurEff->SetPeriodicTimer(dot.initialAmplitude[effIndex]);

                        // and cause them to instantly deal damage
                        for (int effIndex = 0; effIndex < MAX_SPELL_EFFECTS; effIndex++)
                            if (auto aurEff = currentAura->GetEffect(effIndex))
                                if (aurEff->GetPeriodicTimer())
                                    aurEff->SetPeriodicTimer(0);
                    }
                }
            }

            SpellCastResult CheckRequirement()
            {
                // don't allow on same target
                if (Unit * target = GetExplTargetUnit())
                    if (Aura * aura = GetCaster()->GetAura(SPELL_WARLOCK_SOUL_SWAP_BUFF))
                        if (spell_warlock_soul_swap_buff::spell_warlock_soul_swap_buff_AuraScript* auraScript = dynamic_cast<spell_warlock_soul_swap_buff::spell_warlock_soul_swap_buff_AuraScript*>(aura->GetScriptByName("spell_warlock_soul_swap_buff")))
                            if (auraScript->originalTarget == target->GetGUID())
                                return SPELL_FAILED_BAD_TARGETS;

                return SPELL_CAST_OK;
            }

            void Register() override
            {
                OnCheckCast += SpellCheckCastFn(spell_warlock_soul_swap_exhale_SpellScript::CheckRequirement);
                OnEffectLaunchTarget += SpellEffectFn(spell_warlock_soul_swap_exhale_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_soul_swap_exhale_SpellScript();
        }
};

// 48181 - Haunt
class spell_warlock_haunt : public SpellScriptLoader
{
    public:
        spell_warlock_haunt() : SpellScriptLoader("spell_warlock_haunt") { }

        class spell_warlock_haunt_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_haunt_AuraScript);

            void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                Unit * caster = GetCaster();
                if (!caster)
                    return;

                AuraRemoveMode removeMode = GetTargetApplication()->GetRemoveMode();

                switch (removeMode)
                {
                    case AURA_REMOVE_BY_EXPIRE:
                        // Item - Warlock T16 4P Bonus
                        // "Haunt has a 10% chance to refund its shard when expiring."
                        if (int32 chance = caster->GetAuraEffectAmount(SPELL_WARLOCK_T16_4P, EFFECT_0))
                            if (roll_chance_i(chance))
                                caster->CastSpell(caster, SPELL_WARLOCK_SOULSHARD_ENERGIZE, true);
                        break;
                    case AURA_REMOVE_BY_DEATH:
                        caster->GetSpellHistory()->ResetCooldown(GetSpellInfo()->Id, true);
                        break;
                    default:
                        break;
                }
            }

            void Register() override
            {
                OnEffectRemove += AuraEffectRemoveFn(spell_warlock_haunt_AuraScript::OnRemove, EFFECT_1, SPELL_AURA_MOD_SCHOOL_MASK_DAMAGE_FROM_CASTER, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_haunt_AuraScript();
        }
};

class gameobject_warlock_soulwell : public GameObjectScript
{
    public:
        gameobject_warlock_soulwell() : GameObjectScript("gameobject_warlock_soulwell") { }

        struct gameobject_warlock_soulwellAI : public GameObjectAI
        {
            gameobject_warlock_soulwellAI(GameObject* go) : GameObjectAI(go)
            {
            }

            bool GossipHello(Player* player, bool isUse) override
            {
                if (!isUse)
                    return true;

                Unit * owner = go->GetOwner();
                if (!owner || owner->GetTypeId() != TYPEID_PLAYER || !player->IsInSameRaidWith(owner->ToPlayer()))
                    return true;

                // don't allow using it if player already has a Healthstone so it won't consume charges
                if (auto spellInfo = sSpellMgr->GetSpellInfo(SPELL_WARLOCK_CREATE_HEALTHSTONE))
                    if (player->HasItemCount(spellInfo->GetEffect(EFFECT_0)->ItemType))
                        return true;

                return false;

            }
        };

        GameObjectAI* GetAI(GameObject* go) const override
        {
            return new gameobject_warlock_soulwellAI(go);
        }
};

// 145072 - Item - Warlock T16 2P Bonus
class spell_warlock_t16_demo_2p : public SpellScriptLoader
{
    public:
        spell_warlock_t16_demo_2p() : SpellScriptLoader("spell_warlock_t16_demo_2p") { }

        class spell_warlock_t16_demo_2p_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_t16_demo_2p_AuraScript);

            void OnProc(AuraEffect const* aurEff, ProcEventInfo& eventInfo)
            {
                uint32 procSpellId = 0;
                if (auto spellInfo = eventInfo.GetDamageInfo()->GetSpellInfo())
                    procSpellId = spellInfo->Id;
                uint32 chance = 0;
                uint32 triggeredSpellId = 0;
                switch (procSpellId)
                {
                    case SPELL_WARLOCK_CONFLAGRATE:
                    case SPELL_WARLOCK_CONFLAGRATE_FIRE_AND_BRIMSTONE:
                        chance = aurEff->GetSpellInfo()->GetEffect(EFFECT_3)->BasePoints;
                        triggeredSpellId = 145075; // Destructive Influence
                        break;
                    case SPELL_WARLOCK_UNSTABLE_AFFLICTION:
                        chance = aurEff->GetSpellInfo()->GetEffect(EFFECT_1)->BasePoints;
                        triggeredSpellId = 145082; // Empowered Grasp
                        break;
                    case SPELL_WARLOCK_SOUL_FIRE:
                    case SPELL_WARLOCK_SOUL_FIRE_METAMORPHOSIS:
                        chance = aurEff->GetSpellInfo()->GetEffect(EFFECT_3)->BasePoints;
                        triggeredSpellId = 145085; // Fiery Wrath
                        break;
                    default:
                        return;
                }
                if (!roll_chance_i(chance))
                    return;
                Unit * caster = GetUnitOwner();
                caster->CastSpell(caster, triggeredSpellId, true);
            }

            void Register() override
            {
                OnEffectProc += AuraEffectProcFn(spell_warlock_t16_demo_2p_AuraScript::OnProc, EFFECT_0, SPELL_AURA_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_t16_demo_2p_AuraScript();
        }
};

// 145091 - Item - Warlock T16 4P Bonus
class spell_warlock_t16_4p : public SpellScriptLoader
{
    public:
        spell_warlock_t16_4p() : SpellScriptLoader("spell_warlock_t16_4p") { }

        class spell_warlock_t16_4p_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_t16_4p_AuraScript);

            void PeriodicTick(AuraEffect const* aurEffConst)
            {
                // "When a Burning Ember fills up, your critical strike chance is increased by 15% for 5 seconds"
                Player * caster = GetUnitOwner()->ToPlayer();
                if (!caster || caster->HasAura(SPELL_WARLOCK_T16_4P_INTERNAL_CD))
                    return;
                // allow only in Destruction
                if (caster->GetSpecializationId() != TALENT_SPEC_WARLOCK_DESTRUCTION)
                    return;

                AuraEffect * aurEff = const_cast<AuraEffect*>(aurEffConst);
                uint32 currentPower = caster->GetPower(POWER_BURNING_EMBERS) / 10;
                uint32 oldPower = aurEff->GetAmount();
                if (currentPower > oldPower)
                {
                    caster->CastSpell(caster, SPELL_WARLOCK_T16_4P_TRIGGERED, true);
                    caster->CastSpell(caster, SPELL_WARLOCK_T16_4P_INTERNAL_CD, true);
                }
                aurEff->SetAmount(currentPower);
            }

            void OnProc(AuraEffect const* /*aurEff*/, ProcEventInfo& eventInfo)
            {
                if (!eventInfo.GetDamageInfo())
                    return;

                Unit* caster = GetUnitOwner();
                Unit* victim = eventInfo.GetDamageInfo()->GetVictim();
                if (!caster || !victim)
                    return;
                // "Shadow Bolt and Touch of Chaos have a 8% chance to also cast Hand of Gul'dan at the target"
                caster->CastSpell(victim, SPELL_WARLOCK_HAND_OF_GULDAN, true);
            }

            void Register() override
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_warlock_t16_4p_AuraScript::PeriodicTick, EFFECT_31, SPELL_AURA_PERIODIC_DUMMY);
                OnEffectProc += AuraEffectProcFn(spell_warlock_t16_4p_AuraScript::OnProc, EFFECT_0, SPELL_AURA_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_t16_4p_AuraScript();
        }
};

// 111400 - Burning Rush
class spell_warlock_burning_rush : public SpellScriptLoader
{
public:
    spell_warlock_burning_rush() : SpellScriptLoader("spell_warlock_burning_rush") { }

    class spell_warlock_burning_rush_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warlock_burning_rush_AuraScript);

        void PeriodicTick(AuraEffect const* /*aurEff*/)
        {
            if (Unit* caster = GetUnitOwner())
                if (caster->HealthBelowPct(GetSpellInfo()->GetEffect(EFFECT_1)->CalcValue()))
                {
                    caster->RemoveAura(GetId());
                    PreventDefaultAction();
                }
        }

        void Register() override
        {
            OnEffectPeriodic += AuraEffectPeriodicFn(spell_warlock_burning_rush_AuraScript::PeriodicTick, EFFECT_3, SPELL_AURA_PERIODIC_DAMAGE_PERCENT);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warlock_burning_rush_AuraScript();
    }
};

// 30146, 112870 - Summon Felguard, Summon Wrathguard
class spell_warlock_glyph_of_felguard : public SpellScriptLoader
{
public:
    spell_warlock_glyph_of_felguard() : SpellScriptLoader("spell_warlock_glyph_of_felguard") { }

    class spell_warlock_glyph_of_felguard_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warlock_glyph_of_felguard_SpellScript);

        void HandleAfterHit()
        {
            if (Player* caster = GetCaster()->ToPlayer())
            {
                if (!caster->HasAura(SPELL_WARLOCK_GLYPH_OF_FELGUARD))
                    return;

                uint32 itemEntry = 0;
                for (int i = INVENTORY_SLOT_ITEM_START; i < INVENTORY_SLOT_ITEM_END; ++i)
                    if (Item* pItem = caster->GetItemByPos(INVENTORY_SLOT_BAG_0, i))
                        if (const ItemTemplate* itemplate = pItem->GetTemplate())
                            if (itemplate->GetClass() == ITEM_CLASS_WEAPON && (
                                itemplate->GetSubClass() == ITEM_SUBCLASS_WEAPON_SWORD2 ||
                                itemplate->GetSubClass() == ITEM_SUBCLASS_WEAPON_AXE2 ||
                                itemplate->GetSubClass() == ITEM_SUBCLASS_WEAPON_AXE2 ||
                                itemplate->GetSubClass() == ITEM_SUBCLASS_WEAPON_MACE2 ||
                                itemplate->GetSubClass() == ITEM_SUBCLASS_WEAPON_POLEARM))
                            {
                                itemEntry = itemplate->GetId();
                                break;
                            }

                if (Pet* pet = ObjectAccessor::GetPet(*caster, caster->GetPetGUID()))
                {
                    for (uint8 i = 0; i < 3; ++i)
                        pet->SetVirtualItem(i, 0);

                    pet->SetVirtualItem(0, itemEntry);
                }
            }
        }

        void Register() override
        {
            AfterCast += SpellCastFn(spell_warlock_glyph_of_felguard_SpellScript::HandleAfterHit);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warlock_glyph_of_felguard_SpellScript();
    }
};

// Summon demon (used by all warlock Summon demon spells)
class spell_warlock_summon_demon : public SpellScriptLoader
{
    public:
        spell_warlock_summon_demon() : SpellScriptLoader("spell_warlock_summon_demon") { }

        class spell_warlock_summon_demon_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_summon_demon_SpellScript);

            SpellCastResult CheckRequirement()
            {
                Player * player = GetCaster()->ToPlayer();
                if (!player)
                    return SPELL_CAST_OK;

                // "Soulburn: Summon Demon has a 60 sec cooldown"
                if (player->HasAura(SPELL_WARLOCK_SOULBURN))
                    if (player->Variables.GetValue<time_t>("Spells.SoulburnSummonDemon", 0) > time(nullptr))
                        return SPELL_FAILED_NOT_READY;

                return SPELL_CAST_OK;
            }

            void HandleAfterCast()
            {
                // "Soulburn: Summon Demon has a 60 sec cooldown"
                if (Player * player = GetCaster()->ToPlayer())
                    if (!GetSpell()->GetCastTime())
                        player->Variables.Set<time_t>("Spells.SoulburnSummonDemon", (time(nullptr) + 60 * IN_MILLISECONDS));
            }

            void Register() override
            {
                AfterCast += SpellCastFn(spell_warlock_summon_demon_SpellScript::HandleAfterCast);
                OnCheckCast += SpellCheckCastFn(spell_warlock_summon_demon_SpellScript::CheckRequirement);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_summon_demon_SpellScript();
        }
};

// ================================================================== ADDED IN LEGION ==================================================================

// Dimensional Rift - 196586
class spell_warlock_artifact_dimensional_rift : public SpellScriptLoader
{
public:
    spell_warlock_artifact_dimensional_rift() : SpellScriptLoader("spell_warlock_artifact_dimensional_rift") {}

    class spell_warlock_artifact_dimensional_rift_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warlock_artifact_dimensional_rift_SpellScript);

        void HandleHit(SpellEffIndex /*effIndex*/)
        {
            Unit* caster = GetCaster();
            Unit* target = GetHitUnit();
            if (!caster || !target)
                return;

            //green //green //purple
            std::vector<uint32> spellVisualIds = { 219117, 219117, 219107 };
            // Chaos Tear  //Chaos Portal  //Shadowy Tear
            std::vector<uint32> summonIds = { 108493,        108493,          99887 };
            // Durations must be longer, because if the npc gets destroyed before the last projectile hits
            // it won't deal any damage.
            std::vector<uint32> durations = { 7000, 4500, 16000 };
            uint32 id = std::rand() % 3;
            Position pos = caster->GetPosition();
            // Portals appear in a random point, in a distance between 4-8yards
            caster->MovePosition(pos, (float)(std::rand() % 5) + 4.f, (float)rand_norm() * static_cast<float>(2 * M_PI));
            if (Creature* rift = caster->SummonCreature(summonIds[id], pos.GetPositionX(), pos.GetPositionY(), pos.GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN, durations[id]))
            {
                rift->CastSpell(rift, spellVisualIds[id], true);
                rift->SetOwnerGUID(caster->GetGUID());
                // We cannot really use me->GetVictim() inside of the AI, since the target
                // for portal is locked, it doesn't change no matter what. So we set it like this
                rift->SetTarget(target->GetGUID());
                // We use same ID and script for Chaos Portal and Chaos Tear as there are no more NPCs for this spell
                rift->SetArmor(id, 0);
            }
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_warlock_artifact_dimensional_rift_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warlock_artifact_dimensional_rift_SpellScript();
    }
};

// Chaos Tear - 108493
class npc_warlock_chaos_tear : public CreatureScript
{
public:
    npc_warlock_chaos_tear() : CreatureScript("npc_warlock_chaos_tear") { }

    struct npc_warlock_chaos_tearAI : public ScriptedAI
    {
        npc_warlock_chaos_tearAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

        int32 timer = 0;
        int32 counter = 0;

        void UpdateAI(uint32 diff)
        {
            timer += diff;
            switch (me->GetArmor())
            {
            case 0:
                if (counter >= 22)
                    return;
                if (timer >= 250)
                {
                    timer -= 250;
                    ObjectGuid targetGuid = me->GetTarget();
                    ObjectGuid casterGuid = me->GetOwnerGUID();
                    if (targetGuid.IsEmpty() || casterGuid.IsEmpty())
                        return;
                    Unit* caster = ObjectAccessor::GetUnit(*me, casterGuid);
                    Unit* target = ObjectAccessor::GetUnit(*me, targetGuid);
                    if (!caster || !target)
                        return;

                    me->CastSpell(target, SPELL_WARLOCK_TEAR_CHAOS_BARRAGE, true, nullptr, nullptr, caster->GetGUID());
                    counter++;
                }
                break;
            case 1:
                if (timer >= 1500)
                {
                    timer -= 9000;
                    ObjectGuid targetGuid = me->GetTarget();
                    ObjectGuid casterGuid = me->GetOwnerGUID();
                    if (targetGuid.IsEmpty() || casterGuid.IsEmpty())
                        return;
                    Unit* caster = ObjectAccessor::GetUnit(*me, casterGuid);
                    Unit* target = ObjectAccessor::GetUnit(*me, targetGuid);
                    if (!caster || !target)
                        return;

                    me->CastSpell(target, SPELL_WARLOCK_TEAR_CHAOS_BOLT, true, nullptr, nullptr, caster->GetGUID());
                }
                break;
            default:
                break;
            }
        }
    };

    CreatureAI* GetAI(Creature* p_Creature) const
    {
        return new npc_warlock_chaos_tearAI(p_Creature);
    }
};

// Shadowy Tear - 99887
class npc_warlock_shadowy_tear : public CreatureScript
{
public:
    npc_warlock_shadowy_tear() : CreatureScript("npc_warlock_shadowy_tear") { }

    struct npc_warlock_shadowy_tearAI : public ScriptedAI
    {
        npc_warlock_shadowy_tearAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }

        int32 timer = 0;
        int32 counter = 0;

        void UpdateAI(uint32 diff)
        {
            if (counter >= 7)
                return;

            timer += diff;
            if (timer >= 2000)
            {
                timer -= 2000;
                ObjectGuid targetGuid = me->GetTarget();
                ObjectGuid casterGuid = me->GetOwnerGUID();
                if (targetGuid.IsEmpty() || casterGuid.IsEmpty())
                    return;
                Unit* caster = ObjectAccessor::GetUnit(*me, casterGuid);
                Unit* target = ObjectAccessor::GetUnit(*me, targetGuid);
                if (!caster || !target)
                    return;

                me->CastSpell(target, SPELL_WARLOCK_TEAR_SHADOW_BOLT, true, nullptr, nullptr, caster->GetGUID());
                counter++;
            }
        }
    };

    CreatureAI* GetAI(Creature* p_Creature) const
    {
        return new npc_warlock_shadowy_tearAI(p_Creature);
    }
};

// Immolate Dot - 157736
class spell_warlock_immolate_dot : public SpellScriptLoader
{
public:
    spell_warlock_immolate_dot() : SpellScriptLoader("spell_warlock_immolate_dot") {}

    class spell_warlock_immolate_dot_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warlock_immolate_dot_AuraScript);

        void HandlePeriodic(AuraEffect const* /*aurEff*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            if (Aura* aur = caster->GetAura(SPELL_WARLOCK_CHANNEL_DEMONFIRE_ACTIVATOR))
                aur->RefreshDuration();

            if (GetAura()->Variables.Exist("Spells.AffectedByRoaringBlaze"))
            {
                int32 damage = GetEffect(EFFECT_0)->GetDamage();
                AddPct(damage, 25);
                GetEffect(EFFECT_0)->SetDamage(damage);
                GetAura()->SetNeedClientUpdateForTargets();
            }
        }

        void HandleApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            caster->CastSpell(caster, SPELL_WARLOCK_CHANNEL_DEMONFIRE_ACTIVATOR, true);

            GetAura()->Variables.Remove("Spells.AffectedByRoaringBlaze");
        }

        void HandleRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            std::list<Unit*> enemies;
            Trinity::AnyUnfriendlyUnitInObjectRangeCheck check(caster, caster, 100.f);
            Trinity::UnitListSearcher<Trinity::AnyUnfriendlyUnitInObjectRangeCheck> searcher(caster, enemies, check);
            Cell::VisitAllObjects(caster, searcher, 100.f);
            enemies.remove_if(Trinity::UnitAuraCheck(false, SPELL_WARLOCK_IMMOLATE_DOT, caster->GetGUID()));
            if (enemies.empty())
                if (Aura* aur = caster->GetAura(SPELL_WARLOCK_CHANNEL_DEMONFIRE_ACTIVATOR))
                    aur->SetDuration(0);
        }

        void Register() override
        {
            AfterEffectApply += AuraEffectApplyFn(spell_warlock_immolate_dot_AuraScript::HandleApply, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE, AURA_EFFECT_HANDLE_REAL_OR_REAPPLY_MASK);
            OnEffectPeriodic += AuraEffectPeriodicFn(spell_warlock_immolate_dot_AuraScript::HandlePeriodic, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE);
            AfterEffectRemove += AuraEffectRemoveFn(spell_warlock_immolate_dot_AuraScript::HandleRemove, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE, AURA_EFFECT_HANDLE_REAL_OR_REAPPLY_MASK);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warlock_immolate_dot_AuraScript();
    }
};

// Channel Demonfire - 196447
class spell_warlock_channel_demonfire : public SpellScriptLoader
{
public:
    spell_warlock_channel_demonfire() : SpellScriptLoader("spell_warlock_channel_demonfire") {}

    class spell_warlock_channel_demonfire_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warlock_channel_demonfire_AuraScript);

        void HandlePeriodic(AuraEffect const* /*aurEff*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            std::list<Unit*> enemies;
            Trinity::AnyUnfriendlyUnitInObjectRangeCheck check(caster, caster, 100.f);
            Trinity::UnitListSearcher<Trinity::AnyUnfriendlyUnitInObjectRangeCheck> searcher(caster, enemies, check);
            Cell::VisitAllObjects(caster, searcher, 100.f);
            enemies.remove_if(Trinity::UnitAuraCheck(false, SPELL_WARLOCK_IMMOLATE_DOT, caster->GetGUID()));
            if (enemies.empty())
                return;

            Unit* target = Trinity::Containers::SelectRandomContainerElement(enemies);
            caster->CastSpell(target, SPELL_WARLOCK_CHANNEL_DEMONFIRE_DAMAGE, true);
        }

        void Register() override
        {
            OnEffectPeriodic += AuraEffectPeriodicFn(spell_warlock_channel_demonfire_AuraScript::HandlePeriodic, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warlock_channel_demonfire_AuraScript();
    }
};

// Reap Souls - 216698
class spell_warlock_artifact_reap_souls : public SpellScriptLoader
{
public:
    spell_warlock_artifact_reap_souls() : SpellScriptLoader("spell_warlock_artifact_reap_souls") {}

    class spell_warlock_artifact_reap_souls_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warlock_artifact_reap_souls_SpellScript);

        void HandleHit(SpellEffIndex /*effIndex*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            caster->CastSpell(caster, SPELL_WARLOCK_DEADWIND_HARVERST, true);
        }

        SpellCastResult CheckCast()
        {
            Unit* caster = GetCaster();
            if (!caster)
                return SPELL_FAILED_DONT_REPORT;

            if (!caster->HasAura(SPELL_WARLOCK_TORMENTED_SOULS))
                return SPELL_FAILED_CANT_DO_THAT_RIGHT_NOW;

            return SPELL_CAST_OK;
        }

        void Register() override
        {
            OnCheckCast += SpellCheckCastFn(spell_warlock_artifact_reap_souls_SpellScript::CheckCast);
            OnEffectHitTarget += SpellEffectFn(spell_warlock_artifact_reap_souls_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warlock_artifact_reap_souls_SpellScript();
    }
};

// Deadwind harvest - 216708
class spell_warlock_artifact_deadwind_harvest : public SpellScriptLoader
{
public:
    spell_warlock_artifact_deadwind_harvest() : SpellScriptLoader("spell_warlock_artifact_deadwind_harvest") {}

    class spell_warlock_artifact_deadwind_harvest_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warlock_artifact_deadwind_harvest_AuraScript);

        void CalcAmount(AuraEffect const* /*aurEff*/, int32& /*amount*/, bool& /*canBeRecalculated*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            int32 stackAmount = 0;
            if (Aura* aur = caster->GetAura(SPELL_WARLOCK_TORMENTED_SOULS))
                stackAmount = aur->GetStackAmount();

            int32 duration = GetAura()->GetDuration() * stackAmount;
            GetAura()->SetMaxDuration(duration);
            GetAura()->SetDuration(duration);

            caster->RemoveAurasDueToSpell(SPELL_WARLOCK_TORMENTED_SOULS);
        }

        void Register() override
        {
            DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_warlock_artifact_deadwind_harvest_AuraScript::CalcAmount, EFFECT_0, SPELL_AURA_MOD_DAMAGE_PERCENT_DONE);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warlock_artifact_deadwind_harvest_AuraScript();
    }
};

// Thal'kiel's Consumption - 211714
class spell_warlock_artifact_thalkiels_consumption : public SpellScriptLoader
{
public:
    spell_warlock_artifact_thalkiels_consumption() : SpellScriptLoader("spell_warlock_artifact_thalkiels_consumption") {}

    class spell_warlock_artifact_thalkiels_consumption_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warlock_artifact_thalkiels_consumption_SpellScript);

        int32 damage = 0;

        void HandleHit(SpellEffIndex /*effIndex*/)
        {
            Unit* caster = GetCaster();
            Unit* target = GetHitUnit();
            if (!target || !caster)
                return;

            caster->CastCustomSpell(SPELL_WARLOCK_THALKIELS_CONSUMPTION_DAMAGE, SPELLVALUE_BASE_POINT0, damage, target, TRIGGERED_FULL_MASK);
        }

        void SaveDamage(std::list<WorldObject*>& targets)
        {
            targets.remove_if([](WorldObject* target)
            {
                // Remove non-unit (should not happen, better be safe though) and Players (only caster)
                if (!target->ToUnit() || target->ToPlayer())
                    return true;
                // Remove Gateways
                if (target->ToCreature()->GetCreatureType() != CREATURE_TYPE_DEMON)
                    return true;

                return false;
            });

            int32 basePoints = GetSpellInfo()->GetEffect(EFFECT_1)->BasePoints;
            for (WorldObject* pet : targets)
                damage += pet->ToUnit()->CountPctFromMaxHealth(basePoints);
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_warlock_artifact_thalkiels_consumption_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_DUMMY);
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_warlock_artifact_thalkiels_consumption_SpellScript::SaveDamage, EFFECT_1, TARGET_UNIT_CASTER_PET);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warlock_artifact_thalkiels_consumption_SpellScript();
    }
};

// 196104 - Mana Tap
class spell_warlock_mana_tap : public SpellScriptLoader
{
    public:
        spell_warlock_mana_tap() : SpellScriptLoader("spell_warlock_mana_tap") { }

        class spell_warlock_mana_tap_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_mana_tap_SpellScript);

            SpellCastResult CheckCast()
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return SPELL_FAILED_DONT_REPORT;

                if (caster->GetPowerPct(POWER_MANA) < GetEffectInfo(EFFECT_1)->BasePoints)
                    return SPELL_FAILED_NO_POWER;

                return SPELL_CAST_OK;
            }

            void HandleHit(SpellEffIndex effIndex)
            {
                PreventHitEffect(effIndex);

                Unit* caster = GetCaster();
                if (!caster)
                    return;
                int32 bp = GetEffectInfo()->BasePoints;
                int32 mana = caster->GetPower(POWER_MANA) - caster->CountPctFromMaxPower(POWER_MANA, bp);

                caster->SetPower(POWER_MANA, mana);
            }

            void Register() override
            {
                OnEffectLaunch += SpellEffectFn(spell_warlock_mana_tap_SpellScript::HandleHit, EFFECT_1, SPELL_EFFECT_ENERGIZE);
                OnCheckCast += SpellCheckCastFn(spell_warlock_mana_tap_SpellScript::CheckCast);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_mana_tap_SpellScript();
        }
};

// 205179 - Phantom Singularity
class spell_warlock_phantom_singularity : public SpellScriptLoader
{
    public:
        spell_warlock_phantom_singularity() : SpellScriptLoader("spell_warlock_phantom_singularity") { }

        class spell_warlock_phantom_singularity_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_phantom_singularity_AuraScript);

            void PeriodicTick(AuraEffect const* /*aurEff*/)
            {
                Unit* caster = GetCaster();
                Unit* target = GetUnitOwner();
                if (!caster || !target)
                    return;

                caster->CastSpell(target, SPELL_WARLOCK_PHANTOM_SINGULARITY_DAMAGE, true);
            }

            void Register() override
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_warlock_phantom_singularity_AuraScript::PeriodicTick, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_phantom_singularity_AuraScript();
        }
};

// Soul Harvest - 196098
class spell_warlock_soul_harvest : public SpellScriptLoader
{
public:
    spell_warlock_soul_harvest() : SpellScriptLoader("spell_warlock_soul_harvest") {}

    class spell_warlock_soul_harvest_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warlock_soul_harvest_AuraScript);

        void HandleApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;
            if (!caster->ToPlayer())
                return;

            std::list<Unit*> targets;
            caster->GetAttackableUnitListInRange(targets, 100.f);
            int32 spellId = 0;
            switch (caster->ToPlayer()->GetSpecializationId())
            {
                case TALENT_SPEC_WARLOCK_AFFLICTION:
                    spellId = SPELL_WARLOCK_AGONY;
                    break;
                case TALENT_SPEC_WARLOCK_DEMONOLOGY:
                    spellId = SPELL_WARLOCK_DOOM;
                    break;
                case TALENT_SPEC_WARLOCK_DESTRUCTION:
                    spellId = SPELL_WARLOCK_IMMOLATE_DOT;
                    break;
                default:
                    break;
            }
            targets.remove_if(Trinity::UnitAuraCheck(false, spellId, caster->GetGUID()));
            int32 mod = std::min((int)targets.size(), 15);
            int32 duration = GetAura()->GetMaxDuration() + 2 * mod * IN_MILLISECONDS;

            GetAura()->SetMaxDuration(duration);
            GetAura()->SetDuration(duration);
        }

        void Register() override
        {
            AfterEffectApply += AuraEffectApplyFn(spell_warlock_soul_harvest_AuraScript::HandleApply, EFFECT_0, SPELL_AURA_MOD_DAMAGE_PERCENT_DONE, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warlock_soul_harvest_AuraScript();
    }
};

// 199471 - Soul Flame
class spell_warlock_artifact_soul_flame : public SpellScriptLoader
{
    public:
        spell_warlock_artifact_soul_flame() : SpellScriptLoader("spell_warlock_artifact_soul_flame") { }

        class spell_warlock_artifact_soul_flame_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_artifact_soul_flame_AuraScript);

            void OnProc(AuraEffect const* /*aurEff*/, ProcEventInfo& eventInfo)
            {
                Unit* target = eventInfo.GetActionTarget();
                Unit* caster = GetCaster();
                if (!caster || !target)
                    return;

                Position p = target->GetPosition();
                caster->GetScheduler().Schedule(300ms, [caster, p](TaskContext /*context*/)
                {
                    caster->CastSpell(p, SPELL_WARLOCK_SOUL_FLAME_PROC, true);
                });
            }

            void Register() override
            {
                OnEffectProc += AuraEffectProcFn(spell_warlock_artifact_soul_flame_AuraScript::OnProc, EFFECT_0, SPELL_AURA_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_artifact_soul_flame_AuraScript();
        }
};

// 199472 - Wrath of Consumption
class spell_warlock_artifact_wrath_of_consumption : public SpellScriptLoader
{
    public:
        spell_warlock_artifact_wrath_of_consumption() : SpellScriptLoader("spell_warlock_artifact_wrath_of_consumption") { }

        class spell_warlock_artifact_wrath_of_consumption_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_artifact_wrath_of_consumption_AuraScript);

            void OnProc(AuraEffect const* /*aurEff*/, ProcEventInfo& /*eventInfo*/)
            {
                if (Unit* caster = GetCaster())
                    caster->CastSpell(caster, SPELL_WARLOCK_WRATH_OF_CONSUMPTION_PROC, true);
            }

            void Register() override
            {
                OnEffectProc += AuraEffectProcFn(spell_warlock_artifact_wrath_of_consumption_AuraScript::OnProc, EFFECT_0, SPELL_AURA_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_artifact_wrath_of_consumption_AuraScript();
        }
};

// 196305 - Eternal Struggle
class spell_warlock_artifact_eternal_struggle : public SpellScriptLoader
{
    public:
        spell_warlock_artifact_eternal_struggle() : SpellScriptLoader("spell_warlock_artifact_eternal_struggle") { }

        class spell_warlock_artifact_eternal_struggle_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_artifact_eternal_struggle_AuraScript);

            void OnProc(AuraEffect const* aurEff, ProcEventInfo& /*eventInfo*/)
            {
                PreventDefaultAction();
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                caster->CastCustomSpell(SPELL_WARLOCK_ETERNAL_STRUGGLE_PROC, SPELLVALUE_BASE_POINT0, aurEff->GetAmount(), caster, true);
            }

            void Register() override
            {
                OnEffectProc += AuraEffectProcFn(spell_warlock_artifact_eternal_struggle_AuraScript::OnProc, EFFECT_0, SPELL_AURA_PROC_TRIGGER_SPELL_WITH_VALUE);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_artifact_eternal_struggle_AuraScript();
        }
};

// 196301 - Devourer of Life
class spell_warlock_artifact_devourer_of_life : public SpellScriptLoader
{
    public:
        spell_warlock_artifact_devourer_of_life() : SpellScriptLoader("spell_warlock_artifact_devourer_of_life") { }

        class spell_warlock_artifact_devourer_of_life_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_artifact_devourer_of_life_AuraScript);

            void OnProc(AuraEffect const* aurEff, ProcEventInfo& /*eventInfo*/)
            {
                PreventDefaultAction();
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                if (roll_chance_i(aurEff->GetAmount()))
                    caster->CastSpell(caster, SPELL_WARLOCK_DEVOURER_OF_LIFE_PROC, true);
            }

            void Register() override
            {
                OnEffectProc += AuraEffectProcFn(spell_warlock_artifact_devourer_of_life_AuraScript::OnProc, EFFECT_0, SPELL_AURA_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_artifact_devourer_of_life_AuraScript();
        }
};

// 17962 - Conflagrate
class spell_warlock_conflagrate : public SpellScriptLoader
{
    public:
        spell_warlock_conflagrate() : SpellScriptLoader("spell_warlock_conflagrate") { }

        class spell_warlock_conflagrate_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_conflagrate_SpellScript);

            void HandleHit(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                Unit* target = GetHitUnit();
                if (!caster || !target)
                    return;

                Player* casterPlayer = caster->ToPlayer();
                if (!casterPlayer)
                    return;

                caster->CastSpell(caster, SPELL_WARLOCK_CONFLAGRATE_ENERGIZE, true);

                if (caster->HasAura(SPELL_WARLOCK_CONFLAGRATION_OF_CHAOS))
                {
                    int32 damage = GetHitDamage();
                    AddPct(damage, casterPlayer->m_activePlayerData->SpellCritPercentage);
                    SetHitDamage(damage);

                    caster->RemoveAurasDueToSpell(SPELL_WARLOCK_CONFLAGRATION_OF_CHAOS);
                }

                caster->CastSpell(caster, SPELL_WARLOCK_BACKDRAFT_TRIGGERED, true);
                if (caster->HasAura(SPELL_WARLOCK_FLASHOVER_AURA))
                    caster->CastSpell(caster, SPELL_WARLOCK_BACKDRAFT_TRIGGERED, true);

                if (caster->HasAura(SPELL_WARLOCK_ROARING_BLAZE))
                    caster->CastSpell(target, SPELL_WARLOCK_CONFLAGRATE_ROARING_BLAZE, true);
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_warlock_conflagrate_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_conflagrate_SpellScript();
        }
};

// 196236 - Soulsnatcher
class spell_warlock_artifact_soul_snatcher : public SpellScriptLoader
{
    public:
        spell_warlock_artifact_soul_snatcher() : SpellScriptLoader("spell_warlock_artifact_soul_snatcher") { }

        class spell_warlock_artifact_soul_snatcher_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_artifact_soul_snatcher_AuraScript);

            void OnProc(AuraEffect const* aurEff, ProcEventInfo& /*eventInfo*/)
            {
                PreventDefaultAction();
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                if (roll_chance_i(aurEff->GetAmount()))
                    caster->CastSpell(caster, SPELL_WARLOCK_SOULSNATCHER_PROC, true);
            }

            void Register() override
            {
                OnEffectProc += AuraEffectProcFn(spell_warlock_artifact_soul_snatcher_AuraScript::OnProc, EFFECT_0, SPELL_AURA_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_artifact_soul_snatcher_AuraScript();
        }
};

// 219415 - Dimension Ripper
class spell_warlock_artifact_dimension_ripper : public SpellScriptLoader
{
    public:
        spell_warlock_artifact_dimension_ripper() : SpellScriptLoader("spell_warlock_artifact_dimension_ripper") { }

        class spell_warlock_artifact_dimension_ripper_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_artifact_dimension_ripper_AuraScript);

            void OnProc(AuraEffect const* /*aurEff*/, ProcEventInfo& /*eventInfo*/)
            {
                PreventDefaultAction();
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                caster->GetSpellHistory()->RestoreCharge(sSpellMgr->GetSpellInfo(SPELL_WARLOCK_DIMENSIONAL_RIFT)->ChargeCategoryId);
            }

            void Register() override
            {
                OnEffectProc += AuraEffectProcFn(spell_warlock_artifact_dimension_ripper_AuraScript::OnProc, EFFECT_0, SPELL_AURA_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_artifact_dimension_ripper_AuraScript();
        }
};

// 198590 - Drain Soul
class spell_warlock_drain_soul : public SpellScriptLoader
{
    public:
        spell_warlock_drain_soul() : SpellScriptLoader("spell_warlock_drain_soul") { }

        class spell_warlock_drain_soul_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_drain_soul_AuraScript);

            void OnPeriodicDamage(AuraEffect const* /*aurEff*/, Unit * /*target*/, uint32 & damage)
            {
                if (GetTarget() && GetTarget()->HealthBelowPct(GetSpellInfo()->GetEffect(EFFECT_2)->BasePoints)) {
                    damage *= (100.f + GetSpellInfo()->GetEffect(EFFECT_1)->BasePoints) / 100.f;
                }
            }

            void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                if (GetTargetApplication() && GetTargetApplication()->GetRemoveMode() == AURA_REMOVE_BY_DEATH)
                    caster->CastSpell(caster, SPELL_WARLOCK_DRAIN_SOUL_ENERGIZE, true);
            }

            void Register() override
            {
                OnDamage += AuraDamageFn(spell_warlock_drain_soul_AuraScript::OnPeriodicDamage, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE);
                OnEffectRemove += AuraEffectRemoveFn(spell_warlock_drain_soul_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_drain_soul_AuraScript();
        }
};

// 755 - Health Funnel
class spell_health_funnel : public SpellScriptLoader
{
    public:
        spell_health_funnel() : SpellScriptLoader("spell_health_funnel") { }

        class spell_health_funnel_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_health_funnel_AuraScript);

            void PeriodicTick(AuraEffect const* /*aurEff*/)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                int32 damage = caster->CountPctFromMaxHealth(GetSpellInfo()->GetEffect(EFFECT_0)->BasePoints);
                int32 heal = damage;

                caster->CastCustomSpell(caster, SPELL_WARLOCK_HEALTH_FUNNEL_HEAL, &damage, &heal, NULL, true);
            }

            void Register() override
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_health_funnel_AuraScript::PeriodicTick, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_health_funnel_AuraScript();
        }
};

// 27285 - Seed of Corruption damage
class spell_warlock_seed_of_corruption_damage : public SpellScriptLoader
{
    public:
        spell_warlock_seed_of_corruption_damage() : SpellScriptLoader("spell_warlock_seed_of_corruption_damage") { }

        class spell_warlock_seed_of_corruption_damage_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_seed_of_corruption_damage_SpellScript);

            void HandleHit(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                Unit* target = GetHitUnit();
                if (!caster || !target)
                    return;

                // chain explosion
                if (Aura* soc = target->GetAura(SPELL_WARLOCK_SEED_OF_CORRUPTION, caster->GetGUID()))
                {
                    if (!soc->Variables.Exist("_alreadyDetonated"))
                    {
                        soc->Variables.Set("_alreadyDetonated", 0);
                        soc->Remove();
                        caster->CastSpell(target, SPELL_WARLOCK_SEED_OF_CORRUPTION_DETONATION, true);
                    }
                }

                caster->CastSpell(target, SPELL_WARLOCK_CORRUPTION_TRIGGERED, true);
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_warlock_seed_of_corruption_damage_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_seed_of_corruption_damage_SpellScript();
        }
};

// 19483 - Immolation
class spell_warlock_infernal_immolation : public SpellScriptLoader
{
    public:
        spell_warlock_infernal_immolation() : SpellScriptLoader("spell_warlock_infernal_immolation") { }

        class spell_warlock_infernal_immolation_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_infernal_immolation_AuraScript);

            void PeriodicTick(AuraEffect const* /*aurEff*/)
            {
                PreventDefaultAction();
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                caster->CastSpell(caster, SPELL_WARLOCK_IMMOLATION_TRIGGERED, true, NULL, NULL, caster->GetOwnerGUID());
            }

            void Register() override
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_warlock_infernal_immolation_AuraScript::PeriodicTick, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_infernal_immolation_AuraScript();
        }
};

// 30108 - Unstable Affliction
class spell_warlock_unstable_affliction : public SpellScriptLoader
{
    public:
        spell_warlock_unstable_affliction() : SpellScriptLoader("spell_warlock_unstable_affliction") { }

        class spell_warlock_unstable_affliction_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_unstable_affliction_SpellScript);

            void HandleHit(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                Unit* caster = GetCaster();
                Unit* target = GetHitUnit();
                if (!caster || !target)
                    return;

                std::vector<int32> uaspells = { SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT5, SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT4,
                                                SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT3, SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT2,
                                                SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT1 };

                int32 spellToCast = 0;
                int32 minDuration = 10000;
                int32 lowestDurationSpell = 0;
                for (int32 spellId : uaspells)
                {
                    if (Aura* ua = target->GetAura(spellId, caster->GetGUID()))
                    {
                        if (ua->GetDuration() < minDuration)
                        {
                            minDuration = ua->GetDuration();
                            lowestDurationSpell = ua->GetSpellInfo()->Id;
                        }
                    }
                    else
                        spellToCast = spellId;
                }

                if (!spellToCast)
                    caster->CastSpell(target, lowestDurationSpell, true);
                else
                    caster->CastSpell(target, spellToCast, true);

                if (caster->HasAura(SPELL_WARLOCK_CONTAGION))
                    caster->CastSpell(target, SPELL_WARLOCK_CONTAGION_DEBUFF, true);

                if (caster->HasAura(SPELL_WARLOCK_COMPOUNDING_HORROR))
                    caster->CastSpell(target, SPELL_WARLOCK_COMPOUNDING_HORROR_DAMAGE, true);
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_warlock_unstable_affliction_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_unstable_affliction_SpellScript();
        }
};

// 233490 - Unstable Affliction dispel
class spell_warlock_unstable_affliction_dispel : public SpellScriptLoader
{
    public:
        spell_warlock_unstable_affliction_dispel() : SpellScriptLoader("spell_warlock_unstable_affliction_dispel") { }

        class spell_warlock_unstable_affliction_dispel_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_unstable_affliction_dispel_AuraScript);

            void HandleDispel(DispelInfo* dispelInfo)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                if (Unit* dispeller = dispelInfo->GetDispeller()) {
                    int32 damage = GetAura()->GetEffect(EFFECT_0)->GetDamage() * 4;
                    caster->CastCustomSpell(dispeller, SPELL_WARLOCK_UNSTABLE_AFFLICTION_DISPEL, &damage, NULL, NULL, true);
                }
            }

            void HandleRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                Unit* caster = GetCaster();
                Unit* target = GetUnitOwner();
                if (!caster || !target || !caster->ToPlayer())
                    return;

                if (caster->HasAura(SPELL_WARLOCK_UNSTABLE_AFFLICTION_RANK2))
                {
                    if (GetTargetApplication() && GetTargetApplication()->GetRemoveMode() == AURA_REMOVE_BY_DEATH)
                    {
                        if (caster->Variables.Exist("_uaLockout"))
                            return;

                        caster->CastSpell(caster, SPELL_WARLOCK_UNSTABLE_AFFLICTION_ENERGIZE, true);

                        caster->Variables.Set("_uaLockout", 0);
                        caster->GetScheduler().Schedule(100ms, [caster](TaskContext /*context*/)
                        {
                            caster->Variables.Remove("_uaLockout");
                        });
                    }
                }

                // When Unstable Affliction expires, it has a 6% chance to reapply itself.
                if (GetTargetApplication() && GetTargetApplication()->GetRemoveMode() == AURA_REMOVE_BY_EXPIRE)
                    if (roll_chance_i(caster->GetAuraEffectAmount(SPELL_WARLOCK_FATAL_ECHOES, EFFECT_0)))
                        caster->GetScheduler().Schedule(100ms, [this, caster, target](TaskContext /*context*/)
                        {
                            caster->CastSpell(target, GetSpellInfo()->Id, true);
                        });
            }

            void Register() override
            {
                OnEffectRemove += AuraEffectRemoveFn(spell_warlock_unstable_affliction_dispel_AuraScript::HandleRemove, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE, AURA_EFFECT_HANDLE_REAL);
                AfterDispel += AuraDispelFn(spell_warlock_unstable_affliction_dispel_AuraScript::HandleDispel);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_unstable_affliction_dispel_AuraScript();
        }
};

// 108370 - Soul Leech
class spell_warlock_soul_leech : public SpellScriptLoader
{
    public:
        spell_warlock_soul_leech() : SpellScriptLoader("spell_warlock_soul_leech") { }

        class spell_warlock_soul_leech_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_soul_leech_AuraScript);

            void OnProc(AuraEffect const*  aurEff, ProcEventInfo& eventInfo)
            {
                PreventDefaultAction();
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                Unit* secondaryTarget = NULL;
                if (Player* player = caster->ToPlayer())
                    secondaryTarget = player->GetPet();
                if (Pet* pet = caster->ToPet())
                {
                    secondaryTarget = pet->GetOwner();
                    if (!secondaryTarget)
                        return;
                }

                Unit* targets[2] = { caster, secondaryTarget };
                for (Unit* target : targets)
                {
                    if (target)
                    {
                        int32 finalAmount = CalculatePct(eventInfo.GetDamageInfo()->GetDamage(), aurEff->GetAmount());
                        int32 soulLinkHeal = finalAmount; // save value for soul link
                        // add old amount
                        if (Aura * aura = target->GetAura(SPELL_WARLOCK_SOUL_LEECH_SHIELD))
                            finalAmount += aura->GetEffect(EFFECT_0)->GetAmount();

                        AddPct(finalAmount, caster->GetAuraEffectAmount(SPELL_ARENA_DAMPENING, EFFECT_0));
                        // max 15% of HP
                        int32 maxHealthPct = GetEffect(EFFECT_1)->GetAmount();
                        if (uint32 demonskinBonus = caster->GetAuraEffectAmount(SPELL_WARLOCK_DEMON_SKIN, EFFECT_1))
                            maxHealthPct = demonskinBonus;
                        finalAmount = std::min<uint32>(finalAmount, CalculatePct(target->GetMaxHealth(), maxHealthPct));
                        target->CastCustomSpell(target, SPELL_WARLOCK_SOUL_LEECH_SHIELD, &finalAmount, NULL, NULL, true);

                        if (target->ToPlayer() && target->HasAura(SPELL_WARLOCK_SOUL_LINK_BUFF))
                        {
                            int32 playerHeal = CalculatePct(soulLinkHeal, target->GetAura(SPELL_WARLOCK_SOUL_LINK_BUFF)->GetEffect(EFFECT_1)->GetAmount());
                            int32 petHeal = CalculatePct(soulLinkHeal, target->GetAura(SPELL_WARLOCK_SOUL_LINK_BUFF)->GetEffect(EFFECT_2)->GetAmount());
                            target->CastCustomSpell(target, SPELL_WARLOCK_SOUL_LINK_HEAL, &playerHeal, &petHeal, NULL, true);
                        }
                    }
                }
            }

            void Register() override
            {
                OnEffectProc += AuraEffectProcFn(spell_warlock_soul_leech_AuraScript::OnProc, EFFECT_0, SPELL_AURA_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_soul_leech_AuraScript();
        }
};

// Call Dreadstalkers - 104316
class spell_warlock_call_dreadstalkers : public SpellScriptLoader
{
public:
    spell_warlock_call_dreadstalkers() : SpellScriptLoader("spell_warlock_call_dreadstalkers") {}

    class spell_warlock_call_dreadstalkers_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warlock_call_dreadstalkers_SpellScript);

        void HandleHit(SpellEffIndex /*effIndex*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            for (int32 i = 0 ; i < GetEffectValue() ; ++i)
                caster->CastSpell(caster, SPELL_WARLOCK_CALL_DREADSTALKERS_SUMMON, true);
        }

        void HandleAfterCast()
        {
            Unit* caster = GetCaster();
            Unit* target = GetExplTargetUnit();
            if (!caster || !target)
                return;

            std::list<Creature*> dreadstalkers;
            caster->GetCreatureListWithEntryInGrid(dreadstalkers, 98035);
            for (Creature* dreadstalker : dreadstalkers)
            {
                if (dreadstalker->GetOwner() == caster)
                {
                    dreadstalker->AI()->AttackStart(target);
                    dreadstalker->AddThreat(target, 9999999.f);
                }
            }

            if (uint32 impsToSummon = caster->GetAuraEffectAmount(SPELL_WARLOCK_IMPROVED_DREADSTALKERS, EFFECT_0))
                for (uint32 i = 0; i < impsToSummon; ++i)
                    caster->CastSpell(target->GetRandomNearPosition(3.f), SPELL_WARLOCK_WILD_IMP_SUMMON, true);
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_warlock_call_dreadstalkers_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_DUMMY);
            AfterCast += SpellCastFn(spell_warlock_call_dreadstalkers_SpellScript::HandleAfterCast);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warlock_call_dreadstalkers_SpellScript();
    }
};

// Dreadstalker - 98035
class npc_warlock_dreadstalker : public CreatureScript
{
public:
    npc_warlock_dreadstalker() : CreatureScript("npc_warlock_dreadstalker") {}

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_warlock_dreadstalkerAI(creature);
    }

    struct npc_warlock_dreadstalkerAI : public ScriptedAI
    {
        npc_warlock_dreadstalkerAI(Creature* creature) : ScriptedAI(creature) {}

        bool firstTick = true;

        void UpdateAI(uint32 /*diff*/) override
        {
            if (firstTick)
            {
                Unit* owner = me->GetOwner();
                if (!me->GetOwner() || !me->GetOwner()->ToPlayer())
                    return;

                me->SetMaxHealth(owner->CountPctFromMaxHealth(40));
                me->SetHealth(me->GetMaxHealth());

                if (Unit* target = owner->ToPlayer()->GetSelectedUnit())
                    me->CastSpell(target, SPELL_WARLOCK_DREADSTALKER_CHARGE, true);

                firstTick = false;

                me->CastCustomSpell(SPELL_WARLOCK_SHARPENED_DREADFANGS_BUFF, SPELLVALUE_BASE_POINT0, owner->GetAuraEffectAmount(SPELL_WARLOCK_SHARPENED_DREADFANGS, EFFECT_0), me, true);
            }

            UpdateVictim();
            DoMeleeAttackIfReady();
        }
    };
};

// 193396 - Demonic Empowerment
class spell_warlock_demonic_empowerment : public SpellScriptLoader
{
    public:
        spell_warlock_demonic_empowerment() : SpellScriptLoader("spell_warlock_demonic_empowerment") { }

        class spell_warlock_demonic_empowerment_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_demonic_empowerment_SpellScript);

            void FilterTargets(std::list<WorldObject*>& targets)
            {
                Unit* caster = GetCaster();
                targets.remove_if([caster](WorldObject* wobj)
                {
                    Unit* target = wobj->ToUnit();
                    if (!target)
                        return true;

                    if (target->GetEntry() == NPC_WARLOCK_DEMONIC_GATEWAY_GREEN ||
                        target->GetEntry() == NPC_WARLOCK_DEMONIC_GATEWAY_PURPLE)
                        return true;

                    return caster == target;
                });
            }

            void HandleCast()
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                if (roll_chance_i(caster->GetAuraEffectAmount(SPELL_WARLOCK_POWER_TRIP, EFFECT_0)) && caster->IsInCombat())
                    caster->CastSpell(caster, SPELL_WARLOCK_POWER_TRIP_ENERGIZE, true);
            }

            void Register() override
            {
                AfterCast += SpellCastFn(spell_warlock_demonic_empowerment_SpellScript::HandleCast);
                SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(m_scriptSpellId);
                // automatically hook SPELL_EFFECT_SCHOOL_DAMAGE
                for (SpellEffectInfo const* effect : spellInfo->GetEffectsForDifficulty(DIFFICULTY_NONE))
                    if (effect && effect->TargetA.GetTarget() == TARGET_UNIT_CASTER_PET)
                        OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_warlock_demonic_empowerment_SpellScript::FilterTargets, effect->EffectIndex, TARGET_UNIT_CASTER_PET);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_demonic_empowerment_SpellScript();
        }
};

// 193440 - Demonwrath
class spell_warlock_demonwrath : public SpellScriptLoader
{
    public:
        spell_warlock_demonwrath() : SpellScriptLoader("spell_warlock_demonwrath") { }

        class spell_warlock_demonwrath_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_demonwrath_SpellScript);

            void FilterTargets(std::list<WorldObject*>& targets)
            {
                Unit* caster = GetCaster();
                targets.remove_if([caster](WorldObject* wobj)
                {

                    Unit* target = wobj->ToUnit();
                    if (!target)
                        return true;

                    if (target->GetEntry() == NPC_WARLOCK_DEMONIC_GATEWAY_GREEN ||
                        target->GetEntry() == NPC_WARLOCK_DEMONIC_GATEWAY_PURPLE)
                        return true;

                    // We need to exclude caster too
                    if (target == caster)
                        return true;

                    return false;
                });
            }

            void Register() override
            {
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_warlock_demonwrath_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_CASTER_PET);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_demonwrath_SpellScript();
        }
};

// 193439 - Demonwrath damage
class spell_warlock_demonwrath_damage : public SpellScriptLoader
{
    public:
        spell_warlock_demonwrath_damage() : SpellScriptLoader("spell_warlock_demonwrath_damage") { }

        class spell_warlock_demonwrath_damage_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_demonwrath_damage_SpellScript);

            bool firstHit = true;

            void FilterTargets(std::list<WorldObject*>& targets)
            {
                // "dealing 3*0 (+34.5% SP) Shadow damage to all enemies within 10 yds of any of your demons"
                Unit* caster = GetCaster();
                if (!caster || !caster->ToPlayer())
                    return;

                Player* player = caster->ToPlayer();
                Pet* pet = player->GetPet();
                targets.remove_if([player, pet](WorldObject* wobj)
                {
                    Unit* target = wobj->ToUnit();
                    if (!target)
                        return true;

                    // Check if we have a pet that has demonwrath marker on him in 10 yards.
                    std::list<Creature*> possiblePets;
                    target->GetCreatureListWithEntryInGrid(possiblePets, 0, 10.f);
                    bool needToRemove = true;
                    for (Creature* pet : possiblePets)
                        if (pet->HasAura(SPELL_WARLOCK_DEMONWRATH_AURA, player->GetGUID()))
                            needToRemove = false;
                    if (pet && pet->IsWithinDist3d(target, 10.f))
                        needToRemove = false;

                    return needToRemove;
                });
            }

            void HandleHit(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                if (firstHit)
                {
                    if (roll_chance_i(sSpellMgr->GetSpellInfo(SPELL_WARLOCK_DEMONWRATH_AURA)->GetEffect(EFFECT_2)->BasePoints))
                        caster->CastSpell(caster, SPELL_WARLOCK_DEMONWRATH_ENERGIZE, true);

                    firstHit = false;
                }
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_warlock_demonwrath_damage_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_warlock_demonwrath_damage_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_demonwrath_damage_SpellScript();
        }
};

// 603 - Doom
class spell_warlock_doom : public SpellScriptLoader
{
    public:
        spell_warlock_doom() : SpellScriptLoader("spell_warlock_doom") { }

        class spell_warlock_doom_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_doom_AuraScript);

            void PeriodicTick(AuraEffect const* aurEff)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                caster->CastSpell(caster, SPELL_WARLOCK_DOOM_ENERGIZE, true);
                if (caster->HasAura(SPELL_WARLOCK_IMPENDING_DOOM))
                    caster->CastSpell(GetTarget(), SPELL_WARLOCK_WILD_IMP_SUMMON, true);

                if (caster->HasAura(SPELL_WARLOCK_DOOM_DOUBLED) && roll_chance_i(25))
                    GetEffect(EFFECT_0)->SetDamage(aurEff->GetDamage() * 2);
            }

            void Register() override
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_warlock_doom_AuraScript::PeriodicTick, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_doom_AuraScript();
        }
};

// 105174 - Hand of Gul'Dan
class spell_warlock_hand_of_guldan : public SpellScriptLoader
{
    public:
        spell_warlock_hand_of_guldan() : SpellScriptLoader("spell_warlock_hand_of_guldan") { }

        class spell_warlock_hand_of_guldan_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_hand_of_guldan_SpellScript);

            void HandleHit(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                Unit* target = GetHitUnit();
                if (!caster || !target)
                    return;

                uint32 soulShards = GetSpell()->GetSpellPowerCostModifier(POWER_SOUL_SHARDS) * GetEffectValue();

                caster->Variables.Set("_handOfGuldanSoulshards", soulShards);
                caster->CastSpell(target, SPELL_WARLOCK_HAND_OF_GULDAN_DAMAGE, true);
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_warlock_hand_of_guldan_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_hand_of_guldan_SpellScript();
        }
};

// 86040 - Hand of Gul'Dan damage
class spell_warlock_hand_of_guldan_damage : public SpellScriptLoader
{
    public:
        spell_warlock_hand_of_guldan_damage() : SpellScriptLoader("spell_warlock_hand_of_guldan_damage") { }

        class spell_warlock_hand_of_guldan_damage_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_hand_of_guldan_damage_SpellScript);

            void HandleHit(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                Unit* target = GetHitUnit();
                if (!caster)
                    return;

                uint32 usedSoulShards = caster->Variables.GetValue<uint32>("_handOfGuldanSoulshards");
                //Increase damage for all hit units
                SetHitDamage(GetHitDamage() * usedSoulShards);

                if (caster->HasAura(SPELL_WARLOCK_HAND_OF_DOOM))
                    caster->CastSpell(target, SPELL_WARLOCK_DOOM, true);

                // Summon wild imps only on primary target
                if (GetHitUnit() != GetExplTargetUnit())
                    return;

                double angleOffsets[3]{ 0, 2 * M_PI / 3, 4 * M_PI_2 / 3};
                for (uint32 i = 0; i < usedSoulShards; ++i)
                {
                    Position p = target->GetPosition();
                    target->MovePositionToFirstCollision(p, 2.f, angleOffsets[i]);
                    caster->CastSpell(p.GetPositionX(), p.GetPositionY(), p.GetPositionZ(), SPELL_WARLOCK_WILD_IMP_SUMMON, true);
                }
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_warlock_hand_of_guldan_damage_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_hand_of_guldan_damage_SpellScript();
        }
};

// 80240 - Havoc
// 200548 - Bane of Havoc
class spell_warlock_havoc : public SpellScriptLoader
{
    public:
        spell_warlock_havoc() : SpellScriptLoader("spell_warlock_havoc") { }

        class spell_warlock_havoc_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_havoc_AuraScript);

            void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                Unit* caster = GetCaster();
                Unit* target = GetUnitOwner();
                if (!caster || !target)
                    return;

                std::vector<ObjectGuid> targets = caster->Variables.GetValue<std::vector<ObjectGuid>>("Spells.HavocTargetGUID");
                targets.push_back(target->GetGUID());
                caster->Variables.Set("Spells.HavocTargetGUID", targets);
            }

            void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                Unit* caster = GetCaster();
                Unit* target = GetUnitOwner();
                if (!caster || !target)
                    return;

                std::vector<ObjectGuid> targets = caster->Variables.GetValue<std::vector<ObjectGuid>>("Spells.HavocTargetGUID");
                targets.erase(std::remove_if(targets.begin(), targets.end(), [target](ObjectGuid guid)
                {
                    return target->GetGUID() == guid;
                }));
                caster->Variables.Set("Spells.HavocTargetGUID", targets);
            }

            void Register() override
            {
                OnEffectRemove += AuraEffectRemoveFn(spell_warlock_havoc_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
                AfterEffectApply += AuraEffectApplyFn(spell_warlock_havoc_AuraScript::OnApply, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_havoc_AuraScript();
        }
};

// 5740 - Rain of Fire
// MiscId - 5420
struct at_warlock_rain_of_fire : AreaTriggerAI
{
    at_warlock_rain_of_fire(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

        void OnUpdate(uint32 diff) override
        {
            Unit* caster = at->GetCaster();
            if (!caster)
                return;

            int32 timer = at->Variables.GetValue<int32>("Spells.RainOfFireTimer") + diff;
            if (timer < 1000)
            {
                at->Variables.Set("Spells.RainOfFireTimer", timer);
                return;
            }

            for (ObjectGuid guid : at->GetInsideUnits())
                if (Unit* unit = ObjectAccessor::GetUnit(*caster, guid))
                    if (caster->IsValidAttackTarget(unit))
                        caster->CastSpell(unit, SPELL_WARLOCK_RAIN_OF_FIRE_DAMAGE, true);

            at->Variables.Set<int32>("Spells.RainOfFireTimer", int32(timer - 1000));
        }
};

// 77220 - Mastery: Chaotic Energies
class spell_warlock_chaotic_energies : public SpellScriptLoader
{
    public:
        spell_warlock_chaotic_energies() : SpellScriptLoader("spell_warlock_chaotic_energies") { }

        class spell_warlock_chaotic_energies_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_chaotic_energies_AuraScript);

            void CalculateAmount(AuraEffect const* /*aurEff*/, int32 & amount, bool & /*canBeRecalculated*/)
            {
                amount = -1;
            }

            void OnAbsorb(AuraEffect* /*aurEff*/, DamageInfo& /*dmgInfo*/, uint32& /*absorbAmount*/)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                // "Damage you take is reduced by a random amount, up to 0%."
                /*int32 chaoticEnergiesBonus = PROJECT::Mastery::CalculateBonus(caster, 0, -TALENT_SPEC_WARLOCK_DESTRUCTION, EFFECT_1);
                int32 actualBonus = urand(0, chaoticEnergiesBonus);

                absorbAmount = CalculatePct(dmgInfo.GetDamage(), actualBonus);*/
            }

            void Register() override
            {
                OnEffectAbsorb += AuraEffectAbsorbFn(spell_warlock_chaotic_energies_AuraScript::OnAbsorb, EFFECT_2);
                DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_warlock_chaotic_energies_AuraScript::CalculateAmount, EFFECT_2, SPELL_AURA_SCHOOL_ABSORB);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_chaotic_energies_AuraScript();
        }
};

// 233494 - Contagion
class spell_warlock_contagion : public SpellScriptLoader
{
    public:
        spell_warlock_contagion() : SpellScriptLoader("spell_warlock_contagion") { }

        class spell_warlock_contagion_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_contagion_AuraScript);

            void PeriodicTick(AuraEffect const* /*aurEff*/)
            {
                Unit* caster = GetCaster();
                Unit* target = GetTarget();
                if (!caster || !target)
                    return;

                std::vector<int32> uaspells = { SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT5, SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT4,
                    SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT3, SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT2,
                    SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT1 };

                bool hasUa = false;
                for (int32 ua : uaspells)
                    if (target->HasAura(ua, caster->GetGUID()))
                        hasUa = true;

                if (!hasUa)
                    Remove();
            }

            void Register() override
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_warlock_contagion_AuraScript::PeriodicTick, EFFECT_1, SPELL_AURA_PERIODIC_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_contagion_AuraScript();
        }
};

// 146739 - Corruption
class spell_warlock_corruption : public SpellScriptLoader
{
    public:
        spell_warlock_corruption() : SpellScriptLoader("spell_warlock_corruption") { }

        class spell_warlock_corruption_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_corruption_AuraScript);

            void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                if (Aura* absoluteCorruption = caster->GetAura(SPELL_WARLOCK_ABSOLUTE_CORRUPTION))
                {
                    GetAura()->Variables.Set("DontRecalculateDuration", uint32(0));
                    int32 duration = -1;
                    if (GetUnitOwner()->GetTypeId() == TYPEID_PLAYER)
                        duration = absoluteCorruption->GetEffect(EFFECT_0)->GetBaseAmount() * 1000;
                    SetMaxDuration(duration);
                    RefreshDuration();
                }
            }

            void Register() override
            {
                OnEffectApply += AuraEffectApplyFn(spell_warlock_corruption_AuraScript::OnApply, EFFECT_0, SPELL_AURA_PERIODIC_DAMAGE, AURA_EFFECT_HANDLE_REAL_OR_REAPPLY_MASK);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_corruption_AuraScript();
        }
};

// 219272 - Demon Skin
class spell_warlock_demon_skin : public SpellScriptLoader
{
    public:
        spell_warlock_demon_skin() : SpellScriptLoader("spell_warlock_demon_skin") { }

        class spell_warlock_demon_skin_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_demon_skin_AuraScript);

            void PeriodicTick(AuraEffect const* aurEff)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                float absorb = (aurEff->GetAmount() / 10.f) * caster->GetMaxHealth() / 100.f;

                // Add remaining amount if already applied
                AuraEffect* soulLeechShield = caster->GetAuraEffect(SPELL_WARLOCK_SOUL_LEECH_SHIELD, EFFECT_0);
                if (soulLeechShield)
                    absorb += soulLeechShield->GetAmount();

                AddPct(absorb, caster->GetAuraEffectAmount(SPELL_ARENA_DAMPENING, EFFECT_0));

                float threshold = caster->CountPctFromMaxHealth(GetEffect(EFFECT_1)->GetAmount());
                absorb = std::min(absorb, threshold);

                if (soulLeechShield)
                    soulLeechShield->SetAmount(absorb);
                else
                    caster->CastCustomSpell(SPELL_WARLOCK_SOUL_LEECH_SHIELD, SPELLVALUE_BASE_POINT0, absorb, caster, TRIGGERED_FULL_MASK);
            }

            void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                if (Aura* aur = caster->GetAura(SPELL_WARLOCK_SOUL_LEECH_SHIELD))
                {
                    aur->SetMaxDuration(15000);
                    aur->RefreshDuration();
                }
            }

            void Register() override
            {
                OnEffectRemove += AuraEffectRemoveFn(spell_warlock_demon_skin_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY, AURA_EFFECT_HANDLE_REAL);
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_warlock_demon_skin_AuraScript::PeriodicTick, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_demon_skin_AuraScript();
        }
};

// 103679 - Soul Effigy
class npc_warlock_soul_effigy : public CreatureScript
{
public:
    npc_warlock_soul_effigy() : CreatureScript("npc_warlock_soul_effigy") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_warlock_soul_effigyAI(creature);
    }

    struct npc_warlock_soul_effigyAI : public CreatureAI
    {
        npc_warlock_soul_effigyAI(Creature* creature) : CreatureAI(creature) { }

        void Reset() override
        {
            me->SetControlled(true, UNIT_STATE_ROOT);
            me->CastSpell(me, SPELL_WARLOCK_SOUL_EFFIGY_AURA, true);
        }

        void UpdateAI(uint32 /*diff*/) override { }
    };
};

// 205178 - Soul Effigy target
class spell_warlock_soul_effigy_target : public SpellScriptLoader
{
    public:
        spell_warlock_soul_effigy_target() : SpellScriptLoader("spell_warlock_soul_effigy_target") { }

        class spell_warlock_soul_effigy_target_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_soul_effigy_target_AuraScript);

            void PeriodicTick(AuraEffect const* /*aurEff*/)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                if (!caster->Variables.Exist("Spells.SoulEffigyGuid"))
                {
                    Remove();
                    return;
                }

                ObjectGuid const guid = caster->Variables.GetValue<ObjectGuid>("Spells.SoulEffigyGuid", ObjectGuid::Empty);
                if (!ObjectAccessor::GetUnit(*caster, guid))
                    Remove();
            }

            void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                ObjectGuid const guid = caster->Variables.GetValue<ObjectGuid>("Spells.SoulEffigyGuid", ObjectGuid::Empty);

                if (Unit* effigy = ObjectAccessor::GetUnit(*caster, guid))
                    effigy->ToTempSummon()->DespawnOrUnsummon();
            }

            void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                Unit* caster = GetCaster();
                Unit* target = GetTarget();
                if (!caster || !target)
                    return;

                caster->Variables.Set("Spells.SoulEffigyTargetGuid", target->GetGUID());
            }

            void Register() override
            {
                OnEffectApply += AuraEffectApplyFn(spell_warlock_soul_effigy_target_AuraScript::OnApply, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY, AURA_EFFECT_HANDLE_REAL_OR_REAPPLY_MASK);
                OnEffectRemove += AuraEffectRemoveFn(spell_warlock_soul_effigy_target_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY, AURA_EFFECT_HANDLE_REAL);
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_warlock_soul_effigy_target_AuraScript::PeriodicTick, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_soul_effigy_target_AuraScript();
        }
};

// 205247 - Soul Effigy aura
class spell_warlock_soul_effigy_aura : public SpellScriptLoader
{
    public:
        spell_warlock_soul_effigy_aura() : SpellScriptLoader("spell_warlock_soul_effigy_aura") { }

        class spell_warlock_soul_effigy_aura_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_soul_effigy_aura_AuraScript);

            void OnProc(AuraEffect const* aurEff, ProcEventInfo& eventInfo)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                Unit* owner = caster->ToTempSummon()->GetSummoner();
                if (!owner)
                    return;

                if (eventInfo.GetSpellInfo() && eventInfo.GetSpellInfo()->IsPositive())
                    return;

                int32 damage = CalculatePct(eventInfo.GetDamageInfo()->GetDamage(), aurEff->GetAmount());
                if (!damage)
                    return;

                ObjectGuid const guid = owner->Variables.GetValue<ObjectGuid>("Spells.SoulEffigyTargetGuid", ObjectGuid::Empty);

                if (Unit* target = ObjectAccessor::GetUnit(*owner, guid))
                {
                    caster->CastSpell(target, SPELL_WARLOCK_SOUL_EFFIGY_VISUAL, true, nullptr, nullptr, owner->GetGUID());
                    ObjectGuid targetGuid = target->GetGUID();
                    ObjectGuid ownerGuid = owner->GetGUID();
                    caster->GetScheduler().Schedule(750ms, [caster, targetGuid, damage, ownerGuid](TaskContext /*context*/)
                    {
                        Unit* target = ObjectAccessor::GetUnit(*caster, targetGuid);
                        Unit* owner = ObjectAccessor::GetUnit(*caster, ownerGuid);
                        if (!target || !owner)
                            return;

                        caster->CastCustomSpell(SPELL_WARLOCK_SOUL_EFFIGY_DAMAGE, SPELLVALUE_BASE_POINT0, damage, target, true, nullptr, nullptr, owner->GetGUID());
                    });
                }
            }

            void Register() override
            {
                OnEffectProc += AuraEffectProcFn(spell_warlock_soul_effigy_aura_AuraScript::OnProc, EFFECT_0, SPELL_AURA_PERIODIC_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_soul_effigy_aura_AuraScript();
        }
};

// 205145 - Demonic Calling
class spell_warlock_demonic_calling : public SpellScriptLoader
{
    public:
        spell_warlock_demonic_calling() : SpellScriptLoader("spell_warlock_demonic_calling") { }

        class spell_warlock_demonic_calling_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_demonic_calling_AuraScript);

            bool CheckProc(ProcEventInfo& eventInfo)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return false;

                int32 rollChance = 0;
                switch (eventInfo.GetSpellInfo()->Id)
                {
                    case SPELL_WARLOCK_SHADOWBOLT:
                        rollChance = 20;
                        break;
                    case SPELL_WARLOCK_DEMONWRATH_DAMAGE:
                        rollChance = 5;
                        break;
                }

                return roll_chance_i(rollChance);
            }

            void Register() override
            {
                DoCheckProc += AuraCheckProcFn(spell_warlock_demonic_calling_AuraScript::CheckProc);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_demonic_calling_AuraScript();
        }
};

// 196277 - Implosion
class spell_warlock_implosion : public SpellScriptLoader
{
    public:
        spell_warlock_implosion() : SpellScriptLoader("spell_warlock_implosion") { }

        class spell_warlock_implosion_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_implosion_SpellScript);

            void HandleHit(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                Unit* target = GetHitUnit();
                if (!caster || !target)
                    return;

                std::list<Creature*> imps;
                caster->GetCreatureListWithEntryInGrid(imps, 55659); // Wild Imps
                for (Creature* imp : imps)
                {
                    if (imp->ToTempSummon()->GetSummoner() == caster)
                    {
                        imp->Variables.Set("ForceUpdateTimers", true);
                        imp->CastSpell(target, SPELL_WARLOCK_IMPLOSION_JUMP, true);
                        imp->GetMotionMaster()->MoveJump(*target, 300.f, 1.f, EVENT_JUMP);
                        ObjectGuid casterGuid = caster->GetGUID();
                        caster->GetScheduler().Schedule(500ms, [imp, casterGuid](TaskContext /*context*/)
                        {
                            imp->CastSpell(imp, SPELL_WARLOCK_IMPLOSION_DAMAGE, true, nullptr, nullptr, casterGuid);
                            imp->DisappearAndDie();
                        });
                    }
                }
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_warlock_implosion_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_implosion_SpellScript();
        }
};

// 171975 - Grimoire of Synergy
class spell_warlock_grimoir_of_synergy : public SpellScriptLoader
{
    public:
        spell_warlock_grimoir_of_synergy() : SpellScriptLoader("spell_warlock_grimoir_of_synergy") { }

        class spell_warlock_grimoir_of_synergy_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_grimoir_of_synergy_AuraScript);

            void OnProc(AuraEffect const* /*aurEff*/, ProcEventInfo& /*eventInfo*/)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                if (caster->GetTypeId() != TYPEID_PLAYER)
                    caster->CastSpell(caster->GetOwner(), SPELL_WARLOCK_GRIMOIRE_OF_SYNERGY, true);
                else if (Pet* pet = caster->ToPlayer()->GetPet())
                    caster->CastSpell(pet, SPELL_WARLOCK_GRIMOIRE_OF_SYNERGY, true);
            }

            void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                if (Player* player = caster->ToPlayer())
                    if (Pet* pet = player->GetPet())
                        pet->RemoveAurasDueToSpell(SPELL_WARLOCK_GRIMOIRE_OF_SYNERGY);
            }

            void Register() override
            {
                OnEffectRemove += AuraEffectRemoveFn(spell_warlock_grimoir_of_synergy_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
                OnEffectProc += AuraEffectProcFn(spell_warlock_grimoir_of_synergy_AuraScript::OnProc, EFFECT_0, SPELL_AURA_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_grimoir_of_synergy_AuraScript();
        }
};

// Summon Darkglare - 205180
class spell_warlock_summon_darkglare : public SpellScript
{
    PrepareSpellScript(spell_warlock_summon_darkglare);

    void HandleOnHitTarget(SpellEffIndex /*effIndex*/)
    {
        if (Unit* target = GetHitUnit())
        {
            Player::AuraEffectList effectList = target->GetAuraEffectsByTypes({ SPELL_AURA_PERIODIC_DAMAGE, SPELL_AURA_PERIODIC_DAMAGE_PERCENT }, GetCaster()->GetGUID());

            for (AuraEffect* effect : effectList)
                if (Aura* aura = effect->GetBase())
                    aura->ModDuration(GetEffectInfo(EFFECT_1)->CalcValue() * IN_MILLISECONDS);
        }
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_warlock_summon_darkglare::HandleOnHitTarget, EFFECT_1, SPELL_EFFECT_SCRIPT_EFFECT);
    }
};

// 103673 - Darkglare
struct npc_warlock_darkglare : public PetAI
{
    npc_warlock_darkglare(Creature* creature) : PetAI(creature) {}

    void UpdateAI(uint32 /*diff*/) override
    {
        Unit* owner = me->GetOwner();
        if (!owner)
            return;

        Unit* target = GetTarget();
        ObjectGuid newtargetGUID = owner->GetTarget();
        if (newtargetGUID.IsEmpty() || newtargetGUID == _targetGUID)
        {
            CastSpellOnTarget(owner, target);
            return;
        }

        if (Unit* newTarget = ObjectAccessor::GetUnit(*me, newtargetGUID))
            if (target != newTarget && me->IsValidAttackTarget(newTarget))
                target = newTarget;

        CastSpellOnTarget(owner, target);
    }

    void DamageDealt(Unit* /*victim*/, uint32& damage, DamageEffectType /*damageType*/) override
    {
        Unit* owner = me->GetOwner();
        if (!owner)
            return;

        uint32 baseDamageMultiplier = 0;
        if (Aura* darkGlareSummonAura = owner->GetAura(SPELL_WARLOCK_DARKGLARE_SUMMON))
            baseDamageMultiplier = darkGlareSummonAura->GetEffect(EFFECT_2)->GetBaseAmount();

        auto ownedAuras = owner->GetOwnedAurasByTypes({ SPELL_AURA_PERIODIC_DAMAGE, SPELL_AURA_PERIODIC_DAMAGE_PERCENT });

        AddPct(damage, ownedAuras.size() * baseDamageMultiplier);
    }

private:
    Unit* GetTarget() const
    {
        return ObjectAccessor::GetUnit(*me, _targetGUID);
    }

    void CastSpellOnTarget(Unit* /*owner*/, Unit* target)
    {
        if (target && me->IsValidAttackTarget(target))
        {
            _targetGUID = target->GetGUID();
            me->CastSpell(target, SPELL_WARLOCK_DARKGLARE_EYE_BEAM, false);
        }
    }

    ObjectGuid _targetGUID;
};

// 205231 - Eye Laser
class spell_warlock_eye_laser : public SpellScriptLoader
{
    public:
        spell_warlock_eye_laser() : SpellScriptLoader("spell_warlock_eye_laser") { }

        class spell_warlock_eye_laser_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_eye_laser_SpellScript);

            void FilterTargets(std::list<WorldObject*>& unitList)
            {
                Unit* caster = GetOriginalCaster();
                if (!caster)
                    return;

                unitList.remove_if(Trinity::UnitAuraCheck(false, SPELL_WARLOCK_DOOM, caster->GetGUID()));
            }

            void Register() override
            {
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_warlock_eye_laser_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_TARGET_ENEMY);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_eye_laser_SpellScript();
        }
};

// 157695 - Demonbolt
class spell_warlock_demonbolt_old : public SpellScriptLoader
{
    public:
        spell_warlock_demonbolt_old() : SpellScriptLoader("spell_warlock_demonbolt_old") { }

        class spell_warlock_demonbolt_old_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_demonbolt_old_SpellScript);

            void HandleHit(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                int32 damage = GetHitDamage();
                int32 pctMod = GetEffectInfo(EFFECT_2)->CalcValue(caster);
                AddPct(damage, caster->m_Controlled.size() * pctMod);
                SetHitDamage(damage);
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_warlock_demonbolt_old_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_demonbolt_old_SpellScript();
        }
};

// 17877 - Shadowburn
class spell_warlock_shadowburn : public SpellScriptLoader
{
    public:
        spell_warlock_shadowburn() : SpellScriptLoader("spell_warlock_shadowburn") { }

        class spell_warlock_shadowburn_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_shadowburn_SpellScript);

            void HandleHit(SpellEffIndex /*effIndex*/)
            {
                Player* caster = GetCaster()->ToPlayer();
                Unit* target = GetHitUnit();
                if (!caster || !target)
                    return;

                caster->CastSpell(caster, SPELL_WARLOCK_SHADOWBURN_ENERGIZE, true);

                if (caster->HasAura(SPELL_WARLOCK_CONFLAGRATION_OF_CHAOS))
                {
                    int32 damage = GetHitDamage();
                    AddPct(damage, caster->m_activePlayerData->SpellCritPercentage);
                    SetHitDamage(damage);

                    caster->RemoveAurasDueToSpell(SPELL_WARLOCK_CONFLAGRATION_OF_CHAOS);
                }
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_warlock_shadowburn_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
            }
        };

        class spell_warlock_shadowburn_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_shadowburn_AuraScript);

            void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                if (GetTargetApplication() && GetTargetApplication()->GetRemoveMode() == AURA_REMOVE_BY_DEATH)
                    GetCaster()->GetSpellHistory()->ResetCooldown(SPELL_WARLOCK_SHADOWBURN, true);
            }

            void Register() override
            {
                OnEffectRemove += AuraEffectRemoveFn(spell_warlock_shadowburn_AuraScript::OnRemove, EFFECT_1, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL_OR_REAPPLY_MASK);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_shadowburn_SpellScript();
        }

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_shadowburn_AuraScript();
        }
};

// 126 - Eye of Kilrogg
class spell_warlock_eye_of_kilrogg : public SpellScriptLoader
{
    public:
        spell_warlock_eye_of_kilrogg() : SpellScriptLoader("spell_warlock_eye_of_kilrogg") { }

        class spell_warlock_eye_of_kilrogg_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_eye_of_kilrogg_AuraScript);

            void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                Unit* caster = GetCaster();
                if (!caster || !caster->ToPlayer())
                    return;

                if (caster->ToPlayer()->GetPet())
                {
                    caster->GetScheduler().Schedule(250ms, [caster](TaskContext /*context*/)
                    {
                        caster->ToPlayer()->PetSpellInitialize();
                    });
                }
            }

            void Register() override
            {
                OnEffectRemove += AuraEffectRemoveFn(spell_warlock_eye_of_kilrogg_AuraScript::OnRemove, EFFECT_1, SPELL_AURA_MOD_INVISIBILITY_DETECT, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_eye_of_kilrogg_AuraScript();
        }
};

// 221711 - Essence Drain
// Called by Drain Soul (198590) and Drain Life (234153)
class spell_warlock_essence_drain : public SpellScriptLoader
{
    public:
        spell_warlock_essence_drain() : SpellScriptLoader("spell_warlock_essence_drain") { }

        class spell_warlock_essence_drain_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_essence_drain_AuraScript);

            void PeriodicTick(AuraEffect const* /*aurEff*/)
            {
                Unit* caster = GetCaster();
                Unit* target = GetUnitOwner();
                if (!caster || !target)
                    return;

                if (caster->HasAura(SPELL_WARLOCK_ESSENCE_DRAIN))
                    caster->CastSpell(target, SPELL_WARLOCK_ESSENCE_DRAIN_DEBUFF, true);

                if (uint32 durationBonus = caster->GetAuraEffectAmount(SPELL_WARLOCK_ROT_AND_DECAY, EFFECT_0))
                {
                    std::vector<uint32> dots{ SPELL_WARLOCK_AGONY, SPELL_WARLOCK_CORRUPTION_TRIGGERED, SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT1, SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT2,
                        SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT3, SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT4, SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT5 };

                    for (uint32 dot : dots)
                        if (Aura* aur = target->GetAura(dot, caster->GetGUID()))
                            aur->ModDuration(durationBonus);
                }
            }

            void Register() override
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_warlock_essence_drain_AuraScript::PeriodicTick, EFFECT_0, SPELL_AURA_PERIODIC_LEECH);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_essence_drain_AuraScript();
        }
};

// 221703 - Casting Circle
// MiscId - 8138
struct at_warlock_casting_circle : AreaTriggerAI
{
    at_warlock_casting_circle(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

        void OnUnitEnter(Unit* unit) override
        {
            Unit* caster = at->GetCaster();
            if (!caster || !unit)
                return;

            if (caster == unit)
                caster->CastSpell(unit, SPELL_WARLOCK_CASTING_CIRCLE_BUFF, true);
        }

        void OnUnitExit(Unit* unit) override
        {
            Unit* caster = at->GetCaster();
            if (!caster || !unit)
                return;

            unit->RemoveAurasDueToSpell(SPELL_WARLOCK_CASTING_CIRCLE_BUFF, caster->GetGUID());
        }
};

// 212356 - Soulshatter
class spell_warlock_soul_shatter : public SpellScriptLoader
{
    public:
        spell_warlock_soul_shatter() : SpellScriptLoader("spell_warlock_soul_shatter") { }

        class spell_warlock_soul_shatter_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_soul_shatter_SpellScript);

            void FilterTargets(std::list<WorldObject*>& unitList)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                unitList.remove_if([caster](WorldObject* obj)
                {
                    Unit* target = obj->ToUnit();
                    if (!target)
                        return true;

                    return !(target->HasAura(SPELL_WARLOCK_AGONY, caster->GetGUID()) || target->HasAura(SPELL_WARLOCK_CORRUPTION_TRIGGERED, caster->GetGUID()) ||
                        target->HasAura(SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT1, caster->GetGUID()) || target->HasAura(SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT2, caster->GetGUID()) ||
                        target->HasAura(SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT3, caster->GetGUID()) || target->HasAura(SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT4, caster->GetGUID()) ||
                        target->HasAura(SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT5, caster->GetGUID()));
                });

                unitList.sort(Trinity::ObjectDistanceOrderPred(caster));
                if (unitList.size() > 5)
                    unitList.resize(5);
            }

            void HandleHit(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                Unit* target = GetHitUnit();
                if (!caster || !target)
                    return;

                // Apparently does 10% dmg no matter what.
                int32 maxHealthPctPossible = GetSpellInfo()->GetEffect(EFFECT_2)->BasePoints;
                //int32 healthPctFromDot = (int32) ((float) RemoveDotsAndAggregateDamage(caster, target) / (float) target->CountPctFromMaxHealth(maxHealthPctPossible));

                //if (healthPctFromDot < maxHealthPctPossible)
                //{
                //    SetHitDamage(healthPctFromDot);
                //} else {
                    SetHitDamage(maxHealthPctPossible);
                //}
                caster->CastSpell(caster, SPELL_WARLOCK_SOULSHATTER_ENERGIZE, true);
                caster->CastSpell(caster, SPELL_WARLOCK_SOULSHATTER_HASTE, true);
            }

            int32 RemoveDotsAndAggregateDamage(Unit* caster, Unit* target)
            {
                std::vector<uint32> dots{ SPELL_WARLOCK_AGONY, SPELL_WARLOCK_CORRUPTION_TRIGGERED, SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT1, SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT2,
                                          SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT3, SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT4, SPELL_WARLOCK_UNSTABLE_AFFLICTION_DOT5 };
                int32 dotDamage = 0;
                for (uint32 dot : dots)
                {
                    //if (AuraEffect* aurEff = target->GetAuraEffect(dot, SPELL_AURA_PERIODIC_DAMAGE, caster->GetGUID()))
                    //    dotDamage += aurEff->GetRemainingDamage(24000);
                    target->RemoveAurasDueToSpell(dot, caster->GetGUID());
                }
                return dotDamage;
            }

            void Register() override
            {
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_warlock_soul_shatter_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENEMY);
                OnEffectHitTarget += SpellEffectFn(spell_warlock_soul_shatter_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_DAMAGE_FROM_MAX_HEALTH_PCT);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_soul_shatter_SpellScript();
        }
};

// 234877 - Curse of Shadows
class spell_warlock_curse_of_shadows : public SpellScriptLoader
{
    public:
        spell_warlock_curse_of_shadows() : SpellScriptLoader("spell_warlock_curse_of_shadows") { }

        class spell_warlock_curse_of_shadows_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_curse_of_shadows_AuraScript);

            void OnProc(AuraEffect const* aurEff, ProcEventInfo& eventInfo)
            {
                PreventDefaultAction();
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                SpellInfo const* spellInfo = eventInfo.GetDamageInfo()->GetSpellInfo();
                if (!spellInfo || !(spellInfo->GetSchoolMask() & SPELL_SCHOOL_MASK_MAGIC))
                    return;

                int32 damage = CalculatePct(eventInfo.GetDamageInfo()->GetDamage(), aurEff->GetAmount());
                caster->CastCustomSpell(SPELL_WARLOCK_CURSE_OF_SHADOWS_DAMAGE, SPELLVALUE_BASE_POINT0, damage, eventInfo.GetActionTarget(), true);
            }

            void Register() override
            {
                OnEffectProc += AuraEffectProcFn(spell_warlock_curse_of_shadows_AuraScript::OnProc, EFFECT_0, SPELL_AURA_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_curse_of_shadows_AuraScript();
        }
};

// 212619 - Call Felhunter
class spell_warlock_call_felhunter : public SpellScriptLoader
{
    public:
        spell_warlock_call_felhunter() : SpellScriptLoader("spell_warlock_call_felhunter") { }

        class spell_warlock_call_felhunter_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_call_felhunter_SpellScript);

            SpellCastResult CheckCast()
            {
                Unit* caster = GetCaster();
                if (!caster || !caster->ToPlayer())
                    return SPELL_FAILED_BAD_TARGETS;

                if (caster->ToPlayer()->GetPet() && caster->ToPlayer()->GetPet()->GetEntry() == 417)
                    return SPELL_FAILED_CANT_DO_THAT_RIGHT_NOW;

                return SPELL_CAST_OK;
            }

            void Register() override
            {
                OnCheckCast += SpellCheckCastFn(spell_warlock_call_felhunter_SpellScript::CheckCast);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_call_felhunter_SpellScript();
        }
};

// 212623 - Singe Magic
class spell_warlock_singe_magic : public SpellScriptLoader
{
    public:
        spell_warlock_singe_magic() : SpellScriptLoader("spell_warlock_singe_magic") { }

        class spell_warlock_singe_magic_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_singe_magic_SpellScript);

            void HandleHit(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                Unit* target = GetHitUnit();
                if (!caster || !target)
                    return;

                if (Pet* pet = caster->ToPlayer()->GetPet())
                    pet->CastCustomSpell(SPELL_WARLOCK_SINGE_MAGIC, SPELLVALUE_BASE_POINT0, GetEffectInfo(EFFECT_0)->BasePoints, target, true);
            }

            SpellCastResult CheckCast()
            {
                Unit* caster = GetCaster();
                if (!caster || !caster->ToPlayer())
                    return SPELL_FAILED_BAD_TARGETS;

                if (caster->ToPlayer()->GetPet() && caster->ToPlayer()->GetPet()->GetEntry() == 416)
                    return SPELL_CAST_OK;

                return SPELL_FAILED_CANT_DO_THAT_RIGHT_NOW;
            }

            void Register() override
            {
                OnCheckCast += SpellCheckCastFn(spell_warlock_singe_magic_SpellScript::CheckCast);
                OnEffectHitTarget += SpellEffectFn(spell_warlock_singe_magic_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_singe_magic_SpellScript();
        }
};

// 107024 - Fel Lord
class npc_warlock_fel_lord : public CreatureScript
{
public:
    npc_warlock_fel_lord() : CreatureScript("npc_warlock_fel_lord") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_warlock_fel_lordAI(creature);
    }

    struct npc_warlock_fel_lordAI : public CreatureAI
    {
        npc_warlock_fel_lordAI(Creature* creature) : CreatureAI(creature) { }

        void Reset() override
        {
            Unit* owner = me->GetOwner();
            if (!owner)
                return;

            me->SetMaxHealth(owner->GetMaxHealth());
            me->SetHealth(me->GetMaxHealth());
            me->SetControlled(true, UNIT_STATE_ROOT);
        }

        void UpdateAI(uint32 /*diff*/) override
        {
            if (me->HasUnitState(UNIT_STATE_CASTING))
                return;

            me->CastSpell(me, SPELL_WARLOCK_FEL_LORD_CLEAVE, false);
        }
    };
};

// Summon Observer
// MiscId - 90001
struct at_warlock_summon_observer : AreaTriggerAI
{
    at_warlock_summon_observer(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

        void OnUnitEnter(Unit* unit) override
        {
            Unit* caster = at->GetCaster();
            if (!caster || !unit)
                return;

            Unit* owner = caster->GetOwner();
            if (!owner)
                return;

            if (owner->IsValidAttackTarget(unit))
                caster->CastSpell(unit, SPELL_WARLOCK_OBSERVER_AURA, true);
        }

        void OnUnitExit(Unit* unit) override
        {
            Unit* caster = at->GetCaster();
            if (!caster || !unit)
                return;

            unit->RemoveAurasDueToSpell(SPELL_WARLOCK_OBSERVER_AURA, caster->GetGUID());
        }
};

// 212580 - Eye of the Observer
class spell_warlock_eye_of_the_observer : public SpellScriptLoader
{
    public:
        spell_warlock_eye_of_the_observer() : SpellScriptLoader("spell_warlock_eye_of_the_observer") { }

        class spell_warlock_eye_of_the_observer_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_eye_of_the_observer_AuraScript);

            void OnProc(AuraEffect const* /*aurEff*/, ProcEventInfo& eventInfo)
            {
                PreventDefaultAction();
                Unit* caster = GetCaster();
                Unit* actor = eventInfo.GetActor();
                if (!caster || !actor)
                    return;

                caster->CastCustomSpell(SPELL_WARLOCK_LASERBEAM, SPELLVALUE_BASE_POINT0, actor->CountPctFromMaxHealth(5), actor, true);
            }

            void Register() override
            {
                OnEffectProc += AuraEffectProcFn(spell_warlock_eye_of_the_observer_AuraScript::OnProc, EFFECT_0, SPELL_AURA_DUMMY);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_eye_of_the_observer_AuraScript();
        }
};

// 212282 - Cremation
class spell_warlock_cremation : public SpellScriptLoader
{
    public:
        spell_warlock_cremation() : SpellScriptLoader("spell_warlock_cremation") { }

        class spell_warlock_cremation_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_cremation_AuraScript);

            void OnProc(AuraEffect const* aurEff, ProcEventInfo& eventInfo)
            {
                PreventDefaultAction();
                Unit* caster = GetCaster();
                Unit* target = eventInfo.GetActionTarget();
                if (!caster || !target)
                    return;

                switch (eventInfo.GetDamageInfo()->GetSpellInfo()->Id)
                {
                    case SPELL_WARLOCK_SHADOWBURN:
                    case SPELL_WARLOCK_CONFLAGRATE:
                        caster->CastCustomSpell(GetSpellInfo()->GetEffect(EFFECT_0)->TriggerSpell, SPELLVALUE_BASE_POINT0, aurEff->GetAmount(), target, true);
                        break;
                    case SPELL_WARLOCK_INCINERATE:
                        caster->CastSpell(target, SPELL_WARLOCK_IMMOLATE_DOT, true);
                        break;
                }
            }

            void Register() override
            {
                OnEffectProc += AuraEffectProcFn(spell_warlock_cremation_AuraScript::OnProc, EFFECT_0, SPELL_AURA_PROC_TRIGGER_SPELL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_cremation_AuraScript();
        }
};

// 212269 - Fel Fissure
// MiscId - 6959
struct at_warlock_fel_fissure : AreaTriggerAI
{
    at_warlock_fel_fissure(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

        void OnUnitEnter(Unit* unit) override
        {
            Unit* caster = at->GetCaster();
            if (!caster || !unit)
                return;

            if (caster->IsValidAttackTarget(unit))
                caster->CastSpell(unit, SPELL_WARLOCK_FEL_FISSURE_DEBUFF, true);
        }

        void OnUnitExit(Unit* unit) override
        {
            Unit* caster = at->GetCaster();
            if (!caster || !unit)
                return;

            unit->RemoveAurasDueToSpell(SPELL_WARLOCK_FEL_FISSURE_DEBUFF, caster->GetGUID());
        }
};

// 200546 - Bane of Havoc
// MiscId - 5650
struct at_warlock_bane_of_havoc : AreaTriggerAI
{
    at_warlock_bane_of_havoc(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

        void OnUnitEnter(Unit* unit) override
        {
            Unit* caster = at->GetCaster();
            if (!caster || !unit)
                return;

            if (caster->IsValidAttackTarget(unit))
                caster->CastSpell(unit, SPELL_WARLOCK_BANE_OF_HAVOC_DEBUFF, true);
        }

        void OnUnitExit(Unit* unit) override
        {
            Unit* caster = at->GetCaster();
            if (!caster || !unit)
                return;

            unit->RemoveAurasDueToSpell(SPELL_WARLOCK_BANE_OF_HAVOC_DEBUFF, caster->GetGUID());
        }
};

// 117828 - Backdraft
class spell_warlock_backdraft : public SpellScriptLoader
{
    public:
        spell_warlock_backdraft() : SpellScriptLoader("spell_warlock_backdraft") { }

        class spell_warlock_backdraft_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_backdraft_AuraScript);

            bool OnCheckProc(ProcEventInfo& /*eventInfo*/)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return false;

                if (caster->Variables.GetValue<time_t>("Spells.BackdraftCD", 0) > time(nullptr))
                    return false;

                caster->Variables.Set<time_t>("Spells.BackdraftCD", time(nullptr) + 500);
                return true;
            }

            void Register() override
            {
                DoCheckProc += AuraCheckProcFn(spell_warlock_backdraft_AuraScript::OnCheckProc);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_backdraft_AuraScript();
        }
};

// 231489 - Compounding Horror
class spell_warlock_compounding_horror : public SpellScriptLoader
{
    public:
        spell_warlock_compounding_horror() : SpellScriptLoader("spell_warlock_compounding_horror") { }

        class spell_warlock_compounding_horror_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_compounding_horror_SpellScript);

            void HandleHit(SpellEffIndex /*effIndex*/)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                int32 damage = GetHitDamage();
                int32 stacks = 0;
                if (Aura* aur = caster->GetAura(SPELL_WARLOCK_COMPOUNDING_HORROR))
                    stacks = aur->GetStackAmount();

                SetHitDamage(damage * stacks);

                caster->RemoveAurasDueToSpell(SPELL_WARLOCK_COMPOUNDING_HORROR);
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_warlock_compounding_horror_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_compounding_horror_SpellScript();
        }
};

// 108446 - Soul Link
class spell_warlock_soul_link : public SpellScriptLoader
{
    public:
        spell_warlock_soul_link() : SpellScriptLoader("spell_warlock_soul_link") { }

        class spell_warlock_soul_link_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_soul_link_AuraScript);

            void HandleSplit(AuraEffect* /*aurEff*/, DamageInfo& /*dmgInfo*/, uint32& splitAmount)
            {
                Unit* pet = GetUnitOwner();
                if (!pet)
                    return;

                Unit* owner = pet->GetOwner();
                if (!owner)
                    return;

                if (owner->HasAura(SPELL_WARLOCK_SOUL_SKIN) && owner->HealthBelowPct(35))
                    splitAmount *= 2;
            }

            void Register() override
            {
                OnEffectSplit += AuraEffectSplitFn(spell_warlock_soul_link_AuraScript::HandleSplit, EFFECT_0);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_soul_link_AuraScript();
        }
};

// 211219 - The Expendables
class spell_warlock_artifact_the_expendables : public SpellScriptLoader
{
    public:
        spell_warlock_artifact_the_expendables() : SpellScriptLoader("spell_warlock_artifact_the_expendables") { }

        class spell_warlock_artifact_the_expendables_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_artifact_the_expendables_AuraScript);

            void OnRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                if (caster->ToPlayer())
                    return;

                Player* player = caster->GetCharmerOrOwnerPlayerOrPlayerItself();
                if (!player)
                    return;

                for (Unit* unit : player->m_Controlled)
                    player->CastSpell(unit, SPELL_WARLOCK_THE_EXPANDABLES_BUFF, true);
            }

            void Register() override
            {
                OnEffectRemove += AuraEffectRemoveFn(spell_warlock_artifact_the_expendables_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_DUMMY, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_artifact_the_expendables_AuraScript();
        }
};

// 211720 - Thal'kiel's Discord
class spell_warlock_artifact_thalkiels_discord : public SpellScriptLoader
{
    public:
        spell_warlock_artifact_thalkiels_discord() : SpellScriptLoader("spell_warlock_artifact_thalkiels_discord") { }

        class spell_warlock_artifact_thalkiels_discord_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_warlock_artifact_thalkiels_discord_AuraScript);

            void OnProc(AuraEffect const* aurEff, ProcEventInfo& eventInfo)
            {
                PreventDefaultAction();
                Unit* caster = GetCaster();
                Unit* target = eventInfo.GetActionTarget();
                if (!caster || !target)
                    return;

                if (!caster->IsValidAttackTarget(target))
                    return;

                caster->CastSpell(target, aurEff->GetSpellEffectInfo()->TriggerSpell, true);
            }

            void Register() override
            {
                OnEffectProc += AuraEffectProcFn(spell_warlock_artifact_thalkiels_discord_AuraScript::OnProc, EFFECT_0, SPELL_AURA_PROC_TRIGGER_SPELL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_warlock_artifact_thalkiels_discord_AuraScript();
        }
};

// 211729 - Thal'kiel's Discord
// MiscId - 6913
struct at_warlock_artifact_thalkiels_discord : AreaTriggerAI
{
    at_warlock_artifact_thalkiels_discord(AreaTrigger* areatrigger) : AreaTriggerAI(areatrigger) { }

        void OnUpdate(uint32 diff) override
        {
            Unit* caster = at->GetCaster();
            if (!caster)
                return;

            int32 timer = at->Variables.GetValue<int32>("_timer") + diff;
            if (timer >= 1300)
            {
                at->Variables.Set<int32>("_timer", 0);
                caster->CastSpell(*at, SPELL_WARLOCK_THALKIES_DISCORD_DAMAGE, true);
            }
            else
                at->Variables.Set("_timer", timer);
        }
};

// 171017 - Meteor Strike
class spell_warlock_infernal_meteor_strike : public SpellScriptLoader
{
    public:
        spell_warlock_infernal_meteor_strike() : SpellScriptLoader("spell_warlock_infernal_meteor_strike") { }

        class spell_warlock_infernal_meteor_strike_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_warlock_infernal_meteor_strike_SpellScript);

            void HandleCast()
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                if (Player* player = caster->GetCharmerOrOwnerPlayerOrPlayerItself())
                    if (player->HasAura(SPELL_WARLOCK_LORD_OF_THE_FLAMES) && !player->HasAura(SPELL_WARLOCK_LORD_OF_THE_FLAMES_CD))
                    {
                        for (uint32 i = 0; i < 3; ++i)
                            player->CastSpell(caster, SPELL_WARLOCK_LORD_OF_THE_FLAMES_SUMMON, true);
                        player->CastSpell(player, SPELL_WARLOCK_LORD_OF_THE_FLAMES_CD, true);
                    }
            }

            void Register() override
            {
                OnCast += SpellCastFn(spell_warlock_infernal_meteor_strike_SpellScript::HandleCast);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_warlock_infernal_meteor_strike_SpellScript();
        }
};



// 251404 - Agony Soul Shard Driver
enum SoulShardDriverData
{
    DATA_AGONY_TICK     = 5,
    DATA_AGONY_ADD      = 6,
    DATA_AGONY_REMOVE   = 7,
};

class aura_warlock_soul_shard_driver : public AuraScript
{
    PrepareAuraScript(aura_warlock_soul_shard_driver);

public:
    aura_warlock_soul_shard_driver()
    {
        _soulShardGenerator = 0.f;
        _agonyNumber = 0.0;
    }

    void SoulShardDriverTick()
    {
        if (_agonyNumber >= 1.0)
        {
            _soulShardGenerator += (GetAverage() + GetVariance()) / sqrt(_agonyNumber);
            if (_soulShardGenerator >= 1.f)
            {
                _soulShardGenerator -= 1.f;
                GetCaster()->CastSpell(GetCaster(), SPELL_WARLOCK_AGONY_ENERGIZE, true);
            }
        }
    }

    float GetVariance()
    {
        return GetAverage() * irand(-50, 50) / 100.f;
    }

    float GetAverage()
    {
        return 0.1618958f;
    }

    void SetData(uint32 type, int64 /*data*/)
    {
        if (type == DATA_AGONY_TICK)
        {
            SoulShardDriverTick();
        }
        if (type == DATA_AGONY_ADD)
        {
            _agonyNumber += 1.0;
        }
        if (type == DATA_AGONY_REMOVE)
        {
            _agonyNumber -= 1.0;
            if (_agonyNumber < 0.0)
            {
                _agonyNumber = 0.0;
            }
        }
    }

    void Register() override
    {
    }

private:
    float _soulShardGenerator;
    double _agonyNumber;
};

// 980 - Agony
class spell_warlock_agony : public SpellScriptLoader {
public:
    spell_warlock_agony() : SpellScriptLoader("spell_warlock_agony") { }

    class spell_warlock_agony_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warlock_agony_AuraScript);

    public:
        spell_warlock_agony_AuraScript() {  }

        void HandleApply(AuraEffect const* aurEff, AuraEffectHandleModes /*mode*/)
        {
            aurEff->GetBase()->Variables.Set<bool>("DontModifyStackAmountOnReapply", true);
            if (aura_warlock_soul_shard_driver* driver = getSoulShardDriverOfCaster())
                driver->SetData(DATA_AGONY_ADD, GetTarget()->GetGUID().GetCounter());
        }

        void HandleRemove(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            if (aura_warlock_soul_shard_driver* driver = getSoulShardDriverOfCaster())
                driver->SetData(DATA_AGONY_REMOVE, GetTarget()->GetGUID().GetCounter());
        }

        void HandleDummyTick(AuraEffect const* /*aurEff*/)
        {
            ModStackAmount(1, AURA_REMOVE_BY_DEFAULT, false, false);

            if (aura_warlock_soul_shard_driver* driver = getSoulShardDriverOfCaster())
                driver->SetData(DATA_AGONY_TICK, GetTarget()->GetGUID().GetCounter());
        }

        aura_warlock_soul_shard_driver* getSoulShardDriverOfCaster()
        {
            if (GetCaster())
                if (Aura* soulShards = GetCaster()->GetAura(SPELL_WARLOCK_SOUL_SHARDS_AURA))
                    return (aura_warlock_soul_shard_driver*)soulShards->GetScriptByName("spell_warlock_soul_shard_driver");

            return nullptr;
        }

        void Register() override
        {
            OnEffectApply += AuraEffectApplyFn(spell_warlock_agony_AuraScript::HandleApply, EFFECT_1, SPELL_AURA_PERIODIC_DUMMY, AURA_EFFECT_HANDLE_REAL);
            OnEffectRemove += AuraEffectRemoveFn(spell_warlock_agony_AuraScript::HandleRemove, EFFECT_1, SPELL_AURA_PERIODIC_DUMMY, AURA_EFFECT_HANDLE_REAL);
            OnEffectPeriodic += AuraEffectPeriodicFn(spell_warlock_agony_AuraScript::HandleDummyTick, EFFECT_1, SPELL_AURA_PERIODIC_DUMMY);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warlock_agony_AuraScript();
    }
};

// 264106 - Deathbolt
class spell_warlock_deathbolt : public SpellScriptLoader
{
public:
    spell_warlock_deathbolt() : SpellScriptLoader("spell_warlock_deathbolt") { }

    class spell_warlock_deathbolt_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warlock_deathbolt_SpellScript);

        void HandleHit(SpellEffIndex effIndex)
        {
            PreventHitDefaultEffect(effIndex);
            SetHitDamage(CalculateDamage());
        }

        int32 CalculateDamage()
        {
            int32 damage = 0;
            Unit::AuraApplicationMap const& auras = GetHitUnit()->GetAppliedAuras();
            for (auto i = auras.begin(); i != auras.end(); ++i)
            {
                SpellInfo const* spell = i->second->GetBase()->GetSpellInfo();

                if (spell->SpellFamilyName == uint32(SPELLFAMILY_WARLOCK) && spell->SpellFamilyFlags & flag128(502, 8110, 300000, 0)) // out of Mastery : Potent Afflictions
                {
                    AuraEffectVector effects = i->second->GetBase()->GetAuraEffects();
                    for (AuraEffectVector::const_iterator iter = effects.begin(); iter != effects.end(); ++iter)
                    {
                        if ((*iter)->GetAuraType() == SPELL_AURA_PERIODIC_DAMAGE)
                        {
                            int32 valToUse = 0;

                            if (spell->Id == SPELL_CORRUPTION_DOT)
                                valToUse = (*iter)->GetRemainingDamage(GetSpellInfo()->GetEffect(EFFECT_2)->BasePoints * 1000);
                            else
                                valToUse = (*iter)->GetRemainingDamage();

                            damage += valToUse * GetSpellInfo()->GetEffect(EFFECT_1)->BasePoints / 100;
                        }
                    }
                }
            }

            return damage;
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_warlock_deathbolt_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warlock_deathbolt_SpellScript();
    }
};

// 108416 - Dark Pact
class spell_warlock_dark_pact : public SpellScriptLoader
{
public:
    spell_warlock_dark_pact() : SpellScriptLoader("spell_warlock_dark_pact") { }

    class spell_warlock_dark_pact_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warlock_dark_pact_AuraScript);

        void CalculateAmount(AuraEffect const* /*aurEff*/, int32 & amount, bool &)
        {
            int32 sacrifiedHealth = GetCaster()->CountPctFromCurHealth(GetSpellInfo()->GetEffect(EFFECT_1)->BasePoints);
            GetCaster()->ModifyHealth(-sacrifiedHealth);
            amount = CalculatePct(sacrifiedHealth, GetSpellInfo()->GetEffect(EFFECT_2)->BasePoints);
        }

        void Register() override
        {
            DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_warlock_dark_pact_AuraScript::CalculateAmount, EFFECT_0, SPELL_AURA_SCHOOL_ABSORB);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warlock_dark_pact_AuraScript();
    }
};

// Shadow Bolt - 686 232670
class spell_warlock_shadow_bolt : public SpellScript
{
    PrepareSpellScript(spell_warlock_shadow_bolt);

    bool Validate(SpellInfo const* /*spellInfo*/) override
    {
        return ValidateSpellInfo({ SPELL_WARLOCK_SHADOW_BOLT_SHOULSHARD, SPELL_WARLOCK_SHADOW_EMBRACE, SPELL_WARLOCK_SHADOW_EMBRACE_BUFF });
    }

    void HandleOnCast()
    {
        if (GetCaster()->HasAura(SPELL_WARLOCK_DEMONOLOGY_WARLOCK))
            GetCaster()->CastSpell(GetCaster(), SPELL_WARLOCK_SHADOW_BOLT_SHOULSHARD, true);
    }

    void DoEffectHitTarget(SpellEffIndex /*effIndex*/)
    {
        if (Unit* hitUnit = GetHitUnit())
            if (GetCaster()->HasAura(SPELL_WARLOCK_SHADOW_EMBRACE))
                GetCaster()->CastSpell(hitUnit, SPELL_WARLOCK_SHADOW_EMBRACE_BUFF, true);
    }

    void Register() override
    {
        OnCast += SpellCastFn(spell_warlock_shadow_bolt::HandleOnCast);
        OnEffectHitTarget += SpellEffectFn(spell_warlock_shadow_bolt::DoEffectHitTarget, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
    }
};

// 108558 - Nightfall
class spell_warlock_nightfall : public SpellScriptLoader
{
public:
    spell_warlock_nightfall() : SpellScriptLoader("spell_warlock_nightfall") { }

    class spell_warlock_nightfall_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warlock_nightfall_AuraScript);

        void OnAuraProc(ProcEventInfo& /*eventInfo*/)
        {
            GetCaster()->CastSpell(GetCaster(), SPELL_NIGHTFALL_BUFF, true);
        }

        bool CheckProc(ProcEventInfo& eventInfo)
        {
            return (&eventInfo)->GetSpellInfo()->Id == SPELL_CORRUPTION_DOT;
        }

        void Register() override
        {
            DoCheckProc += AuraCheckProcFn(spell_warlock_nightfall_AuraScript::CheckProc);
            OnProc += AuraProcFn(spell_warlock_nightfall_AuraScript::OnAuraProc);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warlock_nightfall_AuraScript();
    }
};

// 29722 - Incinerate
class spell_warlock_incinerate : public SpellScriptLoader
{
public:
    spell_warlock_incinerate() : SpellScriptLoader("spell_warlock_incinerate") { }

    class spell_warlock_incinerate_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warlock_incinerate_SpellScript);

        void FilterTargets(std::list<WorldObject*>& unitList)
        {
            Unit* caster = GetCaster();
            Unit* originalTarget = GetExplTargetUnit();
            if (!caster || !originalTarget)
                return;

            // It hits all nearby enemies by default, but it should do so only if caster has talent "Fire and Brimstone"
            if (!caster->HasAura(SPELL_WARLOCK_FIRE_AND_BRIMSTONE))
            {
                unitList.clear();
                unitList.push_back(originalTarget);
            }
        }

        void HandleHit(SpellEffIndex /*effIndex*/)
        {
            if (GetCaster())
                GetCaster()->CastSpell(GetCaster(), SPELL_INCINERATE_NORMAL_ENERGIZE, true);
        }

        void HandleAfterHit()
        {
            if (GetCaster() && GetCaster()->HasAura(SPELL_WARLOCK_FIRE_AND_BRIMSTONE))
                GetCaster()->EnergizeBySpell(GetCaster(), SPELL_WARLOCK_FIRE_AND_BRIMSTONE, 1, POWER_SOUL_SHARDS);
        }

        void Register() override
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_warlock_incinerate_SpellScript::FilterTargets, EFFECT_1, TARGET_UNIT_DEST_AREA_ENEMY);
            OnEffectHit += SpellEffectFn(spell_warlock_incinerate_SpellScript::HandleHit, EFFECT_1, SPELL_EFFECT_SCHOOL_DAMAGE);
            AfterHit += SpellHitFn(spell_warlock_incinerate_SpellScript::HandleAfterHit);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warlock_incinerate_SpellScript();
    }
};

// 196412 - Eradication
class spell_warlock_eradication : public SpellScriptLoader
{
public:
    spell_warlock_eradication() : SpellScriptLoader("spell_warlock_eradication") { }

    class spell_warlock_eradication_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warlock_eradication_AuraScript);

        bool CheckProc(ProcEventInfo& eventInfo)
        {
            return (&eventInfo)->GetSpellInfo()->Id == SPELL_CHAOS_BOLT;
        }

        void Register() override
        {
            DoCheckProc += AuraCheckProcFn(spell_warlock_eradication_AuraScript::CheckProc);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warlock_eradication_AuraScript();
    }
};

// 264178 - Demonbolt
class spell_warlock_demonbolt : public SpellScriptLoader
{
public:
    spell_warlock_demonbolt() : SpellScriptLoader("spell_warlock_demonbolt") { }

    class spell_warlock_demonbolt_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warlock_demonbolt_SpellScript);

        void HandleHit(SpellEffIndex /*effIndex*/)
        {
            if (GetCaster())
            {
                GetCaster()->CastSpell(GetCaster(), SPELL_DEMONBOLT_ENERGIZE, true);
                GetCaster()->CastSpell(GetCaster(), SPELL_DEMONBOLT_ENERGIZE, true);
            }
        }

        void Register() override
        {
            OnEffectHit += SpellEffectFn(spell_warlock_demonbolt_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warlock_demonbolt_SpellScript();
    }
};

// 6353 - Soul Fire
class spell_warlock_soul_fire : public SpellScriptLoader
{
public:
    spell_warlock_soul_fire() : SpellScriptLoader("spell_warlock_soul_fire") { }

    class spell_warlock_soul_fire_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warlock_soul_fire_SpellScript);

        void HandleHit(SpellEffIndex /*effIndex*/)
        {
            if (GetCaster())
                GetCaster()->CastSpell(GetCaster(), SPELL_SOULFIRE_ENERGIZE, true);
        }

        void Register() override
        {
            OnEffectHit += SpellEffectFn(spell_warlock_soul_fire_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warlock_soul_fire_SpellScript();
    }
};

// 42223 - Rain of fire damage
class spell_warlock_rain_of_fire_damage : public SpellScriptLoader
{
public:
    spell_warlock_rain_of_fire_damage() : SpellScriptLoader("spell_warlock_rain_of_fire_damage") { }

    class spell_warlock_rain_of_fire_damage_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_warlock_rain_of_fire_damage_SpellScript);

        void HandleHit(SpellEffIndex /*effIndex*/)
        {
            Unit* caster = GetCaster();
            if (!caster)
                return;

            if (caster->HasAura(SPELL_INFERNO_AURA) && roll_chance_i(sSpellMgr->GetSpellInfo(SPELL_INFERNO_AURA)->GetEffect(EFFECT_0)->BasePoints))
                caster->CastSpell(caster, SPELL_RAIN_OF_FIRE_ENERGIZE, true);
        }

        void Register() override
        {
            OnEffectHit += SpellEffectFn(spell_warlock_rain_of_fire_damage_SpellScript::HandleHit, EFFECT_0, SPELL_EFFECT_SCHOOL_DAMAGE);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_warlock_rain_of_fire_damage_SpellScript();
    }
};

// 104773 - Unending Resolve
class spell_warlock_unending_resolve : public SpellScriptLoader
{
public:
    spell_warlock_unending_resolve() : SpellScriptLoader("spell_warlock_unending_resolve") { }

    class spell_warlock_unending_resolve_AuraScript : public AuraScript
    {
        PrepareAuraScript(spell_warlock_unending_resolve_AuraScript);

        void PreventEffectIfCastingCircle(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
        {
            Unit* caster = GetCaster();
            if (!caster || caster->ToPlayer())
                return;
            Player* pCaster = caster->ToPlayer();
            if (!pCaster)
                return;

            if (pCaster->HasSpell(SPELL_WARLOCK_CASTING_CIRCLE))
                PreventDefaultAction();
        }

        void Register() override
        {
            OnEffectApply += AuraEffectApplyFn(spell_warlock_unending_resolve_AuraScript::PreventEffectIfCastingCircle, EFFECT_0, SPELL_AURA_MECHANIC_IMMUNITY, AURA_EFFECT_HANDLE_REAL);
            OnEffectRemove += AuraEffectRemoveFn(spell_warlock_unending_resolve_AuraScript::PreventEffectIfCastingCircle, EFFECT_0, SPELL_AURA_MECHANIC_IMMUNITY, AURA_EFFECT_HANDLE_REAL);
            OnEffectApply += AuraEffectApplyFn(spell_warlock_unending_resolve_AuraScript::PreventEffectIfCastingCircle, EFFECT_3, SPELL_AURA_MECHANIC_IMMUNITY, AURA_EFFECT_HANDLE_REAL);
            OnEffectRemove += AuraEffectRemoveFn(spell_warlock_unending_resolve_AuraScript::PreventEffectIfCastingCircle, EFFECT_3, SPELL_AURA_MECHANIC_IMMUNITY, AURA_EFFECT_HANDLE_REAL);
        }
    };

    AuraScript* GetAuraScript() const override
    {
        return new spell_warlock_unending_resolve_AuraScript();
    }
};

void AddSC_warlock_spell_scripts()
{
    // ADDED IN MOP
    new spell_warlock_command_demon;
    new spell_warlock_dark_bargain;
    new spell_warlock_fear;
    new spell_warlock_life_tap;
    new spell_warlock_immolation_aura;
    new npc_warlock_wild_imp;
    new spell_warlock_grimoire_of_sacrifice;
    new spell_warlock_healthstone_heal;
    new spell_warlock_soul_swap_soulburn;
    new spell_warlock_unending_breath;
    new spell_warlock_chaos_bolt;
    new spell_warlock_shadowburn;
    new spell_warlock_demonbolt_old();
    new spell_warlock_4p_t14_pve;
    new spell_warlock_unbound_will;
    new spell_warlock_seduction;
    new spell_warlock_imp_firebolt;
    new npc_warlock_infernal;
    new spell_warlock_touch_of_chaos;
    new spell_warlock_seed_of_corruption;
    new spell_warlock_blood_horror;
    new spell_warlock_dark_apotheosis;
    new spell_warlock_demonic_slash;
    new spell_warlock_use_soulstone;
    new spell_warlock_glyph_of_nightmares;
    new spell_warlock_grimoire_felguard;
    new spell_warlock_dark_regeneration;
    new spell_warlock_t15_2p_bonus;
    new spell_warlock_drain_life;
    new spell_warlock_howl_of_terror;
    new spell_warlock_malefic_grasp;
    new spell_warlock_haunt;
    new gameobject_warlock_soulwell;
    new spell_warlock_t16_demo_2p;
    new spell_warlock_t16_4p;
    new spell_warlock_summon_demon;

    new spell_warlock_soul_swap;
    new spell_warlock_soul_swap_buff;
    new spell_warlock_soul_swap_exhale;

    new npc_warlock_doomguard;
    new spell_warlock_doomguard_doom_bolt;

    new spell_warlock_siphon_life;

    new spell_warlock_fel_firebolt_wild_imp;

    new spell_warlock_demonic_gateway;
    new npc_warlock_demonic_gateway;

    new spell_warlock_burning_rush;
    new spell_warlock_glyph_of_felguard;


    // ADDED IN LEGION
    new spell_warlock_artifact_dimensional_rift();
    new spell_warlock_immolate_dot();
    new spell_warlock_channel_demonfire();
    new spell_warlock_artifact_deadwind_harvest();
    new spell_warlock_artifact_reap_souls();
    new spell_warlock_artifact_thalkiels_consumption();
    new spell_warlock_mana_tap();
    new spell_warlock_phantom_singularity();
    new spell_warlock_soul_harvest();
    new spell_warlock_artifact_soul_flame();
    new spell_warlock_artifact_wrath_of_consumption();
    new spell_warlock_artifact_eternal_struggle();
    new spell_warlock_artifact_devourer_of_life();
    new spell_warlock_conflagrate();
    new spell_warlock_artifact_soul_snatcher();
    new spell_warlock_artifact_dimension_ripper();
    new spell_warlock_drain_soul();
    new spell_health_funnel();
    new spell_warlock_seed_of_corruption_damage();
    new spell_warlock_infernal_immolation();
    new spell_warlock_unstable_affliction();
    new spell_warlock_unstable_affliction_dispel();
    new spell_warlock_soul_leech();
    new spell_warlock_call_dreadstalkers();
    new spell_warlock_demonic_empowerment();
    new spell_warlock_demonwrath_damage();
    new spell_warlock_demonwrath();
    new spell_warlock_doom();
    new spell_warlock_hand_of_guldan();
    new spell_warlock_hand_of_guldan_damage();
    new spell_warlock_havoc();
    new spell_warlock_chaotic_energies();
    new spell_warlock_contagion();
    new spell_warlock_corruption();
    new spell_warlock_demon_skin();
    new spell_warlock_soul_effigy_target();
    new spell_warlock_soul_effigy_aura();
    new spell_warlock_demonic_calling();
    new spell_warlock_implosion();
    new spell_warlock_grimoir_of_synergy();
    new spell_warlock_eye_laser();
    new spell_warlock_eye_of_kilrogg();
    new spell_warlock_essence_drain();
    new spell_warlock_soul_shatter();
    new spell_warlock_curse_of_shadows();
    new spell_warlock_call_felhunter();
    new spell_warlock_singe_magic();
    new spell_warlock_eye_of_the_observer();
    new spell_warlock_cremation();
    new spell_warlock_backdraft();
    new spell_warlock_compounding_horror();
    new spell_warlock_soul_link();
    new spell_warlock_artifact_the_expendables();
    new spell_warlock_artifact_thalkiels_discord();
    new spell_warlock_infernal_meteor_strike();
    new spell_warlock_agony();
    RegisterAuraScript(aura_warlock_soul_shard_driver);
    new spell_warlock_deathbolt();
    new spell_warlock_dark_pact();
    RegisterSpellScript(spell_warlock_shadow_bolt);
    new spell_warlock_nightfall();
    new spell_warlock_incinerate();
    new spell_warlock_eradication();
    new spell_warlock_demonbolt();
    new spell_warlock_soul_fire();
    new spell_warlock_rain_of_fire_damage();
    new spell_warlock_unending_resolve();
    RegisterSpellScript(spell_warlock_summon_darkglare);

    RegisterAreaTriggerAI(at_warlock_casting_circle);
    RegisterAreaTriggerAI(at_warlock_artifact_thalkiels_discord);
    RegisterAreaTriggerAI(at_warlock_rain_of_fire);
    RegisterAreaTriggerAI(at_warlock_summon_observer);
    RegisterAreaTriggerAI(at_warlock_fel_fissure);
    RegisterAreaTriggerAI(at_warlock_bane_of_havoc);

    new npc_warlock_dreadstalker();
    new npc_warlock_shadowy_tear();
    new npc_warlock_chaos_tear();
    new npc_warlock_soul_effigy();
    RegisterCreatureAI(npc_warlock_darkglare);
    new npc_warlock_fel_lord();
}
