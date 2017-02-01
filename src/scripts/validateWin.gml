///Before awarding our players, check if at least one of them is still alive.
//Call this script upon boss destruction (See objBoss1's Destroy Event for an example of useage)

var beatBoss = false;
        
//Check every single player instance and, if there's at least one still alive, flag the boss as dead.
for (var i=0; i<instance_number(objPlayer); i++)
{
    thisPlayer = instance_find(objPlayer,i);
    if (!thisPlayer.dead)
    {
        beatBoss = true;
    }
}

return beatBoss;
