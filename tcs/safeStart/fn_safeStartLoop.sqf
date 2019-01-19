/*
	Description:	
		Safe start loop that keeps track of when safe start should be enabled and disabled.
		Must be run on the server.

	Parameters:
		None

	Returns:
		None

	Example:
		[] spawn TCS_fnc_safeStartLoop;
*/

if !(isServer) exitWith {};

while {TCS_param_safeStartTime > 0} do {
	// Broadcast remaining time to players
	["SafeStart", [format ["Time Remaining: %1 min", TCS_param_safeStartTime]]] remoteExec ["BIS_fnc_showNotification", 0];

	uisleep 60; //Mission time independent 60 seconds

	// If mission timer has been terminated by admin briefing, simply exit
	if (TCS_param_safeStartTime < 0) exitWith {};

	TCS_param_safeStartTime = TCS_param_safeStartTime - 1;
	publicVariable "TCS_param_safeStartTime";
};

//Once the mission timer has reached 0, disable the safeties
if (TCS_param_safeStartTime == 0) then {
		["SafeStartMissionStarting", ["Mission starting now!"]] remoteExec ["bis_fnc_showNotification", 0];
		[false] remoteExec ["TCS_fnc_toggleSafeStart", playableUnits + switchableUnits];
};
