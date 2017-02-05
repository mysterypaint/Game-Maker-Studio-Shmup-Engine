///Draws the Force Field onto the screen, called by objCamera's Draw Event
//Arg0: The objPlayer instance (1, 2, ...) to refer to

var forceColor = c_blue;
var enlargeShield = 0;

if (!argument[0].dead)
{
    if (global.frModeEnabled)
    {
        forceColor = c_green;
        enlargeShield = -1.5; //The smaller the number, the larger the shield size
        if argument[0].HP<4 {forceColor = c_red;}
    }
    else
    {    
        if argument[0].HP<3 {forceColor = c_red;}
    }
    
    var shieldRatio = ((argument[0].HP-1)/(argument[0].HPMax-1+enlargeShield))/2; //Divide by two because the sprite is twice as large
    
    {
        draw_sprite_ext(sprForceField,argument[0].forceFrame,argument[0].x+objCamera.scrollX+argument[0].flyingIn,argument[0].y+objCamera.scrollY,shieldRatio,shieldRatio,0,forceColor,0.26);
    }
}
