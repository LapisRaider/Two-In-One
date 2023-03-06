#macro WALKING_ANIM_NAME sLivingCat_Walking
#macro IDLE_ANIM_NAME sLivingCat_Idle
#macro SPEED 1


/// @description Insert description here
// You can write your code in this editor
if (keyboard_check(vk_right)) {
	x += SPEED;
	sprite_index = WALKING_ANIM_NAME;
	image_xscale = 1;
}
else if (keyboard_check(vk_left)) {
	x -= SPEED;
	sprite_index = WALKING_ANIM_NAME;
	image_xscale = -1;
}
else {
	sprite_index = IDLE_ANIM_NAME;
}