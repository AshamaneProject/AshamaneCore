
function npc_bryan_cross()
{
    var timer = 10000;

    script.Reset = function()
    {
        me.CastSpellTriggered(me, 41475);
        
        var motionMaster = me.GetMotionMaster();
        //motionMaster.MovePoint(0, -8942.668945, -107.672882, 83.069565, false);
    };

    script.UpdateAI = function(diff)
    {
        if (timer <= diff)
        {
            print("10 secondes :)");
            timer = 10000;
        }
        else
            timer -= diff;
    };
}

function register()
{
    sJsStorage.RegisterCreatureScript(npc_bryan_cross.name, 1319);
}
