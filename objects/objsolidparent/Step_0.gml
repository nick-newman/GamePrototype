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

// Z Collisions





if (instance_place(x, y, objSolidParent)) {
	var _instance = instance_place_z(x, y, z, objSolidParent); //find highest solid below player
	// above or below (gravity)
	// at top (ground, move with obj)
	// height at solid z (collide, gravity)
	
	if (z > _instance.zHeight) { //|| z < _instance.z
		zSpeed += gravityForce;
		grounded = false;
	}
	
	if (z + zSpeed <= _instance.zHeight && z >= _instance.z) { //&& z >= _instance.z
		zSpeed = _instance.zSpeed;
	    z = _instance.zHeight;
		x += _instance.xSpeed;
		y += _instance.ySpeed;
		grounded = true;
	}
	
	//if (zHeight + zSpeed >= _instance.z && z < _instance.zHeight) {
	//	zSpeed = gravityForce;
	//	grounded = false;
	//}
} else {
	zSpeed += gravityForce;
	grounded = false;
}
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