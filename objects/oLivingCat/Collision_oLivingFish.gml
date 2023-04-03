with (other) {
	++global.currFishesCollected;
	oSoundManager.playPickup = true;
	instance_destroy();
}