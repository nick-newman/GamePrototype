// Physics
event_inherited();

// Aggression
if (distance_to_object(objPlayer) < 640) {
	if (canJump && !jumping) {
		zSpeed = jumpSpeed;
		canJump = false;
		jumping = true;
		var targetDir = point_direction(x, y, objPlayer.x + objPlayer.xSpeed * 16, objPlayer.y + objPlayer.ySpeed * 16);
		var targetLen = distance_to_point(objPlayer.x, objPlayer.y) / 32 + random_range(0.3, 0.9);
		xSpeed = lengthdir_x(targetLen, targetDir);
		ySpeed = lengthdir_y(targetLen, targetDir);
		alarm[0] = (room_speed * random_range(1, 1.5));
	}
}

// Landing
if (z + zSpeed <= zFloor) {
	xSpeed = 0;
	ySpeed = 0;
	zSpeed = 0;
	jumping = false;
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