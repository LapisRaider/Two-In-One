if (global.currFishesCollected < global.totalFishesInLevel) {
	image_index = 0;
	return;
}

image_index = 1; //change sprite to open door version

if (!unlockDoorPlayed) {
	oSoundManager.playUnlockDoor = true;
	unlockDoorPlayed = true;
}


if (place_meeting(x, y, oGhostCat) && place_meeting(x,y, oLivingCat)) {
	//set max room finished
	if (instance_exists(oCurrProgressTracker) && nextRoomIndex != 0) {
		if (nextRoomIndex > global.maxLevel)
			global.maxLevel = nextRoomIndex;
	}
	
	if (!endSoundPlayed) {
		oSoundManager.playFinishLevel = true;
		endSoundPlayed = true;
	}
	
	src_SlideTransition(TRANS_MODE.GOTO, nextRoom);
}
