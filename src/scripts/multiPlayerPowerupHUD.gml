//Draw Player 1's HUD

for(var i=0;i<2;i++)
{
    for(var j=0;j<3;j++)
    {
        //Handle the boxes themselves
        if ((j+1)+(3*i) == objPlayer.powerupSlot)
        {
        //original y pos was 212
        draw_sprite(sprPowerupHUD,2,objCamera.x+16+(32*j),objCamera.y+228+(8*i));
        }
        else
        {draw_sprite(sprPowerupHUD,0,objCamera.x+16+(32*j),objCamera.y+228+(8*i));}
    }
}

//Determine which arsenal Player 1 has

//Handle the actual text in the boxes
draw_enable_alphablend(true);
var currColor = c_white;

//Determine which text to draw onto the screen
var currSpeed = 3;
var currMissile = 4;
var currDouble = 5;
var currLaser = 6;
var currOption = 7;
var currQuestion = 8;

switch(objMain.missileType)
{
    case 2: currMissile=10; //2-way
        break;
    case 3: currMissile=13; //Spread Bomb
        break;
    case 4: currMissile=16; //Photon Torpedo
        break;
    default:
        break;
}
switch(objMain.doubleType)
{
    case 2: currDouble=11; //Tailgun
        break;
    case 3: currDouble=14; //Vertical
        break;
    case 4: currDouble=17; //Back Double
        break;
    default:
        break;
}
switch(objMain.laserType)
{
    case 2: currLaser = 12; //Ripple
        break;
    case 3: currLaser = 15; //C.Laser
        break;
    case 4: currLaser = 18; //Twin Laser
        break;
    default:
        break;
}
switch(objMain.optionType)
{
    default:
        break;
}

///Draw Player 1's arsenal
//Speedup
currColor = hudDetermineColor(1,1); if (objPlayer.playerSpeed < objPlayer.playerSpeedMax) draw_sprite_ext( sprPowerupHUD, currSpeed, objCamera.x+16+(32*0),objCamera.y+228, 1, 1, 0, currColor, 1);
//Missile
currColor = hudDetermineColor(2,1); if (!objPlayer.hasMissile) draw_sprite_ext( sprPowerupHUD, currMissile, objCamera.x+16+(32*1),objCamera.y+228, 1, 1, 0, currColor, 1);
//Double
currColor = hudDetermineColor(3,1); if (!objPlayer.hasDouble) draw_sprite_ext( sprPowerupHUD, currDouble, objCamera.x+16+(32*2),objCamera.y+228, 1, 1, 0, currColor, 1);
//Laser
currColor = hudDetermineColor(4,1); if (!objPlayer.hasLaser) draw_sprite_ext( sprPowerupHUD, currLaser, objCamera.x+16+(32*0),objCamera.y+228+8, 1, 1, 0, currColor, 1);
//Option
currColor = hudDetermineColor(5,1); if (objPlayer.numOfOpts<objPlayer.optsMax) draw_sprite_ext( sprPowerupHUD, currOption, objCamera.x+16+(32*1),objCamera.y+228+8, 1, 1, 0, currColor, 1);
//Question
currColor = hudDetermineColor(6,1); if (!objPlayer.hasQuestion) draw_sprite_ext( sprPowerupHUD, currQuestion, objCamera.x+16+(32*2),objCamera.y+228+8, 1, 1, 0, currColor, 1);





//Draw Player 2's HUD
draw_enable_alphablend(false);

for(var i=0;i<2;i++)
{
    for(var j=0;j<3;j++)
    {
        //Handle the boxes themselves
        if ((j+1)+(3*i) == objPlayer2.powerupSlot)
        {
        //original y pos was 212
        draw_sprite(sprPowerupHUD,2,objCamera.x+144+(32*j),objCamera.y+228+(8*i));
        }
        else
        {draw_sprite(sprPowerupHUD,1,objCamera.x+144+(32*j),objCamera.y+228+(8*i));}
    }
}

//Determine which arsenal Player 2 has

//Handle the actual text in the boxes
draw_enable_alphablend(true);
var currP2Color = c_white;

//Determine which text to draw onto the screen
var currP2Speed = 3;
var currP2Missile = 4;
var currP2Double = 5;
var currP2Laser = 6;
var currP2Option = 7;
var currP2Question = 8;

switch(objMain.p2MissileType)
{
    case 2: currP2Missile=10; //2-way
        break;
    case 3: currP2Missile=13; //Spread Bomb
        break;
    case 4: currP2Missile=16; //Photon Torpedo
        break;
    default:
        break;
}
switch(objMain.p2DoubleType)
{
    case 2: currP2Double=11; //Tailgun
        break;
    case 3: currP2Double=14; //Vertical
        break;
    case 4: currP2Double=17; //Back Double
        break;
    default:
        break;
}
switch(objMain.p2LaserType)
{
    case 2: currP2Laser = 12; //Ripple
        break;
    case 3: currP2Laser = 15; //C.Laser
        break;
    case 4: currP2Laser = 18; //Twin Laser
        break;
    default:
        break;
}
switch(objMain.p2OptionType)
{
    default:
        break;
}

///Draw Player 2's arsenal
//Speedup
currP2Color = hudDetermineColor(1,2); if (objPlayer2.playerSpeed < objPlayer2.playerSpeedMax) draw_sprite_ext( sprPowerupHUD, currP2Speed, objCamera.x+144+(32*0),objCamera.y+228, 1, 1, 0, currP2Color, 1);
//Missile
currP2Color = hudDetermineColor(2,2); if (!objPlayer2.hasMissile) draw_sprite_ext( sprPowerupHUD, currP2Missile, objCamera.x+144+(32*1),objCamera.y+228, 1, 1, 0, currP2Color, 1);
//Double
currP2Color = hudDetermineColor(3,2); if (!objPlayer2.hasDouble) draw_sprite_ext( sprPowerupHUD, currP2Double, objCamera.x+144+(32*2),objCamera.y+228, 1, 1, 0, currP2Color, 1);
//Laser
currP2Color = hudDetermineColor(4,2); if (!objPlayer2.hasLaser) draw_sprite_ext( sprPowerupHUD, currP2Laser, objCamera.x+144+(32*0),objCamera.y+228+8, 1, 1, 0, currP2Color, 1);
//Option
currP2Color = hudDetermineColor(5,2); if (objPlayer2.numOfOpts<objPlayer2.optsMax) draw_sprite_ext( sprPowerupHUD, currP2Option, objCamera.x+144+(32*1),objCamera.y+228+8, 1, 1, 0, currP2Color, 1);
//Question
currP2Color = hudDetermineColor(6,2); if (!objPlayer2.hasQuestion) draw_sprite_ext( sprPowerupHUD, currP2Question, objCamera.x+144+(32*2),objCamera.y+228+8, 1, 1, 0, currP2Color, 1);
