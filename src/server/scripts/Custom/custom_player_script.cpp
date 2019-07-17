/*
* Copyright (C) 2017-2019 AshamaneProject <https://github.com/AshamaneProject>
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

#include "Conversation.h"
#include "Creature.h"
#include "DatabaseEnv.h"
#include "DBCEnums.h"
#include "ObjectMgr.h"
#include "Player.h"
#include "ScriptedGossip.h"
#include "ScriptMgr.h"
#include "World.h"
#include "WorldSession.h"

class playerscript_recruiter : public PlayerScript
{
public:
    playerscript_recruiter() : PlayerScript("playerscript_recruiter") {}

    void OnLevelChanged(Player* player, uint8 /*oldLevel*/) override
    {
        if (player->getLevel() != MAX_LEVEL)
            return;

        QueryResult result = LoginDatabase.PQuery("SELECT recruiter, recruiter_rewarded FROM account WHERE id = %u", player->GetSession()->GetAccountId());
        if (!result)
            return;

        Field* fields           = result->Fetch();
        uint32 recruiter        = fields[0].GetUInt32();
        bool recruiterRewarded  = fields[1].GetBool();

        if (recruiterRewarded)
            return;

        result = CharacterDatabase.PQuery("SELECT guid, NAME FROM characters WHERE account = %u ORDER BY totaltime DESC LIMIT 1", recruiter);
        if (!result)
            return;

        fields = result->Fetch();
        uint64 recruiterCharacterGUID = fields[0].GetUInt64();

        if (!recruiterCharacterGUID)
            return;

        result = LoginDatabase.PQuery("SELECT COUNT(*) FROM account WHERE recruiter = %u AND recruiter_rewarded = 1", recruiter);
        if (!result)
            return;

        fields = result->Fetch();
        uint32 recruiterRewardCount = fields[0].GetUInt32();
        uint32 rewardItem = 0;

        switch (++recruiterRewardCount)
        {
            case 1: rewardItem = 54860;     break; // X-53 Touring Rocket
            case 2: rewardItem = 37719;     break; // Swift Zhevra
            case 5: rewardItem = 106246;    break; // Emerald Hippogryph
            default: break;
        }

        if (rewardItem)
        {
            CharacterDatabase.PExecute("INSERT INTO character_shop (guid, type, itemId, itemCount) VALUES (" UI64FMTD ", 0, %u, 1)", recruiterCharacterGUID, rewardItem);
            LoginDatabase.PExecute("UPDATE account SET recruiter_rewarded = 1 WHERE id = %u", player->GetSession()->GetAccountId());
        }
    }
};

// TODO : this script is temp fix,
// remove it when lordaeron battle is properly fixed
class OnBfaArrival : public PlayerScript
{
public:
    OnBfaArrival() : PlayerScript("OnBfaArrival") { }

    enum
    {
        QUEST_DYING_WORLD_A                 = 52946,
        QUEST_DYING_WORLD_H                 = 53028,

        SPELL_CREATE_WAR_CAMPAIGN_H         = 273381,
        SPELL_CREATE_WAR_CAMPAIGN_A         = 273382,

        CONVERSATION_MAGNI_DYING_WORLD      = 9316,
    };

    void OnLogin(Player* player, bool /*firstLogin*/) override
    {
        if (player->getLevel() >= 110)
            HandleBFAStart(player);
    }

    void OnLevelChanged(Player* player, uint8 oldLevel) override
    {
        if (oldLevel < 110 && player->getLevel() >= 110)
            HandleBFAStart(player);
    }

    void HandleBFAStart(Player* player)
    {
        if (player->GetQuestStatus(QUEST_DYING_WORLD_A) == QUEST_STATUS_NONE &&
            player->GetQuestStatus(QUEST_DYING_WORLD_H) == QUEST_STATUS_NONE)
        {
            player->CastSpell(player, player->IsInAlliance() ? SPELL_CREATE_WAR_CAMPAIGN_A : SPELL_CREATE_WAR_CAMPAIGN_H, true);

            Conversation::CreateConversation(CONVERSATION_MAGNI_DYING_WORLD, player, player->GetPosition(), { player->GetGUID() });

            if (const Quest* quest = sObjectMgr->GetQuestTemplate(player->IsInAlliance() ? QUEST_DYING_WORLD_A : QUEST_DYING_WORLD_H))
                player->AddQuest(quest, nullptr);
        }
    }
};

void AddSC_custom_player_script()
{
    RegisterPlayerScript(playerscript_recruiter);
    RegisterPlayerScript(OnBfaArrival);
}
