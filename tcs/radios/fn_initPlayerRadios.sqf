/**
	Description:
		Initializes a player's radios with the option of removing existing radios.

	Parameters:
		None

	Returns:
		None

	Example:
		[] spawn TCS_fnc_initPlayerRadios;

*/

waitUntil {
	sleep 0.5;
	[] call acre_api_fnc_isInitialized;
};


if (TCS_var_saveAndRestoreRadioSettings) then {
	// We need to wait here because the radios we just added will not be initialized yet
	// since they are set on the server
	waitUntil { 
		uiSleep 0.5;
		([] call acre_api_fnc_isInitialized);
	};

	[] call TCS_fnc_restoreRadioSettings;
};

