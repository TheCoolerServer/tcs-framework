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
private _adminIds = [
	"76561198038553572", // Hingle
	"76561198028549221", // Lucas
	"76561197992043612", // Science
	"76561197981421300", // Metkill
	"76561197997429145", // M16
	"76561197982851011", // Dumbname
	"76561198042629560" // Pliskin
];
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

// Setup the server FPS debug marker


["TCS_evt_serverFPSUpdate", {
	params ["_fps", "_localUnitCount", "_localGroupCount"];
	private _markerType = "mil_circle";
	private _markerColor = "ColorGreen";

	if (_fps < 30) then {
		_markerType = "mil_warning";
		_markerColor = "ColorYellow";
	};

	if (_fps < 15) then {
		_markerColor = "ColorRed";
	};

	TCS_var_serverFPSMarker setMarkerColorLocal _markerColor;
	TCS_var_serverFPSMarker setMarkerTypeLocal _markerType;
	TCS_var_serverFPSMarker setMarkerTextLocal format ["FPS: %1, %2 local groups, %3 local units", _fps, _localGroupCount, _localUnitCount];
}] call CBA_fnc_addEventHandler;
