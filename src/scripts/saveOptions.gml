if file_exists("sav") {file_delete("sav");}
    ini_open("sav");
    ini_write_string("Options","bgmVol",string(global.bgmVol));
    ini_write_string("Options","sfxVol",string(global.sfxVol));
    ini_write_string("Options","grVOptEnabled",string(global.grVOptEnabled));
    ini_write_string("Options","frModeEnabled",string(global.frModeEnabled));
    ini_write_string("Options","keyUp",string(global.keyUp));
    ini_write_string("Options","keyDown",string(global.keyDown));
    ini_write_string("Options","keyLeft",string(global.keyLeft));
    ini_write_string("Options","keyRight",string(global.keyRight));
    ini_write_string("Options","keyAction1",string(global.keyAction1));
    ini_write_string("Options","keyAction2",string(global.keyAction2));
    ini_write_string("Options","keyAction3",string(global.keyAction3));
    ini_write_string("Options","keyPause",string(global.keyPause));
    ini_write_string("Options","windowSize",string(objMain.windowSize));
    ini_close();
