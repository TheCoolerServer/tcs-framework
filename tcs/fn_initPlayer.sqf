//Initialize player variables
//Used by the default respawn template to check if that when the player respawned he really was killed since the first time he spawns the respawn function is called
TCS_var_wasKilled = false;

//Initialize the player's radios
if (TCS_var_radiosModuleEnabled) then {
	[] call TCS_fnc_initPlayerRadios;
};