function PlaySoundNoOverlap(soundName, priority, loop, isPlay, sndInstance = noone) {
	if (!isPlay || !global.playSound)
		return;
		
	var snd = sndInstance;
	
	// only if the sound effect is not playing, then play sound
	if (!audio_is_playing(sndInstance)) {
		snd = audio_play_sound(soundName, priority, loop);
		//audio_sound_gain(snd, global.sfxVol * soundName.volume, 0)
	}
	
	return snd;
}

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

//reset non-looping sfx variables
playEnemyHitSound = false
playFallPitfall = false
playFinishLevel = false
playJump = false
playPickup = false
playSpikeHit = false

// play looping sfx