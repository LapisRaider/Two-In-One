roomBGMInstance = noone;

currBGM = sound_MainMenuBGM;
prevRoom =  room_get_name(room);

playSound = true;
if (instance_exists(oGameManager)) {
	playSound = global.playSound;
} else if (instance_exists(oCurrProgressTracker)) {
	playSound = global.soundActived;
}
