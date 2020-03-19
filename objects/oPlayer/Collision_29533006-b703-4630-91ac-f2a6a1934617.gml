/// @description Insert description here
// You can write your code in this editor

if (can_be_damage) {
	with (other) {
		other.hitfrom = point_direction(x, y, other.x, other.y);
	}
	hp -= 1;
}