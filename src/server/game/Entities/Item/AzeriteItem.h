
#ifndef AzeriteItemH
#define AzeriteItemH

#include "Common.h"
#include "Object.h"
#include "Item.h"

class TC_GAME_API AzeriteItem : public Item
{
    uint32 _level;
    uint64 _experience;
public:
    AzeriteItem();
    ~AzeriteItem();
    bool Create(ObjectGuid::LowType guidlow, uint32 itemid, Player const* owner) override;
    bool LoadFromDB(ObjectGuid::LowType guid, ObjectGuid ownerGuid, Field* fields, uint32 entry, Player const* owner = nullptr) override;
    void SaveToDB(SQLTransaction& trans) override;

    void SetLevel(uint32 level, bool loading = false);
    void AddExperience(uint32 value);
};

struct PowerData
{
    PowerData(uint32 powerId, uint32 spellId);
    PowerData();

    uint32 PowerId;
    uint32 SpellId;
};

class TC_GAME_API AzeriteEmpoweredItem : public Item
{
    std::map<int32, PowerData> _powerIds;
public:
    AzeriteEmpoweredItem();
    ~AzeriteEmpoweredItem();
    bool Create(ObjectGuid::LowType guidlow, uint32 itemid, Player const* owner) override;
    void SelectPower(int32 powerId, int32 tier);
    bool LoadFromDB(ObjectGuid::LowType guid, ObjectGuid ownerGuid, Field* fields, uint32 entry, Player const* owner = nullptr) override;
    void SaveToDB(SQLTransaction& trans) override;
    void SetPower(uint32 spellId, bool apply, Player* owner = nullptr);
    void ApplyPowers(Player* player, bool apply);
};

#endif
