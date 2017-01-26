///This will spawn all the entities placed in the OGMO map
//Make sure each object has a switch case here: each case should perfectly match their corresponding entity's name in the .oep!
switch (argument[0])
{
case "PlayerSpawn":
        show_message("No longer a thing, ignoring...");
        /*
        if !instance_exists(objPlayer)
        {
        var myID = instance_create(argument[2],argument[3],objPlayer); with (myID) {myID = argument[1];}
        //Move the camera so that the player is perfectly in the center of the screen
        //... But if the camera would end up out of bounds, set the position to the map's edge instead.
        if (objPlayer.x-(objCamera.viewportWidth/2)<0)
        {objCamera.x=0;}else{objCamera.x=objPlayer.x-(objCamera.viewportWidth/2);}
        if (objPlayer.y-(objCamera.viewportHeight/2)<0)
        {objCamera.y=0;}else{objCamera.y=objPlayer.y-(objCamera.viewportHeight/2);}
        }*/
        break;
case "objLion":
        var myID = instance_create(argument[2],argument[3],objLion);
        with (myID) {myID = argument[1];}
        break;
case "objBlueDee":
        var myID = instance_create(argument[2]+8,argument[3]+8,objDee01);
        with (myID) {myID = argument[1]; isRed = false;}
        break;
case "objRedDee":
        var myID = instance_create(argument[2]+8,argument[3]+8,objDee01);
        with (myID) {myID = argument[1]; isRed = true;}
        break;
case "objBean_Pattern1":
        for (var i=0; i<5; i++)
        {
            var myID = instance_create(argument[2]+(i*16),argument[3],objBean);
            with (myID) {myID = string(argument[1]) + "_" + string(i); groupID = string(argument[1]); isolatedNum = i; patternType = 1; lagFrames = (i*16);}
        }
        break;
case "objBean_Pattern2":
        for (var i=0; i<5; i++)
        {
            var myID = instance_create(argument[2]+(i*16),argument[3],objBean);
            with (myID) {myID = string(argument[1]) + "_" + string(i); groupID = string(argument[1]); isolatedNum = i; patternType = 2; lagFrames = (i*16);}
        }
        break;
//Throw an error in case we run into some undefined case
case "undefined":
default: if(!objMain.threwError){show_message("Warning: Unknown object(s) detected! Unable to spawn and skipping over it.##Make sure each object has a switch case in the placeSprite() script: each case should perfectly match their corresponding entity's name in the .oep!");objMain.threwError=true;}
        break;
}
