// VALUES FOR LIVING CAT

WALKING_ANIM_NAME = sLivingCat_Walking
IDLE_ANIM_NAME = sLivingCat_Idle
FALLING_ANIM_NAME = sLivingCat_Falling
JUMPING_ANIM_NAME = sLivingCat_Jumping
DEAD_ANIM_NAME = sLivingCat_Death
ORIGINAL_SCALE_SIZE = image_xscale

SPEED = 1.2
XSPEED_IN_AIR = 1.5
GRAVITY = 0.1
JUMP_SPEED = 2.8
JUMP_NUMBER = 1
GROUND_THRESHOLD = 0.1
PUSH_STRENGTH = 0.5;
MAX_Y_VEL = 2.8;

O_COLLIDABLES_PARENT = oLivingCat_ParentWalls
O_COLLIDABLE_WALL = oLivingWall
O_COLLIDABLE_SLOPE = oLivingWall_Slope
O_BOX = oBox



//VARIABLES THAT WILL CHANGE IN RUN TIME FOR LIVING CAT 
xCurrSpeed = SPEED
xVel = 0
yVel = 0
moveDir = 0
jumpsLeft = JUMP_NUMBER
isOnGround = true;
originalImageSpeed = image_speed;

slopeMax = 4
isDead = false
