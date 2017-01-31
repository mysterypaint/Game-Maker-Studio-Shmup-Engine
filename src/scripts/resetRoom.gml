///Reset the entire room if the player dies and we're finished waiting while dead
//This script is called from objPlayer upon death
objMain.cleaningRoom = true;
objMain.bgmFadeoutMultiplier = 1;

if (powerupSlot>=1){powerupSlot=1;} //Give the player a free capsule on revival if they have any capsule on death
        objPlayer.konDone = false;
        objPlayer.konCode = false;
        objPlayer.fun = false;
        objPlayer.dead = false;
        objPlayer.shipTurning = 0;
        objPlayer.cc1=0;
        objPlayer.cc2=0;
        objPlayer.callD = 0;
        objPlayer.HP = 1;
        //Remove all powerups
        objPlayer.playerSpeed = 1;
        objPlayer.hasMissile = false;
        objPlayer.hasDouble = false;
        objPlayer.hasLaser = false;
        if instance_exists(objPlayer2)
        {
            objPlayer2.konDone = false;
            objPlayer2.konCode = false;
            objPlayer2.fun = false;
            objPlayer2.dead = false;
            objPlayer2.shipTurning = 0;
            objPlayer2.cc1=0;
            objPlayer2.cc2=0;
            objPlayer2.callD = 0;
            objPlayer2.HP = 1;
            //Remove all powerups
            objPlayer2.playerSpeed = 1;
            objPlayer2.hasMissile = false;
            objPlayer2.hasDouble = false;
            objPlayer2.hasLaser = false;
        }
        
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
        with (objEnemyParent)
           {
            instance_destroy();
           }
        with (objBossParent)
           {
            instance_destroy();
           }
        with (objEnemyBullet)
           {
            instance_destroy();
           }
        with (objBossLaser)
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

        //Re-spawn all entities in the map except the player, who already exists
        if (!objMain.rememberBGM)
        {
            global.currentMap = global.prevMap;
            objCamera.scrollX = objCamera.prevScrollX;
            objCamera.scrollY = objCamera.prevScrollY;
        }
        
        spawnSprites();
        //Play the bgm again
        audio_stop_sound(global.currentSong);
        
        if (!objMain.rememberBGM)
        {
            global.currentSong = global.prevSong;
        }
        
        changeBGM(global.currentSong,false); //If the song is loopable, play the intro instead
        objMain.rememberBGM = true;
        
        //Reset the position of the camera, objMain, and objPlayer
        objCamera.x = -256;
        objCamera.y = 0;
        objMain.x = objCamera.x;
        objMain.y = objCamera.y;
        objPlayer.x = objCamera.x + 128;
        objPlayer.y = 128;
        if instance_exists(objPlayer2)
        {
            objPlayer2.x = objCamera.x + 128;
            objPlayer2.y = 128+32;
            objPlayer.y = 128-32;
        }
        
        objMain.cleaningRoom = false; //Turn off the flag since we're all done maintaining the room
