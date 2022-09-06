// Physics
event_inherited();

// Friction
if (z == zFloor) {
	/*
	if (xSpeed != 0) {
		xSpeed += -sign(xSpeed);
	}
	if (ySpeed != 0) {
		ySpeed += -sign(ySpeed);
	}
	*/
	/*
	if (xSpeed > 0) {
		xSpeed -= 1;
	}
	if (xSpeed < 0) {
		xSpeed += 1;
	}
	if (ySpeed > 0) {
		ySpeed -= 1;
	}
	if (ySpeed < 0) {
		ySpeed += 1;
	}
	*/
	xSpeed = 0;
	ySpeed = 0;
}

if (z <= -512) {
	instance_destroy();
}