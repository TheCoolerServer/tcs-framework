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

if (TCS_var_removeRadiosInInventory) then {
	private _radiosToRemove = [] call acre_api_fnc_getCurrentRadioList;
	
	[_radiosToRemove] call TCS_fnc_removePlayerRadios;
};


if (TCS_var_addRadiosToPlayers) then {
	[] call TCS_fnc_addConfigurationRadiosToPlayer;
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

