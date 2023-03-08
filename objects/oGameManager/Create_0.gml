#macro MIN_LAYER_ALPHA 0.5
#macro GHOST_TILE_LAYER "GhostTiles"
#macro LIVING_TILE_LAYER "LivingTiles"

//win conditions
global.isLivingCat = true;
global.currFishesCollected = 0;
global.totalFishesInLevel = 0;

//tile related graphics
ghostTile_alpha = global.isLivingCat ? MIN_LAYER_ALPHA : 1;
livingTile_alpha = global.isLivingCat ? 1 : MIN_LAYER_ALPHA;

ghostTile_alphaHandler = shader_get_uniform(shader_ChangeAlphaGhost, "alpha");
livingTile_alphaHandler = shader_get_uniform(shader_ChangeAlphaLiving, "alpha");