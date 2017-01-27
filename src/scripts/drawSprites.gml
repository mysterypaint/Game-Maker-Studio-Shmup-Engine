//For drawing more than one sprite with objCamera's draw event
//We loop through every single instance of the object and draw them one by one

if instance_exists(argument[0])
{
    var i;
    for (i = 0; i < instance_number(argument[0]); i += 1)
    {
        thisObject = instance_find(argument[0],i);
        with (thisObject)
        {
            draw_sprite(argument[1],image_index,x,y);
        }
    
    }
}
