/// @description Insert description here
// You can write your code in this editor
if (done == 0) {
	vertical_speed = vertical_speed + grav;

	// Horizontal Collision
	if (place_meeting(x + horizontal_speed, y, oWall)) {
		while (!place_meeting(x + sign(horizontal_speed), y, oWall)) {
			x = x + sign(horizontal_speed);
		}
		horizontal_speed = 0;
	}

	x = x + horizontal_speed;

	// Vertical Collision
	if (place_meeting(x, y + vertical_speed, oWall)) {
		if (vertical_speed > 0) {
			done = 1;
			image_index = 1;
		}

		while (!place_meeting(x, y + sign(vertical_speed), oWall)) {
			y = y + sign(vertical_speed);
		}
		vertical_speed = 0;
	}

	y = y + vertical_speed;
}
