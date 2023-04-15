// called whenever cats are swap to init the world
function InitSwapCat(){
	var ghostCatAlpha = global.isLivingCat ? MIN_LAYER_ALPHA : 1;
	var livingCatAlpha = global.isLivingCat ? 1 : MIN_LAYER_ALPHA;
	
	global.ghostTile_alpha = ghostCatAlpha;
	global.livingTile_alpha = livingCatAlpha;
	
	
	oLivingCat.image_alpha = livingCatAlpha;
	/*if (instance_exists(oLivingFish))
		oLivingFish.image_alpha = livingCatAlpha;*/
	
	oGhostCat.image_alpha = ghostCatAlpha;
	/*if (instance_exists(oGhostFish))
		oGhostFish.image_alpha = ghostCatAlpha; */
		
	layer_set_visible("GhostBackground",  !global.isLivingCat);
	layer_set_visible("LivingBackground",  global.isLivingCat);
}