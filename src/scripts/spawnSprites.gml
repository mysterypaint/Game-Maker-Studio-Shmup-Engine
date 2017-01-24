for (var i=0; i<ds_map_size(objMain.levelDataSprites)/4; i++)
{
var b = string(i);
var arg1 = ds_map_find_value(objMain.levelDataSprites, "spriteIndex" + b);
var arg2 = ds_map_find_value(objMain.levelDataSprites, "spriteID" + b);
var arg3 = ds_map_find_value(objMain.levelDataSprites, "spriteXPos" + b);
var arg4 = ds_map_find_value(objMain.levelDataSprites, "spriteYPos" + b);

placeSprites(arg1,arg2,arg3,arg4);

}
