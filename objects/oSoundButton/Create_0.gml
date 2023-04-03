event_inherited();

if (!instance_exists(oSoundManager)) {
	return;
}

if (global.playSound) {
	sprite_index = sAudio;
} else {
	sprite_index = sMute;
}