//follow whichever cat is currently active
var activeCat;
if (global.isLivingCat) {
	activeCat = oLivingCat;
} else {
	activeCat = oGhostCat;
}

var dist = activeCat.x - x;
var xDir = sign(dist);
if (abs(dist) < DIST_THRESHOLD) {
	xDir = 0;
}

xVel = xDir * MOVE_SPEED;

BasicCollision(oBox);
BasicCollision(oGateParent);
BasicCollision(oLivingCat_ParentWalls);
BasicCollision(oGhostCat_ParentWalls);


if ((x + xVel > max_xPos && xDir > 0) || (x + xVel < min_xPos && xDir < 0)) {
	xVel = 0;
} 
x += xVel;


//update animation here
if (xDir != 0) {
	image_xscale = xDir * START_SCALE;
}

if (isAttacking) {
	sprite_index = ATTACK_ANIM_NAME;
	
	if (image_index >= image_number - 1) {
		isAttacking = false;
	}
	
	return;
} 


if (xVel == 0) {
	sprite_index = IDLE_ANIM_NAME;
} else {
	sprite_index = WALKING_ANIM_NAME;
}
