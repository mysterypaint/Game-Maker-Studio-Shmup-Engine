///This script draws the Gradius Laser from objCamera's Draw event
if instance_exists(objLaser)
{
    var i;
    for (i = 0; i < instance_number(objLaser); i += 1)
    {
        thisLaser = instance_find(objLaser,i);
        with (thisLaser)
        {
            if laserType == 1 //Standard laser
            {
                draw_sprite_ext(sprLaser,2,x,y,image_xscale, image_yscale,0,c_white,1);
            }
            else if laserType == 2 //C. Laser
            {
                
                {
                    for (var j=0; j<=length; j++)
                    {
                        draw_sprite(sprLaser,cycImgIndex,x+(j*4),y);
                    }
                }
            }
        }
    }
}
