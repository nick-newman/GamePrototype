function z_collision(_z, _instance) {
	if (_z >= _instance.z && _z < _instance.zHeight) {
		return true;
	}
	return false;
}
