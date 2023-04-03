
GRAVITY = 0.3;
O_COLLIDABLES_PARENT = oNormalWall_Parent;
O_COLLIDABLE_SLOPE = oNormalWall_Slope;
O_COLLIDABLE_WALL = oNormalWall;
INTERACTION_SIZE = 0;
GROUND_THRESHOLD = 0.1;
COLLISION_TOP_OFFSET = 10;
COLLISION_SIDE_OFFSET = 1;

// falling for 6 frames
FALL_SOUND_THRESHOLD = GRAVITY * 10;

xVel = 0;
xFollowVel = 0; //if it's on something
yVel = 0;
slopeMax = 4;

followBox = noone;
updatedThisFrame = false;
notMoving = false;