function PlayBGM() {
	if (!audio_is_playing(roomBGMInstance))
		roomBGMInstance = audio_play_sound(currBGM, BGM_PRIORITY, true);
}

function ChangeMusic(newRoom) {
	if (newRoom == "LevelSelection" || newRoom == "MainMenu" || newRoom == "Credits") {
		currBGM = sound_MainMenuBGM;
	}
	else if (newRoom == "LastCutScene") {
		currBGM = sound_FinalCutscene;
	}
	else if (newRoom == "IntroCutscene") {
		currBGM = sound_IntroBGM;
	}
	else if (newRoom == "Room7") {
		currBGM = sound_BossLevelBGM;
	}
	else {
		currBGM = sound_LevelBGM;
	}
}

if (instance_exists(oGameManager)) {
	playSound = global.playSound;
} else if (instance_exists(oCurrProgressTracker)) {
	playSound = global.soundActived;
}

if (room_get_name(room) != prevRoom) {
	var newRoom = room_get_name(room);
	if (prevRoom == "LevelSelection" || prevRoom == "MainMenu" || prevRoom == "Credits") {
		if (newRoom == "LevelSelection" || newRoom == "MainMenu" || newRoom == "Credits") {
			prevRoom = newRoom;
			return;
		}
	}
	
	ChangeMusic(newRoom);
	audio_stop_sound(roomBGMInstance);
	prevRoom = newRoom;
}

if (playSound)
	PlayBGM();

