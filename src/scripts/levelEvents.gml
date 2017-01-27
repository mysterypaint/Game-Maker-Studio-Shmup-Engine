///This script keeps track of all level flags throughout the game
//Like if we're getting close to a level or boss

switch(global.currentMap)
{
case "map00.oel": //Pre-stage 1
    if objCamera.x<-250{objMain.nextGameLoop=false;}
    if objCamera.x > (global.mapWidth * global.tileWidth) - 32 && !objMain.nextGameLoop
    {
        changeMap("map01.oel",BGM01);
    }
    break;

case "map01.oel": //Stage 1
    //if (objCamera.x>-250 && !instance_exists(objBoss1) && objMain.mapSwitchTimer<=0)
    if (objCamera.x > (global.mapWidth * global.tileWidth) - 32 && objMain.bgmFadeoutMultiplier<=0 && !instance_exists(objBoss1) && objMain.mapSwitchTimer<=0) //After the camera surpassed the map and the music is completely faded out...
    {
    //... Boss time!
    objMain.rememberBGM = false;
    audio_stop_sound(global.currentSong);
    changeBGM(BGM02,false); //Boss BGM Intro (Loop handled automatically)
    
    //Assemble our boss
    var p1 = instance_create(objCamera.x+objCamera.viewportWidth+64,128,objBoss1);
    var p2 = instance_create(objCamera.x+objCamera.viewportWidth+64,128,objBoss1);
    var p3 = instance_create(objCamera.x+objCamera.viewportWidth+64,128,objBoss1);
    p1.myID = 1;
    p2.myID = 2;
    p3.myID = 3;
    var b1 = instance_create(objCamera.x+objCamera.viewportWidth+64,128,objBossBarrier);
    var b2 = instance_create(objCamera.x+objCamera.viewportWidth+64,128,objBossBarrier);
    var b3 = instance_create(objCamera.x+objCamera.viewportWidth+64,128,objBossBarrier);
    b1.myID = 1;
    b2.myID = 2;
    b3.myID = 3;
    var myEye = instance_create(x,y,objBossEye);
    myEye.image_index = 2;
    p1.myEye = myEye;
    }
    break;
case "beatBoss1":
    if (objMain.mapSwitchTimer<=5)
    {
    objMain.rememberBGM = true;
    objMain.nextGameLoop = true;
    objMain.switchingMaps = false;
    objMain.bgmFadeoutMultiplier = 0;
    objMain.showLoop = 182; //For the specified length of frames, tell the player which loop they're on
    global.currentSong = BGM00;
    global.prevMap = "map00.oel"; //Set to the same map so we don't accidentally warp back to this map state if we die on the next state
    objCamera.scrollX = 0.3;
    objCamera.y = 0;
    objPlayer.y = (objPlayer.y%objCamera.viewportHeight);
    changeMap("map00.oel",BGM00); //Infinite loop, for demonstration purposes
    objMain.loopCounter++; //Starting from 1, keeps track of how many times we've reached this point of the game (Could be used as a difficulty determinant)
    }
    break;
default:
    break;
}

//Fade out music whenever the player is approaching the end of the map, unless a boss has spawned somewhere nearby already
if (objCamera.x > (global.mapWidth * global.tileWidth) - 128 && !objMain.switchingMaps && !instance_exists(objBossParent))
{
    if objMain.bgmFadeoutMultiplier>0
    {
        objMain.bgmFadeoutMultiplier-=0.005;
    }
}