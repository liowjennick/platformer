vertical_speed = vertical_speed + grav;

// Don't walk off edges
if (grounded) && (afraidOfHeights) && (!place_meeting(x + horizontal_speed, y + 1, oWall)) {
	horizontal_speed = -horizontal_speed;
}

// Horizontal Collision
if (place_meeting(x + horizontal_speed, y, oWall)) {
	while (!place_meeting(x + sign(horizontal_speed), y, oWall)) {
		x = x + sign(horizontal_speed);
	}
	horizontal_speed = -horizontal_speed;
}

x = x + horizontal_speed;

// Vertical Collision
if (place_meeting(x, y + vertical_speed, oWall)) {
	while (!place_meeting(x, y + sign(vertical_speed), oWall)) {
		y = y + sign(vertical_speed);
	}
	vertical_speed = 0;
}

y = y + vertical_speed;

// Animation
// check if not touching ground
if (!place_meeting(x, y + 1, oWall)) {
	grounded = false;
	sprite_index = sEnemyA;
	image_speed = 0;
	
	// falling down sprite
	if (sign(vertical_speed) > 0) {
		image_index = 1;
	} else {
		image_index = 0;
	}
} else {
	grounded = true;
	image_speed = 1;
	// idle
	if (horizontal_speed == 0) {
		sprite_index = sEnemy;
	} else {
		// running
		sprite_index = sEnemyR;
	}
}

// change direction depending on movement
if (horizontal_speed != 0) {
	image_xscale = sign(horizontal_speed) * size;
}

image_yscale = size;
