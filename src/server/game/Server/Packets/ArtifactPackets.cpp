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

#include "ArtifactPackets.h"

ByteBuffer& operator>>(ByteBuffer& data, WorldPackets::Artifact::ArtifactAddPower::ArtifactPowerChoice& artifactPowerChoice)
{
    data >> artifactPowerChoice.ArtifactPowerID;
    data >> artifactPowerChoice.Rank;
    return data;
}

void WorldPackets::Artifact::ArtifactAddPower::Read()
{
    _worldPacket >> ArtifactGUID;
    _worldPacket >> ForgeGUID;
    PowerChoices.resize(_worldPacket.read<uint32>());
    
	for (ArtifactPowerChoice& artifactPowerChoice : PowerChoices)
        _worldPacket >> artifactPowerChoice;
}

void WorldPackets::Artifact::ArtifactSetAppearance::Read()
{
    _worldPacket >> ArtifactGUID;
    _worldPacket >> ForgeGUID;
    _worldPacket >> ArtifactAppearanceID;
}

void WorldPackets::Artifact::ConfirmArtifactRespec::Read()
{
    _worldPacket >> ArtifactGUID;
    _worldPacket >> NpcGUID;
}

WorldPacket const* WorldPackets::Artifact::ArtifactForgeOpened::Write()
{
    _worldPacket << ArtifactGUID;
    _worldPacket << ForgeGUID;

    return &_worldPacket;
}

WorldPacket const* WorldPackets::Artifact::ArtifactRespecConfirm::Write()
{
    _worldPacket << ArtifactGUID;
    _worldPacket << NpcGUID;

    return &_worldPacket;
}

WorldPacket const* WorldPackets::Artifact::ArtifactXpGain::Write()
{
    _worldPacket << ArtifactGUID;
    _worldPacket << Amount;

    return &_worldPacket;
}

WorldPacket const* WorldPackets::Artifact::ArtifactKnowledge::Write()
{
    _worldPacket << int32(ArtifactCategoryID);
    _worldPacket << int8(KnowledgeLevel);

    return &_worldPacket;
}

void WorldPackets::Artifact::ArtifactAddRelicTalent::Read()
{
    _worldPacket >> ArtifactGUID;
    _worldPacket >> ForgeGUID;
    _worldPacket >> SlotIndex;
    _worldPacket >> TalentIndex;
}

WorldPacket const* WorldPackets::Artifact::ArtifactTraitsRefunded::Write()

{
    _worldPacket << Guid;
    _worldPacket << UnkInt;
    _worldPacket << UnkInt2;

    return &_worldPacket;
}

void WorldPackets::Artifact::ArtifactAttuneSocketedRelic::Read()
{
    _worldPacket >> ArtifactGUID;
    _worldPacket >> ForgeGUID;
    _worldPacket >> RelicSlotIndex;
}

void WorldPackets::Artifact::ArtifactAttunePreviewRelic::Read()
{
    _worldPacket >> RelicGUID;
    _worldPacket >> ForgeGUID;
}

WorldPacket const* WorldPackets::Artifact::ArtifactAttuneSocketedRelicData::Write()
{
    _worldPacket << ArtifactGUID;
    _worldPacket << Result;

    return &_worldPacket;
}
