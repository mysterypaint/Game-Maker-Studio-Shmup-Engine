///Handles how songs should loop
//Intros should be named exactly the same as their loop points,
//but add "Loop" to the end of the looped section!
var songLoops = false;
var introLength = 0;
var loopLength = 0;
var currSng = global.currentSong;
var nothing = false;
var sngStrm = objMain.songStream;

switch(currSng)
{
    case musFlight2: introLength = 1.311; loopLength = 20.971; songLoops = true; break;
    case musStage1: introLength = 6.079; loopLength = 83.986; songLoops = true; break;
    case musBoss1: introLength = 1.723; loopLength = 13.263; songLoops = true; break;
    case -99: nothing = true; break;
    default: break;
}

//Handle song looping if the song loops/isn't playing "nothing"
if (!nothing && songLoops)
{
    //We'll do this by calculating the difference between the end of the track and the current position we're at (The audio clip has a bit of data after this to make some leeway for this script to work.
    //Then, we'll jump to the loop relative to how far we are into the song
    var totalLength = introLength + loopLength;
    var tPos = audio_sound_get_track_position(sngStrm);
    if (tPos>totalLength)
    {
        audio_sound_set_track_position(sngStrm,tPos-loopLength);
    }
}

//Fix volume to account for any bgmFadeout changes
if audio_sound_get_gain(global.currentSong) != (global.bgmVol*objMain.bgmFadeoutMultiplier/100)
{
    audio_sound_gain(global.currentSong, ((global.bgmVol*objMain.bgmFadeoutMultiplier)/100), 0);
}
