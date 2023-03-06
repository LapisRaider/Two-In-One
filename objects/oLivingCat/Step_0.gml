function UpdateMovement(xDir, isJump) {
	xVel = xDir * SPEED;
	yVel = yVel + GRAVITY;

	// jump if we on surfaces that we can
	for (var i = 0; i < array_length(JUMPABLE_SURFACES); i += 1) {
		if (place_meeting(x, y + 1, JUMPABLE_SURFACES[i]) && isJump) {
			yVel = JUMP_SPEED;
		}
	}

	//collision with collidables
	for (var i = 0; i < array_length(COLLIDABLES); i += 1) {
		//horizontal collision
		if (place_meeting(x + xVel, y, COLLIDABLES[i])) {
			while (!place_meeting(x + sign(xVel), y, oTempWall)) {
				 x += sign(xVel); //slowly increment to the right/left so you'll be 0 pixels away from the wall
			}
			xVel = 0;
		}
	
		//vertical collision
		if (place_meeting(x, y + yVel, COLLIDABLES[i])) {
			while (!place_meeting(x, y + sign(yVel), oTempWall)) {
				y += sign(yVel);
			}
	
			yVel = 0;
		}
	}

	x += xVel; //update x pos
	y += yVel;
}

function UpdateAnim(xDir) {
	if (xDir == 0) {
		sprite_index = IDLE_ANIM_NAME;
	}
	else {
		sprite_index = WALKING_ANIM_NAME;
		image_xscale = xDir;
	}
}


var moveDir = keyboard_check(vk_right) - keyboard_check(vk_left); //don't let player move if press both keys
var isPressJump = keyboard_check_pressed(vk_space);

UpdateMovement(moveDir, isPressJump);
UpdateAnim(moveDir);