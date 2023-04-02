if (borderWidth != 0) {
	draw_set_colour(borderColor);
	draw_roundrect_ext(bbox_left - borderWidth,bbox_top - borderWidth, bbox_right + borderWidth, bbox_bottom + borderWidth, borderRadius, borderRadius, 0);
}

draw_set_colour(image_blend);
draw_roundrect_ext(bbox_left,bbox_top, bbox_right, bbox_bottom, borderRadius, borderRadius, 0);

// draw text
event_inherited();
