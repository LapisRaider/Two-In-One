#macro WALKING_ANIM_NAME sLivingCat_Walking
#macro IDLE_ANIM_NAME sLivingCat_Idle
#macro FALLING_ANIM_NAME sLivingCat_Falling
#macro JUMPING_ANIM_NAME sLivingCat_Jumping
#macro ORIGINAL_SCALE_SIZE 0.7

#macro SPEED 1
#macro GRAVITY 0.1
#macro JUMP_SPEED 2.8
#macro JUMP_NUMBER 1
#macro GROUND_THRESHOLD 0.1

#macro O_COLLIDABLES_PARENT oLivingCat_ParentWalls
#macro O_COLLIDABLE_WALL oLivingWall
#macro O_COLLIDABLE_SLOPE oLivingWall_Slope


xVel = 0
yVel = 0
jumpsLeft = JUMP_NUMBER
isOnGround = true;

slopeMax = 4
