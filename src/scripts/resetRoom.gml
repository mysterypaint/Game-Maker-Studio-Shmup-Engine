///Reset the entire room if the player dies and we're finished waiting while dead
//This script is called from objPlayer upon death
objMain.cleaningRoom = true;

if (powerupSlot>=1){powerupSlot=1;} //Give the player a free capsule on revival if they have any capsule on death
        objPlayer.konDone = false;
        objPlayer.konCode = false;
        objPlayer.fun = false;
        objPlayer.dead = false;
        objPlayer.shipTurning = 0;
        objPlayer.cc1=0;
        objPlayer.cc2=0;
        objPlayer.callD = 0;

        //Remove all powerups
        playerSpeed = 1;
        hasMissile = false;
        hasDouble = false;
        hasLaser = false;
        with (objOption)
           {
            instance_destroy();
           }
        numOfOpts=0;
        with (objFrontShield)
           {
            instance_destroy();
           }
        hasQuestion = false;
        hasExclamation = false;
        
        //Delete all existing temporary particles
        with (objBullet)
           {
            instance_destroy();
           }
        with (objDouble)
           {
            instance_destroy();
           }
        with (objLaser)
           {
            instance_destroy();
           }

        //Delete all interactable things, too
        with (objLion)
           {
            instance_destroy();
           }
        with (obj16x16Explosion)
           {
            instance_destroy();
           }
        with (objCapsule)
           {
            instance_destroy();
           }

        //Without changing the map, re-spawn all entities in the map except the player, who already exists
        spawnSprites();
        
        //Play the bgm again
        audio_stop_sound(global.currentSong);
        checkBGMIntro(global.currentSong); //If the song is loopable, play the intro instead
        
        //Reset the position of the camera
        objCamera.x = 0;
        objCamera.y = 0;
        objMain.cleaningRoom = false; //Turn off the flag since we're all done maintaining the room
