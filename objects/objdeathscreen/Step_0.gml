if (start) {
	image_alpha += 0.03;
}

if (start && image_alpha >= 1) {
	start = false;
	image_alpha = 1;
	alarm[0] = (room_speed * (objPlayer.respawnTime));
}

if (!start && alarm[0] < 0) {
	image_alpha -= 0.03;
}

if (!start && image_alpha <= 0) {
	instance_destroy();
}