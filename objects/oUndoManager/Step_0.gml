function StartTrack(moveDone) {
	if (lastMove == moveDone) {
		return;
	}
	
	show_debug_message("lastMove {0}", lastMove);
	show_debug_message("moveDone {0}", moveDone);
	
	lastMove = moveDone;
	if (lastMove == possibleMoves.NOTHING) {
		return;
	}

	
	var dataToTrack = new DataToTrack();
	
	dataToTrack.livingCat = new CatData(oLivingCat.x, oLivingCat.y, oLivingCat.moveDir);
	dataToTrack.ghostCat = new CatData(oGhostCat.x, oGhostCat.y, oGhostCat.moveDir);
	
	dataToTrack.ghostFishes = ds_list_create();
	for (var i = 0; i < instance_number(oGhostFish); ++i;) {
		var fish = instance_find(oGhostFish, i);
		var ghostFish = new FishData(fish.x, fish.y, i);
		ds_list_add(dataToTrack.ghostFishes, ghostFish);
	}
	
	dataToTrack.livingFishes = ds_list_create();
	for (var i = 0; i < instance_number(oLivingFish); ++i;) {
		var fish = instance_find(oLivingFish, i);
		var livingFish = new FishData(fish.x, fish.y, i);
		ds_list_add(dataToTrack.livingFishes, livingFish);
	}

	dataToTrack.moveDone = moveDone;
	dataToTrack.isLivingCat = global.isLivingCat;
	
	//if data structure is full, remove the earliest and put in the latest
	tail += 1;
	sizeCounter += 1;
	tail = tail % MAX_QUEUE_AMT;
	if (sizeCounter >= MAX_QUEUE_AMT) {
		sizeCounter = MAX_QUEUE_AMT;
		head += 1;
	}
	
	undoTracker[tail] = dataToTrack;
}

// pop the latest, if queue
function PopLast() {
	if (sizeCounter == 0) {
		return;
	}
	
	var dataToTrack = undoTracker[tail];
	oLivingCat.x = dataToTrack.livingCat.xPos;
	oLivingCat.y = dataToTrack.livingCat.yPos;
	oLivingCat.moveDir = dataToTrack.livingCat.moveDir;
	
	oGhostCat.x = dataToTrack.ghostCat.xPos;
	oGhostCat.y = dataToTrack.ghostCat.yPos;
	oGhostCat.moveDir = dataToTrack.ghostCat.moveDir;
	
	for (var i = 0; i < ds_list_size(dataToTrack.ghostFishes); ++i;) {
		var ghostFish = instance_find(oGhostFish, dataToTrack.ghostFishes[i].objId);
		if (ghostFish == noone) {
			instance_create_layer(dataToTrack.ghostFishes[i].x, dataToTrack.ghostFishes[i].y, "Instances", oGhostFish);
		}
	}
	
	for (var i = 0; i < ds_list_size(dataToTrack.livingFishes); ++i;) {
		var livingFish = instance_find(oLivingFish, dataToTrack.ghostFishes[i].objId);
		if (livingFish == noone) {
			instance_create_layer(dataToTrack.livingFishes[i].x, dataToTrack.livingFishes[i].y, "Instances", oLivingFish);
		}
	}
	
	delete dataToTrack;
	undoTracker[tail] = noone;
	tail -= 1;
	if (tail < 0) {
		tail = MAX_QUEUE_AMT - 1;
	}
	sizeCounter -= 1;
}

// check if players press undo
if (keyboard_check_pressed(ord("U"))) {
	PopLast();
}