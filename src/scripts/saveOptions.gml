if file_exists("sav") {file_delete("sav");}
    ini_open("sav");
    ini_write_string("Options","bgmVol",string(global.bgmVol));
    ini_write_string("Options","sfxVol",string(global.sfxVol));
    ini_write_string("Options","grVOptEnabled",string(global.grVOptEnabled));
    ini_write_string("Options","frModeEnabled",string(global.frModeEnabled));
    ini_write_string("Options","windowSize",string(objMain.windowSize));
    
    //P1 Controls
    ini_write_string("Options","keyUp",string(global.keyUp));
    ini_write_string("Options","keyDown",string(global.keyDown));
    ini_write_string("Options","keyLeft",string(global.keyLeft));
    ini_write_string("Options","keyRight",string(global.keyRight));
    ini_write_string("Options","keyAction1",string(global.keyAction1));
    ini_write_string("Options","keyAction2",string(global.keyAction2));
    ini_write_string("Options","keyAction3",string(global.keyAction3));
    ini_write_string("Options","keyPause",string(global.keyPause));
    
    //P2 Controls
    ini_write_string("Options","keyP2Up",string(global.keyP2Up));
    ini_write_string("Options","keyP2Down",string(global.keyP2Down));
    ini_write_string("Options","keyP2Left",string(global.keyP2Left));
    ini_write_string("Options","keyP2Right",string(global.keyP2Right));
    ini_write_string("Options","keyP2Action1",string(global.keyP2Action1));
    ini_write_string("Options","keyP2Action2",string(global.keyP2Action2));
    ini_write_string("Options","keyP2Action3",string(global.keyP2Action3));
    ini_write_string("Options","keyP2Pause",string(global.keyP2Pause));

    ini_close();
