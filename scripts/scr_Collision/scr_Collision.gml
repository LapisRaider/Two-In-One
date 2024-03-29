//basic collision, ignoring slopes, with pixel perfection
function BasicPixelPerfectCollision(objToCheck) {
	if (place_meeting(x + xVel, y, objToCheck)) {
		while (!place_meeting(x + sign(xVel), y, objToCheck)) {
			x += sign(xVel);
		}
		
		xVel = 0;
	}
	
	if (place_meeting(x, y + yVel, objToCheck)) {
		while (!place_meeting(x, y + sign(yVel), objToCheck)) {
			y += sign(yVel);
		}
		
		yVel = 0;
		
	}
}

//basic collision, ignoring slopes
function BasicCollision(objToCheck) {
	if (place_meeting(x + xVel, y, objToCheck)) {
		/*while (!place_meeting(x + sign(xVel) * 0.1, y, objToCheck)) {
			x += sign(xVel) * 0.1;
		}*/
		xVel = 0;
	}
	
	if (place_meeting(x, y + yVel, objToCheck)) {
		while (!place_meeting(x, y + (sign(yVel) * 0.01), objToCheck)) {
			y += sign(yVel) * 0.01;
		}
		yVel = 0;
	}
}

