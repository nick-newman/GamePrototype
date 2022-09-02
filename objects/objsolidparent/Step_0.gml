// X Collisions
if (instance_place_3d(x + xSpeed, y, z, objSolidParent)) {
	var _instance = instance_place_3d(x + xSpeed, y, z, objSolidParent);
	while (!instance_place(x + sign(xSpeed), y, _instance)) {
		x += sign(xSpeed);
	}
	/*
	if (pushForce > _instance.pushForce) {
		_instance.xSpeed = xSpeed;
	}
	*/
	xSpeed = 0;
}
x += round(xSpeed);

// Y Collisions
if (instance_place_3d(x, y + ySpeed, z, objSolidParent)) {
	var _instance = instance_place_3d(x, y + ySpeed, z, objSolidParent);
	while (!instance_place(x, y + sign(ySpeed), _instance)) {
		y += sign(ySpeed);
	}
	/*
	if (pushForce > _instance.pushForce) {
		_instance.ySpeed = ySpeed;
	}
	*/
	ySpeed = 0;
}
y += round(ySpeed);

// Z Collisions
if (z > zFloor) {
	zSpeed += gravityForce;
	grounded = false;
}
if (instance_place(x, y, objSolidParent)) {
	var _instanceArray = instance_place_z(x, y, z, objSolidParent);
	// floor collisions
	if (_instanceArray[0] != noone) {
		zFloor = _instanceArray[0].zHeight;
		if (z + zSpeed < zFloor) {
			zSpeed = _instanceArray[0].zSpeed;
			z = zFloor;
		}
		if (z == zFloor) {
			x += _instanceArray[0].xSpeed;
			y += _instanceArray[0].ySpeed;
			grounded = true;
		}
	}
	// roof collisions, causes crash when collding x/y over void due to while loop
	// Player can snap thru as well
	if (_instanceArray[1] != noone) {
		if (zHeight + zSpeed > _instanceArray[1].z) {
			// increase z manually until true collision
			//while (zHeight != _instanceArray[1].z) {
			//	z += 1;
			//}
			//zSpeed = 0;
		}
		// better fix needed
		
	}
} else {
	zFloor = -1024;
	grounded = false;
}
z += round(zSpeed);