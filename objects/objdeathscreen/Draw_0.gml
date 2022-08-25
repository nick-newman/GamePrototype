// Background
draw_sprite_ext(sprDeathScreen, image_index, objPlayer.x, objPlayer.y - objPlayer.z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

// Death Message
if (image_alpha == 1) {
	//draw_text(objPlayer.x - 25, objPlayer.y - 25, "You died");
}