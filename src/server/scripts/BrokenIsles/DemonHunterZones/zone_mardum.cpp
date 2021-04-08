/*
 * Copyright (C) 2017-2020 AshamaneProject <https://github.com/AshamaneProject>
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
#include "GameObject.h"
#include "MotionMaster.h"
#include "ObjectAccessor.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "SceneMgr.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "SpellScript.h"
#include "TemporarySummon.h"
#include "PhasingHandler.h"
#include "ScriptedGossip.h"
#include "Conversation.h"
#include "Log.h"

enum eQuests
{
    QUEST_INVASION_BEGIN        = 40077,
    QUEST_ASHTONGUE_FORCES      = 40378,
    QUEST_COILSKAR_FORCES       = 40379,
    QUEST_EYE_ON_THE_PRIZE      = 39049,
    QUEST_MEETING_WITH_QUEEN    = 39050,
    QUEST_SHIVARRA_FORCES       = 38765,
    QUEST_BEFORE_OVERRUN        = 38766,
    QUEST_HIDDEN_NO_MORE        = 39495,
    QUEST_ON_FELBAT_WINGS       = 39663,
    QUEST_THE_KEYSTONE          = 38728,
    QUEST_CRY_HAVOC             = 39516,
    QUEST_THEIR_NUMBERS_ARE_LEGION = 38819
};

enum MardumSpells
{
    // Inquisitor Baleful
    SPELL_INCITE_MADNESS                              = 194529,
    SPELL_INFERNAL_SMASH                              = 192709,
    SPELL_LEGION_AEGIS                                = 192665,
    SPELL_LEARN_EYE_BEAM                              = 195447,
};
enum MardumEvents
{
    // Doom Commander Beliash
    EVENT_SHADOW_BLAZE                                = 0,
    EVENT_SHADOW_BOLT_VOLLEY                          = 1,
    EVENT_SHADOW_RETREAT                              = 2
};

enum MardumTexts
{
    // Inquisitor Baleful
    SAY_AGGRO_INQUISITOR_BALEFUL                      = 0,
    SAY_DEATH_INQUISITOR_BALEFUL                      = 1,
    SAY_60_HP_PCT_INQUISITOR_BALEFUL                  = 2,
};
enum MardumCreatures
{
    NPC_POWER_QUEST_KILL_CREDIT                       = 105946,
    NPC_COLOSSAL_INFERNAL                             = 96159,
};
enum eScenes
{
    SPELL_SCENE_MARDUM_WELCOME          = 193525,
    SPELL_SCENE_MARDUM_LEGION_BANNER    = 191677,
    SPELL_SCENE_MARDUM_ASHTONGUE_FORCES = 189261,
    SPELL_SCENE_MARDUM_COILSKAR_FORCES  = 190793,
    SPELL_SCENE_MEETING_WITH_QUEEN      = 188539,
    SPELL_SCENE_MARDUM_SHIVARRA_FORCES  = 190851,
};

enum ePhaseSpells
{
    SPELL_PHASE_170 = 59073,
    SPELL_PHASE_171 = 59074,
    SPELL_PHASE_172 = 59087,
    SPELL_PHASE_173 = 54341,

    SPELL_PHASE_175 = 57569,
    SPELL_PHASE_176 = 74789,
    SPELL_PHASE_177 = 69819,

    SPELL_PHASE_179 = 67789,
    SPELL_PHASE_180 = 68480,
    SPELL_PHASE_181 = 68481
};

enum ePhases
{
    SPELL_PHASE_MARDUM_WELCOME              = SPELL_PHASE_170,
    SPELL_PHASE_MARDUM_FELSABBER            = SPELL_PHASE_172,

    SPELL_PHASE_ILLIDARI_OUTPOST_ASHTONGUE  = SPELL_PHASE_175,
    SPELL_PHASE_ILLIDARI_OUTPOST_COILSKAR   = SPELL_PHASE_176,
    SPELL_PHASE_ILLIDARI_OUTPOST_SHIVARRA   = SPELL_PHASE_177
};

enum eMisc
{
    PLAYER_CHOICE_DH_SPEC_SELECTION             = 231,
    PLAYER_CHOICE_DH_SPEC_SELECTION_HAVOC       = 478,
    PLAYER_CHOICE_DH_SPEC_SELECTION_VENGEANCE   = 479,
};

Position const NPCsPos[2] =
{
    { 523.404f,    2428.41f,     -117.087f,   0.108873f }, /// Summmon position for Colossal Infernal
    { 586.843323f, 2433.053955f, -62.977276f, 6.143252f }  /// Fly position when Legion Aegis Event (Inquisitor Baleful)
};

class PlayerScript_mardum_welcome_scene_trigger : public PlayerScript
{
public:
    PlayerScript_mardum_welcome_scene_trigger() : PlayerScript("PlayerScript_mardum_welcome_scene_trigger") {}

    uint32 checkTimer = 1000;

    void OnLogin(Player* player, bool firstLogin) override
    {
        if (player->getClass() == CLASS_DEMON_HUNTER && player->GetZoneId() == 7705 && firstLogin)
        {
            player->RemoveAurasDueToSpell(SPELL_PHASE_MARDUM_WELCOME);
        }
    }

    void OnUpdate(Player* player, uint32 diff) override
    {
        if (checkTimer <= diff)
        {
            if (player->getClass() == CLASS_DEMON_HUNTER && player->GetZoneId() == 7705 && player->GetQuestStatus(QUEST_INVASION_BEGIN) == QUEST_STATUS_NONE &&
                player->GetPositionY() < 3280.f && !player->HasAura(SPELL_SCENE_MARDUM_WELCOME) &&
                !player->HasAura(SPELL_PHASE_MARDUM_WELCOME))
            {
                player->CastSpell(player, SPELL_SCENE_MARDUM_WELCOME, true);
            }

            checkTimer = 1000;
        }
        else checkTimer -= diff;
    }
};

class scene_mardum_welcome : public SceneScript
{
public:
    scene_mardum_welcome() : SceneScript("scene_mardum_welcome") { }

    void OnSceneStart(Player* player, uint32 /*sceneInstanceID*/, SceneTemplate const* /*sceneTemplate*/) override
    {
        player->AddDelayedConversation(2000, 705);
    }

    void OnSceneComplete(Player* player, uint32 /*sceneInstanceID*/, SceneTemplate const* /*sceneTemplate*/) override
    {
        player->AddAura(SPELL_PHASE_MARDUM_WELCOME);
    }
};

class npc_kayn_sunfury_welcome : public CreatureScript
{
public:
    npc_kayn_sunfury_welcome() : CreatureScript("npc_kayn_sunfury_welcome") { }

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest) override
    {
        if (quest->GetQuestId() == QUEST_INVASION_BEGIN) {
            player->SummonCreature(93011, creature->GetPosition(), TEMPSUMMON_MANUAL_DESPAWN, 17000, 0, true);
        }
        return true;
    }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_kayn_sunfury_welcome_AI(creature);
    }

    struct npc_kayn_sunfury_welcome_AI : public ScriptedAI
    {
        npc_kayn_sunfury_welcome_AI(Creature* creature) : ScriptedAI(creature)
        {
            timer = 0;
            movein = false;
        }

        uint32 timer;
        bool movein;

        void IsSummonedBy(Unit* summoner) override
        {
            Player* player = summoner->ToPlayer();

            if (!player)
                return;

            timer = 9000;
            movein = true;

            Talk(0);

            me->GetScheduler().Schedule(Seconds(5), [](TaskContext context)
            {
                Creature* kayn = GetContextCreature();
                kayn->AI()->Talk(1);
            });

            player->SummonCreature(98228, 1182.36f, 3202.91f, 51.6049f, 4.88566f, TEMPSUMMON_MANUAL_DESPAWN, 16000, true);
            player->SummonCreature(98227, 1177.00f, 3203.07f, 51.3637f, 4.88746f, TEMPSUMMON_MANUAL_DESPAWN, 16000, true);
            player->SummonCreature(99918, 1172.92f, 3207.82f, 52.3935f, 3.73185f, TEMPSUMMON_MANUAL_DESPAWN, 16000, true);
            player->SummonCreature(98290, 1171.49f, 3203.69f, 51.3145f, 3.4564f, TEMPSUMMON_MANUAL_DESPAWN, 16000, true);
            player->SummonCreature(98292, 1170.74f, 3204.71f, 51.5426f, 3.36744f, TEMPSUMMON_MANUAL_DESPAWN, 16000, true);
        }

        void UpdateAI(uint32 diff) override
        {
            if (movein)
            {
                if (timer <= diff)
                {
                    me->GetMotionMaster()->MovePath(10267107, false);

                    if (Creature* npc = me->FindNearestCreature(98228, 10.0f, true))
                        npc->GetMotionMaster()->MovePath(10267108, false);

                    if (Creature* npc = me->FindNearestCreature(98227, 10.0f, true))
                        npc->GetMotionMaster()->MovePath(10267109, false);

                    if (Creature* npc = me->FindNearestCreature(99918, 10.0f, true))
                        npc->GetMotionMaster()->MovePath(10267110, false);

                    if (Creature* npc = me->FindNearestCreature(98292, 10.0f, true))
                        npc->GetMotionMaster()->MovePath(10267111, false);

                    if (Creature* npc = me->FindNearestCreature(98290, 10.0f, true))
                        npc->GetMotionMaster()->MovePath(10267112, false);

                    movein = false;
                    me->DespawnOrUnsummon(17000);
                }
                else timer -= diff;
            }
        }
    };
};

class go_mardum_legion_banner_1 : public GameObjectScript
{
public:
    go_mardum_legion_banner_1() : GameObjectScript("go_mardum_legion_banner_1") { }

    bool OnGossipHello(Player* player, GameObject* /*go*/) override
    {
        if (!player->GetQuestObjectiveData(QUEST_INVASION_BEGIN, 1))
            player->CastSpell(player, SPELL_SCENE_MARDUM_LEGION_BANNER, true);

        if (!player->GetQuestObjectiveData(QUEST_INVASION_BEGIN, 1))
            player->CastSpell(player, SPELL_PHASE_171, true);

        return false;
    }
};

// Quest 39279 "Asault on Mardum" - Gameobjects 244439, 244440 conversations
class go_q39279 : public GameObjectScript
{
public:
    go_q39279() : GameObjectScript("go_q39279") { }

    enum eData
    {
        QUEST_ASSAULT_ON_MARDUM = 39279,
        NPC_FIRST_COMM = 102223,
        NPC_SECOND_COMM = 102224,
    };

    bool OnGossipHello(Player* player, GameObject* go) override
    {
        switch (go->GetEntry())
        {
        case 244439: {
            if (!player->GetReqKillOrCastCurrentCount(QUEST_ASSAULT_ON_MARDUM, NPC_FIRST_COMM)) {
                player->KilledMonsterCredit(NPC_FIRST_COMM, go->GetGUID());
                Conversation* conversation_558 = new Conversation();
                if (!conversation_558->CreateConversation(558, player, player->GetPosition(), { player->GetGUID() }))
                    delete conversation_558;
            }
            player->KilledMonsterCredit(go->GetEntry(), ObjectGuid::Empty);
            break;
        }
        case 244440: {
            if (!player->GetReqKillOrCastCurrentCount(QUEST_ASSAULT_ON_MARDUM, NPC_SECOND_COMM)) {
                player->KilledMonsterCredit(NPC_SECOND_COMM, go->GetGUID());
                Conversation* conversation_583 = new Conversation;
                if (!conversation_583->CreateConversation(583, player, player->GetPosition(), { player->GetGUID() }))
                    delete conversation_583;
            }
            player->KilledMonsterCredit(go->GetEntry(), ObjectGuid::Empty);
            break;
        }
        default:
            break;
        }

        return false;
    }
};

// Destroying Fel Spreader - Spell 191827
class spell_destroying_fel_spreader : public SpellScriptLoader
{
public:
    spell_destroying_fel_spreader() : SpellScriptLoader("spell_destroying_fel_spreader") { }

    class spell_destroying_fel_spreader_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_destroying_fel_spreader_SpellScript);

        enum eSpellData
        {
            QUEST_ASSAULT_ON_MARDUM = 39279,
            NPC_FIRST_SPREADER = 97154,
            NPC_FEL_SPREADER = 97142,
            KAYN_SPREADER_CONVERSATION = 581,
        };

        void HandleScriptEffect(SpellEffIndex effIndex)
        {
            PreventHitDefaultEffect(EFFECT_0);
            if (Unit* caster = GetCaster())
            {
                Player *player = caster->ToPlayer();

                if (!player)
                    return;

                if (Unit * target = GetHitUnit())
                {
                    if (player->GetReqKillOrCastCurrentCount(QUEST_ASSAULT_ON_MARDUM, NPC_FIRST_SPREADER) == 0
                        && player->HasQuest(QUEST_ASSAULT_ON_MARDUM)
                    ) {
                        player->KilledMonsterCredit(NPC_FIRST_SPREADER, ObjectGuid::Empty);
                        Conversation* conversation = new Conversation();
                        if (!conversation->CreateConversation(KAYN_SPREADER_CONVERSATION, player, player->GetPosition(), { player->GetGUID() }))
                            delete conversation;
                    }
                    else {
                        player->KilledMonsterCredit(target->GetEntry(), ObjectGuid::Empty);
                    }

                    target->PlayOneShotAnimKitId(ANIM_DESTROY);
                    target->HandleEmoteCommand(EMOTE_STATE_DEAD);
                    target->ToCreature()->DespawnOrUnsummon(2s);
                }
            }
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_destroying_fel_spreader_SpellScript::HandleScriptEffect, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_destroying_fel_spreader_SpellScript();
    }
};

class go_mardum_portal_ashtongue : public GameObjectScript
{
public:
    go_mardum_portal_ashtongue() : GameObjectScript("go_mardum_portal_ashtongue") { }

    bool OnGossipHello(Player* player, GameObject* /*go*/) override
    {
        if (!player->GetQuestObjectiveData(QUEST_ASHTONGUE_FORCES, 0))
        {
            player->KilledMonsterCredit(88872); // QUEST_ASHTONGUE_FORCES storageIndex 0 KillCredit
            player->KilledMonsterCredit(97831); // QUEST_ASHTONGUE_FORCES storageIndex 1 KillCredit
            player->CastSpell(player, SPELL_SCENE_MARDUM_ASHTONGUE_FORCES, true);
        }

        return false;
    }
};

class scene_mardum_welcome_ashtongue : public SceneScript
{
public:
    scene_mardum_welcome_ashtongue() : SceneScript("scene_mardum_welcome_ashtongue") { }

    void OnSceneTriggerEvent(Player* player, uint32 /*sceneInstanceID*/, SceneTemplate const* /*sceneTemplate*/, std::string const& triggerName)
    {
        if (triggerName == "SEEFELSABERCREDIT")
        {
            player->KilledMonsterCredit(101534); // QUEST_ASHTONGUE_FORCES storageIndex 1 KillCredit
        }
        else if (triggerName == "UPDATEPHASE")
        {
            player->AddAura(SPELL_PHASE_MARDUM_FELSABBER);
        }
    }
};

// 200176 - Learn felsaber
class spell_learn_felsaber : public SpellScript
{
    PrepareSpellScript(spell_learn_felsaber);

    void HandleMountOnHit(SpellEffIndex /*effIndex*/)
    {
        GetCaster()->RemoveAurasDueToSpell(SPELL_PHASE_MARDUM_FELSABBER);

        // We schedule this to let hover animation pass
        GetCaster()->GetScheduler().Schedule(Milliseconds(900), [](TaskContext context)
        {
            GetContextUnit()->CastSpell(GetContextUnit(), 200175, true); // Felsaber mount
        });
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_learn_felsaber::HandleMountOnHit, EFFECT_1, SPELL_EFFECT_APPLY_AURA);
    }
};

// 101748 - Fel Gazer - To Complete Quest "Enter Illidari: Ashtongue (40378)"
struct npc_quest_completer : public ScriptedAI
{
    npc_quest_completer(Creature* creature) : ScriptedAI(creature) { }

    void MoveInLineOfSight(Unit* unit) override
    {
        if (Player* player = unit->ToPlayer())
            if (player->GetDistance(me) < 40.0f)
                if (!player->GetQuestObjectiveData(QUEST_ASHTONGUE_FORCES, 2))
                    player->KilledMonsterCredit(94410);
    }
};


class go_mardum_cage : public GameObjectScript
{
public:
    go_mardum_cage(const char* name, uint32 insideNpc, uint32 killCredit = 0) : GameObjectScript(name), _insideNpc(insideNpc), _killCredit(killCredit)
    {
        if (_killCredit == 0)
            _killCredit = insideNpc;
    }

    bool OnGossipHello(Player* player, GameObject* go) override
    {
        if (Creature* creature = go->FindNearestCreature(_insideNpc, 10.0f))
        {
            // TODO : Remove this line when phasing is done properly
            creature->DestroyForPlayer(player);

            if (TempSummon* personalCreature = player->SummonCreature(_insideNpc, creature->GetPosition(), TEMPSUMMON_TIMED_DESPAWN, 4000, 0, true))
            {
                float x, y, z;
                personalCreature->GetClosePoint(x, y, z, personalCreature->GetCombatReach() / 3, 50.0f);
                personalCreature->GetMotionMaster()->MovePoint(0, x, y, z);

                // TODO : personalCreature->Talk(0);
            }

            player->KilledMonsterCredit(_killCredit);
        }

        return false;
    }

    uint32 _insideNpc;
    uint32 _killCredit;
};

// 93105 - Inquisitor Baleful
struct npc_inquisitor_baleful : public ScriptedAI
{
    npc_inquisitor_baleful(Creature* creature) : ScriptedAI(creature) { }

    ObjectGuid colossalInfernalGuid;
    bool aegisDone;
    bool doingAegis;
    uint8 elementalCast;

    void Reset() override
    {
        me->SetCanFly(false);
        me->SetDisableGravity(false);

        if (!me->FindNearestCreature(NPC_COLOSSAL_INFERNAL, 150.0f))
        {
            if (Creature* infernal = me->SummonCreature(NPC_COLOSSAL_INFERNAL, NPCsPos[0], TEMPSUMMON_CORPSE_TIMED_DESPAWN, 2000))
                colossalInfernalGuid = infernal->GetGUID();
        }

        aegisDone = false;
        doingAegis = false;
        elementalCast = 1;
    }

    Creature* GetInfernal() const
    {
        return ObjectAccessor::GetCreature(*me, colossalInfernalGuid);
    }

    void EnterCombat(Unit*) override
    {
        Talk(SAY_AGGRO_INQUISITOR_BALEFUL);

        me->GetScheduler().Schedule(Seconds(urand(8, 10)), [this](TaskContext context) /// Incite Madness
        {
            if (!doingAegis)
            {
                if (Unit* target = me->GetVictim())
                    me->CastSpell(target, SPELL_INCITE_MADNESS);
            }

            context.Repeat(15s);
        });
    }

    void DamageTaken(Unit* /*attacker*/, uint32& damage) override
    {
        if (me->HealthBelowPctDamaged(60, damage) && !aegisDone)
        {
            aegisDone = true;
            doingAegis = true;

            Talk(SAY_60_HP_PCT_INQUISITOR_BALEFUL);

            if (Unit* target = me->GetVictim())
                me->CastSpell(me, SPELL_LEGION_AEGIS, true);

            me->AttackStop();
            me->SetReactState(REACT_PASSIVE);

            me->SetCanFly(true);
            me->SetDisableGravity(true);
            
            me->GetMotionMaster()->MoveTakeoff(0, NPCsPos[1]);

            me->GetScheduler().Schedule(1s, [this](TaskContext context)
            {
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM))
                {
                    if (Creature* infernal = GetInfernal())
                        infernal->CastSpell(target, SPELL_INFERNAL_SMASH);
                }

                elementalCast++;

                if (elementalCast <= 3) /// Only 3 cast of Infernal Smash
                    context.Repeat(5s);
            });
            
            me->GetScheduler().Schedule(15s, [this](TaskContext context) /// End Legion Aegis event
            {
                me->SetReactState(REACT_AGGRESSIVE);
                me->SetDisableGravity(true);

                if (Creature* infernal = GetInfernal())
                {
                    infernal->AttackStop();
                    infernal->SetReactState(REACT_PASSIVE);
                }

                doingAegis = false;
            });
        }
    }

    void JustDied(Unit* /*killer*/) override
    {
        Talk(SAY_DEATH_INQUISITOR_BALEFUL);

        if (Creature* infernal = GetInfernal())
            infernal->KillSelf();

        std::list<Player*> players;
        me->GetPlayerListInGrid(players, 50.0f);

        for (Player* player : players)
        {
            if (player->HasQuest(QUEST_EYE_ON_THE_PRIZE) && !player->GetQuestObjectiveData(QUEST_EYE_ON_THE_PRIZE, 0))
            {
                player->KilledMonsterCredit(NPC_POWER_QUEST_KILL_CREDIT);
                player->KilledMonsterCredit(NPC_COLOSSAL_INFERNAL);

                if (!player->HasSpell(SPELL_LEARN_EYE_BEAM))
                    player->CastSpell(player, SPELL_LEARN_EYE_BEAM);
            }
        }
    }
};

// 192709 - Infernal Smash
class spell_mardum_infernal_smash : public SpellScript
{
    PrepareSpellScript(spell_mardum_infernal_smash);

    void HandleDummy(SpellEffIndex /*effIndex*/)
    {
        if (!GetCaster() || !GetHitUnit() || !(GetHitUnit()->GetTypeId() == TypeID::TYPEID_PLAYER)) 
            return;

        GetCaster()->CastSpell(GetHitUnit(), GetEffectValue(), true);
    }

    void Register() override
    {
        OnEffectHitTarget += SpellEffectFn(spell_mardum_infernal_smash::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
    }
};

class npc_mardum_ashtongue_mystic : public CreatureScript
{
public:
    npc_mardum_ashtongue_mystic() : CreatureScript("npc_mardum_ashtongue_mystic") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 /*action*/) override
    {
        player->KilledMonsterCredit(creature->GetEntry());

        // TODO : Remove this line when phasing is done properly
        creature->DestroyForPlayer(player);

        if (TempSummon* personalCreature = player->SummonCreature(creature->GetEntry(), creature->GetPosition(), TEMPSUMMON_TIMED_DESPAWN, 4000, 0, true))
            personalCreature->KillSelf();
        return true;
    }
};

class go_mardum_portal_coilskar : public GameObjectScript
{
public:
    go_mardum_portal_coilskar() : GameObjectScript("go_mardum_portal_coilskar") { }

    bool OnGossipHello(Player* player, GameObject* /*go*/) override
    {
        if (!player->GetQuestObjectiveData(QUEST_COILSKAR_FORCES, 1))
        {
            player->KilledMonsterCredit(94406); // QUEST_COILSKAR_FORCES storageIndex 0 KillCredit
            player->KilledMonsterCredit(97831); // QUEST_COILSKAR_FORCES storageIndex 1 KillCredit
            player->CastSpell(player, SPELL_SCENE_MARDUM_COILSKAR_FORCES, true);
        }

        return false;
    }
};

class npc_mardum_announcer : public CreatureScript
{
public:
    npc_mardum_announcer() : CreatureScript("npc_mardum_announcer") { }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_mardum_announcer_AI(creature);
    }

    struct npc_mardum_announcer_AI : public ScriptedAI
    {
        npc_mardum_announcer_AI(Creature* creature) : ScriptedAI(creature)
        {
            SetCanSeeEvenInPassiveMode(true);
        }

        void Reset() override {
            conversationEntry = 0;
            targetGUID.Clear();
            events.Reset();
            events.ScheduleEvent(EVENT_CLEAR_PLAYERS, 3600s);
        }

        enum eData {
            EVENT_ANNOUNCE_NEAR_BELIASH = 1,
            EVENT_CLEAR_PLAYERS = 2,
            NPC_ANNOUNCER_1 = 24021, // General Bunny near Beliash
        };

        uint32 conversationEntry;
        ObjectGuid targetGUID;
        GuidSet m_player_for_event;
        EventMap events;

        void MoveInLineOfSight(Unit* who) override {
            if (who->GetTypeId() != TYPEID_PLAYER)
                return;

            GuidSet::iterator itr = m_player_for_event.find(who->GetGUID());
            if (itr != m_player_for_event.end())
                return;

            if(!me->IsWithinDistInMap(who, 45.0f))
                return;

            uint32 eTimer = 1000;

            switch (me->GetEntry()) {
                case NPC_ANNOUNCER_1:
                    if (me->GetAreaId() == 7742 && who->ToPlayer()->GetQuestStatus(38766) == QUEST_STATUS_INCOMPLETE) {
                        conversationEntry = 531;
                        events.RescheduleEvent(EVENT_ANNOUNCE_NEAR_BELIASH, eTimer);
                    }
                    break;
                default:
                    break;
            }

            if (!conversationEntry)
                return;

            m_player_for_event.insert(who->GetGUID());
            targetGUID = who->GetGUID();
        }

        void UpdateAI(uint32 diff) override {
            events.Update(diff);

            if (uint32 eventId = events.ExecuteEvent()) {
                switch (eventId) {
                    case EVENT_ANNOUNCE_NEAR_BELIASH: {
                        if (Player* player = ObjectAccessor::FindPlayer(targetGUID)) {
                            Conversation* conversation = new Conversation;
                            if (!conversation->CreateConversation(conversationEntry, player, player->GetPosition(), { player->GetGUID() }))
                                delete conversation;
                        }
                        break;
                    }
                    case EVENT_CLEAR_PLAYERS:
                        m_player_for_event.clear();
                        events.RescheduleEvent(EVENT_CLEAR_PLAYERS, 7200s);
                        break;
                    default:
                        break;
                }
            }
        }
    };
};

enum SPELLS
{
    SPELL_GAUNTLET_EVENT_WARNING = 195644,
    SPELL_BRIDGE_EVENT = 192228,
    CONVERSATION_BOMBARDMENT_WARNING = 747,
    CONVERSATION_CAPTAINS = 569,
};

class PlayerScript_event_warning : public PlayerScript
{

public:
    PlayerScript_event_warning() : PlayerScript("PlayerScript_event_warning") { }

    void OnUpdateArea(Player* player, Area* newArea, Area* oldArea) override
    {
        if (player->getClass() == CLASS_DEMON_HUNTER &&
            player->GetZoneId() == 7705 &&
            player->GetQuestStatus(QUEST_SHIVARRA_FORCES) == QUEST_STATUS_COMPLETE &&
            newArea->GetId() == 7705 && oldArea->GetId() == 7742
        ) { 
            Conversation* conversation = new Conversation;
            if (!conversation->CreateConversation(747, player, player->GetPosition(), { player->GetGUID() }))
                delete conversation;
        }

        if (player->getClass() == CLASS_DEMON_HUNTER &&
            player->GetZoneId() == 7705 &&
            player->GetQuestStatus(QUEST_THEIR_NUMBERS_ARE_LEGION) == QUEST_STATUS_INCOMPLETE &&
            newArea->GetId() == 7713 && oldArea->GetId() == 7712
        ) {
            Conversation* conversation = new Conversation;
            if (!conversation->CreateConversation(569, player, player->GetPosition(), { player->GetGUID() }))
                delete conversation;
        }
    }
};

class go_meeting_with_queen_ritual : public GameObjectScript
{
public:
    go_meeting_with_queen_ritual() : GameObjectScript("go_meeting_with_queen_ritual") { }

    bool OnGossipHello(Player* player, GameObject* /*go*/) override
    {
        if (player->HasQuest(QUEST_MEETING_WITH_QUEEN) &&
            !player->GetQuestObjectiveData(QUEST_MEETING_WITH_QUEEN, 0))
        {
            player->CastSpell(player, SPELL_SCENE_MEETING_WITH_QUEEN, true);
        }

        return false;
    }
};

class scene_mardum_meeting_with_queen : public SceneScript
{
public:
    scene_mardum_meeting_with_queen() : SceneScript("scene_mardum_meeting_with_queen") { }

    void OnSceneEnd(Player* player, uint32 /*sceneInstanceID*/, SceneTemplate const* /*sceneTemplate*/) override
    {
        player->KilledMonsterCredit(100722);
    }
};

//93221 Doom Commander Beliash
struct npc_mardum_doom_commander_beliash : public ScriptedAI
{
    npc_mardum_doom_commander_beliash(Creature* creature) : ScriptedAI(creature) {
        Initialize();
    }

    enum Spells
    {
        SPELL_SHADOW_BOLT_VOLLEY    = 221159, // 196403
        SPELL_SHADOW_RETREAT        = 196625,
        SPELL_SHADOW_RETREAT_AT     = 195402,
        SPELL_LEARN_CONSUME_MAGIC   = 195439
    };

    enum texts
    {
        SAY_ONCOMBAT_BELIASH = 0,
        SAY_ONDEATH = 1,
    };

    void Initialize()
    {
        me->SetCorpseDelay(30);
        me->SetRespawnDelay(60);

        if (Creature* Tyranna = me->FindNearestCreature(95048, 95.0f)) {
            if (Tyranna->HasAura(188658))
                Tyranna->RemoveAura(188658);
        }
    }

    void Reset() override
    {   
        Initialize();
        me->setActive(true);
    }

    void EnterCombat(Unit* victim) override
    {
        if (Creature* Tyranna = me->FindNearestCreature(95048, 95.0f))
            Tyranna->AI()->Talk(0);

        Talk(SAY_ONCOMBAT_BELIASH);

        me->GetScheduler().Schedule(Milliseconds(5000), [this](TaskContext context)
        {
            if (Creature* Tyranna = me->FindNearestCreature(95048, 95.0f)) {
                Tyranna->AddAura(188658);
            }
        });

        me->GetScheduler().Schedule(Milliseconds(2500), [this](TaskContext context)
        {
            me->CastSpell(me, SPELL_SHADOW_BOLT_VOLLEY, true);
            context.Repeat(Milliseconds(2500));
        });

        me->GetScheduler().Schedule(Seconds(10), [this](TaskContext context)
        {
            me->CastSpell(me, SPELL_SHADOW_RETREAT);
            context.Repeat(Seconds(15));

            // During retreat commander make blaze appear
            me->GetScheduler().Schedule({ Milliseconds(500), Milliseconds(1000) }, [this](TaskContext /*context*/)
            {
                me->CastSpell(me, SPELL_SHADOW_RETREAT_AT, true);
            });
        });
    }

    void JustDied(Unit* /*killer*/) override
    {
        Talk(SAY_ONDEATH);

        std::list<Player*> players;
        me->GetPlayerListInGrid(players, 50.0f);

        for (Player* player : players)
        {
            player->ForceCompleteQuest(QUEST_BEFORE_OVERRUN);

            if (!player->HasSpell(SPELL_LEARN_CONSUME_MAGIC))
                player->CastSpell(player, SPELL_LEARN_CONSUME_MAGIC);
        }
    }
};

// gossip text TO-DO: read from db
#define GOSSIP_SEVIS1 "Sevis, I need to sacrifice you in order to power the final gateway."
#define GOSSIP_SEVIS2 "I want you to sacrifice me in order to power the gateway."
#define GOSSIP_SEVIS3 "I'm sertain, Sevis. I need to sacrifice you to power the gateway."
#define GOSSIP_SEVIS4 "Hold a moment, Sevis. I'm reconsidering."
#define GOSSIP_SEVIS5 "I've made up my mind. Sacrifice me, Sevis, and power the gateway."

// 99915 - Sevis Brightflame
class npc_mardum_sevis_brightflame_shivarra : public CreatureScript
{
public:
    npc_mardum_sevis_brightflame_shivarra() : CreatureScript("npc_mardum_sevis_brightflame_shivarra") { }

    bool _sacrificeSevis = false;
    bool _sacrificeMe = false;

    enum eSevis {
        SPELL_SACRIFICING_SEVIS_BRIGHTFLAME = 196731,
        SPELL_SEVIS_SACRIFICE_ME = 196735,
        SPELL_ANQUISHED_SOUL = 203789, // Well of Souls Visual
        CREATURE_TEXT_1 = 0, // We have a huge problem here.
        CREATURE_TEXT_2 = 1, // It has been... an honor.
        CREATURE_TEXT_3 = 2, // Your sacrifice will NOT be in vain!
        EVENT_SACRIFICE_SEVIS = 1,
        EVENT_SACRIFICE_PLAYER = 2,
        DATA_SACRIFICE_SEVIS = 10,
        DATA_SACRIFICE_PLAYER = 11,
        NPC_PORTAL_BUNNY = 24021
    };

    struct npc_mardum_sevis_brightflame_shivarra_AI : public ScriptedAI
    {
        npc_mardum_sevis_brightflame_shivarra_AI(Creature* creature) : ScriptedAI(creature) { }

        bool _greetSaid = false;
        
        void MoveInLineOfSight(Unit* unit) override
        {
            if (Player* player = unit->ToPlayer())
                if (player->GetDistance(me) < 5.0f)
                    if (!player->GetQuestObjectiveData(QUEST_SHIVARRA_FORCES, 0) && !_greetSaid) {
                        me->AI()->Talk(CREATURE_TEXT_1);
                        _greetSaid = true;
                    }   
        }

        void UpdateAI(uint32 diff) override
        {
            UpdateVictim();
            _events.Update(diff);

            while (uint32 eventId = _events.ExecuteEvent())
            {
                switch (eventId)
                {
                case EVENT_SACRIFICE_SEVIS:
                    me->SetCorpseDelay(30);
                    me->SetRespawnDelay(60);
                    me->AI()->Talk(CREATURE_TEXT_2);
                    if (Player* player = ObjectAccessor::GetPlayer(*me, _playerGuid)) {
                        if (Creature* bunny = me->FindNearestCreature(NPC_PORTAL_BUNNY, me->GetVisibilityRange(), true))
                            player->CastSpell(bunny, SPELL_ANQUISHED_SOUL, true);
                    }
                    me->KillSelf();
                    break;
                case EVENT_SACRIFICE_PLAYER:
                    me->AI()->Talk(CREATURE_TEXT_3);
                    if (Player* player = ObjectAccessor::GetPlayer(*me, _playerGuid)) {
                        player->KillSelf(false);
                        if (Creature* bunny = me->FindNearestCreature(NPC_PORTAL_BUNNY, me->GetVisibilityRange(), true))
                            me->CastSpell(bunny, SPELL_ANQUISHED_SOUL, true);
                    }
                    break;
                default:
                    break;
                }
            }
            // no melee attacks
        }

        void SetGUID(ObjectGuid guid, int32 /*id*/) override
        {
            _playerGuid = guid;
        }

        void SetData(uint32 id, uint32 value) override
        {
            switch (id)
            {
            case DATA_SACRIFICE_SEVIS:
                _events.ScheduleEvent(EVENT_SACRIFICE_SEVIS, 500);
                break;
            case DATA_SACRIFICE_PLAYER:
                _events.ScheduleEvent(EVENT_SACRIFICE_PLAYER, 500);
            default:
                break;
            }
        }

    private:
        EventMap _events;
        ObjectGuid _playerGuid = ObjectGuid::Empty;
    };

    bool SacrificeMade(Player* player, Creature* creature) {
        if (!player->GetQuestObjectiveData(QUEST_SHIVARRA_FORCES, 0)) {
            player->KilledMonsterCredit(creature->GetEntry());
            return true;
        }
        return false;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {   
        if (!player->GetQuestObjectiveData(QUEST_SHIVARRA_FORCES, 0) && !_sacrificeSevis && !_sacrificeMe) {
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, GOSSIP_SEVIS1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, GOSSIP_SEVIS2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            SendGossipMenuFor(player, player->GetGossipTextId(creature), creature->GetGUID());
        }

        return true;
    }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        if (!player || !creature)
            return false;

        ClearGossipMenuFor(player);

        switch (action)
        {
        case GOSSIP_ACTION_INFO_DEF + 1:
            _sacrificeSevis = true;
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, GOSSIP_SEVIS3, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 3);
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, GOSSIP_SEVIS4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
            SendGossipMenuFor(player, player->GetGossipTextId(creature), creature->GetGUID());
            return true;
        case GOSSIP_ACTION_INFO_DEF + 2:
            _sacrificeMe = true;
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, GOSSIP_SEVIS5, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 5);
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, GOSSIP_SEVIS4, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 4);
            SendGossipMenuFor(player, player->GetGossipTextId(creature), creature->GetGUID());
            return true;
        case GOSSIP_ACTION_INFO_DEF + 3:
            _sacrificeSevis = false;
            CloseGossipMenuFor(player);
            player->CastSpell(creature, SPELL_SACRIFICING_SEVIS_BRIGHTFLAME);
            creature->AI()->SetGUID(player->GetGUID());
            creature->AI()->SetData(DATA_SACRIFICE_SEVIS, DATA_SACRIFICE_SEVIS);
            SacrificeMade(player, creature);
            return true;
        case GOSSIP_ACTION_INFO_DEF + 4:
            _sacrificeSevis = false;
            _sacrificeMe = false;
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, GOSSIP_SEVIS1, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
            AddGossipItemFor(player, GOSSIP_ICON_CHAT, GOSSIP_SEVIS2, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 2);
            SendGossipMenuFor(player, player->GetGossipTextId(creature), creature->GetGUID());
            return true;
        case GOSSIP_ACTION_INFO_DEF + 5:
            _sacrificeMe = false;
            CloseGossipMenuFor(player);
            creature->CastSpell(player, SPELL_SEVIS_SACRIFICE_ME);
            creature->AI()->SetGUID(player->GetGUID());
            creature->AI()->SetData(DATA_SACRIFICE_PLAYER, DATA_SACRIFICE_PLAYER);
            SacrificeMade(player, creature);
            return true;
        default:
            return true;
        }
    }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_mardum_sevis_brightflame_shivarra_AI(creature);
    }
};

class PlayerScript_mardum_conversation_trigger : public PlayerScript
{
public:
    PlayerScript_mardum_conversation_trigger() : PlayerScript("PlayerScript_mardum_conversation_trigger") {}

    enum { CONVERSATION_LORD_ILLIDAN = 736 };

    void OnPlayerReleasedGhost(Player* player) override
    {
        if (player->getClass() == CLASS_DEMON_HUNTER && !player->IsCorpse()
            && player->GetQuestObjectiveData(QUEST_SHIVARRA_FORCES, 0))
                player->AddDelayedConversation(12000, CONVERSATION_LORD_ILLIDAN);
    }
};

class go_mardum_portal_shivarra : public GameObjectScript
{
public:
    go_mardum_portal_shivarra() : GameObjectScript("go_mardum_portal_shivarra") { }

    bool OnGossipHello(Player* player, GameObject* /*go*/) override
    {
        if (player->GetQuestObjectiveData(QUEST_SHIVARRA_FORCES, 0))
        {
            player->ForceCompleteQuest(QUEST_SHIVARRA_FORCES);
            player->CastSpell(player, SPELL_SCENE_MARDUM_SHIVARRA_FORCES, true);
        }

        return false;
    }
};

// 90247, 93693, 94435
class npc_mardum_captain : public CreatureScript
{
public:
    npc_mardum_captain() : CreatureScript("npc_mardum_captain") { }

    enum
    {
        NPC_ASHTONGUE_CAPTAIN   = 90247,
        NPC_COILSKAR_CAPTAIN    = 93693,
        NPC_SHIVARRA_CAPTAIN    = 94435,

        SCENE_ASHTONGUE         = 191315,
        SCENE_COILSKAR          = 191400,
        SCENE_SHIVARRA          = 191402
    };

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 /*action*/) override
    {
        CloseGossipMenuFor(player);

        player->KilledMonsterCredit(creature->GetEntry());

        uint32 sceneSpellId = 0;
        uint32 phaseSpellId = 0;

        switch (creature->GetEntry())
        {
            case NPC_ASHTONGUE_CAPTAIN:
                sceneSpellId = SCENE_ASHTONGUE;
                phaseSpellId = SPELL_PHASE_ILLIDARI_OUTPOST_ASHTONGUE;
                creature->AI()->Talk(0);
                break;
            case NPC_COILSKAR_CAPTAIN:
                sceneSpellId = SCENE_COILSKAR;
                phaseSpellId = SPELL_PHASE_ILLIDARI_OUTPOST_COILSKAR;
                creature->AI()->Talk(0);
                break;
            case NPC_SHIVARRA_CAPTAIN:
                sceneSpellId = SCENE_SHIVARRA;
                phaseSpellId = SPELL_PHASE_ILLIDARI_OUTPOST_SHIVARRA;
                creature->AI()->Talk(0);
                break;
            default:
                break;
        }

        player->GetScheduler().Schedule(Seconds(5), [player, creature, sceneSpellId, phaseSpellId](TaskContext /*context*/)
        {
            creature->AI()->Talk(1);

            if (sceneSpellId)
                player->CastSpell(player, sceneSpellId, true);

            if (phaseSpellId)
                player->RemoveAurasDueToSpell(phaseSpellId);
        });

        player->GetScheduler().Schedule(Seconds(20), [player, creature](TaskContext /*context*/)
        {
            creature->DestroyForPlayer(player);
        });
        return true;
    }
};

// 96436 - Jace Darkweaver
class npc_mardum_jace_darkweaver : public CreatureScript
{
public:
    npc_mardum_jace_darkweaver() : CreatureScript("npc_mardum_jace_darkweaver") { }

    enum
    {
        GOB_CAVERN_STONES = 245045,
        SAY_TEXT_0 = 0, // Will you use your spectral sight on the cave entrance?
        SAY_YELL_1 = 1, // They wont escape us. Illidari attack!
    };

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 /*action*/) override
    {
        player->KilledMonsterCredit(creature->GetEntry());
        creature->AI()->Talk(SAY_TEXT_0);
        return true;
    }

    bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest) override
    {
        if (quest->GetQuestId() == 39495)
        {
            if (Creature* demonHunter1 = creature->FindNearestCreature(101790, 50.0f))
                demonHunter1->CastSpell(demonHunter1, 194326, true);
            if (Creature* demonHunter2 = creature->FindNearestCreature(101787, 50.0f))
                demonHunter2->CastSpell(demonHunter2, 194326, true);
            if (Creature* demonHunter3 = creature->FindNearestCreature(101788, 50.0f))
                demonHunter3->CastSpell(demonHunter3, 194326, true);
            if (Creature* demonHunter4 = creature->FindNearestCreature(101789, 50.0f))
                demonHunter4->CastSpell(demonHunter4, 194326, true);

            if (GameObject* go = creature->FindNearestGameObject(245045, 50.0f))
                go->UseDoorOrButton();

            player->KilledMonsterCredit(98755, ObjectGuid::Empty);
        }

        if (GameObject* personnalCavernStone = player->SummonGameObject(GOB_CAVERN_STONES, 1237.150024f, 1642.619995f, 103.152f, 5.80559f, QuaternionData(0, 0, 20372944, 20372944), 0, true))
        {
            personnalCavernStone->GetScheduler()
                .Schedule(2s, [creature](TaskContext context) {
                    GetContextGameObject()->SetLootState(GO_READY);
                    GetContextGameObject()->UseDoorOrButton(10000);
                    creature->AI()->Talk(SAY_YELL_1);
                })
                .Schedule(10s, [](TaskContext context) {
                    GetContextGameObject()->Delete();
                });
        }

        return true;
    }
};

// 188501 spectral sight
class spell_mardum_spectral_sight : public SpellScript
{
    PrepareSpellScript(spell_mardum_spectral_sight);

    void HandleOnCast()
    {
        if (GetCaster()->IsPlayer() && GetCaster()->GetAreaId() == 7754) // Mardum
            GetCaster()->ToPlayer()->KilledMonsterCredit(96437);
        if (GetCaster()->IsPlayer() && GetCaster()->GetAreaId() == 4982) // Durotar Funeral
            GetCaster()->ToPlayer()->KilledMonsterCredit(102563);
        if (GetCaster()->IsPlayer() && GetCaster()->GetAreaId() == 6292) // Stromwind Keep
            GetCaster()->ToPlayer()->KilledMonsterCredit(102563);
    }

    void Register() override
    {
        OnCast += SpellCastFn(spell_mardum_spectral_sight::HandleOnCast);
    }
};

enum FelLordCaza
{
    EVENT_SWEEPING_SLASH = 0,
    EVENT_FEL_INFUSION = 1,
    EVENT_FEL_AXE = 2,
    SPELL_SWEEPING_SLASH = 197002, // 7
    SPELL_FEL_INFUSION = 197180, // 9
    SPELL_FEL_AXE = 196876, // 16
    SPELL_KNOCK_BACK_AT_DEATH = 210101,
    SPELL_TAKING_POWER = 210107,
    NPC_FEL_LORD_CAZA_CREDIT = 106014,
    SAY_ONCOMBAT_CAZA = 0,
    SAY_ONTHROW_AXE = 1,
    SAY_ONDEATH_CAZA = 2,
};

// 96441 - Fel Lord Caza
class npc_fel_lord_caza : public CreatureScript
{
public:
    npc_fel_lord_caza() : CreatureScript("npc_fel_lord_caza") { }

    struct npc_fel_lord_cazaAI : public ScriptedAI
    {
        npc_fel_lord_cazaAI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
        }

        void Initialize() {}

        void Reset() override
        {
            Initialize();
            events.Reset();
        }

        void JustDied(Unit* killer) override
        {
            Talk(SAY_ONDEATH_CAZA);
            if (killer->GetTypeId() == TYPEID_PLAYER) {
                killer->ToPlayer()->CastSpell(killer, SPELL_TAKING_POWER, true);
                killer->ToPlayer()->KilledMonsterCredit(NPC_FEL_LORD_CAZA_CREDIT, ObjectGuid::Empty);
            }   
        }

        void EnterCombat(Unit* who) override
        {
            Talk(SAY_ONCOMBAT_CAZA);
            events.ScheduleEvent(EVENT_SWEEPING_SLASH, 8s);
            events.ScheduleEvent(EVENT_FEL_INFUSION, 9s);
            events.ScheduleEvent(EVENT_FEL_AXE, 15s);
        }

        void UpdateAI(uint32 diff) override
        {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                case EVENT_SWEEPING_SLASH:
                    if (Unit* target = me->GetVictim())
                        me->CastSpell(target, SPELL_SWEEPING_SLASH, true);

                    events.ScheduleEvent(EVENT_SWEEPING_SLASH, 8s);
                    break;
                case EVENT_FEL_AXE:
                    Talk(SAY_ONTHROW_AXE);
                    if (Unit* target = me->GetVictim())
                        me->CastSpell(target, SPELL_FEL_AXE, true);

                    events.ScheduleEvent(EVENT_FEL_AXE, 15s);
                    break;
                case EVENT_FEL_INFUSION:
                    if (Unit* target = me->GetVictim())
                        me->CastSpell(target, SPELL_FEL_INFUSION, true);

                    events.ScheduleEvent(EVENT_FEL_INFUSION, 9s);
                    break;
                }
            }

            if (UpdateVictim())
                DoMeleeAttackIfReady();
        }
    private:
        EventMap events;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_fel_lord_cazaAI(creature);
    }
};

//98986 Prolifica
enum eProlifica {
    ABILITY_FEL_GAZER = 197217,
    ABILITY_GASEOUS_BREATH = 197240,
    EVENT_FEL_GAZER = 1,
    EVENT_BREATH = 2,
    GO_7LG_LEGION_BOOK01 = 245169,
    SAY_ON_COMBAT = 0,
    SAY_ON_DEATH = 2,
};

class npc_mardum_prolifica : public CreatureScript
{
public:
    npc_mardum_prolifica() : CreatureScript("npc_mardum_prolifica") { }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_mardum_prolifica_AI(creature);
    }

    struct npc_mardum_prolifica_AI : public Scripted_NoMovementAI
    {
        EventMap events;
        ObjectGuid playerGuid;

        npc_mardum_prolifica_AI(Creature* creature) : Scripted_NoMovementAI(creature)
        {
            creature->SetCorpseDelay(30);
            creature->SetRespawnDelay(60);
            if (GameObject* gob = me->FindNearestGameObject(GO_7LG_LEGION_BOOK01, me->GetVisibilityRange()))
                gob->DestroyForNearbyPlayers();
        }

        void Reset() override
        {
            events.Reset();
            if (GameObject* gob = me->FindNearestGameObject(GO_7LG_LEGION_BOOK01, me->GetVisibilityRange()))
                gob->DestroyForNearbyPlayers();
        }

        void EnterCombat(Unit* victim) override
        {
            Talk(SAY_ON_COMBAT);

            if (GameObject* gob = me->FindNearestGameObject(GO_7LG_LEGION_BOOK01, me->GetVisibilityRange()))
                gob->DestroyForNearbyPlayers();

            events.ScheduleEvent(EVENT_FEL_GAZER, 13000);
            events.ScheduleEvent(EVENT_BREATH, 5000);
        }

        void JustDied(Unit* killer) override
        {
            Player* player = killer->ToPlayer();

            if (!player)
                return;

            Talk(SAY_ON_DEATH);

            if (player->HasQuest(40222)) {
                killer->GetScheduler().Schedule(Seconds(2), [](TaskContext context)
                {
                    Conversation* conversation = new Conversation;
                    if (!conversation->CreateConversation(585, GetContextUnit(), GetContextUnit()->GetPosition(), { GetContextUnit()->GetGUID() }))
                        delete conversation;
                    if (Creature* summonedCreature_1 = GetContextUnit()->SummonCreature(103432, 1807.34f, 1245.43f, 87.27f, 4.85f, TEMPSUMMON_MANUAL_DESPAWN, 0))
                    {
                        summonedCreature_1->GetMotionMaster()->MovePoint(0, 1814.97f, 1211.79f, 83.19f);
                    }
                    if (Creature* summonedCreature_2 = GetContextUnit()->SummonCreature(103432, 1805.83f, 1241.35f, 87.03f, 4.85f, TEMPSUMMON_MANUAL_DESPAWN, 0))
                    {
                        summonedCreature_2->GetMotionMaster()->MovePoint(0, 1808.91f, 1204.31f, 82.97f);
                    }
                    if (Creature* summonedCreature_3 = GetContextUnit()->SummonCreature(96278, 1809.17f, 1238.59f, 85.88f, 4.85f, TEMPSUMMON_MANUAL_DESPAWN, 0))
                    {
                        summonedCreature_3->GetMotionMaster()->MovePoint(0, 1811.69f, 1195.42f, 80.83f);
                    }
                });
            }
        }

        void UpdateAI(uint32 diff) override
        {
            if (!UpdateVictim() || me->HasUnitState(UNIT_STATE_CASTING))
                return;

            events.Update(diff);
            if (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                case EVENT_FEL_GAZER:
                    DoCast(ABILITY_FEL_GAZER);
                    events.RescheduleEvent(EVENT_FEL_GAZER, 13000);
                    break;
                case EVENT_BREATH:
                    DoCast(ABILITY_GASEOUS_BREATH);
                    events.RescheduleEvent(EVENT_BREATH, 20000);
                    break;
                }
            }
            DoMeleeAttackIfReady();
        }
    };
};

// 97059 - King Voras
class npc_king_voras : public CreatureScript
{
public:
    npc_king_voras() : CreatureScript("npc_king_voras") { }

    enum eKingVoras
    {
        EVENT_SPIDER_EGGS = 1,
        EVENT_ACID_SPIT = 2,
        SPELL_SPIDER_EGGS = 198235,
        SPELL_ACID_SPIT = 198163,
        NPC_VORAS_CREDIT = 93716,
        SAY_ON_COMBAT = 0,
        SAY_ON_DEATH = 2,
        SAY_ON_SPYDERS = 1,
        NPC_SPIDER_EGG = 100719,
        TYRANNA_CONVERSATION = 567,
    };

    struct npc_king_voras_AI : public ScriptedAI
    {
        npc_king_voras_AI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
        }

        void Initialize() {}

        void Reset() override
        {
            Initialize();
            events.Reset();
        }

        void JustDied(Unit* killer) override
        {
            Talk(SAY_ON_DEATH);

            events.CancelEvent(EVENT_ACID_SPIT);
            events.CancelEvent(EVENT_SPIDER_EGGS);

            // despawn eggs
            std::list<Creature*> summonedEggs;
            me->GetCreatureListWithEntryInGrid(summonedEggs, NPC_SPIDER_EGG, me->GetVisibilityRange());
            for (std::list<Creature*>::const_iterator itr = summonedEggs.begin(); itr != summonedEggs.end(); ++itr)
                (*itr)->ToCreature()->DespawnOrUnsummon(0);
            // killcredit + conversation
            if (killer->GetTypeId() == TYPEID_PLAYER) {
                killer->ToPlayer()->KilledMonsterCredit(NPC_VORAS_CREDIT, ObjectGuid::Empty);
                killer->GetScheduler().Schedule(Seconds(5), [](TaskContext context) {
                    Conversation* conversation = new Conversation;
                    if (!conversation->CreateConversation(TYRANNA_CONVERSATION, GetContextUnit(), GetContextUnit()->GetPosition(), { GetContextUnit()->GetGUID() }))
                        delete conversation;
                });
            }
        }

        void EnterCombat(Unit* who) override
        {
            Talk(SAY_ON_COMBAT);
            events.ScheduleEvent(EVENT_ACID_SPIT, 8s);
            events.ScheduleEvent(EVENT_SPIDER_EGGS, 15s);
        }

        void SummomSpiderEggs(uint32 duration)
        {
            Position const eggsPositions[] = {
                { 1186.619f, 1289.300f, 108.589f, 1.225f },
                { 1149.352f, 1239.250f, 120.737f, 3.209f },
                { 1151.949f, 1242.238f, 119.464f, 3.476f },
                { 1142.174f, 1249.346f, 119.955f, 4.552f },
                { 1137.942f, 1249.559f, 120.002f, 4.713f },
                { 1140.069f, 1252.097f, 119.464f, 4.792f },
            };
            for (uint8 i = 0; i < 6; i++)
                me->SummonCreature(NPC_SPIDER_EGG, eggsPositions[i], TEMPSUMMON_CORPSE_DESPAWN, duration);
        }

        void UpdateAI(uint32 diff) override
        {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                case EVENT_ACID_SPIT:
                    DoCast(SPELL_ACID_SPIT);
                    events.RescheduleEvent(EVENT_ACID_SPIT, 8s);
                    break;
                case EVENT_SPIDER_EGGS:
                    Talk(SAY_ON_SPYDERS);
                    SummomSpiderEggs(12000);
                    events.RescheduleEvent(EVENT_SPIDER_EGGS, 29s);
                    break;
                }
            }

            if (UpdateVictim())
                DoMeleeAttackIfReady();
        }
    private:
        EventMap events;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_king_voras_AI(creature);
    }
};

// 97459
class npc_mardum_gaardoun : public CreatureScript
{
public:
    npc_mardum_gaardoun() : CreatureScript("npc_mardum_gaardoun") { }

    enum eData {
        ABILITY_BATTLE_SHOUT = 198258,
        ABILITY_BRUTAL_STRIKE = 198259,
        EVENT_SHOUT = 1,
        EVENT_STRIKE = 2,
        EVENT_REMOVE_AURA = 3,
        EVENT_FREE = 4,
        EVENT_GO_OUT = 5,
        SPELL_WEBBED = 191989,
        NPC_KING_VORAS = 97059,
    };

    struct npc_mardum_gaardoun_AI : public ScriptedAI
    {
        npc_mardum_gaardoun_AI(Creature* creature) : ScriptedAI(creature) { Initialize(); }

        void Initialize() {}

        void Reset() override {
            Initialize();
            events.Reset();
        }

        void OnSpellClick(Unit* clicker, bool& result) override
        {
            events.ScheduleEvent(EVENT_REMOVE_AURA, 2000);
        }

        void EnterCombat(Unit* who) override
        {
            events.ScheduleEvent(EVENT_SHOUT, 2s);
            events.ScheduleEvent(EVENT_STRIKE, 9s);
        }

        void JustReachedHome() override {
            events.ScheduleEvent(EVENT_FREE, 2000);
        }

        void UpdateAI(uint32 diff) override
        {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                case EVENT_REMOVE_AURA:
                    me->RemoveAurasDueToSpell(SPELL_WEBBED);
                    if (Creature* voras = me->FindNearestCreature(NPC_KING_VORAS, me->GetVisibilityRange(), true))
                        me->GetAI()->AttackStart(voras);
                    else
                        events.ScheduleEvent(EVENT_FREE, 2000);
                    break;
                case EVENT_FREE:
                    Talk(1);
                    events.ScheduleEvent(EVENT_GO_OUT, 3000);
                    break;
                case EVENT_GO_OUT:
                    Talk(2);
                    float x, y, z;
                    me->GetClosePoint(x, y, z, me->GetCombatReach() / 3, 50.0f);
                    me->GetMotionMaster()->MovePoint(0, x, y, z);
                    me->DespawnOrUnsummon(5s);
                    break;
                case EVENT_SHOUT:
                    DoCast(ABILITY_BATTLE_SHOUT);
                    events.RescheduleEvent(EVENT_SHOUT, 15s);
                    break;
                case EVENT_STRIKE:
                    DoCast(ABILITY_BRUTAL_STRIKE);
                    events.RescheduleEvent(EVENT_STRIKE, 18s);
                    break;
                }
            }

            if (UpdateVictim())
                DoMeleeAttackIfReady();
        }

    private:
        EventMap events;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_mardum_gaardoun_AI(creature);
    }
};

// 97370 - General Volroth
class npc_general_volroth : public CreatureScript
{
public:
    npc_general_volroth() : CreatureScript("npc_general_volroth") { }

    enum GeneralVolroth
    {
        ABILITY_BURN = 197749,
        ABILITY_FEL_BREATH = 197750,
        QUEST_BROOD_QUEEN_COURT_VOLROTH = 40234,
        SAY_ONCOMBAT = 0,
        SAY_ONFIRE = 1,
        SAY_ONDEATH = 2,
        EVENT_BURN = 1,
        EVENT_FEL_BREATH = 2,
        DOOM_SLAYER_CREDIT = 93716,
        CONVERSATION_STHENO = 570,
    };

    struct npc_general_volroth_AI : public ScriptedAI
    {
        npc_general_volroth_AI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
        }

        void Initialize() {}

        void Reset() override
        {
            Initialize();
            events.Reset();
        }

        void MoveInLineOfSight(Unit* who) override
        {
            if (who->IsPlayer()) {
                if (who->GetDistance(me) < 75.0f)
                    if (who->ToPlayer()->GetQuestStatus(QUEST_BROOD_QUEEN_COURT_VOLROTH) == QUEST_STATE_NONE) {
                        if (const Quest* quest = sObjectMgr->GetQuestTemplate(QUEST_BROOD_QUEEN_COURT_VOLROTH))
                            who->ToPlayer()->AddQuest(quest, nullptr);
                        Conversation* conversation = new Conversation;
                        if (!conversation->CreateConversation(CONVERSATION_STHENO, who->ToPlayer(), who->ToPlayer()->GetPosition(), { who->ToPlayer()->GetGUID() }))
                            delete conversation;
                    }
            }
        }

        void JustDied(Unit* killer) override
        {
            Talk(SAY_ONDEATH);
            if (killer->GetTypeId() == TYPEID_PLAYER) {
                killer->ToPlayer()->KilledMonsterCredit(DOOM_SLAYER_CREDIT, ObjectGuid::Empty);

                if (Creature* coilscar_caller = me->FindNearestCreature(96503, 30.0f, true))
                {
                    coilscar_caller->GetScheduler().Schedule(Seconds(2), [coilscar_caller](TaskContext context)
                    {
                        coilscar_caller->AI()->Talk(0);
                    });
                    coilscar_caller->GetScheduler().Schedule(Seconds(5), [coilscar_caller](TaskContext context)
                    {
                        coilscar_caller->GetMotionMaster()->MovePoint(0, 1872.86f, 1497.45f, 103.66f);
                    });
                    coilscar_caller->DespawnOrUnsummon(12000);
                }
                std::list<Creature*> coilscar_harps;
                coilscar_harps = me->FindNearestCreatures(96561, 30.0f);
                for (std::list<Creature*>::const_iterator itr = coilscar_harps.begin(); itr != coilscar_harps.end(); ++itr)
                    if (Creature* coilscar = (*itr)->ToCreature()) {
                        coilscar->GetScheduler().Schedule(Seconds(5), [coilscar](TaskContext context)
                        {
                            coilscar->GetMotionMaster()->MovePoint(0, 1876.74f, 1501.54f, 102.83f);
                        });
                        coilscar->DespawnOrUnsummon(12000);
                    }
                std::list<Creature*> coilscar_myrms;
                coilscar_myrms = me->FindNearestCreatures(96230, 30.0f);
                for (std::list<Creature*>::const_iterator itr = coilscar_myrms.begin(); itr != coilscar_myrms.end(); ++itr)
                    if (Creature* coilscarMyrm = (*itr)->ToCreature()) {
                        coilscarMyrm->GetScheduler().Schedule(Seconds(5), [coilscarMyrm](TaskContext context)
                        {
                            coilscarMyrm->GetMotionMaster()->MovePoint(0, 1874.57f, 1499.027f, 103.504f);
                        });
                        coilscarMyrm->DespawnOrUnsummon(12000);
                    }
            }
        }

        void EnterCombat(Unit* who) override
        {
            Talk(SAY_ONCOMBAT);
            events.ScheduleEvent(EVENT_BURN, 10s);
            events.ScheduleEvent(EVENT_FEL_BREATH, 7s);
        }

        void UpdateAI(uint32 diff) override
        {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                case EVENT_BURN:
                    Talk(SAY_ONFIRE);
                    DoCast(ABILITY_BURN);
                    events.ScheduleEvent(EVENT_BURN, 10s);
                    break;
                case EVENT_FEL_BREATH:
                    DoCast(ABILITY_FEL_BREATH);
                    events.ScheduleEvent(EVENT_FEL_BREATH, 16s);
                    break;
                default:
                    break;
                }
            }

            if (UpdateVictim())
                DoMeleeAttackIfReady();
        }
    private:
        EventMap events;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_general_volroth_AI(creature);
    }
};

// 97058 - Count Nefarious
class npc_count_nefarious : public CreatureScript
{
public:
    npc_count_nefarious() : CreatureScript("npc_count_nefarious") { }

    enum CountNefarious
    {
        ABILITY_CARRION_STORM = 198947,
        ABILITY_VAMPIRIC_CLEAVE = 198894,
        SPELL_TORRENT_OF_SOULS = 192714,
        SPELL_TORRENT_OF_SOULS_BEAM = 192715,
        QUEST_BROOD_QUEEN_COURT_NEFARIOUS = 40231,
        SAY_ONCOMBAT = 0,
        SAY_ONSWARM = 1,
        SAY_ONDEATH = 2,
        EVENT_STORM = 1,
        EVENT_CLEAVE = 2,
        EVENT_STUN = 3,
        EVENT_CANCEL_STUN = 4,
        DATA_STUN_TARGET = 11,
        TYRANNA_CONVERSATION = 574,
        ALLARI_CONVERSATION = 576,
        DOOM_SLAYER_CREDIT = 93716,
    };

    struct npc_count_nefarious_AI : public ScriptedAI
    {
        npc_count_nefarious_AI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
        }

        void Initialize() {}

        void Reset() override {
            Initialize();
            events.Reset();
        }

        void JustDied(Unit* killer) override {
            Talk(SAY_ONDEATH);

            events.CancelEvent(EVENT_STORM);
            events.CancelEvent(EVENT_CLEAVE);

            if (killer->GetTypeId() == TYPEID_PLAYER) {
                killer->ToPlayer()->KilledMonsterCredit(DOOM_SLAYER_CREDIT, ObjectGuid::Empty);
                killer->GetScheduler().Schedule(Seconds(2), [](TaskContext context) {
                    Conversation* conversation = new Conversation;
                    if (!conversation->CreateConversation(TYRANNA_CONVERSATION, GetContextUnit(), GetContextUnit()->GetPosition(), { GetContextUnit()->GetGUID() }))
                        delete conversation;
                });
            }
        }

        void EnterCombat(Unit* who) override {
            Talk(SAY_ONCOMBAT);

            events.ScheduleEvent(EVENT_STORM, 10s);
            events.ScheduleEvent(EVENT_CLEAVE, 6s);

            if (who->GetTypeId() == TYPEID_PLAYER) {
                who->ToPlayer()->GetScheduler().Schedule(Seconds(2), [](TaskContext context) {
                    Conversation* conversation = new Conversation();
                    if (!conversation->CreateConversation(ALLARI_CONVERSATION, GetContextUnit(), GetContextUnit()->GetPosition(), { GetContextUnit()->GetGUID() }))
                        delete conversation;
                });
            }
        }

        void SetData(uint32 id, uint32 value) override {
            switch (id) {
                case DATA_STUN_TARGET:
                    events.ScheduleEvent(EVENT_STUN, 500);
                    break;
                default:
                    break;
            }
        }

        void UpdateAI(uint32 diff) override {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent()) {
                switch (eventId) {
                    case EVENT_STORM:
                        Talk(SAY_ONSWARM);
                        DoCast(ABILITY_CARRION_STORM);
                        events.ScheduleEvent(EVENT_STORM, 15s);
                        break;
                    case EVENT_CLEAVE:
                        DoCast(ABILITY_VAMPIRIC_CLEAVE);
                        events.ScheduleEvent(EVENT_CLEAVE, 12s);
                        break;
                    case EVENT_STUN:
                        me->CastStop();
                        events.DelayEvent(EVENT_STORM, 10000);
                        events.DelayEvent(EVENT_CLEAVE, 10000);
                        DoCastSelf(SPELL_TORRENT_OF_SOULS);
                        me->AddAura(SPELL_TORRENT_OF_SOULS_BEAM);
                        events.ScheduleEvent(EVENT_CANCEL_STUN, 10s);
                        break;
                    case EVENT_CANCEL_STUN:
                        if (!me->HasAura(192714))
                            me->RemoveAurasDueToSpell(SPELL_TORRENT_OF_SOULS_BEAM);
                        else
                            events.RescheduleEvent(EVENT_CANCEL_STUN, 1s);
                        break;
                    default:
                        break;
                }
            }

            if (UpdateVictim())
                DoMeleeAttackIfReady();
        }
    private:
        EventMap events;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_count_nefarious_AI(creature);
    }
};

// Well of Souls - 244638
class go_well_of_souls : public GameObjectScript
{
public:
    go_well_of_souls() : GameObjectScript("go_well_of_souls") { }

    enum WellOfSouls {
        NPC_COUNT_NEFARIOUS = 97058,
        SPELL_TORRENT_OF_SOULS = 192714,
        SPELL_SOUL_BEAM = 39920,
        DATA_STUN_TARGET = 11,
    };

    void OnLootStateChanged(GameObject* go, uint32 state, Unit* unit) override {
        if (state == GO_ACTIVATED && unit)
            if (Player* player = unit->ToPlayer())
                if (Creature* creature = go->FindNearestCreature(NPC_COUNT_NEFARIOUS, 50.0f)) {
                    go->CastSpell(creature, SPELL_SOUL_BEAM, true);

                    if (!creature->isAttackingPlayer())
                        creature->AI()->AttackStart(player);

                    if (!creature->HasAura(SPELL_TORRENT_OF_SOULS))
                        creature->AI()->SetData(DATA_STUN_TARGET, DATA_STUN_TARGET);
                }
    }
};

// 97676 - Lady S'theno
class npc_lady_stheno_soulengine : public CreatureScript
{
public:
    npc_lady_stheno_soulengine() : CreatureScript("npc_lady_stheno_soulengine") { }

    enum eStheno
    {
        ABILITY_BUBBLE_SHIELD = 224717,
        ABILITY_HEALING_WAVE = 197744,
        SAY_ON_LOS = 0,
        EVENT_SHIELD = 1,
        EVENT_HEAL = 2,
        QUEST_QUEENS_COURT_COUNT_NEFARIOUS = 40231,
    };

    struct npc_lady_stheno_soulengine_AI : public ScriptedAI
    {
        npc_lady_stheno_soulengine_AI(Creature* creature) : ScriptedAI(creature)
        {
            Initialize();
        }

        void Initialize() {
            me->SetReactState(REACT_AGGRESSIVE);
        }

        void Reset() override {
            Initialize();
            events.Reset();
        }

        void JustDied(Unit* killer) override {
            events.CancelEvent(EVENT_SHIELD);
            events.CancelEvent(EVENT_HEAL);
        }

        void DamageTaken(Unit* /*attacker*/, uint32& damage) override
        {
            if (HealthBelowPct(40)) {
                if (!me->HasAura(ABILITY_BUBBLE_SHIELD))
                    events.ScheduleEvent(EVENT_SHIELD, 10s);
                else
                    events.ScheduleEvent(EVENT_HEAL, 2s);
            }
        }

        void MoveInLineOfSight(Unit* who) override
        {
            if (who->IsPlayer()) {
                if (who->GetDistance(me) < 15.0f)
                    if (who->ToPlayer()->GetQuestStatus(QUEST_QUEENS_COURT_COUNT_NEFARIOUS) == QUEST_STATE_NONE) {
                        if (const Quest* quest = sObjectMgr->GetQuestTemplate(QUEST_QUEENS_COURT_COUNT_NEFARIOUS))
                            who->ToPlayer()->AddQuest(quest, nullptr);
                        me->AI()->Talk(0);
                    }
            }
        }

        void UpdateAI(uint32 diff) override {
            events.Update(diff);

            while (uint32 eventId = events.ExecuteEvent()) {
                switch (eventId) {
                    case EVENT_SHIELD:
                        DoCastSelf(ABILITY_BUBBLE_SHIELD);
                        break;
                    case EVENT_HEAL:
                        DoCastSelf(ABILITY_HEALING_WAVE);
                        break;
                    default:
                        break;
                }
            }

            if (UpdateVictim())
                DoMeleeAttackIfReady();
        }
    private:
        EventMap events;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_lady_stheno_soulengine_AI(creature);
    }
};

// Destroying Stabilizer - Spell 201112
class spell_destroying_stabilizer : public SpellScriptLoader
{
public:
    spell_destroying_stabilizer() : SpellScriptLoader("spell_destroying_stabilizer") { }

    enum eData {
        FIRST_STABILIZER_DESTROYED_CREDIT = 97409,
        STABILIZER_DESTROYED_CREDIT = 101947,
        QUEST_THEIR_NUMBERS_ARE_LEGION = 38819,
        JACE_CONVERSATION = 4601,
    };

    class spell_destroying_stabilizer_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_destroying_stabilizer_SpellScript);

        enum eSpellData {};

        void HandleScriptEffect(SpellEffIndex effIndex)
        {
            PreventHitDefaultEffect(EFFECT_0);

            if (Unit* caster = GetCaster())
            {
                Player *player = caster->ToPlayer();

                if (!player)
                    return;

                if (Unit * target = GetHitUnit())
                {
                    if (player->GetReqKillOrCastCurrentCount(QUEST_THEIR_NUMBERS_ARE_LEGION, FIRST_STABILIZER_DESTROYED_CREDIT) == 0
                        && player->GetQuestStatus(QUEST_THEIR_NUMBERS_ARE_LEGION) == QUEST_STATUS_INCOMPLETE)
                    {
                        player->KilledMonsterCredit(FIRST_STABILIZER_DESTROYED_CREDIT, ObjectGuid::Empty);
                        Conversation* conversation = new Conversation;
                        if (!conversation->CreateConversation(JACE_CONVERSATION, player, player->GetPosition(), { player->GetGUID() }))
                            delete conversation;
                    }
                    else {
                        player->KilledMonsterCredit(STABILIZER_DESTROYED_CREDIT, ObjectGuid::Empty);
                    }

                    // target->HandleEmoteCommand(EMOTE_ONESHOT_DEATH);
                    target->PlayOneShotAnimKitId(ANIM_FLY_DESTROY);
                    target->ToCreature()->DespawnOrUnsummon(2s);
                }
            }
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_destroying_stabilizer_SpellScript::HandleScriptEffect, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_destroying_stabilizer_SpellScript();
    }
};

// Destroying Soul Harvester - Spell 192252
class spell_destroying_soulharvester : public SpellScriptLoader
{
public:
    spell_destroying_soulharvester() : SpellScriptLoader("spell_destroying_soulharvester") { }

    enum eData {
        FIRST_HARVESTER_DESTROYED_CREDIT = 97383,
        HARVESTER_DESTROYED_CREDIT = 97382,
        QUEST_THEIR_NUMBERS_ARE_LEGION = 38819,
    };

    class spell_destroying_soulharvester_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_destroying_soulharvester_SpellScript);

        enum eSpellData {};

        void HandleScriptEffect(SpellEffIndex effIndex)
        {
            PreventHitDefaultEffect(EFFECT_0);

            if (Unit* caster = GetCaster())
            {
                Player *player = caster->ToPlayer();

                if (!player)
                    return;

                if (Unit * target = GetHitUnit())
                {
                    if (player->GetReqKillOrCastCurrentCount(QUEST_THEIR_NUMBERS_ARE_LEGION, FIRST_HARVESTER_DESTROYED_CREDIT) == 0
                        && player->GetQuestStatus(QUEST_THEIR_NUMBERS_ARE_LEGION) == QUEST_STATUS_INCOMPLETE)
                    {
                        player->KilledMonsterCredit(FIRST_HARVESTER_DESTROYED_CREDIT, ObjectGuid::Empty);
                    }
                    else {
                        player->KilledMonsterCredit(HARVESTER_DESTROYED_CREDIT, ObjectGuid::Empty);
                    }

                    target->HandleEmoteCommand(EMOTE_STATE_DEAD);
                    target->ToCreature()->DespawnOrUnsummon(2s);
                }
            }
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_destroying_soulharvester_SpellScript::HandleScriptEffect, EFFECT_0, SPELL_EFFECT_DUMMY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_destroying_soulharvester_SpellScript();
    }
};

// 100161 - Mardum Devastator
class npc_mardum_devastator : public CreatureScript
{
public:
    npc_mardum_devastator() : CreatureScript("npc_mardum_devastator") { }

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_mardum_devastator_AI(creature);
    }

    enum eData {
        SPELL_DEVASTATOR_BOMBARDMENT = 191669,
        AREA_MARDUM = 7705,
    };

    struct npc_mardum_devastator_AI : public ScriptedAI
    {
        npc_mardum_devastator_AI(Creature* creature) : ScriptedAI(creature)
        {
            me->SetReactState(REACT_PASSIVE);
            me->setActive(true);
        }

        uint32 timer = 1000;

        void UpdateAI(uint32 diff) override
        {
            if (timer <= diff)
            {
                Position pos = me->GetPosition();
                me->GetMap()->LoadGrid(pos.GetPositionX(), pos.GetPositionY());
                Map::PlayerList const& players = me->GetMap()->GetPlayers();
                for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
                {
                    if (Player* player = itr->GetSource())
                        if (player->GetAreaId() == AREA_MARDUM && me->GetDistance2d(player) <= 270.0f)
                            me->CastSpell(player, SPELL_DEVASTATOR_BOMBARDMENT, false);
                }
                timer = urand(3000, 6000);
            }
            else
                timer -= diff;
        }
    };
};

// 243968 - Banner near 96732 - Destroyed by Ashtongue - KillCredit 96734
// 243967 - Banner near 96731 - Destroyed by Shivarra - KillCredit 96733
// 243965 - Banner near 93762 - Destroyed by Coilskar - KillCredit 96692
class go_mardum_illidari_banner : public GameObjectScript
{
public:
    go_mardum_illidari_banner() : GameObjectScript("go_mardum_illidari_banner") { }

    enum eBombardment {
        SPELL_FROST_PORTAL_BEAM = 70684,
        SPELL_FROST_BEAM = 99490,
        SPELL_DEVASTATOR_FROST_STATE = 191568,
        SPELL_KNOCKBACK_FROM_DEVASTATOR = 198908,
        SPELL_PLANT_BOMB = 251112,
        SPELL_ARCANE_CHANNELING = 191537,
    };

    bool OnGossipHello(Player* player, GameObject* go) override
    {
        uint32 devastatorEntry = 0;
        uint32 killCreditEntry = 0;

        switch (go->GetEntry())
        {
            case 243968:
                devastatorEntry = 96732;
                killCreditEntry = 96734;
                break;
            case 243967:
                devastatorEntry = 96731;
                killCreditEntry = 96733;
                break;
            case 243965:
                devastatorEntry = 93762;
                killCreditEntry = 96692;
                break;
            default:
				break;
        }

        if (Creature* devastator = player->FindNearestCreature(devastatorEntry, 50.0f))
        {
            if (Creature* personnalCreature = player->SummonCreature(devastatorEntry, devastator->GetPosition(), TEMPSUMMON_CORPSE_DESPAWN, 5000, 0, true))
            {
                player->KilledMonsterCredit(devastatorEntry);
                player->KilledMonsterCredit(killCreditEntry);
                devastator->DestroyForPlayer(player);
                
                switch (personnalCreature->GetEntry())
                {
                    case 93762:
                        if (Creature* targ_1 = go->SummonCreature(96503, 1838.30f, 1527.21f, 87.45f, 2.20f, TEMPSUMMON_MANUAL_DESPAWN, 0))
                        {   
                            targ_1->GetMotionMaster()->MovePoint(0, 1827.71f, 1537.93f, 87.125f);
                            targ_1->GetScheduler().Schedule(Seconds(3), [](TaskContext context)
                            {
                                if (Creature* targetEntry = GetContextUnit()->FindNearestCreature(93762, 25.0f, true))
                                    GetContextUnit()->CastSpell(targetEntry, SPELL_FROST_BEAM, false);
                            });
                            targ_1->GetScheduler().Schedule(Seconds(8), [](TaskContext context)
                            {
                                GetContextUnit()->CastStop();
                            });
                            targ_1->DespawnOrUnsummon(10000);
                        }
                        if (Creature* targ_2 = devastator->SummonCreature(96561, 1850.74f, 1533.68f, 91.67f, 2.45f, TEMPSUMMON_MANUAL_DESPAWN))
                        {
                            targ_2->GetMotionMaster()->MovePoint(0, 1832.96f, 1548.18f, 88.65f);
                            targ_2->GetScheduler().Schedule(Seconds(3), [](TaskContext context)
                            {
                                if (Creature* targetEntry = GetContextUnit()->FindNearestCreature(93762, 25.0f, true))
                                    GetContextUnit()->CastSpell(targetEntry, 197751, false);
                            });
                            targ_2->GetScheduler().Schedule(Seconds(8), [](TaskContext context)
                            {
                                GetContextUnit()->CastStop();
                            });
                            targ_2->DespawnOrUnsummon(10000);
                        }
                        if (Creature* targ_3 = devastator->SummonCreature(96503, 1856.08f, 1554.44f, 94.00f, 2.88f, TEMPSUMMON_MANUAL_DESPAWN))
                        {
                            targ_3->GetMotionMaster()->MovePoint(0, 1831.64f, 1561.41f, 87.048f);
                            targ_3->GetScheduler().Schedule(Seconds(3), [](TaskContext context)
                            {
                                if (Creature* targetEntry = GetContextUnit()->FindNearestCreature(93762, 25.0f, true))
                                    GetContextUnit()->CastSpell(targetEntry, SPELL_FROST_BEAM, false);
                            });
                            targ_3->GetScheduler().Schedule(Seconds(8), [](TaskContext context)
                            {
                                GetContextUnit()->CastStop();
                            });
                            targ_3->DespawnOrUnsummon(10000);
                        }
                        if (Creature* targ_4 = devastator->SummonCreature(96503, 1848.49f, 1579.76f, 89.97f, 3.55f, TEMPSUMMON_MANUAL_DESPAWN, 0))
                        {
                            targ_4->GetMotionMaster()->MovePoint(0, 1831.21f, 1571.66f, 87.0463f);
                            targ_4->GetScheduler().Schedule(Seconds(3), [](TaskContext context)
                            {
                                if (Creature* targetEntry = GetContextUnit()->FindNearestCreature(93762, 25.0f, true))
                                    GetContextUnit()->CastSpell(targetEntry, SPELL_FROST_BEAM, false);
                            });
                            targ_4->GetScheduler().Schedule(Seconds(8), [](TaskContext context)
                            {
                                GetContextUnit()->CastStop();
                            });
                            targ_4->DespawnOrUnsummon(10000);
                        }
                        personnalCreature->GetScheduler().Schedule(Seconds(6), [](TaskContext context)
                        {
                            GetContextUnit()->CastSpell(GetContextUnit(), SPELL_DEVASTATOR_FROST_STATE, true);
                        });
                        personnalCreature->GetScheduler().Schedule(Seconds(9), [](TaskContext context)
                        {
                            GetContextUnit()->KillSelf();
                        });
                        break;
                    case 96732:
                        if (Creature* targ_1 = go->SummonCreature(96562, 1348.64f, 1423.67f, 38.50f, 0.43f, TEMPSUMMON_MANUAL_DESPAWN, 0))
                        {
                            targ_1->AddAura(114943);
                            targ_1->GetMotionMaster()->MovePoint(0, 1369.70f, 1432.93f, 36.6287f);
                            targ_1->GetScheduler().Schedule(Seconds(5), [](TaskContext context)
                            {
                                if (Creature* targetEntry = GetContextUnit()->FindNearestCreature(96732, 25.0f, true))
                                    GetContextUnit()->CastSpell(targetEntry, 66268, false);
                            });
                            targ_1->DespawnOrUnsummon(10000);
                        }
                        if (Creature* targ_2 = devastator->SummonCreature(96562, 1357.13f, 1414.33f, 38.23f, 0.74f, TEMPSUMMON_MANUAL_DESPAWN))
                        {
                            targ_2->AddAura(114943);
                            targ_2->GetMotionMaster()->MovePoint(0, 1372.067f, 1428.55f, 36.6089f);
                            targ_2->GetScheduler().Schedule(Seconds(3), [](TaskContext context)
                            {
                                if (Creature* targetEntry = GetContextUnit()->FindNearestCreature(96732, 25.0f, true))
                                    GetContextUnit()->CastSpell(targetEntry, 66268, false);
                            });
                            targ_2->DespawnOrUnsummon(10000);
                        }
                        if (Creature* targ_3 = devastator->SummonCreature(96562, 1365.62f, 1408.62f, 37.75f, 1.11f, TEMPSUMMON_MANUAL_DESPAWN))
                        {
                            targ_3->AddAura(114943);
                            targ_3->GetMotionMaster()->MovePoint(0, 1375.083f, 1426.54f, 36.597f);
                            targ_3->GetScheduler().Schedule(Seconds(3), [](TaskContext context)
                            {
                                if (Creature* targetEntry = GetContextUnit()->FindNearestCreature(96732, 25.0f, true))
                                    GetContextUnit()->CastSpell(targetEntry, 66268, false);
                            });
                            targ_3->DespawnOrUnsummon(10000);
                        }
                        personnalCreature->GetScheduler().Schedule(Seconds(13), [](TaskContext context)
                        {
                            GetContextUnit()->CastSpell(GetContextUnit(), 198908, false);
                        });
                        personnalCreature->GetScheduler().Schedule(Seconds(17), [](TaskContext context)
                        {   
                            GetContextUnit()->KillSelf();
                        });
                        break;
                    case 96731:
                        if (Creature* targ_1 = go->SummonCreature(96563, 1522.16f, 1212.83f, 71.19f, 1.50f, TEMPSUMMON_MANUAL_DESPAWN, 0))
                        {
                            targ_1->GetScheduler().Schedule(Seconds(2), [](TaskContext context)
                            {
                                if (Creature* targetEntry = GetContextUnit()->FindNearestCreature(96731, 25.0f, true))
                                    GetContextUnit()->CastSpell(targetEntry, SPELL_ARCANE_CHANNELING, false);
                            });
                            targ_1->GetScheduler().Schedule(Seconds(7), [](TaskContext context)
                            {
                                GetContextUnit()->CastStop();
                            });
                            targ_1->DespawnOrUnsummon(10000);
                        }
                        if (Creature* targ_2 = devastator->SummonCreature(96564, 1540.79f, 1216.0f, 71.2188f, 2.033f, TEMPSUMMON_MANUAL_DESPAWN))
                        {
                            targ_2->GetScheduler().Schedule(Seconds(2), [](TaskContext context)
                            {
                                if (Creature* targetEntry = GetContextUnit()->FindNearestCreature(96731, 25.0f, true))
                                    GetContextUnit()->CastSpell(targetEntry, SPELL_ARCANE_CHANNELING, false);
                            });
                            targ_2->GetScheduler().Schedule(Seconds(7), [](TaskContext context)
                            {
                                GetContextUnit()->CastStop();
                            });
                            targ_2->DespawnOrUnsummon(10000);
                        }
                        personnalCreature->GetScheduler().Schedule(Seconds(3), [](TaskContext context)
                        {
                            GetContextUnit()->CastSpell(GetContextUnit(), SPELL_ARCANE_CHANNELING);
                        });
                        personnalCreature->GetScheduler().Schedule(Seconds(8), [](TaskContext context)
                        {
                            GetContextUnit()->CastStop();
                            GetContextUnit()->CastSpell(GetContextUnit(), 191454);
                        });
                        personnalCreature->GetScheduler().Schedule(Seconds(9), [](TaskContext context)
                        {   
                            GetContextUnit()->KillSelf();
                        });
                        break;
                    default:
                        personnalCreature->GetScheduler().Schedule(Seconds(2), [](TaskContext context)
                        {
                            GetContextUnit()->KillSelf();
                        });
                        break;
                }
            }
        }

        return false;
    }
};

enum eFelSecrets {
    SPELL_CHOICE_HAVOC_VENGEANCE = 194938,
    SPELL_VENGEANCE_SPEC_CHOSEN = 194940, // Effect #2: Complete Quest (Fel Secrets - Vengeance Spec Tracking Event 39518)
    SPELL_HAVOC_SPEC_CHOSEN = 194939, // Effect #2: Complete Quest (Fel Secrets - Havoc Spec Tracking Event 39517)
    SPELL_ACTIVATING_SPECIALIZATION = 200749,
};

class go_mardum_tome_of_fel_secrets : public GameObjectScript
{
public:
    go_mardum_tome_of_fel_secrets() : GameObjectScript("go_mardum_tome_of_fel_secrets") { }

    bool OnGossipHello(Player* player, GameObject* /*go*/) override
    {
        player->CastSpell(player, SPELL_CHOICE_HAVOC_VENGEANCE, true); // Launch Quest Choice (231)
        return false;
    }
};

class PlayerScript_mardum_spec_choice : public PlayerScript
{
public:
    PlayerScript_mardum_spec_choice() : PlayerScript("PlayerScript_mardum_spec_choice") {}

    // OnPlayerChoiceResponse
    void OnCompleteQuestChoice(Player* player, uint32 choiceID, uint32 responseID)
    {
        if (choiceID != PLAYER_CHOICE_DH_SPEC_SELECTION)
            return;

        player->LearnSpell(SPELL_ACTIVATING_SPECIALIZATION, false); // Allow to choose specialization

        switch (responseID)
        {
            case PLAYER_CHOICE_DH_SPEC_SELECTION_HAVOC:
                player->CastSpell(player, SPELL_HAVOC_SPEC_CHOSEN, true);
                break;
            case PLAYER_CHOICE_DH_SPEC_SELECTION_VENGEANCE:
                player->CastSpell(player, SPELL_VENGEANCE_SPEC_CHOSEN, true);

                if (ChrSpecializationEntry const* spec = sChrSpecializationStore.AssertEntry(581))
                    player->ActivateTalentGroup(spec);

                break;
            default:
                break;
        }
    }
};

enum eCryHavocAndLetSlipTheIllidariSpells {
    SPELL_MANNETHREL_TAUGHT = 195022,
    SPELL_KORVAS_TAUGHT = 195021,
    SPELL_ALLARI_TAUGHT = 194996,
    SPELL_CYANA_TAUGHT = 195019,
    SPELL_KAYN_TAUGHT = 195020,
    SPELL_DH_LEARN_ABILITY_VISUAL = 184444,
};
// 96655 (Allari the Souleater),
// 93127 (Kayn Sunfury),
// 99045 (Korvas Bloodthorn),
// 96420 (Cyana Nightglaive),
// 96652 (Mannethrel Darkstar)
class npc_mardum_dh_learn_spec : public CreatureScript
{
public:
    npc_mardum_dh_learn_spec() : CreatureScript("npc_mardum_dh_learn_spec") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 /*action*/) override
    {
        ClearGossipMenuFor(player);
        CloseGossipMenuFor(player);

        player->KilledMonsterCredit(creature->GetEntry());

        switch (creature->GetEntry()) {
            case 96652: // Mannethrel
                creature->CastSpell(creature, SPELL_DH_LEARN_ABILITY_VISUAL, false);
                creature->CastSpell(creature, SPELL_MANNETHREL_TAUGHT, false);
                creature->GetScheduler().Schedule(Seconds(1), [creature](TaskContext context)
                {
                    Creature* mannethrel = GetContextCreature();
                    mannethrel->AI()->Talk(0);
                });
                creature->GetScheduler().Schedule(Seconds(5), [creature](TaskContext context)
                {
                    Creature* mannethrel = GetContextCreature();
                    mannethrel->AI()->Talk(1);
                    if (Creature* kayn = creature->FindNearestCreature(93127, creature->GetVisibilityRange(), true)) {
                        kayn->AI()->Talk(6);
                    }
                });
                creature->GetScheduler().Schedule(Seconds(6), [creature](TaskContext context)
                {
                    Creature* mannethrel = GetContextCreature();
                    mannethrel->KillSelf();
                });
                break;
            case 96655: // Allari
                creature->CastSpell(creature, SPELL_DH_LEARN_ABILITY_VISUAL, false);
                creature->CastSpell(creature, SPELL_ALLARI_TAUGHT, false);
                creature->GetScheduler().Schedule(Seconds(1), [creature](TaskContext context)
                {
                    Creature* allari = GetContextCreature();
                    allari->AI()->Talk(0);
                });
                break;
            case 93127: // Kayn
                creature->CastSpell(creature, SPELL_DH_LEARN_ABILITY_VISUAL, false);
                creature->CastSpell(creature, SPELL_KAYN_TAUGHT, false);
                creature->GetScheduler().Schedule(Seconds(1), [creature](TaskContext context)
                {
                    Creature* kayn = GetContextCreature();
                    kayn->AI()->Talk(5);
                });
                break;
            case 99045: // Korvas
                creature->CastSpell(creature, SPELL_DH_LEARN_ABILITY_VISUAL, false);
                creature->CastSpell(creature, SPELL_KORVAS_TAUGHT, false);
                creature->GetScheduler().Schedule(Seconds(1), [creature](TaskContext context)
                {
                    Creature* korvas = GetContextCreature();
                    korvas->AI()->Talk(1);
                });
                break;
            case 96420: // Cyana
                creature->CastSpell(creature, SPELL_DH_LEARN_ABILITY_VISUAL, false);
                creature->CastSpell(creature, SPELL_CYANA_TAUGHT, false);
                creature->GetScheduler().Schedule(Seconds(1), [creature](TaskContext context)
                {
                    Creature* cyana = GetContextCreature();
                    cyana->AI()->Talk(1);
                });
                break;
            default:
                break;
        }

        return true;
    }
};

// 96653
class npc_mardum_izal_whitemoon : public CreatureScript
{
public:
    npc_mardum_izal_whitemoon() : CreatureScript("npc_mardum_izal_whitemoon") { }

    bool OnGossipSelect(Player* player, Creature* /*creature*/, uint32 /*sender*/, uint32 /*action*/) override
    {
        if (player->HasQuest(QUEST_ON_FELBAT_WINGS) || player->GetQuestStatus(QUEST_ON_FELBAT_WINGS) == QUEST_STATUS_REWARDED)
            player->CastSpell(player, 192136, true); // KillCredit & SendTaxi

        return true;
    }
};

// Brood Quieen Tyranna Script
enum eTyrannaAttacker
{
    DATA_TYRANNA_DEATH = 1,
    TEXT_DEATH = 0,
    BROOD_QUEEN_TYRANNA = 93802,
};

// Kayn: 20542609 (Entry: 97244)
// Allari: 20542497 (Entry: 97962)
// Jace: 20542610 (Entry: 97959)
// Korvas: 20542498 (Entry: 98712)
class npc_tyranna_attacker : public CreatureScript
{
public:
    npc_tyranna_attacker() : CreatureScript("npc_tyranna_attacker") { }

    struct npc_tyranna_attacker_AI : public ScriptedAI
    {
        npc_tyranna_attacker_AI(Creature* creature) : ScriptedAI(creature) {
            me->SetReactState(REACT_DEFENSIVE);
        }

        void MoveInLineOfSight(Unit* who) override
        {
            if (who->IsPlayer())
                if (Creature* creature = me->FindNearestCreature(BROOD_QUEEN_TYRANNA, me->GetVisibilityRange(), true))
                    AttackStart(creature);
        }

        void EnterCombat(Unit* who) override
        {
            who->GetAI()->AttackStart(me);
        }

        void DamageTaken(Unit* /*attacker*/, uint32& damage) override
        {
            if (HealthAbovePct(75))
                damage = urand(1, 2);
            else
                me->SetHealth(me->GetMaxHealth() * 0.85f);
        }

        void SpellHit(Unit* /*caster*/, SpellInfo const* spell) override {}

        void SetData(uint32 id, uint32 /*value*/) override
        {
            switch (id)
            {
            case DATA_TYRANNA_DEATH:
                if (me->GetEntry() == 97244) {
                    Talk(TEXT_DEATH);
                }
                EnterEvadeMode(EVADE_REASON_OTHER);
                break;
            }
        }

        void JustReachedHome() override {}

        void UpdateAI(uint32 diff) override
        {
            _events.Update(diff);

            DoMeleeAttackIfReady();
        }

    private:
        EventMap _events;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_tyranna_attacker_AI(creature);
    }
};

enum eTyranna
{
    SPELL_BROOD_SWARM = 197627, // 1
    SPELL_INTO_THE_SHADOWS = 197414, // // phase -35%
    SPELL_QUEENS_BITE = 197486,
    EVENT_BROOD_SWARM = 1,
    EVENT_INTO_THE_SHADOWS = 2,
    EVENT_QUEENS_BITE = 3,
    EVENT_SAY_TEXT_2 = 4,
    EVENT_SAY_TEXT_1 = 5,
    EVENT_TYRANNA_DIED = 6,
    TEXT_START_COMBAT = 0,
    TEXT_KEYSTONE = 1,
    TEXT_KISS = 2,
    TEXT_CHILDREN = 3,
    TEXT_TYRANNA_DEATH = 4,
    NPC_KORVAS_TYRANNA = 98712,
    NPC_JACE_TYRANNA = 97959,
    NPC_KAYN_TYRANNA = 97244,
    NPC_ALLARI_TYRANNA = 97962,
    NPC_TYRANNA_SPAWN = 100334,
    NPC_SKITTERING_BROODLING = 100333, // NPC_ADD
};

// 93802
class npc_brood_queen_tyranna : public CreatureScript
{
public:
    npc_brood_queen_tyranna() : CreatureScript("npc_brood_queen_tyranna") { }

    struct npc_brood_queen_tyrannaAI : public ScriptedAI
    {
        npc_brood_queen_tyrannaAI(Creature* creature) : ScriptedAI(creature) {
            Initialize();
        }

        void Initialize()
        {
            _playerParticipating = false;
            _combatStarted = false;
            _swarmSummoned = 0;
        }

        void Reset() override
        {
            _events.Reset();
            Initialize();
            me->setActive(true);
            me->SetReactState(REACT_PASSIVE);
        }

        void MoveInLineOfSight(Unit* who) override
        {
            if (Player* player = who->ToPlayer())
                if (player->GetDistance(me) < 10.0f)
                    if (!_combatStarted)
                    {
                        _combatStarted = true;
                        // Enter Combat
                        _events.ScheduleEvent(EVENT_SAY_TEXT_1, 0);
                        _events.ScheduleEvent(EVENT_BROOD_SWARM, 19000);
                        _events.ScheduleEvent(EVENT_INTO_THE_SHADOWS, 22000);
                        _events.ScheduleEvent(EVENT_QUEENS_BITE, urand(16000, 18000));
                    }  
        }

        void EnterCombat(Unit* /*who*/) override
        {
            // We will schedule the npc abilities when player move near the npc 
        }

        void DamageTaken(Unit* attacker, uint32& damage) override
        {
            if (HealthAbovePct(65) && attacker->IsCreature())
                if (attacker->GetEntry() == NPC_KAYN_TYRANNA)
                    damage = urand(1, 2);

            if (HealthBelowPct(65) && attacker->IsCreature())
                if (attacker->GetEntry() == NPC_KAYN_TYRANNA)
                    me->SetHealth(me->GetHealth() + damage);

            if (!_playerParticipating && attacker->ToPlayer())
            {
                if (Creature* creature = me->FindNearestCreature(NPC_KAYN_TYRANNA, me->GetVisibilityRange(), true))
                {
                    _playerParticipating = true;
                }
            }

            if (damage >= me->GetHealth())
            {
                _events.ScheduleEvent(EVENT_TYRANNA_DIED, 0);

                std::list<HostileReference*> threatList;
                threatList = me->GetThreatManager().getThreatList();
                for (std::list<HostileReference*>::const_iterator itr = threatList.begin(); itr != threatList.end(); ++itr)
                    if (Player* target = (*itr)->getTarget()->ToPlayer())
                        if (target->GetQuestStatus(38728) == QUEST_STATUS_INCOMPLETE)
                            target->KilledMonsterCredit(101760);
            }
        }

        void JustDied(Unit* /*killer*/) override
        {
            std::list<Creature*> summonedSwarm;
            me->GetCreatureListWithEntryInGrid(summonedSwarm, NPC_TYRANNA_SPAWN, me->GetVisibilityRange());
            for (std::list<Creature*>::const_iterator itr = summonedSwarm.begin(); itr != summonedSwarm.end(); ++itr)
                (*itr)->ToCreature()->DespawnOrUnsummon(0);

            if (Creature* creature = me->FindNearestCreature(NPC_KAYN_TYRANNA, me->GetVisibilityRange(), true))
                creature->AI()->SetData(DATA_TYRANNA_DEATH, DATA_TYRANNA_DEATH);
            if (Creature* creature = me->FindNearestCreature(NPC_KORVAS_TYRANNA, me->GetVisibilityRange(), true))
                creature->AI()->SetData(DATA_TYRANNA_DEATH, DATA_TYRANNA_DEATH);
            if (Creature* creature = me->FindNearestCreature(NPC_JACE_TYRANNA, me->GetVisibilityRange(), true))
                creature->AI()->SetData(DATA_TYRANNA_DEATH, DATA_TYRANNA_DEATH);
            if (Creature* creature = me->FindNearestCreature(NPC_ALLARI_TYRANNA, me->GetVisibilityRange(), true))
                creature->AI()->SetData(DATA_TYRANNA_DEATH, DATA_TYRANNA_DEATH);

            me->DespawnOrUnsummon(300000, Seconds(30));
        }

        void SummomNearTarget(uint8 count, uint32 entry, Position targetPos, uint32 duration)
        {
            for (uint8 i = 0; i < count; i++)
            {
                uint8 rand = urand(1, 2);
                float angle = frand(0.0f, 2.0f * float(M_PI));
                float x = targetPos.GetPositionX() + (10.0f * std::cos(angle));
                float y = targetPos.GetPositionY() + (10.0f * std::sin(angle));
                Position randomPosition = {
                    x, y, targetPos.GetPositionZ(), targetPos.GetOrientation()
                };
                me->SummonCreature(entry, randomPosition, TEMPSUMMON_CORPSE_DESPAWN, duration);
            }
        }

        void UpdateAI(uint32 diff) override
        {
            _events.Update(diff);

            if (!UpdateVictim())
                return;

            while (uint32 eventId = _events.ExecuteEvent())
            {
                switch (eventId)
                {
                case EVENT_BROOD_SWARM:
                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0, true))
                    {
                        Talk(TEXT_CHILDREN, me->GetOwner());
                        SummomNearTarget(2, NPC_TYRANNA_SPAWN, target->GetPosition(), 20000); // 2 bigger spiders
                        SummomNearTarget(3, NPC_SKITTERING_BROODLING, target->GetPosition(), 15000); // 3 small spiders
                    }
                    _events.ScheduleEvent(EVENT_BROOD_SWARM, 16000);
                    _swarmSummoned++;
                    break;
                case EVENT_QUEENS_BITE:
                    Talk(TEXT_KISS, me->GetOwner());
                    DoCast(SelectTarget(SELECT_TARGET_RANDOM, 1), SPELL_QUEENS_BITE, true);
                    _events.ScheduleEvent(EVENT_QUEENS_BITE, urand(18000, 24000));
                    break;
                case EVENT_INTO_THE_SHADOWS:
                    DoCast(me, SPELL_INTO_THE_SHADOWS, true);
                    _events.RescheduleEvent(EVENT_QUEENS_BITE, 20000 + urand(14000, 20000));
                    _events.RescheduleEvent(EVENT_BROOD_SWARM, 20000 + urand(20000, 26000));
                    _events.ScheduleEvent(EVENT_INTO_THE_SHADOWS, 20000 + 20000);
                    break;
                case EVENT_SAY_TEXT_2:
                    Talk(TEXT_KEYSTONE, me->GetOwner());
                    break;
                case EVENT_SAY_TEXT_1:
                    Talk(TEXT_START_COMBAT, me->GetOwner());
                    _events.ScheduleEvent(EVENT_SAY_TEXT_2, 3000);
                    break;
                case EVENT_TYRANNA_DIED:
                    Talk(TEXT_TYRANNA_DEATH, me->GetOwner());
                    break;
                }
            }
            DoMeleeAttackIfReady();
        }

    private:
        EventMap _events;
        bool _playerParticipating;
        bool _combatStarted;
        uint8 _swarmSummoned;
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_brood_queen_tyrannaAI(creature);
    }
};

// 97303
//class npc_mardum_kayn_sunfury_end : public CreatureScript
//{
//public:
//    npc_mardum_kayn_sunfury_end() : CreatureScript("npc_mardum_kayn_sunfury_end") { }
//
//    bool OnQuestReward(Player* /*player*/, Creature* /*creature*/, Quest const* /*quest*/, uint32 /*opt*/) override
//    {
//        // This Scene make the mobs disappear ATM
//        //if (quest->GetQuestId() == QUEST_THE_KEYSTONE)
//        //    player->CastSpell(player, 193387, true); // Scene
//
//        return true;
//    }
//};

// 245728
class go_mardum_the_keystone : public GameObjectScript
{
public:
    go_mardum_the_keystone() : GameObjectScript("go_mardum_the_keystone") { }

    bool OnGossipHello(Player* player, GameObject* go) override
    {
        player->KilledMonsterCredit(100651); // return-to-the-black-temple-keystone-activated-quest-kill-credit
        return false;
    }
};

// 192140 - Back to black temple
class spell_mardum_back_to_black_temple : public SpellScript
{
    PrepareSpellScript(spell_mardum_back_to_black_temple);

    void HandleOnCast()
    {
        if (Player* player = GetCaster()->ToPlayer())
        {
            player->AddMovieDelayedAction(471, [player]
            {
                player->EquipNewItem(15, 132243, ItemContext::NONE, true);
                player->EquipNewItem(16, 128956, ItemContext::NONE, true);
                WorldLocation location(1468, 4325.46f, -620.53f, -281.40f, 1.517563f);
                player->SetHomebind(location, 7873);
                player->SendBindPointUpdate();
                player->TeleportTo(location);
            });

            player->GetScheduler().Schedule(Seconds(2), [](TaskContext context)
            {
                GetContextUnit()->RemoveAurasDueToSpell(192140); // Remove black screen
            });
        }
    }

    void Register() override
    {
        OnCast += SpellCastFn(spell_mardum_back_to_black_temple::HandleOnCast);
    }
};

// Spell 192262 Rallying
class spell_rallying : public SpellScriptLoader
{
public:
    spell_rallying() : SpellScriptLoader("spell_rallying") { }

    class spell_rallying_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_rallying_SpellScript);

        void ApplyAura(SpellEffIndex effIndex)
        {
            Unit* target = GetHitUnit();

            if (!target)
                return;

            if (Creature* injuredDH = target->ToCreature()) {
                injuredDH->RemoveAllAuras();
                injuredDH->HandleEmoteCommand(EMOTE_STATE_STAND);
                injuredDH->AI()->Talk(0);
                injuredDH->GetScheduler().Schedule(Seconds(2), [](TaskContext context)
                {
                    GetContextUnit()->ToCreature()->AI()->Talk(1);
                    float x, y, z;
                    GetContextUnit()->ToCreature()->GetClosePoint(x, y, z, GetContextUnit()->GetCombatReach() / 3, 50.0f);
                    GetContextUnit()->ToCreature()->GetMotionMaster()->MovePoint(0, x, y, z);
                    GetContextUnit()->ToCreature()->DespawnOrUnsummon(5000);
                });
                PreventHitDefaultEffect(effIndex);
            }
                
        }

        void Register() override
        {
            OnEffectHitTarget += SpellEffectFn(spell_rallying_SpellScript::ApplyAura, EFFECT_0, SPELL_EFFECT_APPLY_AURA);
        }
    };

    SpellScript *GetSpellScript() const override
    {
        return new spell_rallying_SpellScript();
    }
};

void AddSC_zone_mardum()
{
    new PlayerScript_mardum_welcome_scene_trigger();
    new scene_mardum_welcome();
    new npc_kayn_sunfury_welcome();
    new go_mardum_legion_banner_1();
    new go_mardum_portal_ashtongue();
    new scene_mardum_welcome_ashtongue();
    RegisterSpellScript(spell_learn_felsaber);
    RegisterCreatureAI(npc_quest_completer);
    new go_mardum_cage("go_mardum_cage_belath", 94400);
    new go_mardum_cage("go_mardum_cage_cyana", 94377);
    new go_mardum_cage("go_mardum_cage_izal", 93117);
    new go_mardum_cage("go_mardum_cage_mannethrel", 93230);
    RegisterCreatureAI(npc_inquisitor_baleful);
    RegisterSpellScript(spell_mardum_infernal_smash);
    new npc_mardum_ashtongue_mystic();
    new go_mardum_portal_coilskar();
    new go_meeting_with_queen_ritual();
    new scene_mardum_meeting_with_queen();
    RegisterCreatureAI(npc_mardum_doom_commander_beliash);
    new npc_mardum_sevis_brightflame_shivarra();
    new go_mardum_portal_shivarra();
    new npc_mardum_captain();
    new npc_mardum_jace_darkweaver();
    RegisterSpellScript(spell_mardum_spectral_sight);
    new npc_fel_lord_caza();
    new go_mardum_illidari_banner();
    new go_mardum_tome_of_fel_secrets();
    new PlayerScript_mardum_spec_choice();
    new npc_mardum_dh_learn_spec();
    new npc_mardum_izal_whitemoon();
    new npc_tyranna_attacker();
    new npc_brood_queen_tyranna();
    // new npc_mardum_kayn_sunfury_end();   
    new go_mardum_the_keystone();
    RegisterSpellScript(spell_mardum_back_to_black_temple);
    new PlayerScript_mardum_conversation_trigger();
    new npc_mardum_prolifica();
    new npc_king_voras();
	new go_q39279();
    new spell_destroying_fel_spreader();
    new spell_destroying_stabilizer();
    new spell_destroying_soulharvester();
    new npc_mardum_devastator();
    new npc_mardum_announcer();
    new PlayerScript_event_warning();
    new npc_general_volroth();
    new npc_count_nefarious();
    new go_well_of_souls();
    new npc_lady_stheno_soulengine();
    new npc_mardum_gaardoun();
    new spell_rallying();
}
