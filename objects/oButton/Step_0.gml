var isGhostPressed = place_meeting(x, y, oGhostCat);
var isLivingPressed = place_meeting(x,y, oLivingCat);
var isBoxPressed = place_meeting(x,y, oBox);

var isPressed = isGhostPressed || isLivingPressed || isBoxPressed;
image_index = isPressed;

if (inst_gate != undefined)
	inst_gate.isOpen = isPressed;
	
