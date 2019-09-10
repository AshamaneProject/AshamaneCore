
function npc_bryan_cross()
{
    script.Reset = function()
    {
        me.CastSpellTriggered(me, 41475);
        
        var x = me.GetPositionX();
        
        var motionMaster = me.GetMotionMaster();
        motionMaster.MovePoint(0, -8942.668945, -107.672882, 83.069565, false);
        
        print(" " + x);
    };
}

function register()
{
    sJsStorage.RegisterCreatureScript(npc_bryan_cross.name, 1319);
}
