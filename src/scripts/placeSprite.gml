switch (argument[0])
{
case "PlayerSpawn":
        if !instance_exists(objPlayer)
        {
        var myID = instance_create(argument[2],argument[3],objPlayer); with (myID) {myID = argument[1];}
        objCamera.x=objPlayer.x-(objCamera.viewportWidth/2);
        objCamera.y=objPlayer.y-(objCamera.viewportHeight/2);
        }
        else{objPlayer.x=argument[2];objPlayer.y=argument[3];}
        break;
case "TestEnemy":
        var myID = instance_create(argument[2],argument[3],objEnemy);
        with (myID) {myID = argument[1];}break;
}
