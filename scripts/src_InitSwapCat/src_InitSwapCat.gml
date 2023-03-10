// called whenever cats are swap to init the world
function InitSwapCat(){
	var ghostCatAlpha = global.isLivingCat ? MIN_LAYER_ALPHA : 1;
	var livingCatAlpha = global.isLivingCat ? 1 : MIN_LAYER_ALPHA;
	
	ghostTile_alpha = livingCatAlpha;
	livingTile_alpha = ghostCatAlpha;
	
	oLivingCat.image_alpha = livingCatAlpha;
	if (instance_exists(oLivingFish))
		oLivingFish.image_alpha = livingCatAlpha;
	
	oGhostCat.image_alpha = ghostCatAlpha;
	if (instance_exists(oGhostFish))
		oGhostFish.image_alpha = ghostCatAlpha;
}