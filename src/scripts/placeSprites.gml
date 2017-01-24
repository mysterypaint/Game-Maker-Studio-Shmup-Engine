///This will spawn all the entities placed in the OGMO map
//Make sure each object has a switch case here: each case should perfectly match their corresponding entity's name in the .oep!
switch (argument[0])
{
case "PlayerSpawn":
        if !instance_exists(objPlayer)
        {
        var myID = instance_create(argument[2],argument[3],objPlayer); with (myID) {myID = argument[1];}
        //Move the camera so that the player is perfectly in the center of the screen
        //... But if the camera would end up out of bounds, set the position to the map's edge instead.
        if (objPlayer.x-(objCamera.viewportWidth/2)<0)
        {objCamera.x=0;}else{objCamera.x=objPlayer.x-(objCamera.viewportWidth/2);}
        if (objPlayer.y-(objCamera.viewportHeight/2)<0)
        {objCamera.y=0;}else{objCamera.y=objPlayer.y-(objCamera.viewportHeight/2);}
        }
        else{objPlayer.x=argument[2];objPlayer.y=argument[3];}
        break;
case "objLion":
        var myID = instance_create(argument[2],argument[3],objLion);
        with (myID) {myID = argument[1];}
        break;
//Throw an error in case we run into some undefined case
case "undefined":
default: if(!objMain.threwError){show_message("Warning: Unknown object detected! Unable to spawn and skipping over it.##Make sure each object has a switch case in the placeSprite() script: each case should perfectly match their corresponding entity's name in the .oep!");objMain.threwError=true;}
        break;
}
