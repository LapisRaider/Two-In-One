#macro STARTING_DIALOGUE 0
#macro SECOND_PIC_INDEX 1
#macro THIRD_PIC_INDEX 7
#macro LAST_PIC_INDEX 11

// set up the fonts
event_inherited();

text = ""; //text to print
currCharIndex = 0;
currStringTextIndex = !isFinalScene ? 0 : LAST_PIC_INDEX;

if (isFinalScene) {
	oCutScene.sprite_index = sCutScene4;
}

dialogue[STARTING_DIALOGUE] = "Ginger and Snow had always been inseperable,\n never leaving each other's side."


dialogue[SECOND_PIC_INDEX] = "However, one day,\n it seemed as though the Earth had sundered apart..."
dialogue[SECOND_PIC_INDEX + 1] = "The two close friends soon found themselves\n in worlds that were similar to theirs..."
dialogue[SECOND_PIC_INDEX + 2] = "Yet, distinctly different and not quite right."
dialogue[SECOND_PIC_INDEX + 3] = "The sky was different and there were walls that wasn't there before."
dialogue[SECOND_PIC_INDEX + 4] = "Most distressing of all... "
dialogue[SECOND_PIC_INDEX + 5] = "They found themselves unable to reunite with one another."

dialogue[THIRD_PIC_INDEX] = "However, they soon discovered that they had the ability\n to manipulate certain objects that have an impact on both worlds."
dialogue[THIRD_PIC_INDEX + 1] = "Realizing the potential to work together and resolve the situation,\n they set out to find a solution."
dialogue[THIRD_PIC_INDEX + 2] = "By obtaining magical energies in the form of fishes,\n they were open to open a gate and gradually merge their worlds back together."
dialogue[THIRD_PIC_INDEX + 3] = "But beware, as they found numerous obstacles\n along the way that threatened to thward their efforts..."

dialogue[LAST_PIC_INDEX] = "And with that, after overcoming the final room,\n Earth is once again whole."
dialogue[LAST_PIC_INDEX + 1] = "Ginger and Snow, back together, reunited happily."
dialogue[LAST_PIC_INDEX + 2] = "THE END"
dialogue[LAST_PIC_INDEX + 3] = "THANK YOU FOR PLAYING!"