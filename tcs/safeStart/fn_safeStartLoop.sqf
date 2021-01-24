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

// initServer.sqf runs after the server loads the mission, so that means it runs while the players are on the briefing screen.
// And since uiSleep doesn't care if the game has started or not it will sleep during the briefing and if people stay in the briefing
// for too long safe-start will be disabled once the mission actually starts.
// Putting a sleep here will make sure the actual safe-start loop starts after the briefing is done, just like the pre-init freeze.
sleep 1;

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
		
		// Remove Rapid Deployment action
		if (TCS_var_rapidDeploymentEnabled) then
		{
			player removeAction TCS_mapClickTeleportAction;
		};
};
