function UpdateMovement(xDir, isJump) {
	//look for ground below us, add slopeMax so when go down slope we can still jump
	var solidCollision = place_meeting(x, y + slopeMax, O_COLLIDABLES_PARENT);
	var boxTopCollision = place_meeting(x, y + yVel + GROUND_THRESHOLD, oBox);
	var gateCollision = place_meeting(x, y + yVel + GROUND_THRESHOLD, oGateParent);
	
	xVel = xDir * xCurrSpeed;
	yVel += GRAVITY;
	yVel = min(yVel, MAX_Y_VEL);
	
	//if fall to ground
	if ((gateCollision || boxTopCollision || place_meeting(x, y + yVel + GROUND_THRESHOLD, O_COLLIDABLES_PARENT)) && yVel > 0) {
		isOnGround = true;
		if (jumpsLeft == 0) {
			jumpsLeft = JUMP_NUMBER;
		}
		xCurrSpeed = SPEED;
	}
	else if (yVel > 0)
	{
		isOnGround = false;
	}
	
	if (isJump && (gateCollision || solidCollision || boxTopCollision) && jumpsLeft > 0) {
		yVel = -JUMP_SPEED;
		--jumpsLeft;
		isOnGround = false;

		xCurrSpeed = XSPEED_IN_AIR;
		oSoundManager.playJump = true;
	}
	
	//moving down slopes
	if (solidCollision && !place_meeting(x, y + slopeMax, O_COLLIDABLE_WALL) && yVel > 0) {
		while (!place_meeting(x, y + 1, O_COLLIDABLE_SLOPE)) {
			y += 1;
		}
	}
	
	PushBox();
	BasicCollision(oBox);
	BasicCollision(oGateParent);
	
	
	//move and collide
	move_and_collide(xVel, 0, O_COLLIDABLES_PARENT);
	var collidedObjsY = move_and_collide(0, yVel, O_COLLIDABLES_PARENT);
	
	//if we collide with something && it's abv us, stop players from walking on roof
	// or if player touches on ground, just stop player
	if (array_length(collidedObjsY) != 0 && place_meeting(x, y + yVel, O_COLLIDABLES_PARENT)) {
		yVel = 0;
	}
}


function PushBox() {
	var instance = instance_place(x + xVel, y, O_BOX);
	if (instance != noone) {
		instance.MoveInDirX(sign(xVel), PUSH_STRENGTH);
	}
}

function UpdateAnim(xDir) {
	if (xDir != 0) {
		image_xscale = ORIGINAL_SCALE_SIZE * xDir;
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

function DyingBehavior() {
	if (isDead) {
		sprite_index = DEAD_ANIM_NAME;
	}
	
	if (image_index >= image_number - 1) {
		image_speed = 0;
		
		oGameManager.StartAutoDeathCleanUp();
	} 
}

function StartCatDeath() {
	if (isDead)
		return;

	isDead = true;
	instance_create_layer(x, y, "Instances", oCatDeath);
}

function UpdateTracker(xDir, isJump) {
	if (isOnGround) {
		var nextMove = possibleMoves.NOTHING;
		if (xDir > 0) {
			nextMove = possibleMoves.RIGHT;
		} else if (xDir < 0) {
			nextMove = possibleMoves.LEFT;
		}
		
		oUndoManager.StartTrack(nextMove);
	} else if (isJump) {
		oUndoManager.StartTrack(possibleMoves.JUMP);
	}
}