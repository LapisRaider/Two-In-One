if (!isOpen && (x == xstart && y == ystart))
	return;
	
if (isOpen && (x == xFinalPos && y == yFinalPos))
	return;

var xDir = sign(xFinalPos - xstart);
var yDir = sign(yFinalPos - ystart); //positive dir is down

// go opposite direction
if (!isOpen) {
	xDir *= -1;
	yDir *= -1;
}

xVel = xDir * SPEED;
yVel = yDir * SPEED;

BasicCollision(oBox);
BasicCollision(oLivingCat);
BasicCollision(oGhostCat);
BasicCollision(oEnemy);

x += xVel;
y += yVel;

//clamp positions
if (xFinalPos < xstart) 
	x = clamp(x, xFinalPos, xstart);
else 
	x = clamp(x, xstart, xFinalPos);
	

if (yFinalPos < ystart) 
	y = clamp(y, yFinalPos, ystart);
else 
	y = clamp(y, ystart, yFinalPos);

