///Returns the player we're trying to look for.
//Arg 0: The id of the player to look for 

for (var i=0; i<instance_number(objPlayer); i++)
{
    var itsMe = instance_find(objPlayer,i);
    if (itsMe == argument[0].id)
    {
        return itsMe;
    }
}

return -1;
