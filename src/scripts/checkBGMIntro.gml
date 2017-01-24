///Checks if the BGM had an intro, then changes to the correct BGM if it has one
var songName = audio_get_name(argument[0]);
var checkLoop = string_copy(songName, string_length(songName)-3, string_length(songName));
var isLoop = false;

if (checkLoop=="Loop")
{
    isLoop = true;
    songName = string_copy(songName, 1, string_length(songName)-4);
}

global.currentSong = asset_get_index(songName);

if (checkLoop=="Loop")
{
    changeBGM(asset_get_index(songName),false);
}
