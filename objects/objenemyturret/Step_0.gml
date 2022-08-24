// Physics
event_inherited();

// Aggression
if (distance_to_object(objPlayer) <= 320) {
	if (canAttack) {
		canAttack = false;
		var attack = instance_create_depth(x, y - z, depth, objAttackTurret);
		
		// Normal
		//attack.direction = point_direction(x, y, objPlayer.x, objPlayer.y - objPlayer.z);
		// Predictive
		attack.direction = point_direction(x, y, objPlayer.x + objPlayer.xSpeed * random_range(16, 32), objPlayer.y + objPlayer.ySpeed * random_range(16, 32));
		//Inaccurate
		//attack.direction = point_direction(x, y, objPlayer.x + random_range(-16, 16), objPlayer.y + random_range(-16, 16));
		
		attack.image_angle = attack.direction;
		attack.speed = 5;
		attack.creator = id;
		attack.z = z + sprite_height / 4;
		alarm[0] = (room_speed * attackRate);
	}
}

// On Hit
if (instance_place(x, y - z, objPlayerAttackParent)) {
	var attack = instance_place(x, y - z, objPlayerAttackParent);
	if (attack.z >= z && attack.z <= zHeight) {
		currentHealth -= attack.damage;
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