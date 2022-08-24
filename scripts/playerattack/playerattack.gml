function playerAttack() {
	switch (currentWeapon) {
		case 0: // No Weapon
			attackRate = -1;
			break;
		case 1: // Pistol
			attackRate = 0.5;
			var attack = instance_create_depth(x, y - z, depth, objAttackBullet);
			attack.direction = point_direction(x, y - z, mouse_x, mouse_y - z) + irandom_range(-1, 1);
			attack.image_angle = attack.direction;
			attack.speed = 7;
			attack.creator = id;
			break;
		case 2: // Shotgun
			attackRate = 1;
			break;
	}
}