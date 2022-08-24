function ground_z_get(_x, _y) {

#macro GROUND 0

	if (_x == undefined) _x = x;
	if (_y == undefined) _y = y;
/*
	with (collision_point(_x, _y, obj_ramp_parent, false, true))
	{
		if (upDirection == compass.east)
			return clamp(other.bbox_right - bbox_left + z + 1, z, z + height);
		else if (upDirection == compass.west)
			return clamp(bbox_right - other.bbox_left + z + 1, z, z + height);
		else if (upDirection == compass.north)
			return clamp(bbox_bottom - other.bbox_top + z + 2, z, z + height);
	}
*/	
	var _groundZ = null;
	var _list = ds_list_create();
	var _count = instance_place_list(_x, _y, objZ_Parent, _list, false);
	for (var i = 0; i < _count; i++)
	{
		var _objZ = _list[| i];		
		if (id != _objZ.id && (!variable_instance_exists(id, "collisionMask") || collisionMask != _objZ.id))
		{
			with(_objZ)
				if (_groundZ == null || zHeight > _groundZ)
					_groundZ = zHeight;
		}
	}
	if (_groundZ == null)
		_groundZ = GROUND;
/*
	var _northZInstance = -1;	
	_count = collision_line_list(x, y + 5, x, bbox_top, objZ_Parent, false, true, _list, false);	
	if (_count == 1)
		_northZInstance = _list[| i];
	else if (_count > 1)
		for (var i = 0; i < _count; i++)
			with(_list[| i])
				if (_northZInstance == -1 || z + height > _northZInstance.z + _northZInstance.height)
					_northZInstance = _list[| i];
	ds_list_destroy(_list);		
	var _northZ = _northZInstance <= 0 ? GROUND : _northZInstance.z + _northZInstance.height;
		
	var _southZInstance = collision_point(x, y + 6, objZ_Parent, false, true);
	var _southZ = _southZInstance <= 0 ? GROUND : _southZInstance.z + _southZInstance.height;
				
	var _min = min(_northZ, _southZ);
	var _max = max(_northZ, _southZ);
	
	if (_min != _max && z == _max && _southZ == _min && _southZ != _northZ
	 && collision_line(_x, _y, _x, _y + 7, obj_ramp_north_16, false, true) == null)
	{		
		var _targetY = y + 7 & (-8); //round up to nearest 8
		var _diff = _targetY - y;
		y = _targetY;
		
		var _conveyorTile = tile_get_at_point("Conveyor", x, y - z);
		if(_conveyorTile == null || tile_get_empty(_conveyorTile))
			z += _diff;
				
		_groundZ = _min;
		
		if (variable_instance_exists(id, "moveDirection") && moveDirection > 0 && moveDirection < 180)
			moveSpeed = 0;
	}
	
	if (variable_instance_exists(id, "state") && state == STATE_DIVE)
		_groundZ -= height;
*/
	return _groundZ;
}