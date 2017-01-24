///Debug script that, when debug is enabled, then the player presses "P" on the keyboard,
//it will output the entire as it currently is to .oel format, allowing for level creation directly from the game itself
//(This is because, in debug mode, right-click/left click shifts through tiles and shift+right-click sets them to 0 (blank)
var outputFile = "";
var r=0;

//Search for a spot we can export our level
while (file_exists(working_directory + "output_level_" + string(r) + ".oel"))
    {
    r++;
    }
    var in = working_directory + "output_level_" + string(r) + ".oel";
    outputFile = file_text_open_write(in);
    var qu = chr(34); //Macro to make this code easier to read

    //Now that the file is open, start re-creating the level in the same text doc format the level parser reads
    var mapWidth = global.mapWidth;
    var tileWidth = global.tileWidth;
    var mapHeight = global.mapHeight;
    var tileHeight = global.tileHeight;
    
    //Set the header of the level data
    file_text_write_string(outputFile, "<level width=" + qu + string(mapWidth*tileWidth) + qu + " height=" + qu + string(mapHeight*tileHeight) + qu + ">");
    file_text_writeln(outputFile);
    
    //Start writing all the foreground tile data
    file_text_write_string(outputFile, "  <foreground tileset=" + qu + "tileset0" + qu + " exportMode=" + qu + "CSV" + qu + ">");
    for (var i=0; i<mapHeight; i++) //Reserve the last line for linebreaking
    {
        for (var j=0; j<mapWidth; j++)
        {
            var tileID = string(ds_grid_get(objMain.levelData,j,i));
            if (tileID == "undefined") {tileID = "-1";}
            file_text_write_string(outputFile, tileID);
            if (j<global.mapWidth-1) //Last one doesn't need a comma
            {file_text_write_string(outputFile, ",");}
        }
        if (i<global.mapHeight-1)
        {file_text_writeln(outputFile);}
        else{file_text_write_string(outputFile, "</foreground>"); file_text_writeln(outputFile);}
    }
    
    //Now, write the overlay layer using the same exact method as above
    file_text_write_string(outputFile, "  <overlay tileset=" + qu + "tileset0" + qu + " exportMode=" + qu + "CSV" + qu + ">");
    for (var i=0; i<mapHeight; i++) //Reserve the last line for linebreaking
    {
        for (var j=0; j<mapWidth; j++)
        {
            var tileID = string(ds_grid_get(objMain.levelDataLayer2,j,i));
            if (tileID == "undefined") {tileID = "-1";}
            file_text_write_string(outputFile, tileID);
            if (j<global.mapWidth-1) //Last one doesn't need a comma
            {file_text_write_string(outputFile, ",");}
        }
        if (i<global.mapHeight-1)
        {file_text_writeln(outputFile);}
        else{file_text_write_string(outputFile, "</overlay>"); file_text_writeln(outputFile);}
    }
    
    //Lastly, we'll write all the entities
    file_text_write_string(outputFile, "  <entities>");
    file_text_writeln(outputFile);
    
    for (var i=0; i<ds_map_size(objMain.levelDataSprites)/4; i++)
    {
        var b = string(i);
        var arg1 = string(ds_map_find_value(objMain.levelDataSprites, "spriteIndex" + b));
        var arg2 = string(ds_map_find_value(objMain.levelDataSprites, "spriteID" + b));
        var arg3 = string(ds_map_find_value(objMain.levelDataSprites, "spriteXPos" + b));
        var arg4 = string(ds_map_find_value(objMain.levelDataSprites, "spriteYPos" + b));

        //Print something along the lines of:
        //<PlayerSpawn id="0" x="32" y="80" />
        file_text_write_string(outputFile, "    <" + arg1 + " id=" + qu + arg2 + qu + " x=" + qu + arg3 + qu + " y=" + qu + arg4 + qu + " />");
        
        //Don't linebreak on the last entry
        if (i<ds_map_size((objMain.levelDataSprites)/4)-1)
        {file_text_writeln(outputFile);}
    }
    
    //Finish up closing all the tabs we opened
    file_text_write_string(outputFile, "  </entities>");
    file_text_writeln(outputFile);
    file_text_write_string(outputFile, "</level>");

    //Close the file once we're completely done writing the level data to it
    file_text_close(outputFile);
    
    //Check and reset fullscreen to prevent crashing from show_message
    var full = false;
    if window_get_fullscreen()
    {
        full = true;
        surface_reset_target();
    }
    
    //Let the user know level exporting is done and where to find it
    show_message("Done!#Exported level to " + in + "!");
    
    //Turn on fullscreen again, if applicable
    window_set_fullscreen(full);
