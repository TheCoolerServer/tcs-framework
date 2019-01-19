/*
	Description:
		Ends the mission on all connected clients.

	Parameters:
		0 - (number) Which ending should be displayed (One of the endings in the CfgDebriefings)
		1 - (boolean) Whether the ending is a win or not.

	Returns:
		None

	Example:
		[1, true] call TCS_fnc_mpEndReceiver;
*/

params [
	["_ending", 1, [0]],
	["_state", true, [true]]
];


if (isServer) then{
	sleep 3;
};

// ====================================================================================

switch (_ending) do{
	// Ending #1
	case 1:{};

	// Ending #2
	case 2:{};

	// Ending #3
	case 3:{};

	// Ending #4
	case 4:{};

	// Ending #5
	case 5:{};

	// Ending #6
	case 6:{};

	// Default
	default {};
};

//Grab the ending from CfgDebriefings based on the passed ending and end the mission
_ending = format ["end%1", _ending];
[_ending, _state] spawn BIS_fnc_endMission;

// Clients just "hang" if the mission has ended but are still inside the
// spectator script. Therefore we need to close any open dialogs.
if (dialog) then{
	closeDialog 0;
};
