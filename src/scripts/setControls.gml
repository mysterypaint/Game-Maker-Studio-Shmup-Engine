//Set controls; Blacklist the Esc Key (27)

var lastKey = keyboard_key;
var checkInput1 = (keyboard_check_pressed(vk_anykey) || ((abs(objMain.lastInputP1GamePad)>0 || (objMain.wasAxis)) && objMain.lastInputP1GamePad != objMain.lastInputP1GamePadActual));
var checkInput2 = (keyboard_check_pressed(vk_anykey) || ((abs(objMain.lastInputP2GamePad)>0 || (objMain.wasAxis)) && objMain.lastInputP2GamePad != objMain.lastInputP2GamePadActual));

if (objTitle.playerConfig<=1) //Check if we're about to set controls for Player 1 (or anything less, just in case something odd happens)
{
    if (objMain.lastInputP1GamePad>1)
    {
        lastKey = objMain.lastInputP1GamePad;
    }
    if (objMain.wasAxis)
    {lastKey = -1;}

    switch(currentConfig)
    {
        case 0: 
            if (checkInput1)
                {currentConfig++; configCount++;}
            break;
        case 1: 
            if (checkInput1)&&lastKey!=27
            {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
            global.keyUp=lastKey;currentConfig++; configCount++;}
            break;
        case 2: 
            if (checkInput1)&&lastKey!=27
            {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
            global.keyLeft=lastKey;currentConfig++; configCount++;}
            break;
        case 3: 
            if (checkInput1)&&lastKey!=27
            {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
            global.keyDown=lastKey;currentConfig++; configCount++;}
            break;
        case 4: 
            if (checkInput1)&&lastKey!=27
            {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
            global.keyRight=lastKey;currentConfig++; configCount++;}
            break;
        case 5: 
            if (checkInput1)&&lastKey!=27
            {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
            global.keyAction1=lastKey;currentConfig++; configCount++;}
            break;
        case 6: 
            if (checkInput1)&&lastKey!=27
            {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
            global.keyAction2=lastKey;currentConfig++; configCount++; if (!global.grVOptEnabled){currentConfig++;}} //Skip the next configuration if it's not relevant
            break;
        case 7: 
            if (checkInput1)&&lastKey!=27
            {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
            global.keyAction3=lastKey;currentConfig++; configCount++;}
            break;
        case 8: 
            if (checkInput1)&&lastKey!=27
            {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
            global.keyPause=lastKey;currentConfig++; configCount++;}
            break;
        case 9: currentConfig=0; configCount=0; mpos = 5; currentMenu=2; //Go back to the previous menu and hover over "Set Controls"
            break;
        default: break;
    }
}
else if (objTitle.playerConfig>=2) //Check if we're about to set controls for Player 2 (or anything more, just in case something odd happens)
{
    if (objMain.lastInputP2GamePad>0)
    {
        lastKey = objMain.lastInputP2GamePad;
    }
    switch(currentConfig)
    {
        case 0: 
            if (checkInput2)
                {currentConfig++; configCount++;}
            break;
        case 1: 
            if (checkInput2)&&lastKey!=27
            {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
            global.keyP2Up=lastKey;currentConfig++; configCount++;}
            break;
        case 2: 
            if (checkInput2)&&lastKey!=27
            {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
            global.keyP2Left=lastKey;currentConfig++; configCount++;}
            break;
        case 3: 
            if (checkInput2)&&lastKey!=27
            {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
            global.keyP2Down=lastKey;currentConfig++; configCount++;}
            break;
        case 4: 
            if (checkInput2)&&lastKey!=27
            {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
            global.keyP2Right=lastKey;currentConfig++; configCount++;}
            break;
        case 5: 
            if (checkInput2)&&lastKey!=27
            {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
            global.keyP2Action1=lastKey;currentConfig++; configCount++;}
            break;
        case 6: 
            if (checkInput2)&&lastKey!=27
            {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
            global.keyP2Action2=lastKey;currentConfig++; configCount++; if (!global.grVOptEnabled){currentConfig++;}} //Skip the next configuration if it's not relevant
            break;
        case 7: 
            if (checkInput2)&&lastKey!=27
            {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
            global.keyP2Action3=lastKey;currentConfig++; configCount++;}
            break;
        case 8: 
            if (checkInput2)&&lastKey!=27
            {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
            global.keyP2Pause=lastKey;currentConfig++; configCount++;}
            break;
        case 9: currentConfig=0; configCount=0; mpos = 5; currentMenu=2; //Go back to the previous menu and hover over "Set Controls"
            break;
        default: break;
    }
}
