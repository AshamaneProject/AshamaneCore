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

#include "JSEngine.h"
#include "CreatureAI.h"
#include "Spell.h"

JSEngine::JSEngine()
{
    m_ctx = duk_create_heap_default();

    RegisterPlayerClass();
    RegisterCreatureClass();
    RegisterUnitAIClass();
    RegisterCreatureAIClass();
}

JSEngine::~JSEngine()
{
    if (m_ctx != nullptr)
        duk_destroy_heap(m_ctx);
}

void JSEngine::LoadScriptFromFile(const char* filename)
{
    FILE* f;
    size_t len;
    char buf[16000];

    f = fopen(filename, "rb");
    if (f)
    {
        len = fread((void*)buf, 1, sizeof(buf), f);
        fclose(f);
        duk_push_lstring(m_ctx, (const char*)buf, (duk_size_t)len);
    }
    else
        duk_push_undefined(m_ctx);

    duk_eval(m_ctx);

    duk_get_global_string(m_ctx, "register");
    duk_call(m_ctx, 0);
}

void JSEngine::RegisterPlayerClass()
{
    dukglue_register_constructor<Player, WorldSession*>(m_ctx, "Player");
    dukglue_register_method(m_ctx, &Player::HasSummonPending, "HasSummonPending");
    dukglue_register_method(m_ctx, (bool (Player::*)(Unit*, uint32)) &Player::CastSpell, "CastSpell");
}

void JSEngine::RegisterCreatureClass()
{
    dukglue_register_constructor<Creature>(m_ctx, "Creature");
}

void JSEngine::RegisterUnitAIClass()
{
    //dukglue_register_constructor<UnitAI>(m_ctx, "UnitAI");

    dukglue_register_method(m_ctx, &UnitAI::Reset, "Reset");
}

void JSEngine::RegisterCreatureAIClass()
{
    //dukglue_register_constructor<CreatureAI>(m_ctx, "CreatureAI");
    dukglue_set_base_class<UnitAI, CreatureAI>(m_ctx);

    dukglue_register_method(m_ctx, &CreatureAI::JustDied, "JustDied");
    dukglue_register_method(m_ctx, &CreatureAI::KilledUnit, "KilledUnit");

    dukglue_register_method(m_ctx, &CreatureAI::JustSummoned, "JustSummoned");
    dukglue_register_method(m_ctx, (void(CreatureAI::*)(Unit*)) &CreatureAI::IsSummonedBy, "IsSummonedByUnit");
    dukglue_register_method(m_ctx, (void(CreatureAI::*)(Spell const*)) &CreatureAI::IsSummonedBy, "IsSummonedBySpell");

    dukglue_register_method(m_ctx, &CreatureAI::SummonedCreatureDespawn, "SummonedCreatureDespawn");
    dukglue_register_method(m_ctx, &CreatureAI::SummonedCreatureDies, "SummonedCreatureDies");
}
