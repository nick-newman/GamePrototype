// No Physics Inheritance

// Movement
if (goUp) {
	zSpeed = 1;
	//y += 1;
	if (z >= 64) {
		goUp = false;
		goDown = true;
	}
}
if (goDown) {
	zSpeed = -1;
	//y -= 1;
	if (z <= 16) {
		goUp = true;
		goDown = false;
	}
}
z += round(zSpeed);
zHeight = z + 16;

// Hit Detection
default_hit();