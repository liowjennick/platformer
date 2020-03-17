/// @description Insert description here
// You can write your code in this editor

if (hp <= 0) {
	with (instance_create_layer(x, y, layer, oDead)) {
		direction = other.hitfrom;
		horizontal_speed = lengthdir_x(3, direction);
		vertical_speed = lengthdir_y(3, direction) - 4;
		image_xscale = sign(horizontal_speed);
	}
	ScreenShake(6, 10)

	instance_destroy();
}
