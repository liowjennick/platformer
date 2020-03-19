/// @description Insert description here
// You can write your code in this editor

audio_play_sound(snDeath, 12, false);

horizontal_speed = 0;
vertical_speed = 0;
grav = 0.3;
done = 0;

image_speed = 0;

game_set_speed(30, gamespeed_fps);

with (oCamera) {
	follow = other.id;
}