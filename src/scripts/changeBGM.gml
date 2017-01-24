global.currentSong=argument[0];
if audio_sound_get_gain(global.currentSong) != (global.bgmVol/100)
   {
   audio_sound_gain(global.currentSong, (global.bgmVol/100), 0);
   }
audio_play_sound(global.currentSong,1,argument[1]);
