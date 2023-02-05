/**
	Description:
		Initializes everything else that is needed for anyone that is logged in as an admin or has zeus
		access for the current mission.

	Parameters:
		None

	Returns:
		None
*/

private _start = time;
private _adminIds = getArray (missionConfig >> "enableDebugConsole");
private _isAdmin = (serverCommandAvailable "#kick") || ((getPlayerUID player) in _adminIds);

// systemChat format ["Server command available?: %1", (serverCommandAvailable "#kick")];
// systemChat format ["In list?: %1", ((getPlayerUID player) in _adminIds)];
// systemChat format ["Is admin?: %1", _isAdmin];

if (_isAdmin) exitWith {
	[] call TCS_fnc_briefing_admin;
};

// Isn't an admin but does he have access to zeus at the start of the game?
// getAssignedCuratorLogic and getAssignedCuratorUnit do not work properly on mission time 0
// and the mission time doesn't increase on the briefing screen, so we need to wait for the time
// to increase and then make sure we have a curator logic assigned to include the admin briefing
while {(time - _start) < 10} do {
	if (!isNull (getAssignedCuratorLogic player)) exitWith {
		_isAdmin = true;
	};
	sleep 1;
};

if (_isAdmin) exitWith {
	[] call TCS_fnc_briefing_admin;
};
