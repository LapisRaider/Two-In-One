var ghostLayerId = layer_get_id(GHOST_TILE_LAYER);
var livingLayerId = layer_get_id(LIVING_TILE_LAYER);

layer_shader(ghostLayerId, shader_ChangeAlphaGhost);
layer_shader(livingLayerId, shader_ChangeAlphaLiving);

InitSwapCat();