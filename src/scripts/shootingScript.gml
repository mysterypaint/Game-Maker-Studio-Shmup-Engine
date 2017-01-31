///Handles all player/options shooting
//Arg 0: The player that pressed the shot button: 1 = player 1, 2 = player 2
//Arg 1: Same as above, but contains the actual ID of the player object

//Keys map to Player 1 by default
var keyAction1 = objMain.keyP1Action1;
var keyAction2 = objMain.keyP1Action2;
var keyAction3 = objMain.keyP1Action3;
var missileType = objMain.missileType;
var doubleType = objMain.doubleType;
var laserType = objMain.laserType;
switch(argument[0]) //Determine which player pressed the shoot button and adjust controls accordingly
{
    case 2: //Map keys to player 2, because they shot the bullet
        keyAction1 = objMain.keyP2Action1;
        keyAction2 = objMain.keyP2Action2;
        keyAction3 = objMain.keyP2Action3;
        missileType = objMain.p2MissileType;
        doubleType = objMain.p2DoubleType;
        laserType = objMain.p2LaserType;
        break;
    default: break;
}


if (!argument[1].hasLaser)
{
    if (keyAction1)
    {
        if (shootDelayTimer<=0 && shootCounter<shootCounterMax)
        {
            thisBullet = instance_create(x+objPlayer.hsp,y+objPlayer.vsp,objBullet);
            thisBullet.parentGun = id;
            shootCounter++;
            shootDelayTimer=4;
        }
        else
        {shootDelayTimer--;}
    }
    //if (keyboard_check_released(keyAction1))
    //{shootDelayTimer=0;}
}
else
{
    //Laser
    
    switch(laserType)
    {
        case 1: //Standard Laser
        case 3: //Cyclone Laser
            if keyAction1 && laserCooldownTimer <=0
            {
                laserCooldownTimer=1;
                thisLaser = instance_create(x+argument[1].hsp,y+argument[1].vsp-1,objLaser);
                thisLaser.laserType = objMain.laserType; //Your standard gradius laser. Assume 2 is "CLaser"
                thisLaser.parentGun = id;
            }
            else if (laserCooldownTimer >0)
            {laserCooldownTimer--;}
            break;
        case 2: //Ripple Laser
        case 4: //Twin Laser
            if (shootLaserDelayTimer<=0 && shootLaserCounter<shootLaserCounterMax && keyAction1)
            {
                thisLaser = instance_create(x+argument[1].hsp+4,y+argument[1].vsp,objLaser);
                thisLaser.parentGun = id;
                shootLaserCounter++;
                shootLaserDelayTimer=4;
            }
            else{shootLaserDelayTimer--;}
            break;
        default:
            break;
    }
}

//Double
if (argument[1].hasDouble)
{
    shootCounterMax=shootCounterMaxWithDouble;
    if (keyAction1)
    {
        if (shootDoubleDelayTimer<=0 && shootDoubleCounter<shootDoubleCounterMax)
        {
            switch(doubleType)
            {
                case 1:
                    thisBullet = instance_create(x+argument[1].hsp,y+argument[1].vsp,objDouble);
                    thisBullet.parentGun = id;
                    shootDoubleCounter++;
                    shootDoubleDelayTimer=4;
                    break;
                case 2:
                    thisBullet = instance_create(x+argument[1].hsp-4,y+argument[1].vsp,objDouble);
                    thisBullet.parentGun = id;
                    thisBullet.image_xscale = -1;
                    shootDoubleCounter++;
                    shootDoubleDelayTimer=4;
                    break;
                case 3:
                    thisBullet = instance_create(x+argument[1].hsp,y+argument[1].vsp-4,objDouble);
                    thisBullet.parentGun = id;
                    thisBullet.image_index = 1;
                    shootDoubleCounter++;
                    shootDoubleDelayTimer=4;
                    break;
                case 4:
                    thisBullet = instance_create(x+argument[1].hsp,y+argument[1].vsp,objDouble);
                    thisBullet.parentGun = id;
                    thisBullet.image_xscale = -1;
                    shootDoubleCounter++;
                    shootDoubleDelayTimer=4;
                    break;
                default:
                    break;
            }
        }
        else
        {shootDoubleDelayTimer--;}
    }
}
else{shootCounterMax=shootCounterMaxWithoutDouble}

//Missile
if (argument[1].hasMissile)
{
    if (keyAction1)
    {
        if (missileDelayTimer<=0 && missileCounter<missileCounterMax)
        {
            switch(missileType)
            {
                case 1: //Standard Missile
                case 4: //Photon Torpedo
                    thisBullet = instance_create(x+argument[1].hsp,y+argument[1].vsp,objMissile);
                    thisBullet.parentGun = id;
                    missileCounter++;
                    missileDelayTimer=4;
                    break;
                case 2: //2-Way Missile
                    thisBullet = instance_create(x+argument[1].hsp,y+argument[1].vsp,objMissile);
                    thisBullet.parentGun = id;
                    thisBullet.myID = 1;
                    thisBullet2 = instance_create(x+argument[1].hsp,y+argument[1].vsp,objMissile);
                    thisBullet2.parentGun = id;
                    thisBullet2.myID = 2;
                    missileCounter+=2;
                    missileDelayTimer=70;
                    break;
                case 3: //Spread Bomb
                    thisBullet = instance_create(x+argument[1].hsp,y+argument[1].vsp,objMissile);
                    thisBullet.parentGun = id;
                    missileCounter+=2;
                    missileDelayTimer=30;
                    break;
                default:
                    break;
            }
        }
        else
        {missileDelayTimer--;}
    }
    //if (keyboard_check_released(keyAction1))
    //{missileDelayTimer=0;}
}
