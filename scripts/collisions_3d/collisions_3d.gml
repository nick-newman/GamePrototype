function collision_point_3d(_x, _y, _z, _object, _isPrecise, _shouldSkipSelf) {		
	var _collisionList = get_collision_ds_list();
	var _collisionCount = collision_point_list(_x, _y, _object, _isPrecise, _shouldSkipSelf, _collisionList, false);
	for (var i = _collisionCount - 1; i >= 0; i--)
	{
		var _instance = _collisionList[| i];
		if (has_z_collision(_instance, _z))
			return _instance.id;
	}
	return null;
}

function instance_place_3d(_x, _y, _z, _object) {		
	var _collisionList = get_collision_ds_list();
	var _collisionCount = instance_place_list(_x, _y, _object, _collisionList, false);
	for (var i = _collisionCount - 1; i >= 0; i--)
	{
		var _instance = _collisionList[| i];
		if (has_z_collision(_instance, _z))
			return _instance.id;
	}
	return null;
}

function place_meeting_3d(_x, _y, _z, _object) {	
	return instance_place_3d(_x, _y, _z, _object) != null;
}

function has_z_collision(_collider, _z) {
	if (!instance_exists(_collider)) return false;
	
	var _colliderBottom = _collider.z;
	var _colliderTop = _colliderBottom + _collider.height;
	
	return (_z >= _colliderBottom && _z < _colliderTop)
		|| (_z + height >= _colliderBottom && _z + height < _colliderTop);
}

function get_collision_ds_list() {
	if (!variable_instance_exists(id, "collisionList") || !ds_exists(collisionList, ds_type_list))
		collisionList = ds_list_create();
		
	if (!ds_list_empty(collisionList))
		ds_list_clear(collisionList);
		
	return collisionList;
}

function tile_and_place_meeting_3d(_x, _y, _z, _object, _tileLayer) {
	return tile_meeting_precise(_x, _y - ground_z_get(), _tileLayer) || instance_place_3d(_x, _y, _z, _object) != null;
}

function tile_meeting_ground(_x, _y, _z, _tileLayer) {
	var _tile = tile_get_at_point(_tileLayer, _x, _y - _z - (variable_instance_exists(id, "state") && state == STATE_DIVE ? 16 : 0));
	return _tile != null && !tile_get_empty(_tile) && z <= ground_z_get();
}

function has_water_collision() {
	var _centerX = center_x_bbox(id);
	var _centerY = center_y_bbox(id);
	return ((tile_meeting_ground(_centerX, _centerY, z, "Water")
		|| global.currentTime == timeType.day && tile_meeting_ground(_centerX, _centerY, z, "Water_Day")
		|| collision_point_3d(_centerX, _centerY, z + height, water_obj, false, true)
		) && !place_meeting_3d(x, y, z, bridge_obj));
}