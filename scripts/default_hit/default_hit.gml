function default_hit() {
	if (instance_place(x, y, objAttackParent)) {
		var attack = instance_place(x, y, objAttackParent);
		if (attack.z >= z && attack.z <= zHeight && attack.id != id) {
			instance_destroy(attack);
		}
	}
}