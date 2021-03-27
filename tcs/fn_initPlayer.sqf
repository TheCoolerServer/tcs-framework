/**
	Initializes everything that is needed by the framework on the player.
*/

[] call TCS_fnc_initParameterVariables;

{_x setSpeaker "NoVoice"} forEach playableUnits;

[] call TCS_fnc_createBriefing;

[] call TCS_fnc_safeStartPlayer;

[] spawn TCS_fnc_initPlayerRadios;

[] spawn TCS_fnc_adminInit;

if (TCS_var_showKilledByMessage) then {
	[] spawn TCS_fnc_killedBy;
};

if (TCS_var_autoAssignFireteams) then {
	[] call TCS_fnc_assignTeamColors;
};

if (TCS_var_fireteamMarkersEnabled) then {
	[] call TCS_fnc_initFireteamMarkers;
};

if (TCS_var_rapidDeploymentEnabled) then {
	TCS_var_mapClickTeleport_Rejoin = false;
	
	[] call TCS_fnc_rdSetupEventHandlers;
	[true] call TCS_fnc_mapClickTeleportAction;
};

if ([] call TCS_fnc_areTicketsEnabled) then {
	[] call TCS_fnc_bootstrapTicketsFramework;
};

if ([getPlayerUID player] call TCS_fnc_isPlayerSpectating) then {
	[] call TCS_fnc_moveToSpectator;
};
