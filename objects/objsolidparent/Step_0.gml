// TODO: Pushed Solids do not fall into voids
// Player can't push them when they are touching voids


// X Collisions
if (instance_place_3d(x + xSpeed, y, z, objSolidParent)) {
	var _instance = (instance_place_3d(x + xSpeed, y, z, objSolidParent));
	while (!instance_place(x + sign(xSpeed), y, _instance)) {
		x += sign(xSpeed);
	}
	if (pushForce > _instance.pushForce) {
		_instance.xSpeed = xSpeed;
	}
	xSpeed = 0;
}
x += round(xSpeed);



// Y Collisions
if (instance_place_3d(x, y + ySpeed, z, objSolidParent)) {
	var _instance = (instance_place_3d(x, y + ySpeed, z, objSolidParent));
	while (!instance_place(x, y + sign(ySpeed), _instance)) {
		y += sign(ySpeed);
	}
	if (pushForce > _instance.pushForce) {
		_instance.ySpeed = ySpeed;
	}
	ySpeed = 0;
	
}
y += round(ySpeed);

// force collision from bottom
// if zHeight == solid.z, prevent intersection

// Update zHeight (for solids with a moving z)
zHeight = z + sprite_height / 2;

// Z Collisions
if (instance_place(x, y, objSolidParent)) {
	var tempSolid = instance_place(x, y, objSolidParent);
	
	if (zHeight == tempSolid.z) {
		if (sign(tempSolid.zSpeed) == -1) {
			zSpeed = tempSolid.zSpeed;
			tempSolid.zSpeed = 0;
		} else {
			zSpeed = 0;
			tempSolid.zSpeed = 0; // bug: prevents jumping when on top of objs
		}
	}
	
	if (z >= tempSolid.zHeight) {
		if (tempSolid.zHeight != -1024) {
			zFloor = tempSolid.zHeight;
		} else if (rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, tempSolid.bbox_left, tempSolid.bbox_top, tempSolid.bbox_right, tempSolid.bbox_bottom) == 1) {
			zFloor = tempSolid.zHeight;
		}
		
		if (z == tempSolid.zHeight) {
			tempSolid.zSpeed = 0;
			//xSpeed = tempSolid.xSpeed;
			//ySpeed = tempSolid.ySpeed;
			//zSpeed = tempSolid.zSpeed;
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