function instance_place_z(_x, _y, _z, _object) {
	var _collisionList = get_collision_ds_list();
	var _collisionCount = instance_place_list(_x, _y, _object, _collisionList, false);
	var _collisionListBelow = ds_list_create();
	
	// find all inst player is above
	for (var i = _collisionCount - 1; i >= 0; i--) {
		if (_collisionList[| i] <= _z) {
			ds_list_add(_collisionListBelow, _collisionList[| i]);
		}
		
	}
	
	var _collisionCountBelow = instance_place_list(_x, _y, _object, _collisionListBelow, false);
	var _instance = _collisionList[| _collisionCountBelow - 1];
	
	// then find the highest one
	for (var i = _collisionCountBelow - 1; i >= 0; i--) {
		if (_collisionListBelow[| i].zHeight > _instance.zHeight) {
			_instance = _collisionList[| i];
		}
	}

	return _instance.id;
}

/*
	if (_collisionList[| i].zHeight > _instance.zHeight) {
		_instance = _collisionList[| i];
	}
*/
	


	
	/*
	// not colliding top
	if (z > _instance.zHeight) { //maybe unnecessary, in case top/bot checks fail
	    zSpeed += gravityForce;
		grounded = false;
		//return noone;
	}
	
	
	if (z + zSpeed <= _instance.zHeight) {
		zSpeed = _instance.zSpeed;
	    z = _instance.zHeight;
		grounded = true;
	}
	*/
	
	// bot collis test
	/*
	if (zHeight + zSpeed >= _instance.z) {
		zSpeed = gravityForce;
		if (z < _instance.z) {
			z = _instance.z - zHeight;
		}
		grounded = false;
	}
	*/
	
	/*
	if (z + zSpeed <= _instance.zHeight) {
	    zSpeed = _instance.zSpeed;
	    z = _instance.zHeight;
		x += _instance.xSpeed;
		y += _instance.ySpeed;
		grounded = true;
		return _instance.id;
	}
	
	// bot collis test
	if (zHeight + zSpeed >= _instance.z) {
		if (sign(_instance.zSpeed) == -1) {
			zSpeed = _instance.zSpeed;
		} else {
			zSpeed = gravityForce;
		}
		return _instance.id;
	}
	*/