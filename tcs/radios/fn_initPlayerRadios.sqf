/**
	Description:
		Initializes a player's radios with the option of removing existing radios.
		Spawns new thread that handles the initialization.

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
	
	{
		private _radioClass = _x;
		
		while {[player, _radioClass] call acre_api_fnc_hasKindOfRadio} do {

			player unassignItem _radioClass;

			player removeItem _radioClass;
			player removeItemFromBackpack _radioClass;
			player removeItemFromUniform  _radioClass;
			player removeItemFromVest  _radioClass;
		};
	} forEach _radiosToRemove;
};

private _radioPreset = TCS_var_westRadios;

switch (side player) do{
	case east: {
		_radioPreset = TCS_var_eastRadios;
	};
	case independent: {
		_radioPreset = TCS_var_independentRadios;
	};
	case civilian: {
		_radioPreset = TCS_var_civilianRadios;
	};
};

private _leader = (leader player);

if (_leader == player) then {
	{
		(uniformContainer player) addItemCargoGlobal [_x, 1];
	} forEach (_radioPreset select 0);//First one is the leader's radios
} else {
	{	
		(uniformContainer player) addItemCargoGlobal [_x, 1];
	} forEach (_radioPreset select 1);//Group member radios
};

// Set the player's radios settings to what he had them before
// We need to wait here because the radios we just added will not be initialized yet
// since they are set on the server
waitUntil { 
	uiSleep 0.5;
	([] call acre_api_fnc_isInitialized);
};
if (!isNil "TCS_var_playerRadioSettings") then {
	{
		// See issue https://github.com/IDI-Systems/acre2/issues/692
		// _x params ["_radioClass", "_channel", "_spatialSetting", "_volume"];

		_x params ["_radioClass", "_channel", "_spatialSetting"];
		private _playerRadio = [_radioClass] call acre_api_fnc_getRadioByType;

		if (!isNil "_playerRadio") then {
			[_playerRadio, _channel] call acre_api_fnc_setRadioChannel;
			[_playerRadio, _spatialSetting] call acre_api_fnc_setRadioSpatial;
			
			// See issue https://github.com/IDI-Systems/acre2/issues/692
			// [_playerRadio, _volume] call acre_api_fnc_setRadioVolume;
		};
	} forEach TCS_var_playerRadioSettings;
};

if (!isNil "TCS_var_playerMPTTSettings") then {
	private _mpttSettings = [];

	{
		private _radio = [_x] call acre_api_fnc_getRadioByType;
		if (!isNil "_radio") then {
			_mpttSettings pushBack _radio;
		};
	} forEach TCS_var_playerMPTTSettings;

	[_mpttSettings] call acre_api_fnc_setMultiPushToTalkAssignment;
};