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

#include "duktape\duktape.h"
#include "dukglue\dukglue.h"

class JSEngine
{
public:
    JSEngine();
    ~JSEngine();

    bool LoadJSFileScripts();

    duk_bool_t RunJSFunction(duk_context* ctx, const char* funcName, const char* arga = "", const char* argb = "");

    template <typename T>
    void RegisterGlobal(duk_context* ctx, const T& obj, const char* name)
    {
        dukglue_register_global(ctx, obj, name);
    }

    inline duk_context* GetContext() { return m_ctx; }
    inline duk_context* GetNewContext()
    {
        duk_push_thread(m_ctx);
        return duk_get_context(m_ctx, -1);
    }

private:
    bool CompileScriptFromFile(const char* filename);
    bool CompileJS(const char* programBody);

    void RegisterJSEngineClass();
    void RegisterPosition();
    void RegisterWorldLocation();
    void RegisterWorldObject();
    void RegisterUnitClass();
    void RegisterPlayerClass();
    void RegisterCreatureClass();
    void RegisterTempSummonClass();
    void RegisterMotionMasterClass();
    void RegisterUnitAIClass();
    void RegisterCreatureAIClass();

    duk_context* m_ctx;
};

class JSStorage
{
public:
    static JSStorage* instance();

    void RegisterCreatureScript(std::string scriptname, uint32 id);
    std::string GetCreatureScript(uint32 id);

private:
    std::unordered_map<uint64, std::string> scripts;
};

#define sJsStorage JSStorage::instance()
