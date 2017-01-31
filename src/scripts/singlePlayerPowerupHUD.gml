///Draw Player 1's HUD if we're on single player mode
//This script is called from objCamera's Draw Event

for(var i=0;i<7;i++)
{
    //Handle the boxes themselves
    if (i+1 == objPlayer.powerupSlot)
    {
    //original y pos was 212
    draw_sprite(sprPowerupHUD,2,objCamera.x+16+(32*i),objCamera.y+228);
    }
    else
    {draw_sprite(sprPowerupHUD,0,objCamera.x+16+(32*i),objCamera.y+228);}
}

//Handle the actual text in the boxes
draw_enable_alphablend(true);
var currColor = c_white;

//Determine which text to draw onto the screen
var currSpeed = 2;
var currMissile = 3;
var currDouble = 4;
var currLaser = 5;
var currOption = 6;
var currQuestion = 7;
var currExclamation = 8;

switch(objMain.missileType)
{
    case 2: currMissile=9; //2-way
        break;
    case 3: currMissile=12; //Spread Bomb
        break;
    case 4: currMissile=15; //Photon Torpedo
        break;
    default:
        break;
}
switch(objMain.doubleType)
{
    case 2: currDouble=10; //Tailgun
        break;
    case 3: currDouble=13; //Vertical
        break;
    case 4: currDouble=16; //Back Double
        break;
    default:
        break;
}
switch(objMain.laserType)
{
    case 2: currLaser = 11; //Ripple
        break;
    case 3: currLaser = 14; //C.Laser
        break;
    case 4: currLaser = 17; //Twin Laser
        break;
    default:
        break;
}
switch(objMain.optionType)
{
    default:
        break;
}

currSpeed += 1;
currMissile += 1;
currDouble += 1;
currLaser += 1;
currOption += 1;
currQuestion += 1;
currExclamation += 1;

//Speedup
currColor = hudDetermineColor(1,1); if (objPlayer.playerSpeed < objPlayer.playerSpeedMax) draw_sprite_ext( sprPowerupHUD, currSpeed, objCamera.x+16+(32*0),objCamera.y+228, 1, 1, 0, currColor, 1);
//Missile
currColor = hudDetermineColor(2,1); if (!objPlayer.hasMissile) draw_sprite_ext( sprPowerupHUD, currMissile, objCamera.x+16+(32*1),objCamera.y+228, 1, 1, 0, currColor, 1);
//Double
currColor = hudDetermineColor(3,1); if (!objPlayer.hasDouble) draw_sprite_ext( sprPowerupHUD, currDouble, objCamera.x+16+(32*2),objCamera.y+228, 1, 1, 0, currColor, 1);
//Laser
currColor = hudDetermineColor(4,1); if (!objPlayer.hasLaser) draw_sprite_ext( sprPowerupHUD, currLaser, objCamera.x+16+(32*3),objCamera.y+228, 1, 1, 0, currColor, 1);
//Option
currColor = hudDetermineColor(5,1); if (objPlayer.numOfOpts<objPlayer.optsMax) draw_sprite_ext( sprPowerupHUD, currOption, objCamera.x+16+(32*4),objCamera.y+228, 1, 1, 0, currColor, 1);
//Question
currColor = hudDetermineColor(6,1); if (!objPlayer.hasQuestion) draw_sprite_ext( sprPowerupHUD, currQuestion, objCamera.x+16+(32*5),objCamera.y+228, 1, 1, 0, currColor, 1);
//Exclamation
currColor = hudDetermineColor(7,1); if (!objPlayer.hasExclamation) draw_sprite_ext( sprPowerupHUD, currExclamation, objCamera.x+16+(32*6),objCamera.y+228, 1, 1, 0, currColor, 1);
