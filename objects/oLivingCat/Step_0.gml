function UpdateMovement(xDir, isJump) {
	//look for ground below us, add slopeMax so when go down slope we can still jump
	var solidCollision = place_meeting(x, y + slopeMax, O_COLLIDABLES_PARENT);
	
	xVel = xDir * SPEED;
	yVel += GRAVITY;
	
	//if fall to ground
	if (place_meeting(x, y + yVel, O_COLLIDABLES_PARENT) && yVel > 0) {
		isOnGround = true;
		if (jumpsLeft == 0) {
			jumpsLeft = JUMP_NUMBER;
		}
	}
	
	if (isJump && solidCollision && jumpsLeft > 0) {
		yVel = -JUMP_SPEED;
		--jumpsLeft;
		isOnGround = false;
	}
	
	//moving down slopes
	if (solidCollision && !place_meeting(x, y + slopeMax, O_COLLIDABLE_WALL) && yVel > 0) {
		while (!place_meeting(x, y + 1, O_COLLIDABLE_SLOPE)) {
			y += 1;
		}
	}
	
	//move and collide
	var collidedObjs = move_and_collide(xVel, yVel, O_COLLIDABLES_PARENT);
	
	//if we collide with something && it's abv us, stop players from walking on roof
	// or if player touches on ground, just stop player
	if (array_length(collidedObjs) != 0 && place_meeting(x, y + yVel, O_COLLIDABLES_PARENT)) {
		yVel = 0;
	}
}

function UpdateAnim(xDir) {
	if (xDir != 0) {
		image_xscale = xDir;
	}
	
	if (isOnGround) {
		if (xDir == 0) {
			sprite_index = IDLE_ANIM_NAME;
		}
		else {
			sprite_index = WALKING_ANIM_NAME;
		}
	}
	else {
		if (yVel > 0) {
			sprite_index = FALLING_ANIM_NAME;
		} 
		else if (yVel < 0) {
			sprite_index = JUMPING_ANIM_NAME;
		}
	}
}

if (!global.isLivingGhost) {
	return;
}

var moveDir = keyboard_check(vk_right) - keyboard_check(vk_left); //don't let player move if press both keys
var isPressJump = keyboard_check_pressed(vk_space);

UpdateMovement(moveDir, isPressJump);
UpdateAnim(moveDir);
