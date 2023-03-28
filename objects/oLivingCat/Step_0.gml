moveDir = 0;
var isPressJump = false;

if (global.isLivingCat && !isDead && !oGhostCat.isDead) {
	moveDir = keyboard_check(vk_right) - keyboard_check(vk_left); //don't let player move if press both keys
	isPressJump = keyboard_check_pressed(vk_space);
	show_debug_message(moveDir);
}

UpdateMovement(moveDir, isPressJump);
UpdateTracker(moveDir, isPressJump);


if (isDead) {
	DyingBehavior();
	return;
} else {
	UpdateAnim(moveDir);
}
