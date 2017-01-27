/*
Tile Collision Detection: Simple AABB collision checking

Returns true if the tile behavior in argument[2] matches
the tile at the x/y position (self.x+arg0,self.y+arg1), and vice versa.

It basically works similar to Game Maker's official place_meeting() function,
but the last argument represents the tile behavior instead of an object.

Example: placeMeeting(0,vsp+1,"solid"))
arg0: x offset from self bounding box
arg1: y offset from self bounding box
arg2: The tile type to check for
*/

var inX=argument[0];
var inY=argument[1];
var tw = global.tileWidth;
var th = global.tileHeight;
var g1 = (floor((bbox_left+inX)/tw));
var g2 = (floor((bbox_right+inX)/tw));
var a1 = (floor((bbox_top+inY)/th));
var a2 = (floor((bbox_bottom+inY)/th));
var a3 = (floor((bbox_bottom-((bbox_bottom-bbox_top+1)/2)+inY)/th));
var a4 = (floor((bbox_bottom-((bbox_bottom-bbox_top+1)/2)+inY)/th));
var tmh = global.mapHeight-1;
var tmw = global.mapWidth-1;

/*
Find out the tile interaction behavior for:

    - The left boundary of our object's hitbox (c1)
    - The right boundary of our object's hitbox (c2)
    - The upper boundary of our object's hitbox (c3)
    - The lower boundary of our object's hitbox (c4)
    - The left-middle boundary of our object's hitbox (c5)
    - The right-middle boundary of our object's hitbox (c6)
    
    All of these values are offset/shifted by whatever argument[0] (inX) and argument[1] (inY) are.
        Example: If we want to check objPlayer.x, we'd also take their horizontal speed into consideration and input it as argument[0] (inX)
    
    All of these values were also pre-calculated in the g/a variables listed above this comment.
*/
var c1 = real(ds_grid_get(objMain.levelData, g1, a1));
var c2 = real(ds_grid_get(objMain.levelData, g1, a2));
var c3 = real(ds_grid_get(objMain.levelData, g2, a1));
var c4 = real(ds_grid_get(objMain.levelData, g2, a2));
var c5 = real(ds_grid_get(objMain.levelData, g1, a3));
var c6 = real(ds_grid_get(objMain.levelData, g2, a4));

//Ensure that each possible tile to check is also not out of bounds before we try reading it
//This is because Game Maker dislikes negative values in the array, causing fatal crashes
if c1<0 {c1=0;}
if c2<0 {c2=0;}
if c3<0 {c3=0;}
if c4<0 {c4=0;}
if c5<0 {c5=0;}
if c6<0 {c6=0;}

//Now that we know all numbers should be in-bounds the tiletypes array, start checking for
//actual collisions and return true if we're touching any tile at all
if (objMain.tiletypes[c1] == argument[2])
|| (objMain.tiletypes[c2] == argument[2])
|| (objMain.tiletypes[c3] == argument[2])
|| (objMain.tiletypes[c4] == argument[2])

|| (objMain.tiletypes[c5] == argument[2])
|| (objMain.tiletypes[c6] == argument[2])
{return true;}
return false;
