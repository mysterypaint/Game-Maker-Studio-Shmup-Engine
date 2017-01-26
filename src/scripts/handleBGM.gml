///Handles how songs should loop
//Intros should be named exactly the same as their loop points,
//but add "Loop" to the end of the looped section!
var songLoops = true;
var isIntro = false;
var nothing = false;

switch(global.currentSong)
{
    case BGM00: isIntro = true; songLoops = false; break;
    case BGM00Loop: isIntro = false; songLoops = true; break;
    case BGM01: isIntro = true; songLoops = false; break;
    case BGM01Loop: isIntro = false; songLoops = true; break;
    case BGM02: isIntro = true; songLoops = false; break;
    case BGM02Loop: isIntro = false; songLoops = true; break;
    case -99: nothing = true; break;
    default: break;
}

if (songLoops) && !audio_is_playing(global.currentSong) && !nothing
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

if (isIntro) && !audio_is_playing(global.currentSong) && !nothing
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
