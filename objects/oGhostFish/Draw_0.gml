draw_self();

if (showCollectText && !global.isLivingCat) {
	draw_set_font(fontFamily)
	draw_set_valign(vertAlignment)
	draw_set_halign(alignment)
	draw_set_colour(textColor)
	draw_text_transformed(x, y - yOffset, text, fontSizeX, fontSizeY, 0)
}