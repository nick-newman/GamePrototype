// No Physics Inheritance

// Movement
if (goRight && alarm[1] < 0) {
	xSpeed = 1;
	if (x >= xstart + 40) {
		xSpeed = 0;
		goRight = false;
		goLeft = true;
		alarm[0] = (room_speed * rightPauseTime);
	}
}
if (goLeft && alarm[0] < 0) {
	xSpeed = -1;
	if (x <= xstart - 40) {
		xSpeed = 0;
		goRight = true;
		goLeft = false;
		alarm[1] = (room_speed * leftPauseTime);
	}
}
x += round(xSpeed);

// Hit Detection
default_hit();