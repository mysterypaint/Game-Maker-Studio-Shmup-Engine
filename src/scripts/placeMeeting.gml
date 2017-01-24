/*
Tile Collision Detection: Simple AABB collision checking
Example: placeMeeting(0,vsp+1,"solid"))
arg0: x offset from self bounding box
arg1: y offset from self bounding box
arg2: The tile type to check for
*/

//Only bother checking for ground if we're within map bounds
//(It's not perfect, but it still significantly reduces the console-output lag when testing in GM)

if ((x>=0 && x<=global.mapWidth*global.tileWidth) && 
        (y>=0 && y<=global.mapHeight*global.tileHeight))
{
    if (objMain.tiletypes[ds_grid_get(objMain.levelData, (floor((bbox_left+argument[0])/global.tileWidth)), floor(bbox_top+argument[1])/global.tileHeight)] == argument[2])
    || (objMain.tiletypes[ds_grid_get(objMain.levelData, (floor((bbox_left+argument[0])/global.tileWidth)), floor(bbox_bottom+argument[1])/global.tileHeight)] == argument[2])
    || (objMain.tiletypes[ds_grid_get(objMain.levelData, (floor((bbox_right+argument[0])/global.tileWidth)), floor(bbox_top+argument[1])/global.tileHeight)] == argument[2])
    || (objMain.tiletypes[ds_grid_get(objMain.levelData, (floor((bbox_right+argument[0])/global.tileWidth)), floor(bbox_bottom+argument[1])/global.tileHeight)] == argument[2])
    
    || (objMain.tiletypes[ds_grid_get(objMain.levelData, (floor((bbox_left+argument[0])/global.tileWidth)), floor(bbox_bottom-((bbox_bottom-bbox_top+1)/2)+argument[1])/global.tileHeight)] == argument[2])
    || (objMain.tiletypes[ds_grid_get(objMain.levelData, (floor((bbox_right+argument[0])/global.tileWidth)), floor(bbox_bottom-((bbox_bottom-bbox_top+1)/2)+argument[1])/global.tileHeight)] == argument[2])
    {return true;}
}
return false;
