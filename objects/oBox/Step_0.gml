function MoveInDirX(xDir, movSpeed) {
	xVel = xDir * movSpeed;
}

function UpdateBoxMovement() {
	var solidCollision = place_meeting(x, y + slopeMax, O_COLLIDABLES_PARENT);
	
	yVel += GRAVITY;
	
	//moving down slopes
	if (solidCollision && !place_meeting(x, y + slopeMax, O_COLLIDABLE_WALL) && yVel > 0) {
		while (!place_meeting(x, y + 1, O_COLLIDABLE_SLOPE)) {
			y += 1;
		}
	}
	
	var collideWithBoxBelow = false;
	with (oBox) {
		if (other.id == id) {
			continue;
		}
		
		//if there is something below it and it's moving
		if (place_meeting(x, y + COLLISION_TOP_OFFSET, other)) {
			 xFollowVel = other.xVel;
			 collideWithBoxBelow = true;
			 break;
		}
		
		//if something on the left + other box moving right
		if ((place_meeting(x - COLLISION_TOP_OFFSET, y, other) && sign(other.xVel) > 0) || 
		(place_meeting(x + COLLISION_TOP_OFFSET, y, other) && sign(other.xVel) < 0)) {
			 xFollowVel = other.xVel;
			 break;
		}
	}
	
	xVel += xFollowVel;
	xFollowVel = 0;
	
	BasicCollision(oGhostCat);
	BasicCollision(oLivingCat);
	BasicCollision(oGateParent);
	BasicCollision(oBox);
	BasicCollision(oEnemy);
	
	//move and collide
	move_and_collide(xVel, 0, O_COLLIDABLES_PARENT);
	var collidedObjs = move_and_collide(0, yVel, O_COLLIDABLES_PARENT);
	
	//if we collide with something && it's below us
	if (array_length(collidedObjs) != 0 && (place_meeting(x, y + yVel, O_COLLIDABLES_PARENT) || collideWithBoxBelow)) {
		yVel = 0;
	} 
	
	//if falling, just x = 0, we don't want horiSpeed for it)
	if (yVel > 0 && !place_meeting(x, y + yVel + GROUND_THRESHOLD, O_COLLIDABLES_PARENT) && !collideWithBoxBelow) {
		xVel = 0;
	}
	
	//if no longer colliding with player, stop moving
	var collisionLivingCat = collision_rectangle(x - INTERACTION_SIZE, y - INTERACTION_SIZE, x + INTERACTION_SIZE, y + INTERACTION_SIZE, oLivingCat, false, true);
	var collisionGhostCat = collision_rectangle(x - INTERACTION_SIZE, y - INTERACTION_SIZE, x + INTERACTION_SIZE, y + INTERACTION_SIZE, oGhostCat, false, true);
	if (collisionLivingCat == noone && collisionGhostCat == noone) {
		xVel = 0;
	}
}


UpdateBoxMovement();