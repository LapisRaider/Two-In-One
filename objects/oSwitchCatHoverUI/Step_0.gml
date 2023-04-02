x = catObjectToFollow.x + xOffset;
y = catObjectToFollow.y + yOffset;

if ((catObjectToFollow == oGhostCat && !global.isLivingCat) 
	|| (catObjectToFollow == oLivingCat && global.isLivingCat))
	image_alpha = 0;
else
	image_alpha = 1;