// No Physics Inheritance

// Movement
if (goUp && alarm[1] < 0) {
	zSpeed = 1;
	if (z >= 48) {
		zSpeed = 0;
		goUp = false;
		goDown = true;
		alarm[0] = (room_speed * upPauseTime);
	}
}
if (goDown && alarm[0] < 0) {
	zSpeed = -1;
	if (z <= -16) {
		zSpeed = 0;
		goUp = true;
		goDown = false;
		alarm[1] = (room_speed * downPauseTime);
	}
}
z += round(zSpeed);
zHeight = z + heightValue;

// Hit Detection
default_hit();