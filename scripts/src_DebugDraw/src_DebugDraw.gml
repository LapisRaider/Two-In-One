
function DebugDraw(offsetLeft = 0, offsetTop = 0, offsetBottom = 0, offerRight = 0){
	draw_set_color(c_yellow); // Set the color of the wireframe
	//draw_line_width(bbox_left,bbox_top,bbox_right,bbox_bottom, 1);
	draw_rectangle(bbox_left + offsetLeft,bbox_top +offsetTop,bbox_right +offerRight ,bbox_bottom + offsetBottom,true);

	draw_self();
}