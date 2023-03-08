if (keyboard_check_pressed(ord("X"))) {
	global.isLivingCat = !global.isLivingCat;
	
	ghostTile_alpha = global.isLivingCat ? MIN_LAYER_ALPHA : 1;
	livingTile_alpha = global.isLivingCat ? 1 : MIN_LAYER_ALPHA;
}

if (keyboard_check_pressed(ord("R"))) {
	global.isLivingCat = true;
	global.currFishesCollected = 0;
	
	src_SlideTransition(TRANS_MODE.RESTART);
}

