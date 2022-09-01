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
	xSpeed = 0;
	*/
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

// TODO: DECIDE ON ZFLOOR OR PURE COLLIS THEN FIX BELOW

if (z > zFloor) {
	zSpeed += gravityForce;
}
/*
if (z + zSpeed < zFloor) {
	zSpeed = 0;
	z = zFloor;
}
*/



//zSpeed += gravityForce;

if (instance_place(x, y, objSolidParent)) {
	var _instanceArray = instance_place_z(x, y, z, objSolidParent);
	
	// floor collisions
	if (_instanceArray[0] != noone) {
		
		if (z >= _instanceArray[0].zHeight) {
			//zSpeed = _instanceArray[0].zSpeed;
			//z = _instanceArray[0].zHeight;
			
			//visual only
			zFloor = _instanceArray[0].zHeight;
		}
		
		if (z + zSpeed < _instanceArray[0].zHeight) {
			zSpeed = _instanceArray[0].zSpeed;
		}
		
		if (z == _instanceArray[0].zHeight) {
			x += _instanceArray[0].xSpeed;
			y += _instanceArray[0].ySpeed;
		}
	}
	
	// roof collisions
	if (_instanceArray[1] != noone) {
		if (z + zSpeed >= _instanceArray[1].z) {
			zSpeed = 0;
			z = _instanceArray[1].z - zHeight;
		}
	}
}
z += round(zSpeed);










// IF USING zFLOOR, platforms of different height that are
// connected will glitch when player is in between them
// this requires list to determine which one is higher to use as zFloor
// ALSO, elevators glitch on way down due to brief moment when player's z goes 1
// higher than the platform's zHeight at the top, and Player has x/y issues when its moving up

// for inst place z, handle calculations inside the func?
// if plr z >= _inst.zHeight, apply gravity, set zFloor
// if z == _inst.z, stop falling, move with obj
// if plr zHeight >= _inst.z && plr zHeight < _inst.zHeight, collide

/*
// set zFloor and move when on
if (instance_place(x, y, objSolidParent)) {
	//var _instance = instance_place_z(x, y, z, objSolidParent); // highest obj under player
	var _instanceArray = instance_place_z(x, y, z, objSolidParent);
	// use [0] for top and [1] for bot, and make sure they exist first
	if (_instanceArray[0] != noone) {
		// bot of obj coll checks
	}
	if (_instanceArray[1] != noone) {
		// top of obj coll checks, move the ones below to here
	}
	
	
	zFloor = _instance.zHeight;
	if (z == _instance.zHeight) {
		x += _instance.xSpeed;
		y += _instance.ySpeed;
		z += _instance.zSpeed;
		//z = _instance.zHeight;	//somehow still delayed, yet zFloor tracks accurately
	}
} else {
	zFloor = -1024;
}
*/
// collide at bot requires inst place z to give more than the highest obj under player,
// it would need to give the obj above and closest to player



// Z Collisions

/*
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
*/
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