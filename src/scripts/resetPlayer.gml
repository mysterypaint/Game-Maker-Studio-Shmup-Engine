///Upon death, we'll reset the player

invincibilityFrames = 100; //How long we'll be invincible for upon room reset

if (global.frModeEnabled)
{
    HP=11;HPMax=11;
    if (global.state == states.gameMode)
    {audio_stop_sound(sfxMenuAccept); audio_play_sound(sfxMenuAccept,0,false);}
}
else{HP=1;HPMax=6;}
if (powerupSlot>1)
{
    powerupSlot = 1;
}
konDone = false;
konCode = false;
fun = false;
deadTimer=0;
explode = false;
dead = false;
shipTurning = 0;
cc1=0;
cc2=0;
callD = 0;
//Remove all powerups
playerSpeed = 1;
hasMissile = false;
hasDouble = false;
hasLaser = false;

with (objOption)
{
    if (myPlayer == other.id)
    {
        instance_destroy();
    }
}

numOfOpts=0;
with (objFrontShield)
   {
    instance_destroy();
   }
hasQuestion = false;
hasExclamation = false;
