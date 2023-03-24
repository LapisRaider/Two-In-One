y = sin(currentTime) * HEIGHT_MULTIPLIER + ystart;

currentTime += MOVE_SPEED;
currentTime = currentTime % (2 * pi);
