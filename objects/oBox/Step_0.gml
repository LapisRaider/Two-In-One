function MoveInDirX(xDir, movSpeed) {
	xVel = xDir * movSpeed;
}

function UpdateMovement() {
	var solidCollision = place_meeting(x, y + slopeMax, O_COLLIDABLES_PARENT);
	
	yVel += GRAVITY;
	
	//moving down slopes
	if (solidCollision && !place_meeting(x, y + slopeMax, O_COLLIDABLE_WALL) && yVel > 0) {
		while (!place_meeting(x, y + 1, O_COLLIDABLE_SLOPE)) {
			y += 1;
		}
	}
	
	BasicCollision(oGhostCat);
	BasicCollision(oLivingCat);
	
	//move and collide
	var collidedObjs = move_and_collide(xVel, yVel, O_COLLIDABLES_PARENT);
	
	//if we collide with something && it's abv us, stop players from walking on roof
	// or if player touches on ground, just stop player
	if (array_length(collidedObjs) != 0 && place_meeting(x, y + yVel, O_COLLIDABLES_PARENT)) {
		yVel = 0;
	}
	

	//if no longer colliding with player, stop moving
	//or if falling, just x = 0, we don't want horiSpeed for it
	
}



UpdateMovement();