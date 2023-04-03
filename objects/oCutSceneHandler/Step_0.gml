if (currStringTextIndex >= array_length_1d(dialogue)) {
	return;
}

isEndOfDialogue = currCharIndex > string_length(dialogue[currStringTextIndex]);

// skip dialogue
if (keyboard_check_pressed(vk_space)) {
	if (isEndOfDialogue) {
		currStringTextIndex += 1;
		currCharIndex = 0;
		text = "";
		
		if (currStringTextIndex == SECOND_PIC_INDEX) {
			oCutScene.sprite_index =  sCutScene2;
		} 
		else if (currStringTextIndex == THIRD_PIC_INDEX) {
			oCutScene.sprite_index =  sCutScene3;
		}
	}
	else
		currCharIndex = string_length(dialogue[currStringTextIndex]) - 1;
		
	oSoundManager.playUIbuttonPressed = true;
}



// go to next room
if (currStringTextIndex >= array_length_1d(dialogue) || (!isFinalScene && currStringTextIndex >= LAST_PIC_INDEX)) {
	src_SlideTransition(TRANS_MODE.GOTO, nextRoom);
	return;
}

// animate dialogue
if (!isEndOfDialogue) {
	text = string_copy(dialogue[currStringTextIndex], 0, currCharIndex);
	currCharIndex += 1;
	oSoundManager.playTypingText = true;
}


