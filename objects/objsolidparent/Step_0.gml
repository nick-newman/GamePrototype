// Z Collisions
if (z > zFloor) {
	zSpeed += gravityForce;
}
if (instance_place(x, y, objSolidParent)) {
	var _instanceArray = instance_place_z(x, y, z, objSolidParent);
	if (_instanceArray[0] != noone) {
		zFloor = _instanceArray[0].zHeight;
		if (_instanceArray[0].zSpeed != 0) {
			z += _instanceArray[0].zSpeed;
		}
		if (z + zSpeed < zFloor) {
			zSpeed = 0;
			z = zFloor;
		}
		if (z == zFloor) {
			x += _instanceArray[0].xSpeed;
			y += _instanceArray[0].ySpeed;
		}
	}
	if (_instanceArray[1] != noone) {
		if (z + zSpeed > _instanceArray[1].z - heightValue && zSpeed > 0) {
			zSpeed = 0;
			//if (z <= _instanceArray[1].z)
			//z = _instanceArray[1].z - heightValue;
			// collisions are slightly off
		}
	}
} else {
	zFloor = -1024;
}
z += round(zSpeed);

// X Collisions
if (instance_place_3d(x + xSpeed, y, z, objSolidParent)) {
	var _instance = instance_place_3d(x + xSpeed, y, z, objSolidParent);
	while (!instance_place(x + sign(xSpeed), y, _instance)) {
		x += sign(xSpeed);
	}
	if (pushForce > _instance.pushForce) {
		_instance.xSpeed = xSpeed / 3;
	}
	//xSpeed = _instance.xSpeed;
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
		_instance.ySpeed = ySpeed / 3;
	}
	//ySpeed = _instance.ySpeed;
	ySpeed = 0;
}
y += round(ySpeed);