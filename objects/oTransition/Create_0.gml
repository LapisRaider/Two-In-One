//make black bars animation
w = display_get_gui_width();
h = display_get_gui_height();
h_half = h * 0.5;

enum TRANS_MODE {
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
} 
mode = TRANS_MODE.INTRO;
percent = 1; //for transition fade animation

targetRoom = Room1; //which is next room

