//Initialize player variables
//Used by the default respawn template to check if that when the player respawned he really was killed since the first time he spawns the respawn function is called
TCS_var_wasKilled = false;

//Initialize the player's radios
[] spawn {
	waitUntil {
		sleep 0.5;
		[] call acre_api_fnc_isInitialized;
	};

	[] call TCS_fnc_initPlayerRadios;
};