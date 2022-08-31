// Shadow
draw_sprite_ext(sprShadow, image_index, x, y - zFloor, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

// Sprite
draw_sprite_ext(sprite_index, image_index, x, y - z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

// Testing
draw_set_font(fntInfo);
//draw_text(x + 100, y - 100, "X: " + string(x));
//draw_text(x + 100, y - 80, "Y: " + string(y));

//draw_sprite_ext(sprTrue, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

draw_text(x + 135, y - z - 160, "Health: " + string(currentHealth) + " / " + string(maxHealth));
draw_text(x + 135, y - z - 140, "xSpeed: " + string(xSpeed));
draw_text(x + 135, y - z - 120, "ySpeed: " + string(ySpeed));
//draw_text(x + 135, y - z - 100, "zFloor: " + string(zFloor));
draw_text(x + 135, y - z - 100, "Ground: " + string(grounded));
//draw_text(x + 135, y - z - 80, "Jump: " + string(currentJump));
draw_text(x + 135, y - z - 80, "Z: " + string(z));
//draw_text(x + 135, y - z - 60, "zSpeed: " + string(zSpeed));