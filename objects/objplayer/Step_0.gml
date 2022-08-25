// Physics
event_inherited();

// Cursor
cursor_sprite = sprCursor;
window_set_cursor(cr_none);

// Input
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var space = keyboard_check_pressed(vk_space);
var left_mouse_hold = mouse_check_button(mb_left);
var escape = keyboard_check_pressed(vk_escape);

// Exit Game
if (escape) game_end();

// Direction
var xDirection = right - left;
var yDirection = down - up;

// Acceleration
var xAdd = xDirection * xAcceleration;
var yAdd = yDirection * yAcceleration;

// Deceleration
var xSub = min(xDeceleration, abs(xSpeed)) * sign(xSpeed) * (xDirection == 0);
var ySub = min(yDeceleration, abs(ySpeed)) * sign(ySpeed) * (yDirection == 0);

// Speed Calculation
xSpeed = clamp(xSpeed + xAdd - xSub, -xSpeedLimit, xSpeedLimit);
ySpeed = clamp(ySpeed + yAdd - ySub, -ySpeedLimit, ySpeedLimit);

// Speed Normalization
if !(xSpeed == 0 && ySpeed == 0) {
	var distance = sqrt(sqr(xSpeed) + sqr(ySpeed));
	var minDistance = min(moveSpeed, distance);
	xSpeed = (xSpeed / distance) * minDistance;
	ySpeed = (ySpeed / distance) * minDistance;
}

// Interaction
pushForce = 1;

// Jumping
if (space && currentJump < maxJump) {
	zSpeed = jumpSpeed;
	currentJump += 1;
	jumping = true;
}

// Landing
if (z + zSpeed <= zFloor) {
	currentJump = 0;
	jumping = false;
}

// Immunity
if (alarm[1] > 0) {
	immunityOn = true;
	image_alpha = 0.75;
} else {
	immunityOn = false;
	image_alpha = 1;
}

// On Hit
if (instance_place(x, y - z, objEnemyAttackParent) && !immunityOn) {
	var attack = instance_place(x, y - z, objEnemyAttackParent);
	if (attack.z >= z && attack.z <= zHeight) {
		immunityOn = true;
		currentHealth -= attack.damage;
		var xKnockback = lengthdir_x(attack.knockback, attack.direction - 180);
		var yKnockback = lengthdir_y(attack.knockback, attack.direction - 180);
		xSpeed += xKnockback;
		ySpeed += yKnockback;
		instance_destroy(attack);
		alarm[1] = (room_speed * immunityTime);
		alarm[2] = (room_speed * healthRegenCooldown);
	}
}

// Death
if ((currentHealth <= 0 || z <= -512) && !dead) {
	dead = true;
	alarm[2] = (room_speed * healthRegenCooldown);
	alarm[3] = (room_speed * respawnTime);
	instance_create_depth(x, y - z, -16000, objDeathScreen);
}
if (dead) {
	currentHealth = 0;
	xSpeed = 0;
	ySpeed = 0;
	zSpeed = 0;
	image_alpha = 0;
}

// Respawn
if (alarm[3] < 0 && dead) {
	currentHealth = maxHealth;
	dead = false;
	respawning = false;
	immunityOn = true;
	alarm[1] = (room_speed * immunityTime);
	x = xstart;
	y = ystart;
	z = 0;
	image_alpha = 1;
}

// Health Cap
if (currentHealth > maxHealth) {
	currentHealth = maxHealth;
}

// Health Regen
if (currentHealth < maxHealth && alarm[2] < 0) {
	currentHealth += healthRegen;
}

// Attack Input
if (left_mouse_hold) {
	attacking = true;
} else {
	attacking = false;
}

// Attacking
if (attacking && canAttack) {
	canAttack = false;
	playerAttack();
	alarm[0] = (room_speed * attackRate);
}

// Depth
if (z < 0) {
	// Always draw Player above voids (less than or equal to 0 depth)
	// Draw Player below tiles when z < 0 (greater than 100 depth)
	// This is problematic because both cannot be true at once
} else {
	depth = -100;
}

// Camera
var cameraX = camera_get_view_x(global.Cameras[0]);
var cameraY = camera_get_view_y(global.Cameras[0]);
var targetX = x - CameraWidth / 2;
var targetY = y - z - CameraHeight / 2;
targetX = clamp(targetX, 0, room_width - CameraWidth);
targetY = clamp(targetY, 0, room_height - CameraHeight);
cameraX = clamp(targetX, 0, room_width - CameraWidth);
cameraY = clamp(targetY, 0, room_height - CameraHeight);
camera_set_view_pos(global.Cameras[0], cameraX, cameraY);