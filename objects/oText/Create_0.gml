// font_add(name, size, bold, italic, first, last);
currFont = fPermanentMarker;
if (fontFamily == "Purple Smile.ttf") {
	currFont = fPurpleSmile;
} else if (fontFamily == "RammettoOne-Regular.ttf") {
	currFont = fRammettoOne;
}

if os_browser == browser_not_a_browser {
	currFont = font_add(fontFamily, 32, bold, italics, 32, 128);
}

font_enable_sdf(currFont, true);