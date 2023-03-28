function CatData(_x, _y, _moveDir) constructor {
	xPos = _x;
	yPos = _y;
	moveDir = _moveDir;
};

//need to know whether it was alive prior to the undo
//if fish alive it'll be here
function FishData(_x, _y, _scaleX, _scaleY, _objId) constructor{
	xPos = _x;
	yPos = _y;
	scaleX = _scaleX;
	scaleY = _scaleY;
	objId = _objId;
}

function BoxData(_x, _y, _objId) constructor {
	xPos = _x;
	yPos = _y;
	objId = _objId;
}

enum possibleMoves {
	NOTHING = 0, 
	RIGHT,
	LEFT,
	JUMP,
}

function DataToTrack() constructor{
	livingCat = noone;
	ghostCat = noone;
	livingFishes = noone;
	ghostFishes = noone;
	boxes = noone;
	
	moveDone = possibleMoves.NOTHING;
	isLivingCat = true;
}

MAX_QUEUE_AMT = 5;
undoTracker = array_create(MAX_QUEUE_AMT, noone);
head = 0
tail = 0
sizeCounter = 0

lastMove = possibleMoves.NOTHING;
