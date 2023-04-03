if (!instance_exists(oSoundManager)) {
	return;
}

oSoundManager.SetSound(!global.playSound);

if (global.playSound) {
	sprite_index = sAudio;
	oSoundManager.playUIbuttonPressed = true;
} else {
	sprite_index = sMute;
}