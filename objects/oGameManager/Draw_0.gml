
shader_set(shader_ChangeAlphaGhost)
shader_set_uniform_f(ghostTile_alphaHandler, global.ghostTile_alpha);
shader_reset();

shader_set(shader_ChangeAlphaLiving)
shader_set_uniform_f(livingTile_alphaHandler, global.livingTile_alpha);
shader_reset();