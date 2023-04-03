function ResetRoom() {
	global.isLivingCat = true;
	global.currFishesCollected = 0;
	global.isPause = false;
	
	currentDeathResetTimer = -1;
}

// when one of the cat dies and we want to auto reset room
function StartAutoDeathCleanUp() {
	if (currentDeathResetTimer >= 0) {
		return;
	}
	
	currentDeathResetTimer = room_speed * DEATH_TIMER_PAUSE;
}

function UndoWhenDead() {
	oLivingCat.ReviveCat();
	oGhostCat.ReviveCat();
	currentDeathResetTimer = -1;
}

function SetPause(pause) {
	global.isPause = pause;
	
	var layerId = layer_get_id("PauseMenu");
	layer_set_visible(layerId, pause);
}

function SetSound(sound) {
	global.playSound = sound;
}

function ObjectiveMenuOpen(open) {
	global.isObjectiveMenuOpen = open;
	
	var layerId = layer_get_id("ObjectiveMenu");
	layer_set_visible(layerId, open);
	
	layerId = layer_get_id("PauseMenu");
	layer_set_visible(layerId, !open);
}

if (currentDeathResetTimer >= 0) {
	--currentDeathResetTimer;
	if (currentDeathResetTimer == 0) {
		if (oUndoManager.sizeCounter != 0) {
			src_SlideTransition(TRANS_MODE.UNDO_DEATH);
			UndoWhenDead();
		} else {
			ResetRoom();
			src_SlideTransition(TRANS_MODE.RESTART);
		}

	}
	return;
}
	
if (keyboard_check_pressed(ord("R"))) {
	ResetRoom();
	
	src_SlideTransition(TRANS_MODE.RESTART);
}

if (keyboard_check_pressed(vk_escape)) {
	ObjectiveMenuOpen(false);
	SetPause(!global.isPause);
}

if (oLivingCat.isDead || oGhostCat.isDead) {
	return;
}

if (keyboard_check_pressed(ord("X"))) {
	global.isLivingCat = !global.isLivingCat;
	
	InitSwapCat();
}

