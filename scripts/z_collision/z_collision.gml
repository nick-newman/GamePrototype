function z_collision(_instance, _z) {
	if (_z < _instance.zHeight && _z >= _instance.z) {
		return true;
	}
	return false;
}