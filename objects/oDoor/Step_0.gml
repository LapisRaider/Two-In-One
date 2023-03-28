if (global.currFishesCollected < global.totalFishesInLevel) {
	image_index = 0;
	return;
}

image_index = 1; //change sprite to open door version

if (place_meeting(x, y, oGhostCat) && place_meeting(x,y, oLivingCat)) {
	src_SlideTransition(TRANS_MODE.GOTO, nextRoom);
}
