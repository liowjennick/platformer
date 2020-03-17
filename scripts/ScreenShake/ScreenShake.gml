/// @desc ScreenShake(magnitude, frames)
/// @arg Magnitude sets magnitude of the shake (radius in pixels)
/// @arg Frames sets the length of the shake in frames (60 - 1 second at 60fps)

with (oCamera) {
	if (argument[0] > shake_remain) {
		shake_magnitude = argument[0];
		shake_remain = argument[0];
		shake_length = argument[1];	
	}
}