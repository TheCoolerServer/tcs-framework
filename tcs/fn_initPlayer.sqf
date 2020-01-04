/**
	Initializes everything that is needed by the framework on the player.
*/
[] call TCS_fnc_initParameterVariables;

{_x setSpeaker "NoVoice"} forEach playableUnits;

[] spawn TCS_fnc_createBriefing;

[] call TCS_fnc_safeStartPlayer;

//Initialize the player's radios
if (TCS_var_radiosModuleEnabled) then {
	[] spawn TCS_fnc_initPlayerRadios;
};

if (TCS_var_enableTriggerDebugMarkers) then {
	[] call TCS_fnc_createDebugTriggerMarkers;
};

if (TCS_var_fireteamMarkersEnabled) then {
	[] call TCS_fnc_initFireteamMarkers;
};

if ([] call TCS_fnc_areTicketsEnabled) then {
	[] call TCS_fnc_bootstrapTicketsFramework;
}