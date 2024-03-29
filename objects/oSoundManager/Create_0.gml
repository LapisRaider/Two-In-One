#macro BGM_PRIORITY 5
#macro SOUND_SFX_PRORITY 8
#macro SCENE_SFX_PRIORITY 7
#macro UNDO_SOUND_SFX_PRIORITY 10

global.sfxVol = 1
playSound = true;
if (instance_exists(oGameManager)) {
	playSound = global.playSound;
} else if (instance_exists(oCurrProgressTracker)) {
	playSound = global.soundActived;
}

//sfx to play
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
playBoxDropOnFloor = false

playLeaveSound = false;
playPressedSound = false;
playSwapCat = false

playUIbuttonPressed = false

// looping sfx
playPushCrate = false
pushCrateInstance = noone;

playSlidingPlatformMoving = false
slidingPlatformInstance = noone;

playTypingText = false
typingTextInstance = noone