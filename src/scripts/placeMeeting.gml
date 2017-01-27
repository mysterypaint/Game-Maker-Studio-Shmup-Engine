/*
Tile Collision Detection: Simple AABB collision checking
Example: placeMeeting(0,vsp+1,"solid"))
arg0: x offset from self bounding box
arg1: y offset from self bounding box
arg2: The tile type to check for
*/

//Only bother checking for ground if we're within map bounds
//(It's not perfect, but it still significantly reduces the console-output lag when testing in GM)

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

if (g1<0 || g2<0 || a1<0 || a2<0 || a3<0 || a4<0
  ||g1>tmw || g2>tmw || a1>tmh || a2>tmh || a3>tmh || a4>tmh){return false;}

var c1 = real(ds_grid_get(objMain.levelData, g1, a1));
var c2 = real(ds_grid_get(objMain.levelData, g1, a2));
var c3 = real(ds_grid_get(objMain.levelData, g2, a1));
var c4 = real(ds_grid_get(objMain.levelData, g2, a2));
var c5 = real(ds_grid_get(objMain.levelData, g1, a3));
var c6 = real(ds_grid_get(objMain.levelData, g2, a4));

if c1<0 {c1=0;}
if c2<0 {c2=0;}
if c3<0 {c3=0;}
if c4<0 {c4=0;}
if c5<0 {c5=0;}
if c6<0 {c6=0;}

if (objMain.tiletypes[c1] == argument[2])
|| (objMain.tiletypes[c2] == argument[2])
|| (objMain.tiletypes[c3] == argument[2])
|| (objMain.tiletypes[c4] == argument[2])

|| (objMain.tiletypes[c5] == argument[2])
|| (objMain.tiletypes[c6] == argument[2])
{return true;}
return false;
