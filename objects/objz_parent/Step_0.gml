if (instance_place(x, y, objAttackParent)) { // TODO: include z/zheight
	var attack = instance_place(x, y, objAttackParent);
	instance_destroy(attack);
}