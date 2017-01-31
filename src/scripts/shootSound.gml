//Every time we try to play a shoot sound, refer to this script.
//Arguments work exactly like audio_play_sound() does

with (parentGun)
{
    myIndex = object_get_name(object_index);
    if (myIndex=="objPlayer1") || (myIndex=="objPlayer2")
    {
    audio_stop_sound(argument[0]);
    audio_play_sound(argument[0],argument[1],argument[2]);
    other.playedSFX = true;
    }
}
