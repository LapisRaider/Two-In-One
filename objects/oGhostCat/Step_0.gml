var moveDir = 0;
var isPressJump = false;

if (!global.isLivingCat) {
	moveDir = keyboard_check(vk_right) - keyboard_check(vk_left); //don't let player move if press both keys
	isPressJump = keyboard_check_pressed(vk_space);
}


UpdateMovement(moveDir, isPressJump);
UpdateAnim(moveDir);
