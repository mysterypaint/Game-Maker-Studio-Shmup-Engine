///Called from the levelEvents() script, this script changes maps.
//Argument 0: Map name, with extension, as a string (e.g.: "map01.oel")
//Argument 1: BGM to load (Assume looping is false. Play the intro first!). Directly call the asset, do not input a string.

if (objMain.switchingMaps == false && objMain.bgmFadeoutMultiplier<=0)
{
    objMain.switchingMaps = true;   //Reset at the very end of the loadLevel() script, called at the very bottom of this script.
    objMain.cleaningRoom = true;
    //Forget the spawn data of all sprites
    ds_map_destroy(objMain.levelDataSprites);
    
    //Go through every single enemy in the room and...
    var totalDeleteCount = 0;
    for (var i=0; i < 6;i++)
    {
        var objToFind = "null";
    
        switch(i)
        {
            case 0: objToFind = "objEnemyParent"; break;
            case 1: objToFind = "objBean"; break;
            case 2: objToFind = "objLion"; break;
            case 3: objToFind = "objDee01"; break;
            case 4: objToFind = "objCapsule"; break;
            default: break;
        }
        
        if (objToFind != "null")
        {
            objToFind = asset_get_index(objToFind);
            
            for (j = 0; j < instance_number(objToFind); j++)
            {
                thisEnemy = instance_find(objToFind,j);
                //... Delete all enemies that are not on the camera
                if !(thisEnemy.x >= objCamera.x-64 &&
                    thisEnemy.x <= objCamera.x+64 + objCamera.viewportWidth &&
                    thisEnemy.y >= objCamera.y-64 &&
                    thisEnemy.y <= objCamera.y+64 + objCamera.viewportHeight)
                {
                    with (thisEnemy){silentKill = true; instance_destroy();}
                    totalDeleteCount++;
                }
                else
                {
                    thisEnemy.x = -(objCamera.viewportWidth)+(thisEnemy.x-objCamera.x);
                }
            }
        }
    }
    
    objMain.cleaningRoom = false;
    
    //If applicable, shift all Option positions to the very start of the map
    
    for (var i = 39; i >= 0; i--;)  //Shift all 40 frames of x/y ghost trailing by however the player moved
    {
        objPlayer1.prevX[i] = -(objCamera.viewportWidth)+(objPlayer1.prevX[i]-objCamera.x);
        if instance_exists(objPlayer2)
        {
            objPlayer2.prevX[i] = -(objCamera.viewportWidth)+(objPlayer2.prevX[i]-objCamera.x);
        }
    }
    
    //Move literally everything besides the camera to the very start of the map
    for (i = 0; i < instance_count; i++)
    {
        if (instance_id[i] != objCamera)
        {
            with (instance_id[i]) {x = -(objCamera.viewportWidth)+(x-objCamera.x);}
        }
    }
    //Now move the camera, too
    objCamera.x = -(objCamera.viewportWidth);
    
    //After we've deleted all non-visible enemies, load the next map
    //But first, remember the state of the previous level before we switch stuff
    if (objMain.rememberBGM)
    {
        global.prevMap = global.currentMap;
        objCamera.prevScrollX = objCamera.scrollX;
        objCamera.prevScrollY = objCamera.scrollY;
    }
    
    global.currentMap = argument[0];
    loadLevel(argument[0]);
    changeBGM(argument[1],false);
}

objMain.bgmFadeoutMultiplier=1;
