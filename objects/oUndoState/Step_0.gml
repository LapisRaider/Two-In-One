function ChangeSprite(move, isLivingCat, hasMove = true) {
	if (!hasMove) {
		sprite_index = noone;
		return;
	}
	
	if (isLivingCat) {
		image_blend = livingCatColor;
	} else {
		image_blend = ghostCatColor;
	}
	
	switch (move) {
		case possibleMoves.JUMP: 
			sprite_index = sSpace;
			break;
		case possibleMoves.LEFT:
			sprite_index = sLeft;
			break;
		case possibleMoves.RIGHT:
			sprite_index = sRight;
			break;
	}
}