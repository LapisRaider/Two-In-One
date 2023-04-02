isDoorOpen = false
if (instance_exists(oCurrProgressTracker))
	isDoorOpen = global.maxLevel >= level;


if (!isDoorOpen) {
	image_alpha = doorLockAlpha;
	image_blend = doorLockColor;
}

if (lockObject != noone && isDoorOpen) {
	//remove the lock
	lockObject.image_alpha = 0;
}

if (textObject != noone && !isDoorOpen) {
	instance_destroy(textObject);
}
