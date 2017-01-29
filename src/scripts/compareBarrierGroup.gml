///Called from every colission instance in objBossBarrier
//Returns true if we are the left-most barrier on the screen. Else, false.

var smallestX = x;

//We loop through every single barrier, check if they're in our group, then compare their x position with our x position
var i;
for (i = 0; i < instance_number(objBossBarrier); i += 1)
{
    thisObject = instance_find(objBossBarrier,i);
    if (thisObject.groupID == self.groupID)
    {
        if (thisObject.x<self.x)
        {
            smallestX = thisObject.x;
        }
    }
}

//Return true if we truly are the left-most barrier in our group
if (smallestX>=x)
{
    return true;
}
return false;
