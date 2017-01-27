/*
This script will find the x/y coordinates of a given tile.
Used for drawing the tiles onto the screen with objCamera in its Draw Event, and not for collision detection (see placeMeeting() for that).

Useage: getTile(tileIndex,z)
tileIndex = Tile from tilemap to look for
z: if 1, return x position of tile in ds_grid. If 2, return y position of tile in ds_grid.
z: if 3, return leftmost pixel of tile in tilemap. If 4, return topmost pixel of tile in tilemap.
*/

//First, let's find out which tile we're given.
var tileID = argument[0];
var xPix = (tileID % global.tilesetWidth) * global.tileWidth
var yPix = floor(tileID / global.tilesetWidth) * global.tileHeight

//Find out what the user is asking us to find.
switch(argument[1])
{
    //Return x position of tile in ds_grid
    case 1:
    return 0;

    //Return y position of tile in ds_grid
    case 2:
    return 0;

    //Return leftmost pixel of tile in tilemap.
    case 3:
    return xPix;

    //Return topmost pixel of tile in tilemap.
    case 4:
    return yPix;
    
    default: return 0;
}


