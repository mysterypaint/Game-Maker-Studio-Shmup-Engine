if (objMain.rememberBGM){global.prevSong = global.currentSong;}

global.currentSong=argument[0];
objMain.bgmFadeoutMultiplier=1;
if audio_sound_get_gain(global.currentSong) != (global.bgmVol*objMain.bgmFadeoutMultiplier/100)
   {
   audio_sound_gain(global.currentSong, ((global.bgmVol*objMain.bgmFadeoutMultiplier)/100), 0);
   }
audio_stop_sound(global.currentSong);
objMain.songStream = audio_play_sound(global.currentSong,1,argument[1]);
