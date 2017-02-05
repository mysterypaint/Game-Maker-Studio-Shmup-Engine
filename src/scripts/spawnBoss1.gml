//Assemble our boss
//First, assemble the shell
var p1 = instance_create(objCamera.x+objCamera.viewportWidth+64,128,objBoss1);
var p2 = instance_create(objCamera.x+objCamera.viewportWidth+64,128,objBoss1);
var p3 = instance_create(objCamera.x+objCamera.viewportWidth+64,128,objBoss1);
//Assign each piece of the shell a unique ID so we can draw/move each piece properly
p1.myID = 1;
p2.myID = 2;
p3.myID = 3;
//Do the same for the boss' barriers.
var b1 = instance_create(objCamera.x+objCamera.viewportWidth+64,128,objBossBarrier);
var b2 = instance_create(objCamera.x+objCamera.viewportWidth+64,128,objBossBarrier);
var b3 = instance_create(objCamera.x+objCamera.viewportWidth+64,128,objBossBarrier);
b1.myID = 1;
b2.myID = 2;
b3.myID = 3;
//We should also keep track of the group the barriers share (in case there's more than one barrage of barriers on the boss)
b1.groupID = 1;
b2.groupID = 1;
b3.groupID = 1;
//Finally, give the boss an eye
var myEye = instance_create(objCamera.x+objCamera.viewportWidth+64,128,objBossEye);
myEye.image_index = 2;
myEye.groupID = 1; //Share a group ID with the barriers (so it can't die unless all the barriers have been destroyed)
p1.myEye = myEye; //Let the boss shell know this eye is theirs
