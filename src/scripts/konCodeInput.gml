//Handle cheat codes on the pause menu
with(objMain)
{
    //Only remember the last key if our input was a valid one
    if (keyboard_check_pressed(global.keyUp)||
        keyboard_check_pressed(global.keyDown)||
        keyboard_check_pressed(global.keyLeft)||
        keyboard_check_pressed(global.keyRight)||
        keyboard_check_pressed(global.keyPause)||
        keyboard_check_pressed(global.keyAction1)|| //Shoot button
        keyboard_check_pressed(global.keyAction2)|| //Equip button
        (keyboard_check_pressed(global.keyAction3) && global.grVOptEnabled))  //Option button (Only valid if the Option button is enabled in the title screen menu)
        {lk = keyboard_lastkey;}

    if (!objPlayer.fun)
    {
        switch (objPlayer.cc1)
        {
        case 0:
            if (lk == global.keyUp)
            {
            objPlayer.cc1=1;
            resetKey = true;
            }
            break;
        case 1:
            if (lk == global.keyUp)
            {
            objPlayer.cc1=2;
            resetKey = true;
            }
            else if lk!=0
            {
            objPlayer.cc1=0;
            resetKey = true;
            }
            break;
        case 2:
            if (lk == global.keyDown)
            {
            objPlayer.cc1=3;
            resetKey = true;
            }
            else if lk!=0
            {
            objPlayer.cc1=0;
            resetKey = true;
            }
            break;
        case 3:
            if (lk == global.keyDown)
            {
            objPlayer.cc1=4;
            resetKey = true;
            }
            else if lk!=0
            {
            objPlayer.cc1=0;
            resetKey = true;
            }
            break;
        case 4:
            if (lk == global.keyLeft)
            {
            objPlayer.cc1=5;
            resetKey = true;
            }
            else if lk!=0
            {
            objPlayer.cc1=0;
            resetKey = true;
            }
            break;
        case 5:
            if (lk == global.keyRight)
            {
            objPlayer.cc1=6;
            resetKey = true;
            }
            else if lk!=0
            {
            objPlayer.cc1=0;
            resetKey = true;
            }
            break;
        case 6:
            if (lk == global.keyLeft)
            {
            objPlayer.cc1=7;
            resetKey = true;
            }
            else if lk!=0
            {
            objPlayer.cc1=0;
            resetKey = true;
            }
            break;
        case 7:
            if (lk == global.keyRight)
            {
            objPlayer.cc1=8;
            resetKey = true;
            }
            else if lk!=0
            {
            objPlayer.cc1=0;
            resetKey = true;
            }
            break;
        case 8:
            if (lk == global.keyAction1)
            {
            objPlayer.cc1=9;
            resetKey = true;
            }
            else if lk!=0
            {
            objPlayer.cc1=0;
            resetKey = true;
            }
            break;
        case 9:
            if (lk == global.keyAction2)
            {
            objPlayer.cc1=10;
            resetKey = true;
            }
            else if lk!=0
            {
            objPlayer.cc1=0;
            resetKey = true;
            }
            break;
        case 10:
            objPlayer.konCode = true;
            resetKey = true;
            objPlayer.cc1=0;
            objPlayer.callD = 200;
            break;
        default:
            break;
        }
    }    
    
    if (!objPlayer.konDone)
    {
        switch (objPlayer.cc2)
        {
        case 0:
            if (lk == global.keyDown)
            {
            objPlayer.cc2=1;
            resetKey = true;
            }
            break;
        case 1:
            if (lk == global.keyDown)
            {
            objPlayer.cc2=2;
            resetKey = true;
            }
            else if lk!=0
            {
            objPlayer.cc2=0;
            resetKey = true;
            }
            break;
        case 2:
            if (lk == global.keyUp)
            {
            objPlayer.cc2=3;
            resetKey = true;
            }
            else if lk!=0
            {
            objPlayer.cc2=0;
            resetKey = true;
            }
            break;
        case 3:
            if (lk == global.keyUp)
            {
            objPlayer.cc2=4;
            resetKey = true;
            }
            else if lk!=0
            {
            objPlayer.cc2=0;
            resetKey = true;
            }
            break;
        case 4:
            if (lk == global.keyRight)
            {
            objPlayer.cc2=5;
            resetKey = true;
            }
            else if lk!=0
            {
            objPlayer.cc2=0;
            resetKey = true;
            }
            break;
        case 5:
            if (lk == global.keyLeft)
            {
            objPlayer.cc2=6;
            resetKey = true;
            }
            else if lk!=0
            {
            objPlayer.cc2=0;
            resetKey = true;
            }
            break;
        case 6:
            if (lk == global.keyRight)
            {
            objPlayer.cc2=7;
            resetKey = true;
            }
            else if lk!=0
            {
            objPlayer.cc2=0;
            resetKey = true;
            }
            break;
        case 7:
            if (lk == global.keyLeft)
            {
            objPlayer.cc2=8;
            resetKey = true;
            }
            else if lk!=0
            {
            objPlayer.cc2=0;
            resetKey = true;
            }
            break;
        case 8:
            if (lk == global.keyAction2)
            {
            objPlayer.cc2=9;
            resetKey = true;
            }
            else if lk!=0
            {
            objPlayer.cc2=0;
            resetKey = true;
            }
            break;
        case 9:
            if (lk == global.keyAction1)
            {
            objPlayer.cc2=10;
            resetKey = true;
            }
            else if lk!=0
            {
            objPlayer.cc2=0;
            resetKey = true;
            }
            break;
        case 10:
            objPlayer.konCode = true;
            resetKey = true;
            objPlayer.konCodeLimit--;
            objPlayer.cc2=0;
            break;
        default:
            break;
        }
    }
    
    if (resetKey)
    {
        lk=0;
    }
}
