/**
	Initializes everything that is needed by the framework on the player.
*/

//Initialize player variables
//Used by the default respawn template to check if that when the player respawned he really was killed since the first time he spawns the respawn function is called
TCS_var_wasKilled = false;

//Initialize the player's radios
if (TCS_var_radiosModuleEnabled) then {
	[] call TCS_fnc_initPlayerRadios;
};

[] call TCS_fnc_safeStartPlayer;

if (TCS_var_enableTriggerMarkers) then {
	[] call TCS_fnc_triggerMarkers;
};