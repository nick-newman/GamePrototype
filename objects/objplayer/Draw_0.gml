// Shadow
draw_sprite_ext(sprPlayerShadow, image_index, x, y - zFloor, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

// Sprite
draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

// Testing
draw_text(x + 100, y - 160, "Z: " + string(z));
//draw_text(x + 100, y - 140, "zSpeed: " + string(zSpeed));
draw_text(x + 100, y - 120, "zFloor: " + string(zFloor));
//draw_text(x + 100, y - 100, "X: " + string(x));
//draw_text(x + 100, y - 80, "Y: " + string(y));
//draw_text(x + 100, y - 60, "xSpeed: " + string(xSpeed));
//draw_text(x + 100, y - 40, "ySpeed: " + string(ySpeed));
draw_text(x + 100, y - 20, "Health: " + string(currentHealth) + " / " + string(maxHealth));