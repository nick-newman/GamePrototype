// No Physics Inheritance
zHeight = z + heightValue;

// Aggression
if (distance_to_object(objPlayer) <= 320) {
	if (canAttack) {
		canAttack = false;
		var attack = instance_create_depth(x, y - z - sprite_height / 4, 100, objAttackTurret);
		// Normal
		attack.direction = point_direction(x, y - z - sprite_height / 4, objPlayer.x, objPlayer.y - objPlayer.sprite_height / 4);
		// Predictive
		//attack.direction = point_direction(x, y - z - sprite_height / 4, objPlayer.x + objPlayer.xSpeed * random_range(16, 32), objPlayer.y + objPlayer.ySpeed * random_range(16, 32));
		//Inaccurate
		//attack.direction = point_direction(x, y - z - sprite_height / 4, objPlayer.x + random_range(-16, 16), objPlayer.y + random_range(-16, 16));
		attack.image_angle = attack.direction;
		attack.speed = 5;
		attack.creator = id;
		attack.z = z + sprite_height / 4;
		alarm[0] = (room_speed * attackRate);
	}
}

// Hit Animation
if (alarm[1] > 0) {
	image_alpha = 0.75;
} else {
	image_alpha = 1;
}

// Hit Detection
if (instance_place(x, y - z, objPlayerAttackParent)) {
	var attack = instance_place(x, y - z, objPlayerAttackParent);
	if (attack.z >= z && attack.z <= zHeight) {
		currentHealth -= attack.damage;
		alarm[1] = (room_speed * 0.2);
		instance_destroy(attack);
	}
}

// Death
if (currentHealth <= 0 || z <= -512) {
	instance_destroy();
}

// Health Cap
if (currentHealth > maxHealth) {
	currentHealth = maxHealth;
}