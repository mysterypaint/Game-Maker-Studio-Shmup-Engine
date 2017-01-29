///Handles all player/options shooting

if (!objPlayer.hasLaser)
{
    if (keyboard_check(global.keyAction1))
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
    if (keyboard_check_released(global.keyAction1))
    {shootDelayTimer=0;}
}
else
{
    //Laser
    
    switch(objMain.laserType)
    {
        case 1: //Standard Laser
        case 3: //Cyclone Laser
            if keyboard_check(global.keyAction1) && laserCooldownTimer <=0
            {
                laserCooldownTimer=1;
                thisLaser = instance_create(x+objPlayer.hsp,y+objPlayer.vsp-1,objLaser);
                thisLaser.laserType = objMain.laserType; //Your standard gradius laser. Assume 2 is "CLaser"
                thisLaser.parentGun = id;
            }
            else if (laserCooldownTimer >0)
            {laserCooldownTimer--;}
            break;
        case 2: //Ripple Laser
        case 4: //Twin Laser
            if (shootLaserDelayTimer<=0 && shootLaserCounter<shootLaserCounterMax && keyboard_check(global.keyAction1))
            {
                thisLaser = instance_create(x+objPlayer.hsp+4,y+objPlayer.vsp,objLaser);
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
if (objPlayer.hasDouble)
{
    shootCounterMax=shootCounterMaxWithDouble;
    if (keyboard_check(global.keyAction1))
    {
        if (shootDoubleDelayTimer<=0 && shootDoubleCounter<shootDoubleCounterMax)
        {
            switch(objMain.doubleType)
            {
                case 1:
                    thisBullet = instance_create(x+objPlayer.hsp,y+objPlayer.vsp,objDouble);
                    thisBullet.parentGun = id;
                    shootDoubleCounter++;
                    shootDoubleDelayTimer=4;
                    break;
                case 2:
                    thisBullet = instance_create(x+objPlayer.hsp-4,y+objPlayer.vsp,objDouble);
                    thisBullet.parentGun = id;
                    thisBullet.image_xscale = -1;
                    shootDoubleCounter++;
                    shootDoubleDelayTimer=4;
                    break;
                case 3:
                    thisBullet = instance_create(x+objPlayer.hsp,y+objPlayer.vsp-4,objDouble);
                    thisBullet.parentGun = id;
                    thisBullet.image_index = 1;
                    shootDoubleCounter++;
                    shootDoubleDelayTimer=4;
                    break;
                case 4:
                    thisBullet = instance_create(x+objPlayer.hsp,y+objPlayer.vsp,objDouble);
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
if (objPlayer.hasMissile)
{
    if (keyboard_check(global.keyAction1))
    {
        if (missileDelayTimer<=0 && missileCounter<missileCounterMax)
        {
            switch(objMain.missileType)
            {
                case 1: //Standard Missile
                case 4: //Photon Torpedo
                    thisBullet = instance_create(x+objPlayer.hsp,y+objPlayer.vsp,objMissile);
                    thisBullet.parentGun = id;
                    missileCounter++;
                    missileDelayTimer=4;
                    break;
                case 2: //2-Way Missile
                    thisBullet = instance_create(x+objPlayer.hsp,y+objPlayer.vsp,objMissile);
                    thisBullet.parentGun = id;
                    thisBullet.myID = 1;
                    thisBullet2 = instance_create(x+objPlayer.hsp,y+objPlayer.vsp,objMissile);
                    thisBullet2.parentGun = id;
                    thisBullet2.myID = 2;
                    missileCounter+=2;
                    missileDelayTimer=70;
                    break;
                case 3: //Spread Bomb
                    thisBullet = instance_create(x+objPlayer.hsp,y+objPlayer.vsp,objMissile);
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
    if (keyboard_check_released(global.keyAction1))
    {missileDelayTimer=0;}
}
