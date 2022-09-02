// Returns an array containing the nearest Solids above and below the Player
function instance_place_z(_x, _y, _z, _object) {
	var _collisionList = get_collision_ds_list();
	var _collisionCount = instance_place_list(_x, _y, _object, _collisionList, false);
	var _instanceArray = [noone, noone];
	for (var i = _collisionCount - 1; i >= 0; i--) {
		if (_z >= _collisionList[| i].z) {
			if (_instanceArray[0] != noone) {
				if (_collisionList[| i].z > _instanceArray[0].z) {
					_instanceArray[0] = _collisionList[| i];
				}
			} else {
				_instanceArray[0] = _collisionList[| i];
			}
		} else {
			if (_instanceArray[1] != noone) {
				if (_collisionList[| i].z < _instanceArray[1].z) {
					_instanceArray[1] = _collisionList[| i];
				}
			} else {
				_instanceArray[1] = _collisionList[| i];
			}
		}
	}
	return _instanceArray;
}