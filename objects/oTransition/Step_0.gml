/// @desc progress the transition
if (mode != TRANS_MODE.OFF) {

	// fade bars out when we enter room
	if (mode == TRANS_MODE.INTRO) {
		//reduce by 1/10 of the percent or 0.005
		//start fast then slowly decrease
		percent = max(0, percent - max(percent/transitionSpeed, 0.005));
		
		if (!playOpeningSound) {
			oSoundManager.playOpeningScene = true;
			playOpeningSound = true;
		}
	}
	else {
		percent = min(1 + timeBetweenTransition, percent + max((1-percent)/transitionSpeed, 0.005));
		
		if (!playClosingSound) {
			oSoundManager.playClosingScene = true;
			playClosingSound = true;
		}
	}
	
	if (percent == 1 + timeBetweenTransition || percent == 0) {
		switch (mode) {
			case TRANS_MODE.INTRO: {
				mode = TRANS_MODE.OFF;
				break;
			}		
			case TRANS_MODE.NEXT: {
				//next room in room order
				mode = TRANS_MODE.INTRO;
				room_goto_next();
				break;
			}
			case TRANS_MODE.GOTO: {
				//go to any room we want
				mode = TRANS_MODE.INTRO;
				room_goto(targetRoom);
				break;
			}
			case TRANS_MODE.RESTART: {
				mode = TRANS_MODE.INTRO;
				room_restart();
				break;
			}
			case TRANS_MODE.UNDO_DEATH: {
				mode = TRANS_MODE.INTRO;
				oUndoManager.PopLast();
				oGameManager.UndoWhenDead();
				
				if (instance_exists(oCatDeath)) {
					instance_destroy(oCatDeath);
				}
				break;
			}
		}
	}
} else {
	playOpeningSound = false;
	playClosingSound = false;
}