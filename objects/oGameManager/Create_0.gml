#macro MIN_LAYER_ALPHA 0.5
#macro GHOST_TILE_LAYER "GhostTiles"
#macro LIVING_TILE_LAYER "LivingTiles"

//win conditions
global.isLivingCat = true;
global.currFishesCollected = 0;
global.totalFishesInLevel = 0;

global.isPause = false; // do not let player have any input
global.playSound = true;
if (instance_exists(oCurrProgressTracker)) {
	global.playSound = global.soundActived;
}

global.isObjectiveMenuOpen = false;

//tile related graphics
global.ghostTile_alpha = global.isLivingCat ? MIN_LAYER_ALPHA : 1;
global.livingTile_alpha = global.isLivingCat ? 1 : MIN_LAYER_ALPHA;

ghostTile_alphaHandler = shader_get_uniform(shader_ChangeAlphaGhost, "alpha");
livingTile_alphaHandler = shader_get_uniform(shader_ChangeAlphaLiving, "alpha");


DEATH_TIMER_PAUSE = 1
currentDeathResetTimer = -1