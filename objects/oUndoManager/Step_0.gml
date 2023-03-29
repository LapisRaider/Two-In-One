function UpdateUI() {
	var currUndoData = head;
	for (var i = 0; i < sizeCounter; ++i;) {
		var uiIconInst = instance_find(oUndoState, i);
		if (uiIconInst == noone) {
			continue;
		}
		
		uiIconInst.ChangeSprite(undoTracker[currUndoData].moveDone, undoTracker[currUndoData].isLivingCat);
		currUndoData += 1;
		currUndoData = currUndoData % MAX_QUEUE_AMT;
	}
	
	//the remaining
	for (var i = sizeCounter; i < MAX_QUEUE_AMT; ++i;) {
		var uiIconInst = instance_find(oUndoState, i);
		
		uiIconInst.ChangeSprite(noone, noone, false);
	}
}

function StartTrack(moveDone) {
	if (lastMove == moveDone) {
		return;
	}
	
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
		var ghostFish = new FishData(fish.x, fish.y, fish.image_xscale, fish.image_yscale, i, fish.showCollectText);
		ds_list_add(dataToTrack.ghostFishes, ghostFish);
	}
	
	dataToTrack.livingFishes = ds_list_create();
	for (var i = 0; i < instance_number(oLivingFish); ++i;) {
		var fish = instance_find(oLivingFish, i);
		var livingFish = new FishData(fish.x, fish.y, fish.image_xscale, fish.image_yscale, i, fish.showCollectText);
		ds_list_add(dataToTrack.livingFishes, livingFish);
	}
	
	dataToTrack.boxes = ds_list_create();
	for (var i = 0; i < instance_number(oBox); ++i;) {
		var box = instance_find(oBox, i);
		var boxData = new BoxData(box.x, box.y, i);
		ds_list_add(dataToTrack.boxes, boxData);
	}
	
	dataToTrack.gates = ds_list_create();
	for (var i = 0; i < instance_number(oGateParent); ++i;) {
		var gate = instance_find(oGateParent, i);
		var gateData = new GateData(gate.x, gate.y, gate.isOpen, i);
		ds_list_add(dataToTrack.gates, gateData);
	}
	
	dataToTrack.enemies = ds_list_create();
	for (var i = 0; i < instance_number(oEnemy); ++i;) {
		var enemy = instance_find(oEnemy, i);
		var enemyData = new EnemyData(enemy.x, enemy.y, enemy.isAttacking, i);
		ds_list_add(dataToTrack.enemies, enemyData);
	}
	
	dataToTrack.moveDone = moveDone;
	dataToTrack.isLivingCat = global.isLivingCat;
	
	//if data structure is full, remove the earliest and put in the latest
	sizeCounter += 1;
	if (sizeCounter > MAX_QUEUE_AMT) {
		sizeCounter = MAX_QUEUE_AMT;
		head += 1;
		head = head % MAX_QUEUE_AMT;
	}
	
	tail += 1;
	tail = tail % MAX_QUEUE_AMT;
	undoTracker[tail] = dataToTrack;

	
	UpdateUI();
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
		var fish = ds_list_find_value(dataToTrack.ghostFishes, i);
		var ghostFish = instance_find(oGhostFish, fish.objId);
		if (ghostFish == noone) {
			var inst = instance_create_layer(fish.xPos, fish.yPos, "Instances", oGhostFish);
			inst.image_xscale = fish.scaleX;
			inst.image_yscale = fish.scaleY;
			inst.showCollectText = fish.showCollectText;
		}
	}
	
	for (var i = 0; i < ds_list_size(dataToTrack.livingFishes); ++i;) {
		var fish = ds_list_find_value(dataToTrack.livingFishes, i);
		var livingFish = instance_find(oLivingFish, fish.objId);
		if (livingFish == noone) {
			var inst = instance_create_layer(fish.xPos, fish.yPos, "Instances", oLivingFish);
			inst.image_xscale = fish.scaleX;
			inst.image_yscale = fish.scaleY;
			inst.showCollectText = fish.showCollectText;
		}
	}
	
	for (var i = 0; i < ds_list_size(dataToTrack.enemies); ++i;) {
		var enemyData = ds_list_find_value(dataToTrack.enemies, i);
		var enemy = instance_find(oEnemy, enemyData.objId);
		enemy.x = enemyData.xPos;
		enemy.y = enemyData.yPos;
		enemy.isAttacking = enemyData.isAttacking;
	}
	
	for (var i = 0; i < ds_list_size(dataToTrack.gates); ++i;) {
		var gateData = ds_list_find_value(dataToTrack.gates, i);
		var gate = instance_find(oGateParent, gateData.objId);
		gate.x = gateData.xPos;
		gate.y = gateData.yPos;
		gate.isOpen = gateData.isOpen;
	}
	
	global.isLivingCat = dataToTrack.isLivingCat;
	InitSwapCat();
	
	if (oLivingCat.isDead || oGhostCat.isDead) {
		oGameManager.UndoWhenDead();
	}
	
	delete dataToTrack;
	undoTracker[tail] = noone;
	tail -= 1;
	sizeCounter -= 1;
	if (tail < 0 and sizeCounter > 0) {
		tail = MAX_QUEUE_AMT;
	}
	
	UpdateUI();
}


// check if players press undo
if (keyboard_check_pressed(ord("U"))) {
	PopLast();
}