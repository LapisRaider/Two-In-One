var isGhostPressed = place_meeting(x, y, oGhostCat);
var isLivingPressed = place_meeting(x,y, oLivingCat);

var isPressed = isGhostPressed || isLivingPressed;
image_index = isPressed;

if (inst_gate != undefined)
	inst_gate.isOpen = isPressed;
	
