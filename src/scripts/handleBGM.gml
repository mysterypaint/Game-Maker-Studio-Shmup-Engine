///Handles how songs should loop
//Intros should be named exactly the same as their loop points,
//but add "Loop" to the end of the looped section!
var songLoops = true;
var isIntro = false;

switch(global.currentSong)
{
    case apollon: isIntro = true; songLoops = false; break;
    case apollonLoop: isIntro = false; songLoops = true; break;
    default: break;
}

if (songLoops) && !audio_is_playing(global.currentSong)
{
    if instance_exists(objPlayer)
    {
        if (!objPlayer.dead)
        {
        changeBGM(global.currentSong, songLoops);
        }
    }
    else
    {
    changeBGM(global.currentSong, songLoops);
    }
}

if (isIntro) && !audio_is_playing(global.currentSong)
{
    var newSong = asset_get_index(audio_get_name(global.currentSong) + "Loop");
    global.currentSong = newSong;
    if instance_exists(objPlayer)
    {
        if (!objPlayer.dead)
        {
        changeBGM(global.currentSong, true);
        }
    }
    else
    {
    changeBGM(global.currentSong, true);
    }
}
