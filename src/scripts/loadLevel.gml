/*Parse the level data from Included Files

It's possible to load externally too, but I haven't needed it
and wrote this code a while back (I may write something better one day)

So, I won't comment too much on this code:
It reads through the whole text document and parses/stores each piece in global ds_grids/arrays,
spawns all the sprites on the map, then tells objMain that we have finished "switchingMaps".
*/

if objMain.extFiles=true
{
    dir = program_directory + "maps\";
    
    background_replace(tileset0, program_directory + "/maps/tileset_test.png",0,0);
}
else
{
    dir=working_directory + "maps\";
}

var str = "";
var file = "";
var hey = "";

var lineCount = 0;
var tilemapWidthCountFlag=false;

global.mapWidth=0;

if (ds_exists(objMain.levelData,ds_type_grid))
{
    ds_grid_destroy(objMain.levelData);
}

if (ds_exists(objMain.levelDataLayer2,ds_type_grid))
{
    ds_grid_destroy(objMain.levelDataLayer2);
}

file = file_text_open_read(dir + argument[0]);

var mapHeader = file_text_readln(file);

for (k=1; k <= string_length(mapHeader); k++)
{
        
    if (string_char_at(string(mapHeader),k)=='"')
       {
       
       var j="";
           k++;
           
           while (string_char_at(string(mapHeader),k)!='"')
               {
               j += string_char_at(string(mapHeader),k);
               k++;
               }
               
               if global.mapWidth<=0
               {
               global.mapWidth=real(j)/16;
               }
               else
               {
               global.mapHeight=real(j)/16;
               }
               
    j="";
      }    
}

global.tileWidth=16;
global.tileHeight=16;
objMain.levelData = ds_grid_create(global.mapWidth, global.mapHeight);
objMain.levelDataLayer2 = ds_grid_create(global.mapWidth, global.mapHeight);




global.tilesetIndex=0;

for (var i=1; i<=global.mapHeight ;i++;)
{
 for (var j=1; j<=global.mapWidth ;j++;)
 {

 var hey =  file_text_readln(file);
 var commaCount = 0;
 var tileBuffer = "";
 var tileID = "";
 //loop through every single character in our line (hey) until we hit a comma

 
//show_message(string(j) + ", " + string(i));

 
 for (var k=1; k <= string_length(hey); k++)
   {
   
      if global.tilesetIndex==0
      {
        var q="";
          if (string_char_at(string(hey),k)==' ')
          {
          k+=23;
          
          while (string_char_at(string(hey),k)!='"' && k<57)
          {
          q += (string_char_at(string(hey),k));
          k++;
          }
          
          global.tilesetIndex=background_get_name(asset_get_index(q));//argument[1];
          
          k+=19;
          }
      if k==string_length(hey) {i++;j--;}    
          
      }
      
      
       tileBuffer = tileBuffer + string_char_at(string(hey),k);

       if (string_char_at(string(hey),k)==',')
       {
       
       tileID = string_delete(tileBuffer,string_length(tileBuffer),1);
       if (tileID="-1"){tileID=0;}
       //tileID is the tile we want to store here. Let's store it into the ds_grid.
       ds_grid_set(objMain.levelData, j-1, i-1, tileID);
       
       tileBuffer = "";
       j++;
       }
       else if(j>=global.mapWidth)
       {
       tileID="";
       while (string_char_at(string(hey),k)!='<') && (k<string_length(hey))
       {
       tileID += string_char_at(string(hey),k);
//       show_message(string(k) + ", " + string_char_at(string(hey),k) + ", " + string(tileID) + string(string_length(hey)));
       k++;
       }
       
       
       if (tileID="-1"){tileID=0;}
       //tileID is the last tile on this row. Let's store it into the ds_grid.
//        show_message(tileID);
       
       ds_grid_set(objMain.levelData, j-1, i-1, tileID);
       
       break;
       }
       
   }  
     
 }
}


//overlay tileset

global.overlayTilesetIndex=0;

for (var i=1; i<=global.mapHeight ;i++;)
{
 for (var j=1; j<=global.mapWidth ;j++;)
 {

 var hey =  file_text_readln(file);
 var commaCount = 0;
 var tileBuffer = "";
 var tileID = "";
 //loop through every single character in our line (hey) until we hit a comma

 
//show_message(string(j) + ", " + string(i));

 
 for (var k=1; k <= string_length(hey); k++)
   {
   
      if global.overlayTilesetIndex==0
      {
        var q="";
          if (string_char_at(string(hey),k)==' ')
          {
          k+=20;
          
          while (string_char_at(string(hey),k)!='"' && k<57)
          {
          q += (string_char_at(string(hey),k));
          k++;
          }
          
          global.overlayTilesetIndex=background_get_name(asset_get_index(q));//argument[1];
          
          k+=19;
          }
      if k==string_length(hey)-1 {i++;j--;}    
          
      }
      
      if j>=string_length(hey)-1 {i++;break;}    
      
       tileBuffer = tileBuffer + string_char_at(string(hey),k);

       if (string_char_at(string(hey),k)==',')
       {

       tileID = string_delete(tileBuffer,string_length(tileBuffer),1);
       
       if (tileID="-1"){tileID=0;}
       //tileID is the tile we want to store here. Let's store it into the ds_grid.
       ds_grid_set(objMain.levelDataLayer2, j-1, i-1, tileID);
       
       tileBuffer = "";
       j++;
       }
       else if(j>=global.mapWidth)
       {
       tileID="";
       while (string_char_at(string(hey),k)!='<') && (k<string_length(hey))
       {
       tileID += string_char_at(string(hey),k);
//       show_message(string(k) + ", " + string_char_at(string(hey),k) + ", " + string(tileID) + string(string_length(hey)));
       k++;
       }
       
       
       if (tileID="-1"){tileID=0;}
       //tileID is the last tile on this row. Let's store it into the ds_grid.
//        show_message(tileID);
       
       ds_grid_set(objMain.levelDataLayer2, j-1, i-1, tileID);
       
       break;
       }
       
   }  
     
 }
}


hey =  file_text_readln(file); //<entities>

hey =  file_text_readln(file); //first sprite


//entities layer

if (ds_exists(objMain.levelDataSprites,ds_type_grid))
{
ds_map_destroy(objMain.levelDataSprites);
}

objMain.levelDataSprites = ds_map_create();

var q = 0;

while (string_char_at(string(hey),5)=="<")
{

//loop through every sprite and draw them properly

var dataPart=0;
var spriteIndex="";
 for (var k=6; k <= string_length(hey); k++)
 {
    valueBuffer="";
    
    while (string_char_at(string(hey),k)!=' ') && (spriteIndex=="")
    {
        valueBuffer+=string_char_at(string(hey),k);
        k++;
    }
    if spriteIndex==""
    {spriteIndex=valueBuffer;}
    
    valueBuffer="";
        
    if(string_char_at(string(hey),k)=='"')
    {
        k++
        while string_char_at(string(hey),k)!='"'
        {
            valueBuffer+=string_char_at(string(hey),k);
            k++;
        }
        
        switch(dataPart)
        {
        case 0: spriteID=real(valueBuffer); break;
        case 1: spriteXPos=real(valueBuffer); break;
        case 2: spriteYPos=real(valueBuffer); break;
        default: break;
        }
        
        
        dataPart++;
    }
 }
var b = string(q);
ds_map_add(objMain.levelDataSprites, "spriteIndex" + b, spriteIndex);
ds_map_add(objMain.levelDataSprites, "spriteID" + b, spriteID);
ds_map_add(objMain.levelDataSprites, "spriteXPos" + b, spriteXPos);
ds_map_add(objMain.levelDataSprites, "spriteYPos" + b, spriteYPos);

//show_message(string(spriteIndex) + ", " + string(spriteID) + ", " + string(spriteXPos) + ", " + string(spriteYPos));

q++;


hey =  file_text_readln(file);
}
spawnSprites();

//Close the text document to avoid memory leaks
file_text_close(file);

global.tilesetWidth=16;
global.tilesetHeight=16;
global.currentMap = argument[0]; //Let the game know which map is currently loaded
objMain.switchingMaps = false;
