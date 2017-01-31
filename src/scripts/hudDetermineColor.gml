///Sets the blending color for drawing the text color on the powerup HUD in-game
//This is done in objCamera's draw event
if (argument1==2) //Current player
{
    if (objPlayer2.powerupSlot!=argument0) {return c_blue;} //Blend to make black
}
else
{
    if (objPlayer.powerupSlot!=argument0) {return c_blue;} //Blend to make black
}
return c_white; //Otherwise, blend to make yellow
