// X Collisions
if (instance_place_3d(x + xSpeed, y, z, objSolidParent)) {
	var _instance = instance_place_3d(x + xSpeed, y, z, objSolidParent);
	while (!instance_place(x + sign(xSpeed), y, _instance)) {
		x += sign(xSpeed);
	}
	if (pushForce > _instance.pushForce) {
		//_instance.xSpeed = xSpeed;
	}
	xSpeed = 0;
}
x += round(xSpeed);

// Y Collisions
if (instance_place_3d(x, y + ySpeed, z, objSolidParent)) {
	var _instance = instance_place_3d(x, y + ySpeed, z, objSolidParent);
	while (!instance_place(x, y + sign(ySpeed), _instance)) {
		y += sign(ySpeed);
	}
	if (pushForce > _instance.pushForce) {
		//_instance.ySpeed = ySpeed;
	}
	ySpeed = 0;
	
}
y += round(ySpeed);

// IF USING zFLOOR, platforms of different height that are
// connected will glitch when player is in between them
// this requires list to determine which one is higher to use as zFloor
// ALSO, elevators glitch on way down due to brief moment when player's z goes 1
// higher than the platform's zHeight at the top, and Player has x/y issues when its moving up

// Z Collisions
if (z > zFloor) {
	zSpeed += gravityForce;
}
if (z + zSpeed < zFloor) {
	zSpeed = 0;
	z = zFloor;
}
if (instance_place(x, y, objSolidParent)) {
	//var _instance = instance_place_z(x, y, z, objSolidParent);
	// above or below (gravity)
	// at top (ground, move with obj)
	// height at solid z (collide, gravity)
	
	var _instance = instance_place(x, y, objSolidParent);
	
	// if Player is below and inside obj height, set player z to be under
	
	
	//if (z < _instance.zHeight) {
	//if (z >= _instance.zHeight) {
	if (_instance.z <= z) {
		zFloor = _instance.zHeight;
		if (z == zFloor) {
			x += _instance.xSpeed;
			y += _instance.ySpeed;
		}
		//zSpeed += gravityForce;
		//grounded = false;
		
		
	}
} else {
	//zSpeed += gravityForce;
	//grounded = false;
	zFloor = -1024;
}
/*
// collide with bottom zFloor test
if (instance_place(x, y, objSolidParent)) {
	var _instance = instance_place(x, y, objSolidParent);
	if (_instance.zHeight > z + zSpeed && zFloor >= _instance.zHeight) {
		if (zSpeed >= 0 && z > _instance.zHeight) {
			z = _instance.z + _instance.zHeight;
			zSpeed = gravityForce;
		}
	}
}
*/
z += round(zSpeed);

/*
// Z Collisions
if (instance_place(x, y, objSolidParent)) {
	instance_place_z(objSolidParent);
} else {
	zSpeed += gravityForce;
	grounded = false;
}
z += round(zSpeed);
*/

/*
if (instance_place_z(objSolidParent)) {
	var _instance = instance_place_z(objSolidParent);
	
} else {
	zSpeed += gravityForce;
	grounded = false;
}
z += round(zSpeed);
*/