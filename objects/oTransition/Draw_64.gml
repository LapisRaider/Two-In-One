/// @description Draw black bars

if (mode != TRANS_MODE.OFF) {
	draw_set_color(c_black);
	
	//x y coord of top left | x full width of screen, percent is where it should be on our screen
	draw_rectangle(0,0,w,percent*h_half, false);
	draw_rectangle(0,h,w,h - (percent*h_half), false);
}
