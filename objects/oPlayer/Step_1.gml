/// @description Insert description here
// You can write your code in this editor


if (hp <= 0) {
	hascontrol = false;
	
	with (oGun) {
		instance_destroy();
	}
	
	with (instance_create_layer(x, y, layer, oPlayerDead)) {
		direction = other.hitfrom;
		horizontal_speed = lengthdir_x(3, direction);
		vertical_speed = lengthdir_y(3, direction) - 6;
		image_xscale = sign(horizontal_speed);
		
		if (sign(horizontal_speed) != 0) {
			image_xscale = sign(horizontal_speed);
		}
	}

	ScreenShake(6, 10);
	
	instance_destroy();
}
