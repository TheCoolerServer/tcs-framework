//Initialize player variables
TCS_var_wasKilled = false;

//Initialize the player's radios
[] spawn {
	waitUntil {
		sleep 0.5;
		[] call acre_api_fnc_isInitialized;
	};

	[] call TCS_fnc_initPlayerRadios;
};