// No Physics Inheritance

// Movement
if (goRight) {
	xSpeed = 1;
	if (x >= xstart + 40) {
		goRight = false;
		goLeft = true;
	}
}
if (goLeft) {
	xSpeed = -1;
	if (x <= xstart - 40) {
		goRight = true;
		goLeft = false;
	}
}
x += round(xSpeed);

// Hit Detection
default_hit();