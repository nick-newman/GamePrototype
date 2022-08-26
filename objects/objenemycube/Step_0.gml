// Physics
event_inherited();
// crashes if touching the Player

// Aggression
if (distance_to_object(objPlayer) < 640) {
	if (canJump && !jumping) {
		zSpeed = jumpSpeed;
		jumping = true;
		var targetDir = point_direction(x, y, objPlayer.x + objPlayer.xSpeed * random_range(16, 32), objPlayer.y + objPlayer.ySpeed * random_range(16, 32));
		//var targetLen = distance_to_point(objPlayer.x, objPlayer.y) / random_range(24, 40) + random_range(0.3, 0.9);
		var targetLen = random_range(2, 4);
		//xSpeed = lengthdir_x(targetLen, targetDir);
		//ySpeed = lengthdir_y(targetLen, targetDir);
		alarm[0] = (room_speed * random_range(0.6, 1.2));	// Jump Cooldown Time
	}
}

// Jump Cooldown
if (alarm[0] < 0) {
	canJump = true;
} else {
	canJump = false;
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

depth = -1000;