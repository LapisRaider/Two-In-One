function PlaySound(soundName, priority, loop, isPlay) {
	if (!isPlay || !global.playSound) 
		return;
	
	var snd = audio_play_sound(soundName, priority, loop)
	//audio_sound_gain(snd, global.sfxVol * soundName.volume, 0)
}

if (!global.playSound)
	return;


// play non-looping sfx
PlaySound(sound_hitEnemy, SOUND_SFX_PRORITY, false, playEnemyHitSound);
PlaySound(sound_fallPitfall, SOUND_SFX_PRORITY, false, playFallPitfall);
PlaySound(sound_finishLevel, SOUND_SFX_PRORITY, false, playFinishLevel);
PlaySound(sound_jump, SOUND_SFX_PRORITY, false, playJump);
PlaySound(sound_pickup, SOUND_SFX_PRORITY, false, playPickup);
PlaySound(sound_spike, SOUND_SFX_PRORITY, false, playSpikeHit);
PlaySound(sound_unlockDoor, SOUND_SFX_PRORITY, false, playUnlockDoor);

PlaySound(sound_buttonEnter, SOUND_SFX_PRORITY, false, playLeaveSound);
PlaySound(sound_buttonLeave, SOUND_SFX_PRORITY, false, playPressedSound);

PlaySound(sound_sceneOpen, SCENE_SFX_PRIORITY, false, playOpeningScene);
PlaySound(sound_sceneClose, SCENE_SFX_PRIORITY, false, playClosingScene);

PlaySound(sound_swapCat, SCENE_SFX_PRIORITY, false, playSwapCat);
PlaySound(sound_boxDrop, SCENE_SFX_PRIORITY, false, playBoxDropOnFloor);


//UI sounds
PlaySound(sound_undo, UNDO_SOUND_SFX_PRIORITY, false, playUndo);
PlaySound(sound_UIbuttonPressed, UNDO_SOUND_SFX_PRIORITY, false, playUIbuttonPressed);


//reset non-looping sfx variables
playEnemyHitSound = false
playFallPitfall = false
playFinishLevel = false
playJump = false
playPickup = false
playSpikeHit = false
playUndo = false
playOpeningScene = false
playClosingScene = false
playUnlockDoor = false

playUIbuttonPressed = false
playBoxDropOnFloor = false
playSwapCat = false

playLeaveSound = false;
playPressedSound = false;


// play looping sfx
if (!audio_is_playing(pushCrateInstance) && playPushCrate) {
	pushCrateInstance = audio_play_sound(sound_pushCrate, SOUND_SFX_PRORITY, false);
} else if (!playPushCrate) {
	audio_stop_sound(pushCrateInstance);
}

if (!audio_is_playing(slidingPlatformInstance) && playSlidingPlatformMoving) {
	slidingPlatformInstance = audio_play_sound(sound_slidingPlatform, SOUND_SFX_PRORITY, false);
} else if (!playSlidingPlatformMoving) {
	audio_stop_sound(slidingPlatformInstance);
}

if (!audio_is_playing(typingTextInstance) && playTypingText) {
	typingTextInstance = audio_play_sound(sound_typing, SOUND_SFX_PRORITY, false);
} else if (!playTypingText) {
	audio_stop_sound(typingTextInstance);
}

playPushCrate = false;
playTypingText = false
playSlidingPlatformMoving = false