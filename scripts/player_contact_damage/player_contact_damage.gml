function player_contact_damage() {
	if (z_collision(z, objPlayer) && !objPlayer.immunityOn) {
		objPlayer.immunityOn = true;
		objPlayer.currentHealth -= contactDamage;
		//var xKnockback = lengthdir_x(contactKnockback, attack.direction - 180);
		//var yKnockback = lengthdir_y(contactKnockback, attack.direction - 180);
		//objPlayer.xSpeed += xKnockback;
		//objPlayer.ySpeed += yKnockback;
		objPlayer.alarm[1] = (room_speed * objPlayer.immunityTime);
		objPlayer.alarm[2] = (room_speed * objPlayer.healthRegenCooldown);
	}
}