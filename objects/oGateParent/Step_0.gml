if (!isOpen && (x == xstart && y == ystart))
	return;
	
if (isOpen && (x == xFinalPos && y == yFinalPos))
	return;

var xDir = sign(xstart - xFinalPos);
var yDir = sign(yFinalPos - ystart); //positive dir is down

// go opposite direction
if (!isOpen) {
	xDir *= -1;
	yDir *= -1;
}

x += xDir * SPEED;
y += yDir * SPEED;

//clamp positions
if (xFinalPos < xstart) 
	x = clamp(x, xFinalPos, xstart);
else 
	x = clamp(x, xstart, xFinalPos);
	

if (yFinalPos < ystart) 
	y = clamp(y, yFinalPos, ystart);
else 
	y = clamp(y, ystart, xFinalPos);
