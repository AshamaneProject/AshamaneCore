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

#ifndef SCRIPTEDCREATURE_H_
#define SCRIPTEDCREATURE_H_

#include "CreatureAI.h"
#include "Creature.h"  // convenience include for scripts, all uses of ScriptedCreature also need Creature (except ScriptedCreature itself doesn't need Creature)
#include "DBCEnums.h"
#include "TaskScheduler.h"

class InstanceScript;
enum SelectTargetType : uint8;
enum SelectEffect : uint8;

class TC_GAME_API EntryCheckPredicate
{
    public:
        EntryCheckPredicate(uint32 entry) : _entry(entry) { }
        bool operator()(ObjectGuid const& guid) const { return guid.GetEntry() == _entry; }

    private:
        uint32 _entry;
};

class TC_GAME_API DummyEntryCheckPredicate
{
    public:
        bool operator()(ObjectGuid const&) const { return true; }
};

struct TC_GAME_API EventData
{
    //Has to be between 1 and 8
    uint16 group = 0; uint16 phase = 0;
    uint32 eventId; uint32 time;
};

struct TC_GAME_API TalkData
{
    uint32 eventId, eventType, eventData;
};

enum TC_GAME_API Phase_Data
{
    PHASE_00,
    PHASE_01,
    PHASE_02,
    PHASE_03,
    PHASE_04,
    PHASE_05,
    PHASE_06,
    PHASE_07,
    PHASE_08,
};

enum TC_GAME_API Event_Types
{
    EVENT_TYPE_TALK,
    EVENT_TYPE_CONVERSATION,
    EVENT_TYPE_ACHIEVEMENT,
    EVENT_TYPE_SPELL,
    EVENT_TYPE_YELL,
    EVENT_TYPE_SAY,
};

enum TC_GAME_API On_Events
{
    EVENT_ON_JUSTDIED = 2000,
    EVENT_ON_KILLEDUNIT,
    EVENT_ON_JUSTSUMMON,
    EVENT_ON_ENTERCOMBAT,
    EVENT_ON_MOVEINLINEOFSIGHT,
    EVENT_ON_HP90,
    EVENT_ON_HP80,
    EVENT_ON_HP70,
    EVENT_ON_HP60,
    EVENT_ON_HP50,
    EVENT_ON_HP40,
    EVENT_ON_HP30,
    EVENT_ON_HP20,
    EVENT_ON_HP10,
};

struct TC_GAME_API ScriptedAI : public CreatureAI
{
    explicit ScriptedAI(Creature* creature);
    virtual ~ScriptedAI() { }

    // *************
    //CreatureAI Functions
    // *************

    void AttackStartNoMove(Unit* target);

    // Called at any Damage from any attacker (before damage apply)
    void DamageTaken(Unit* /*attacker*/, uint32& /*damage*/) override { }

    //Called at World update tick
    virtual void UpdateAI(uint32 diff) override;

    // Hook used to execute events scheduled into EventMap without the need
    // to override UpdateAI
    // note: You must re-schedule the event within this method if the event
    // is supposed to run more than once
    virtual void ExecuteEvent(uint32 /*eventId*/) { }

    //Called at creature death
    void JustDied(Unit* /*killer*/) override { }

    //Called at creature killing another unit
    void KilledUnit(Unit* /*victim*/) override { }

    // Called when the creature summon successfully other creature
    void JustSummoned(Creature* /*summon*/) override { }

    // Called when a summoned creature is despawned
    void SummonedCreatureDespawn(Creature* /*summon*/) override { }

    // Called when hit by a spell
    void SpellHit(Unit* /*caster*/, SpellInfo const* /*spell*/) override { }

    // Called when spell hits a target
    void SpellHitTarget(Unit* /*target*/, SpellInfo const* /*spell*/) override { }

    // Called when AI is temporarily replaced or put back when possess is applied or removed
    void OnPossess(bool /*apply*/) { }

    void LoadEventData(std::vector<EventData> const* data);

    void GetEventData(uint16 group);

    void LoadTalkData(std::vector<TalkData> const* data);

    void GetTalkData(uint32 eventId);

    void SetUnlock(uint32 time);

    // *************
    // Variables
    // *************

    //For fleeing
    bool IsFleeing;

    bool IsLock;

    std::vector<EventData> const* eventList = nullptr;
    std::vector<TalkData> const* talkList = nullptr;

    // *************
    //Pure virtual functions
    // *************

    //Called at creature reset either by death or evade
    void Reset() override { }

    //Called at creature aggro either by MoveInLOS or Attack Start
    void EnterCombat(Unit* /*victim*/) override { }

    // Called before EnterCombat even before the creature is in combat.
    void AttackStart(Unit* /*target*/) override;

    // *************
    //AI Helper Functions
    // *************

    //Start movement toward victim
    void DoStartMovement(Unit* target, float distance = 0.0f, float angle = 0.0f);

    //Start no movement on victim
    void DoStartNoMovement(Unit* target);

    //Stop attack of current victim
    void DoStopAttack();

    //Cast spell by spell info
    void DoCastSpell(Unit* target, SpellInfo const* spellInfo, bool triggered = false);

    //Plays a sound to all nearby players
    void DoPlaySoundToSet(WorldObject* source, uint32 soundId);

    // Add specified amount of threat directly to victim (ignores redirection effects) - also puts victim in combat and engages them if necessary
    void AddThreat(Unit* victim, float amount, Unit* who = nullptr);
    // Adds/removes the specified percentage from the specified victim's threat (to who, or me if not specified)
    void ModifyThreatByPercent(Unit* victim, int32 pct, Unit* who = nullptr);
    // Resets the victim's threat level to who (or me if not specified) to zero
    void ResetThreat(Unit* victim, Unit* who = nullptr);
    // Resets the specified unit's threat list (me if not specified) - does not delete entries, just sets their threat to zero
    void ResetThreatList(Unit* who = nullptr);
    // Returns the threat level of victim towards who (or me if not specified)
    float GetThreat(Unit const* victim, Unit const* who = nullptr);

    void DoTeleportTo(float x, float y, float z, uint32 time = 0);
    void DoTeleportTo(float const pos[4]);

    //Teleports a player without dropping threat (only teleports to same map)
    void DoTeleportPlayer(Unit* unit, float x, float y, float z, float o);
    void DoTeleportAll(float x, float y, float z, float o);

    //Returns friendly unit with the most amount of hp missing from max hp
    Unit* DoSelectLowestHpFriendly(float range, uint32 minHPDiff = 1);

    //Returns friendly unit with hp pct below specified and with specified entry
    Unit* DoSelectBelowHpPctFriendlyWithEntry(uint32 entry, float range, uint8 hpPct = 1, bool excludeSelf = true);

    //Returns a list of friendly CC'd units within range
    std::list<Creature*> DoFindFriendlyCC(float range);

    //Returns a list of all friendly units missing a specific buff within range
    std::list<Creature*> DoFindFriendlyMissingBuff(float range, uint32 spellId);

    //Return a player with at least minimumRange from me
    Player* GetPlayerAtMinimumRange(float minRange);

    //Spawns a creature relative to me
    Creature* DoSpawnCreature(uint32 entry, float offsetX, float offsetY, float offsetZ, float angle, uint32 type, uint32 despawntime);

    bool HealthBelowPct(uint32 pct) const;
    bool HealthAbovePct(uint32 pct) const;

    //Returns spells that meet the specified criteria from the creatures spell list
    SpellInfo const* SelectSpell(Unit* target, uint32 school, uint32 mechanic, SelectTargetType targets, float rangeMin, float rangeMax, SelectEffect effect);

    void SetEquipmentSlots(bool loadDefault, int32 mainHand = EQUIP_NO_CHANGE, int32 offHand = EQUIP_NO_CHANGE, int32 ranged = EQUIP_NO_CHANGE);

    // Used to control if MoveChase() is to be used or not in AttackStart(). Some creatures does not chase victims
    // NOTE: If you use SetCombatMovement while the creature is in combat, it will do NOTHING - This only affects AttackStart
    //       You should make the necessary to make it happen so.
    //       Remember that if you modified _isCombatMovementAllowed (e.g: using SetCombatMovement) it will not be reset at Reset().
    //       It will keep the last value you set.
    void SetCombatMovement(bool allowMovement);
    bool IsCombatMovementAllowed() const { return _isCombatMovementAllowed; }

    // return true for heroic mode. i.e.
    //   - for dungeon in mode 10-heroic,
    //   - for raid in mode 10-Heroic
    //   - for raid in mode 25-heroic
    // DO NOT USE to check raid in mode 25-normal.
    bool IsHeroic() const { return _isHeroic; }

    // return the dungeon or raid difficulty
    Difficulty GetDifficulty() const { return _difficulty; }

    // return true for 25 man or 25 man heroic mode
    bool Is25ManRaid() const { return _difficulty == DIFFICULTY_25_N || _difficulty == DIFFICULTY_25_HC; }
    bool IsLFR() const { return _difficulty == DIFFICULTY_LFR || _difficulty == DIFFICULTY_LFR_NEW; }
    bool IsMythic() const { return me->GetMap()->IsMythic(); }
    bool IsChallengeMode() const { return _difficulty == DIFFICULTY_MYTHIC_KEYSTONE; }

    template<class T> inline
    const T& DUNGEON_MODE(const T& normal5, const T& heroic10) const
    {
        switch (_difficulty)
        {
            case DIFFICULTY_NORMAL:
                return normal5;
            case DIFFICULTY_HEROIC:
                return heroic10;
            default:
                break;
        }

        return heroic10;
    }

    template<class T> inline
    const T& RAID_MODE(const T& normal10, const T& normal25) const
    {
        switch (_difficulty)
        {
            case DIFFICULTY_NORMAL_RAID:
            case DIFFICULTY_10_N:
                return normal10;
            case DIFFICULTY_25_N:
                return normal25;
            default:
                break;
        }

        return normal25;
    }

    template<class T> inline
    const T& RAID_MODE(const T& normal10, const T& normal25, const T& heroic10, const T& heroic25) const
    {
        switch (_difficulty)
        {
            case DIFFICULTY_NORMAL_RAID:
            case DIFFICULTY_10_N:
                return normal10;
            case DIFFICULTY_25_N:
                return normal25;
            case DIFFICULTY_10_HC:
                return heroic10;
            case DIFFICULTY_25_HC:
                return heroic25;
            default:
                break;
        }

        return heroic25;
    }

    void KillCreditMe(Player* player) { player->KilledMonsterCredit(me->GetEntry()); }

    private:
        Difficulty _difficulty;
        bool _isCombatMovementAllowed;
        bool _isHeroic;
};

struct TC_GAME_API Scripted_NoMovementAI : public ScriptedAI
{
    Scripted_NoMovementAI(Creature* creature) : ScriptedAI(creature) {}
    virtual ~Scripted_NoMovementAI() {}

    //Called at each attack of me by any victim
    void AttackStart(Unit* target);
};

class TC_GAME_API BossAI : public ScriptedAI
{
    public:
        BossAI(Creature* creature, uint32 bossId);
        virtual ~BossAI() { }

        void JustSummoned(Creature* summon) override;
        void SummonedCreatureDespawn(Creature* summon) override;

        virtual void ScheduleTasks() { }

        void Reset() override { _Reset(); }
        void EnterCombat(Unit* /*who*/) override { _EnterCombat(); }
        void JustDied(Unit* /*killer*/) override { _JustDied(); }
        void JustReachedHome() override { _JustReachedHome(); }
        void KilledUnit(Unit* victim) override { _KilledUnit(victim); }
        void DamageTaken(Unit* attacker, uint32& damage) override { _DamageTaken(attacker, damage); }

        bool CanAIAttack(Unit const* target) const override;

    protected:
        virtual void _Reset();
        void _EnterCombat(bool showFrameEngage = true);
        void _JustDied();
        void _JustReachedHome();
        void _KilledUnit(Unit * victim);
        void _DamageTaken(Unit* attacker, uint32& damage);
        void _DespawnAtEvade(Seconds delayToRespawn, Creature* who = nullptr);
        void _DespawnAtEvade(uint32 delayToRespawn = 30, Creature* who = nullptr) { _DespawnAtEvade(Seconds(delayToRespawn), who); }

        void TeleportCheaters();

    private:
        uint32 const _bossId;
};

class TC_GAME_API StaticBossAI : public BossAI
{
public:
    StaticBossAI(Creature* creature, uint32 bossId, uint32 staticSpell) : BossAI(creature, bossId), _staticSpell(staticSpell) { }
    virtual ~StaticBossAI() { }

protected:
    void _Reset() override;
    void _InitStaticSpellCast();

private:
    uint32 const _staticSpell;
};

class TC_GAME_API WorldBossAI : public ScriptedAI
{
    public:
        WorldBossAI(Creature* creature);
        virtual ~WorldBossAI() { }

        void JustSummoned(Creature* summon) override;
        void SummonedCreatureDespawn(Creature* summon) override;

        virtual void ScheduleTasks() { }

        void Reset() override { _Reset(); }
        void EnterCombat(Unit* /*who*/) override { _EnterCombat(); }
        void JustDied(Unit* /*killer*/) override { _JustDied(); }

    protected:
        void _Reset();
        void _EnterCombat();
        void _JustDied();
};

// SD2 grid searchers.
inline Creature* GetClosestCreatureWithEntry(WorldObject* source, uint32 entry, float maxSearchRange, bool alive = true)
{
    return source->FindNearestCreature(entry, maxSearchRange, alive);
}

inline GameObject* GetClosestGameObjectWithEntry(WorldObject* source, uint32 entry, float maxSearchRange)
{
    return source->FindNearestGameObject(entry, maxSearchRange);
}

template <typename Container>
inline void GetCreatureListWithEntryInGrid(Container& container, WorldObject* source, uint32 entry, float maxSearchRange)
{
    source->GetCreatureListWithEntryInGrid(container, entry, maxSearchRange);
}

template <typename Container>
inline void GetGameObjectListWithEntryInGrid(Container& container, WorldObject* source, uint32 entry, float maxSearchRange)
{
    source->GetGameObjectListWithEntryInGrid(container, entry, maxSearchRange);
}

template <typename Container>
inline void GetPlayerListInGrid(Container& container, WorldObject* source, float maxSearchRange)
{
    source->GetPlayerListInGrid(container, maxSearchRange);
}

TC_GAME_API void GetPositionWithDistInOrientation(Position* pUnit, float dist, float orientation, float& x, float& y);
TC_GAME_API void GetPositionWithDistInOrientation(Position* fromPos, float dist, float orientation, Position& movePosition);

TC_GAME_API void GetRandPosFromCenterInDist(float centerX, float centerY, float dist, float& x, float& y);
TC_GAME_API void GetRandPosFromCenterInDist(Position* centerPos, float dist, Position& movePosition);

TC_GAME_API void GetPositionWithDistInFront(Position* centerPos, float dist, Position& movePosition);

#endif // SCRIPTEDCREATURE_H_
