function instance_place_3d(_x, _y, _z, _object) {
	var _collisionList = get_collision_ds_list();
	var _collisionCount = instance_place_list(_x, _y, _object, _collisionList, false);
	for (var i = _collisionCount - 1; i >= 0; i--) {
		var _instance = _collisionList[| i];
		if (z_collision(_z, _instance)) {
			return _instance.id;
		}
	}
	return noone;
}