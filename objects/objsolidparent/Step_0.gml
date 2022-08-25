// X Collisions
if (instance_place(x + xSpeed, y, objSolidParent)) {
	var tempSolid = (instance_place(x + xSpeed, y, objSolidParent));
	if (z < tempSolid.zHeight && z >= tempSolid.z) {
		while (!instance_place(x + sign(xSpeed), y, tempSolid)) {
			x += sign(xSpeed);
		}
		if (tempSolid.pushForce < pushForce) {
			//xSpeed /= tempSolid.pushResist;
			xSpeed *= 0.5; // this breaks north/west collisions
			tempSolid.xSpeed = xSpeed;
		} else {
			xSpeed = 0;
		}
	}
}
x += round(xSpeed);



// Y Collisions
if (instance_place(x, y + ySpeed, objSolidParent)) {
	var tempSolid = (instance_place(x, y + ySpeed, objSolidParent));
	if (z < tempSolid.zHeight && z >= tempSolid.z) {
		while (!instance_place(x, y + sign(ySpeed), tempSolid)) {
			y += sign(ySpeed);
		}
		if (tempSolid.pushForce < pushForce ) {
			//ySpeed /= tempSolid.pushResist
			ySpeed *= 0.5 // this breaks north/west collisions
			tempSolid.ySpeed = ySpeed;
		} else {
			ySpeed = 0;
		}
	}
}
y += round(ySpeed);

//x += round(xSpeed); // Having this here makes pushing mutually exclusive, but causes corner bug



// Z Collisions
if (instance_place(x, y, objSolidParent)) {
	var tempSolid = instance_place(x, y, objSolidParent);
	if (z >= tempSolid.zHeight) {
		if (tempSolid.zHeight != -1024) {
			zFloor = tempSolid.zHeight;
		} else if (rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, tempSolid.bbox_left, tempSolid.bbox_top, tempSolid.bbox_right, tempSolid.bbox_bottom) == 1) {
			zFloor = tempSolid.zHeight;
		}
	} else zFloor = 0;
} else zFloor = 0;



// Stop at Floor
if (z > zFloor)
    zSpeed += gravityForce;
if (z + zSpeed <= zFloor) {
    zSpeed = 0;
    z = zFloor;
}
z += round(zSpeed);



// Default Hit Detection
if (defaultHit) {
	if (instance_place(x, y, objAttackParent)) {
		var attack = instance_place(x, y, objAttackParent);
		if (attack.z >= z && attack.z <= zHeight) {
			instance_destroy(attack);
		}
	}
}