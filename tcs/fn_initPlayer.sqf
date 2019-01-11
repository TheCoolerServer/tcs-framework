/**
	Initializes everything that is needed by the framework on the player.
*/

//Initialize the player's radios
if (TCS_var_radiosModuleEnabled) then {
	[] spawn TCS_fnc_initPlayerRadios;
};

[] call TCS_fnc_safeStartPlayer;

if (TCS_var_enableTriggerMarkers) then {
	[] call TCS_fnc_createDebugTriggerMarkers;
};