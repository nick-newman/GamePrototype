// No Physics Inheritance

// Hit Detection
if (instance_place(x, y, objAttackParent)) {
	var attack = instance_place(x, y, objAttackParent);
	if (attack.z >= z && attack.z <= zHeight) {
		instance_destroy(attack);
	}
}