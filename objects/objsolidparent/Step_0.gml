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
//var _groundZ = ground_z_get();
if (instance_place(x, y, objZ_Parent)) {
	var _solidZ = instance_place(x, y, objZ_Parent);
	if (z >= _solidZ.zHeight) {
		
		
		// Void Collisions (all corners of bbox must touch)
		if (_solidZ.zHeight != -1024) {
			zFloor = _solidZ.zHeight;
		} else if (rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, _solidZ.bbox_left, _solidZ.bbox_top, _solidZ.bbox_right, _solidZ.bbox_bottom) == 1) {
			zFloor = _solidZ.zHeight;
		}
		
		
		//if (z == _solidZ.zHeight) { THIS SHOULD ONLY APPLY TO MOVING OBJS, since normals don't have speeds
		//	x += round(_solidZ.xSpeed);
		//	y += round(_solidZ.ySpeed);
		//	z += round(_solidZ.zSpeed);
		//}
	} else zFloor = 0; //(zFloor != -1024) zFloor = 0; // PROBLEM: Then player can't get back up ever
} else zFloor = 0; //(zFloor != -1024) zFloor = 0;

/*
if (z > _groundZ)
    zSpeed += gravityForce;
if (z + zSpeed <= _groundZ)
{
    zSpeed = 0;
    z = _groundZ;
}
*/
if (z > zFloor)
    zSpeed += gravityForce;
if (z + zSpeed <= zFloor)
{
    zSpeed = 0;
    z = zFloor;
}
z += round(zSpeed);