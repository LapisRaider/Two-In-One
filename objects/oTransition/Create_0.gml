//make black bars animation
w = display_get_gui_width();
h = display_get_gui_height();
h_half = h * 0.5;

enum TRANS_MODE {
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO,
	UNDO_DEATH,
} 
mode = TRANS_MODE.INTRO;
percent = 1; //for transition fade animation
transitionSpeed = 8; //smaller the faster
timeBetweenTransition = 0.2; //how much extra time the screen will pause at the fully black screen

targetRoom = Room1; //which is next room

playOpeningSound = false;
playClosingSound = false;