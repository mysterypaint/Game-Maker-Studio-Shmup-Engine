//Set controls; Blacklist Esc
switch(currentConfig)
{
    case 0: 
        if keyboard_check_pressed(vk_anykey)
            {currentConfig++; configCount++;}
        break;
    case 1: 
        if keyboard_check_pressed(vk_anykey)&&keyboard_key!=27
        {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
        global.keyUp=keyboard_key;currentConfig++; configCount++;}
        break;
    case 2: 
        if keyboard_check_pressed(vk_anykey)&&keyboard_key!=27
        {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
        global.keyLeft=keyboard_key;currentConfig++; configCount++;}
        break;
    case 3: 
        if keyboard_check_pressed(vk_anykey)&&keyboard_key!=27
        {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
        global.keyDown=keyboard_key;currentConfig++; configCount++;}
        break;
    case 4: 
        if keyboard_check_pressed(vk_anykey)&&keyboard_key!=27
        {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
        global.keyRight=keyboard_key;currentConfig++; configCount++;}
        break;
    case 5: 
        if keyboard_check_pressed(vk_anykey)&&keyboard_key!=27
        {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
        global.keyAction1=keyboard_key;currentConfig++; configCount++;}
        break;
    case 6: 
        if keyboard_check_pressed(vk_anykey)&&keyboard_key!=27
        {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
        global.keyAction2=keyboard_key;currentConfig++; configCount++; if (!global.grVOptEnabled){currentConfig++;}} //Skip the next configuration if it's not relevant
        break;
    case 7: 
        if keyboard_check_pressed(vk_anykey)&&keyboard_key!=27
        {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
        global.keyAction3=keyboard_key;currentConfig++; configCount++;}
        break;
    case 8: 
        if keyboard_check_pressed(vk_anykey)&&keyboard_key!=27
        {audio_stop_sound(sfxMenuTweak);audio_play_sound(sfxMenuTweak,1,false);
        global.keyPause=keyboard_key;currentConfig++; configCount++;}
        break;
    case 9: currentConfig=0; configCount=0; mpos = 5; currentMenu=2; //Go back to the previous menu and hover over "Set Controls"
        break;
    default: break;
}
