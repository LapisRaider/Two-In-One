if (keyboard_check_pressed(ord("X"))) {
	global.isLivingCat = !global.isLivingCat;
}

if (keyboard_check_pressed(ord("R"))) {
	global.isLivingCat = true;
	global.currFishesCollected = 0;
	
	src_SlideTransition(TRANS_MODE.RESTART);
}
