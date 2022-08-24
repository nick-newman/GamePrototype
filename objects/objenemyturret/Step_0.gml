// Physics
event_inherited();

// Aggression
if (distance_to_object(objPlayer) <= 320) {
	if (canAttack) {
		canAttack = false;
		var attack = instance_create_depth(x, y - z, depth, objAttackTurret);
		attack.direction = point_direction(x, y, objPlayer.x, objPlayer.y - objPlayer.z);
		attack.image_angle = attack.direction;
		attack.speed = 5;
		attack.creator = id;
		alarm[0] = (room_speed * attackRate);
	}
}

// On Hit
if (instance_place(x, y - z, objPlayerAttackParent)) {
	var attack = instance_place(x, y - z, objPlayerAttackParent);
	currentHealth -= attack.damage;
	instance_destroy(attack);
}

// Death
if (currentHealth <= 0 || z <= -512) {
	instance_destroy();
}

// Health Cap
if (currentHealth > maxHealth) {
	currentHealth = maxHealth;
}