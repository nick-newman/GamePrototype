// X Collisions
if (instance_place(x + xSpeed, y, objZ_Parent)) {
	var _solidZ = (instance_place(x + xSpeed, y, objZ_Parent));
	if (z < _solidZ.zHeight) {
		while (!instance_place(x + sign(xSpeed), y, objZ_Parent)) {
			x += sign(xSpeed);
		}
		xSpeed = 0;
	}
}
x += round(xSpeed);



// Y Collisions
if (instance_place(x, y + ySpeed, objZ_Parent)) {
	var _solidZ = (instance_place(x, y + ySpeed, objZ_Parent));
	if (z < _solidZ.zHeight) {
		while (!instance_place(x, y + sign(ySpeed), objZ_Parent)) {
			y += sign(ySpeed);
		}
		ySpeed = 0;
	}
}
y += round(ySpeed);



// Z Collisions
if (instance_place(x, y, objZ_Parent)) {
	var _solidZ = instance_place(x, y, objZ_Parent);
	if (z >= _solidZ.zHeight) {
		if (_solidZ.zHeight != -1024) {
			zFloor = _solidZ.zHeight;
		} else if (rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, _solidZ.bbox_left, _solidZ.bbox_top, _solidZ.bbox_right, _solidZ.bbox_bottom) == 1) {
			zFloor = _solidZ.zHeight;
		}
		// For pushables, if z == objPushableParent.zHeight
		// x += round(_solidZ.xSpeed);
		// y += round(_solidZ.ySpeed);
		// z += round(_solidZ.zSpeed);
	} else zFloor = 0;
} else zFloor = 0;



// Stop at Floor
if (z > zFloor)
    zSpeed += gravityForce;
if (z + zSpeed <= zFloor && (zFloor !=-1024 && z >= 0)) {	// if below ground, prevent zFloor from resetting to 0 from under
    zSpeed = 0;
    z = zFloor;
}
z += round(zSpeed);