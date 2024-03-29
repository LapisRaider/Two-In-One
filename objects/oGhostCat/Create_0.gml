//VARIABLES FOR GHOST CAT 
WALKING_ANIM_NAME = sGhostCat_Walking
IDLE_ANIM_NAME = sGhostCat_Idle
FALLING_ANIM_NAME = sGhostCat_Falling
JUMPING_ANIM_NAME = sGhostCat_Jumping
DEAD_ANIM_NAME = sGhostCat_Death
ORIGINAL_SCALE_SIZE = abs(image_xscale)

SPEED = 1
XSPEED_IN_AIR = 0.8
GRAVITY = 0.05
JUMP_SPEED = 2.2
JUMP_NUMBER = 1
GROUND_THRESHOLD = 0.15
PUSH_STRENGTH = 0.5;
MAX_Y_VEL = 1.5;

O_COLLIDABLES_PARENT = oGhostCat_ParentWalls
O_COLLIDABLE_WALL = oGhostWall
O_COLLIDABLE_SLOPE = oGhostWall_Slope
O_BOX = oBox


//VARIABLES THAT WILL CHANGE IN RUN TIME FOR GHOST CAT 
xCurrSpeed = SPEED
xVel = 0
yVel = 0
moveDir = 0
jumpsLeft = JUMP_NUMBER
isOnGround = true;
isDead = false;
originalImageSpeed = image_speed;

slopeMax = 4
