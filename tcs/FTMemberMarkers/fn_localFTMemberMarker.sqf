/*
	Description:	
		Creates and handles the local fireteam marker for the given unit.

	Parameters:
		0 - (object) The unit that should be tracked

	Returns:
		None

	Example:
		[unit] call TCS_fnc_localFTMemberMarker;


*/
params ["_unit"];

private _markerName = Format ["mkr_%1",_unit];
private _markerborderName = Format ["mkrB_%1",_unit];

// this marker is slightly bigger and abused in such a way to make it seem like the next maker has a border
private _pos = getposATL _unit;
private _markerBorder = createMarkerLocal [_markerborderName,_pos];
_markerBorder setMarkerShapeLocal "ICON";
_markerBorder setMarkerTypeLocal "MIL_TRIANGLE";
_markerBorder setMarkerColorLocal "ColorBlack";
_markerBorder setMarkerSizeLocal [0.60, 0.60];
_markerBorder setMarkerDirLocal (direction _unit);

// This marker is the real marker
private _marker = createMarkerLocal [_markerName,_pos];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal "MIL_TRIANGLE";
_marker setMarkerColorLocal (_unit getvariable ["assignedTeam","ColorWhite"]);
_marker setMarkerSizeLocal [0.45, 0.45];
_marker setMarkerDirLocal (direction _unit);

// Start tracking the unit's position and rotation
while{alive _unit && (_unit in TCS_var_aliveFireteamMembers)} do {
	private _pos = getposATL _unit;
	private _dir = (direction _unit);

	if (alive _unit && {_unit in units group player}) then {
		_markerBorder setMarkerPosLocal _pos;
		_markerBorder setMarkerDirLocal _dir;
		_marker setMarkerPosLocal _pos;
		_marker setMarkerDirLocal _dir;

		_marker setMarkerColorLocal (_unit getvariable ["assignedTeam", "ColorWhite"]);
	} else {
		TCS_var_aliveFireteamMembers = TCS_var_aliveFireteamMembers - [_unit];
	};

	sleep 3;
};

//He's dead Jim, let's clear up obsolete markers
deleteMarkerLocal _markerBorder;
deleteMarkerLocal _marker;
