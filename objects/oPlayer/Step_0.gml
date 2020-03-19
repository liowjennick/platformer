/// @description Insert description here
// You can write your code in this editor

if (hascontrol) {
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space);

	if (key_left) || (key_right) || (key_jump) {
		controller = 0;
	}

	if (abs(gamepad_axis_value(0, gp_axislh) > 0.2)) {
		key_left = abs(min(gamepad_axis_value(0, gp_axislh), 0));
		key_right = max(gamepad_axis_value(0, gp_axislh), 0);
		controller = 1;
	}

	if (gamepad_button_check_pressed(0, gp_face1)) {
		key_jump = 1;
		controller = 1;
	}

	// Calculate movement
	var move = key_right - key_left;

	horizontal_speed = move * walk_speed;
	vertical_speed = vertical_speed + grav;

	// Jump
	if (place_meeting(x, y + 1, oWall)) && (key_jump) {
		vertical_speed = -3;
	}

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
		while (!place_meeting(x, y + sign(vertical_speed), oWall)) {
			y = y + sign(vertical_speed);
		}
		vertical_speed = 0;
	}

	y = y + vertical_speed;

	// Animation
	// check if not touching ground
	if (!place_meeting(x, y + 1, oWall)) {
		sprite_index = sPlayerA;
		image_speed = 0;
	
		// falling down sprite
		if (sign(vertical_speed) > 0) {
			image_index = 1;
		} else {
			image_index = 0;
		}
	} else {
		image_speed = 1;
		// idle
		if (sprite_index == sPlayerA) {
			audio_play_sound(snLanding, 7, false);
		}

		if (horizontal_speed == 0) {
			sprite_index = sPlayer;
		} else {
			// running
			sprite_index = sPlayerR;
		}
	}

	// change direction depending on movement
	if (horizontal_speed != 0) {
		image_xscale = sign(horizontal_speed);
	}
} else {
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}

