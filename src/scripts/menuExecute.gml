//This script handles objTitle's menu, depending which option in the menu the user pressed Confirm on.

if currentMenu==1
{
    switch (mpos)
    {
        //Start
        case 0:
            //Jump to the equip screen state
            //objMain's Step Event and Draw Event control the entire state
            global.state = states.equipScreen;
            objMain.shieldSelect = 0;
            objMain.menuProgressedLast = 0;
            instance_destroy();
            break;
        //Options
        case 1:
            audio_stop_sound(sfxMenuAccept);audio_play_sound(sfxMenuAccept,1,false);
            mpos=0;currentMenu+=1;prevBGMVol=global.bgmVol;prevSFXVol=global.sfxVol;prevWindowSize=objMain.windowSize;
            prevKeyUp = global.keyUp;prevKeyDown = global.keyDown;prevKeyLeft = global.keyLeft;prevKeyRight = global.keyRight;prevKeyAction1 = global.keyAction1;prevKeyAction2 = global.keyAction2;prevKeyAction3 = global.keyAction3;prevKeyPause = global.keyPause;
            break;
        //Quit
        case 2:
            game_end();break;
        //Edge case handling
        default: break;
    }
}
else if currentMenu==2
{
    switch (mpos)
    {
        //BGM Vol
        case 0: 
            break;
        //SFX Vol
        case 1:
            break;
        //GRV Options toggle
        case 2:
            global.grVOptEnabled = !global.grVOptEnabled;
            audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
            break;
        //Window Size
        case 3:
            break;
        //Set Controls
        case 4:
            audio_stop_sound(sfxMenuAccept);audio_play_sound(sfxMenuAccept,1,false);
            currentConfig=0;currentMenu=3;
            break;
        case 5:
        //Save Config
            audio_stop_sound(sfxMenuStart);audio_play_sound(sfxMenuStart,1,false);
            saveOptions();
            mpos=0;currentMenu-=1;
            break;
        //Back
        case 6:
            audio_stop_sound(sfxMenuCancel);audio_play_sound(sfxMenuCancel,1,false);
            mpos=0;currentMenu-=1;global.bgmVol=prevBGMVol;global.sfxVol=prevSFXVol;objMain.windowSize=prevWindowSize;window_set_size(256*objMain.windowSize,256*objMain.windowSize);
            global.keyUp = prevKeyUp;global.keyDown = prevKeyDown;global.keyLeft = prevKeyLeft;global.keyRight = prevKeyRight;global.keyAction1 = prevKeyAction1;global.keyAction2 = prevKeyAction2;global.keyAction3 = prevKeyAction3;global.keyPause = prevKeyPause;
            break;
        //Edge case handling
        default: break;
    }
}
else if currentMenu==0
{
    pressStartText=false;
}
