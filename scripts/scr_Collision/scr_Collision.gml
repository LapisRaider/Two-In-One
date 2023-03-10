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
		xVel = 0;
	}
	
	if (place_meeting(x, y + yVel, objToCheck)) {
		while (!place_meeting(x, y + sign(yVel) * 0.1, objToCheck)) {
			y += sign(yVel) * 0.1;
		}
		yVel = 0;
	}
}

