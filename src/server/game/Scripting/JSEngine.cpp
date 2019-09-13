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
#include "BuiltInConfig.h"
#include "CreatureAI.h"
#include "MotionMaster.h"
#include "SharedDefines.h"
#include "Spell.h"
#include "TemporarySummon.h"
#include <fstream>
#include <boost/filesystem.hpp>
#include <Regex.h>

namespace fs = boost::filesystem;

JSEngine::JSEngine()
{
    m_ctx = duk_create_heap_default();

    RegisterJSEngineClass();
    RegisterPosition();
    RegisterWorldLocation();
    RegisterWorldObject();
    RegisterUnitClass();
    RegisterPlayerClass();
    RegisterCreatureClass();
    RegisterTempSummonClass();
    RegisterMotionMasterClass();
    RegisterUnitAIClass();
    RegisterCreatureAIClass();
}

JSEngine::~JSEngine()
{
    if (m_ctx != nullptr)
        duk_destroy_heap(m_ctx);
}

static fs::path GetSourceDirectory()
{
    fs::path dir = BuiltInConfig::GetSourceDirectory();
    dir /= "src";
    dir /= "server";
    dir /= "scripts";
    return dir;
}

bool HasJSSourceFileExtension(fs::path const& path)
{
    static Trinity::regex const regex("^\\.(js)$");
    return Trinity::regex_match(path.extension().generic_string(), regex);
}

bool JSEngine::LoadJSFileScripts()
{
    for (const fs::directory_entry& f : fs::recursive_directory_iterator(GetSourceDirectory()))
        if (fs::is_regular_file(f.path()))
            if (HasJSSourceFileExtension(f.path()))
                if (CompileScriptFromFile(f.path().string().c_str()))
                    RunJSFunction(GetContext(), "register");

    return true;
}

bool JSEngine::CompileScriptFromFile(const char* filename)
{
    std::ifstream inFile(filename);
    std::ostringstream sout;

    std::copy(std::istreambuf_iterator<char>(inFile),
              std::istreambuf_iterator<char>(),
              std::ostreambuf_iterator<char>(sout));

    inFile.close();

    if (!CompileJS(sout.str().c_str()))
    {
        printf("Compile failed for file %s\n", filename);
        printf("%s\n", duk_safe_to_string(m_ctx, -1));
        return false;
    }

    return true;
}

bool JSEngine::CompileJS(const char* programBody)
{
    bool success = false;

    try
    {
        // Compile the JS into bytecode
        if (duk_pcompile_string(m_ctx, 0, programBody) == 0)
        {
            // Actually evaluate it - this will push the compiled code into the global scope
            duk_pcall(m_ctx, 0);
            success = true;

        }
        duk_pop(m_ctx);
    }
    catch (std::exception const& /*ex*/) { }

    return success;
}

duk_bool_t JSEngine::RunJSFunction(duk_context* ctx, const char* funcName, const char* arga, const char* argb)
{
    duk_bool_t returnVal;

    // Get a reference to the named JS function
    if (duk_get_global_string(ctx, funcName))
    {
        // Function found, push the args

        duk_push_string(ctx, arga);
        duk_push_string(ctx, argb);

        // Use pcall - this lets you catch and handle any errors
        if (duk_pcall(ctx, 2) != DUK_EXEC_SUCCESS)
        {
            // An error occurred - display a stack trace
            duk_get_prop_string(ctx, -1, "stack");
            printf("%s\n", duk_safe_to_string(ctx, -1));
        }
        else
        {
            // function executed successfully - get result
            returnVal = duk_get_boolean(ctx, -1);
        }
    }
    else
    {
        printf("JS function not found!\n");
        returnVal = false;
    }

    duk_pop(ctx); // pop result

    return returnVal;
}

void jsPrint(std::string test)
{
    printf("%s\n", test.c_str());
}

void JSEngine::RegisterJSEngineClass()
{
    RegisterGlobal(GetContext(), this, "JSEngine");
    RegisterGlobal(GetContext(), sJsStorage, "sJsStorage");
    dukglue_register_method(m_ctx, &JSStorage::RegisterCreatureScript, "RegisterCreatureScript");

    dukglue_register_function(m_ctx, &jsPrint, "print");
}

void JSEngine::RegisterPosition()
{
    dukglue_register_method(m_ctx, &Position::GetPositionX, "GetPositionX");
    dukglue_register_method(m_ctx, &Position::GetPositionY, "GetPositionY");
    dukglue_register_method(m_ctx, &Position::GetPositionZ, "GetPositionZ");
}

void JSEngine::RegisterWorldLocation()
{
    dukglue_set_base_class<Position, WorldLocation>(m_ctx);
    dukglue_register_method(m_ctx, &WorldLocation::GetMapId, "GetMapId");
}

void JSEngine::RegisterWorldObject()
{
    dukglue_set_base_class<WorldLocation, WorldObject>(m_ctx);
}

void JSEngine::RegisterUnitClass()
{
    dukglue_set_base_class<WorldObject, Unit>(m_ctx);

    dukglue_register_method(m_ctx, (bool (Unit::*)(Unit*, uint32)) &Unit::CastSpell, "CastSpell");
    dukglue_register_method(m_ctx, (bool (Unit::*)(Unit*, uint32)) &Unit::CastSpellTriggered, "CastSpellTriggered");

    dukglue_register_method(m_ctx, (MotionMaster* (Unit::*)()) &Creature::GetMotionMaster, "GetMotionMaster");
}

void JSEngine::RegisterPlayerClass()
{
    dukglue_set_base_class<Unit, Player>(m_ctx);
}

void JSEngine::RegisterCreatureClass()
{
    dukglue_set_base_class<Unit, Creature>(m_ctx);
}

void JSEngine::RegisterTempSummonClass()
{
    dukglue_set_base_class<Creature, TempSummon>(m_ctx);
}

void JSEngine::RegisterMotionMasterClass()
{
    dukglue_register_method(m_ctx, (void (MotionMaster::*)(uint32, float, float, float, bool generatePath)) &MotionMaster::MovePoint, "MovePoint");
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

    dukglue_register_method(m_ctx, &CreatureAI::UpdateVictim, "UpdateVictim");
    dukglue_register_method(m_ctx, &CreatureAI::UpdateVictimWithGaze, "UpdateVictimWithGaze");

    dukglue_register_method(m_ctx, &CreatureAI::SetGazeOn, "SetGazeOn");

    dukglue_register_method(m_ctx, &CreatureAI::Talk, "Talk");

    dukglue_register_method(m_ctx, &CreatureAI::JustDied, "JustDied");
    dukglue_register_method(m_ctx, &CreatureAI::KilledUnit, "KilledUnit");

    dukglue_register_method(m_ctx, &CreatureAI::JustSummoned, "JustSummoned");
    dukglue_register_method(m_ctx, (void(CreatureAI::*)(Unit*)) &CreatureAI::IsSummonedBy, "IsSummonedByUnit");
    dukglue_register_method(m_ctx, (void(CreatureAI::*)(Spell const*)) &CreatureAI::IsSummonedBy, "IsSummonedBySpell");

    dukglue_register_method(m_ctx, &CreatureAI::SummonedCreatureDespawn, "SummonedCreatureDespawn");
    dukglue_register_method(m_ctx, &CreatureAI::SummonedCreatureDies, "SummonedCreatureDies");
}

JSStorage* JSStorage::instance()
{
    static JSStorage instance;
    return &instance;
}

void JSStorage::RegisterCreatureScript(std::string scriptname, uint32 id)
{
    scripts[MAKE_PAIR64(TYPEID_UNIT, id)] = scriptname;
}

std::string JSStorage::GetCreatureScript(uint32 id)
{
    auto scriptItr = scripts.find(MAKE_PAIR64(TYPEID_UNIT, id));
    if (scriptItr == scripts.end())
        return "";

    return scriptItr->second;
}
