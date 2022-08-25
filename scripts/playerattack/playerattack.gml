function playerAttack() {
	switch (currentWeapon) {
		case 0: // No Weapon
			attackRate = -1;
			break;
		case 1: // Type 1
			attackRate = 0.5;
			var attack = instance_create_depth(x, y - z - sprite_height / 4, depth, objAttackBullet);
			attack.direction = point_direction(x, y - z - sprite_height / 4, mouse_x, mouse_y) + irandom_range(-1, 1);
			attack.image_angle = attack.direction;
			attack.speed = 6;
			attack.creator = id;
			attack.z = z + sprite_height / 4;
			break;
		case 2: // Type 2
			attackRate = 0.25;
			var attack = instance_create_depth(x, y - z - sprite_height / 4, depth, objAttackBullet);
			attack.direction = point_direction(x, y - z - sprite_height / 4, mouse_x, mouse_y) + irandom_range(-16, 16);
			attack.image_angle = attack.direction;
			attack.speed = 6;
			attack.creator = id;
			attack.z = z + sprite_height / 4;
			break;
		case 3: // Type 3
			attackRate = 1;
			var attack = instance_create_depth(x, y - z - sprite_height / 4, depth, objAttackBullet);
			attack.direction = point_direction(x, y - z - sprite_height / 4, mouse_x, mouse_y);
			attack.image_angle = attack.direction;
			attack.speed = 9;
			attack.creator = id;
			attack.z = z + sprite_height / 4;
			break;
		case 4: // Type 4
			//on collision with a wall, change direction based on the angle of entrance
			//on collision with other attacks, destroy both/one/slow it/freeze it
			//draw z arc while travelling
			//after a certain lifetime/alarm, change direction by 180deg
			//accelerate/decelerate
			//split into more
			//rotate
			//pierce infinite/max num
			//increase size/dmg/kb at stages based on lifetime
			//homing/slight
			//reflect/parry
			//airblast
			//recoil propels player
			//flame/particle
			//aoe/explosive
			break;
	}
}