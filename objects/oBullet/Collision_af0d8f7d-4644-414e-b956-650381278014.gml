// applies to the enemy it touches
with (other) {
	hp = hp - 1;
	flash = 3;
	// other refers to bullet
	hitfrom = other.direction;
}

instance_destroy();