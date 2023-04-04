var timerConditionFufilled = true;
var deathCondFufilled = true;

if (useTimer) {
	var timePassed = current_time - oLevelTracker.startRoomTime;
	if (timePassed < timeSinceLevelStart) {
		timerConditionFufilled = false;
	}
}

if (useDeaths) {
	if (oLevelTracker.currDeathCounter < deathNumber) {
		deathCondFufilled = false;
	}
}


// Inherit the parent event
if ((deathCondFufilled && useDeaths) || (timerConditionFufilled && useTimer))
	event_inherited();

