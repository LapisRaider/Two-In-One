if (!isPauseMenu) {
	oGameManager.SetSound(!global.playSound);

	if (global.playSound) {
		sprite_index = sAudio;
		oSoundManager.playUIbuttonPressed = true;
	} else {
		sprite_index = sMute;
	}
}

if (!global.isPause || global.isObjectiveMenuOpen)
	return;

oGameManager.SetSound(!global.playSound);

if (global.playSound) {
	sprite_index = sAudio;
	oSoundManager.playUIbuttonPressed = true;
} else {
	sprite_index = sMute;
}