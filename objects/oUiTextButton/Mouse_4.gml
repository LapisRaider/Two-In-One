//i know i should split but im very tired
if (!isPauseMenuButton) {
	src_SlideTransition(TRANS_MODE.GOTO, nextRoom);
	return;
}


if ((global.isPause && !global.isObjectiveMenuOpen))
	src_SlideTransition(TRANS_MODE.GOTO, nextRoom);