/**
	Initializes everything that is needed by the framework on the player.
*/

{_x setSpeaker "NoVoice"} forEach playableUnits;

[] spawn TCS_fnc_createBriefing;

//Initialize the player's radios
if (TCS_var_radiosModuleEnabled) then {
	[] spawn TCS_fnc_initPlayerRadios;
};

[] call TCS_fnc_safeStartPlayer;

if (TCS_var_enableTriggerMarkers) then {
	[] call TCS_fnc_createDebugTriggerMarkers;
};

if (TCS_var_fireteamMarkersEnabled) then {
	[] call TCS_fnc_initFireteamMarkers;
};