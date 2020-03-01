/*
 * Copyright (C) 2008-2018 TrinityCore <https://www.trinitycore.org/>
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

#ifndef ArtifactPackets_h__
#define ArtifactPackets_h__

#include "Packet.h"
#include "ObjectGuid.h"
#include "PacketUtilities.h"

namespace WorldPackets
{
    namespace Artifact
    {
        class ArtifactAddPower final : public ClientPacket
        {
        public:
			ArtifactAddPower(WorldPacket&& packet) : ClientPacket(CMSG_ARTIFACT_ADD_POWER, std::move(packet)) { }
		
            struct ArtifactPowerChoice
            {
                int32 ArtifactPowerID = 0;
                uint8 Rank = 0;
            };


            void Read() override;

            std::vector<ArtifactPowerChoice> PowerChoices;
			ObjectGuid ArtifactGUID;
            ObjectGuid ForgeGUID;
        };

        class ArtifactSetAppearance final : public ClientPacket
        {
        public:
            ArtifactSetAppearance(WorldPacket&& packet) : ClientPacket(CMSG_ARTIFACT_SET_APPEARANCE, std::move(packet)) { }

            void Read() override;

            ObjectGuid ArtifactGUID;
            ObjectGuid ForgeGUID;
            int32 ArtifactAppearanceID = 0;
        };

        class ConfirmArtifactRespec final : public ClientPacket
        {
        public:
            ConfirmArtifactRespec(WorldPacket&& packet) : ClientPacket(CMSG_CONFIRM_ARTIFACT_RESPEC, std::move(packet)) { }

            void Read() override;

            ObjectGuid ArtifactGUID;
            ObjectGuid NpcGUID;
        };
        
        class ArtifactAddRelicTalent final : public ClientPacket
        {
            public:
                ArtifactAddRelicTalent(WorldPacket&& packet) : ClientPacket(CMSG_ARTIFACT_ADD_RELIC_TALENT, std::move(packet)) { }
                
                void Read() override;
                
                ObjectGuid ArtifactGUID;
                ObjectGuid ForgeGUID;
                uint32 SlotIndex = 0;
                uint8 TalentIndex = 0;
        };
		
		class ArtifactAttuneSocketedRelic final : public ClientPacket
        {
        public:
            ArtifactAttuneSocketedRelic(WorldPacket&& packet) : ClientPacket(CMSG_ARTIFACT_ATTUNE_SOCKETED_RELIC, std::move(packet)) { }

            void Read() override;

            ObjectGuid ArtifactGUID;
            ObjectGuid ForgeGUID;
            uint32 RelicSlotIndex = 0;
        };

        class ArtifactAttuneSocketedRelicData final : public ServerPacket
        {
        public:
            ArtifactAttuneSocketedRelicData() : ServerPacket(SMSG_ARTIFACT_ATTUNE_SOCKETED_RELIC_DATA, 16 + 4) { }

            WorldPacket const* Write() override;

            ObjectGuid ArtifactGUID;
            uint32 Result = 0; // not 100% sure
        };

        class ArtifactForgeOpened final : public ServerPacket
        {
        public:
            ArtifactForgeOpened() : ServerPacket(SMSG_ARTIFACT_FORGE_OPENED, 16 + 16) { }

            WorldPacket const* Write() override;

            ObjectGuid ArtifactGUID;
            ObjectGuid ForgeGUID;
        };

        class ArtifactRespecConfirm final : public ServerPacket
        {
        public:
            ArtifactRespecConfirm() : ServerPacket(SMSG_ARTIFACT_RESPEC_CONFIRM, 16 + 16) { }

            WorldPacket const* Write() override;

            ObjectGuid ArtifactGUID;
            ObjectGuid NpcGUID;
        };

        class ArtifactXpGain final : public ServerPacket
        {
        public:
            ArtifactXpGain() : ServerPacket(SMSG_ARTIFACT_XP_GAIN, 16 + 8) { }

            WorldPacket const* Write() override;

            ObjectGuid ArtifactGUID;
            uint64 Amount = 0;
        };

        class ArtifactAttunePreviewRelic final : public ClientPacket
        {
        public:
            ArtifactAttunePreviewRelic(WorldPacket&& packet) : ClientPacket(CMSG_ARTIFACT_ATTUNE_PREVIEW_RELIC, std::move(packet)) { }

            void Read() override;

            ObjectGuid RelicGUID;
            ObjectGuid ForgeGUID;
        };

        class ArtifactKnowledge final : public ServerPacket
        {
        public:
            ArtifactKnowledge() : ServerPacket(SMSG_ARTIFACT_KNOWLEDGE, 1 + 4) { }

            WorldPacket const* Write() override;

            int32 ArtifactCategoryID = 0;
            int8 KnowledgeLevel = 0;
        };
		
		//< SMSG_ARTIFACT_FORGE_CLOSE
        class NullSmsg final : public ServerPacket
        {
        public:
            NullSmsg(OpcodeServer opcode) : ServerPacket(opcode, 0) { }

            WorldPacket const* Write() override { return &_worldPacket; }
        };

        class ArtifactTraitsRefunded final : public ServerPacket
        {
        public:
            ArtifactTraitsRefunded() : ServerPacket(SMSG_ARTIFACT_TRAITS_REFUNDED, 16 + 8) { }

            WorldPacket const* Write() override;

            ObjectGuid Guid;
            uint32 UnkInt = 0;
            uint32 UnkInt2 = 0;
        };
    }
}

#endif // ArtifactPackets_h__
