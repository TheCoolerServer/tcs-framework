/**
	Description:
		Restore a player's radio settings to the previously saved values.

	Parameters:
		None

	Returns: 
		None
*/

if (!isNil "TCS_var_playerRadioSettings") then {
	{
		// See issue https://github.com/IDI-Systems/acre2/issues/692
		// Fixed, will be included in release 2.7.0
		// _x params ["_radioClass", "_channel", "_spatialSetting", "_volume"];

		_x params ["_radioClass", "_channel", "_spatialSetting"];
		private _playerRadio = [_radioClass] call acre_api_fnc_getRadioByType;

		if (!isNil "_playerRadio") then {
			[_playerRadio, _channel] call acre_api_fnc_setRadioChannel;
			[_playerRadio, _spatialSetting] call acre_api_fnc_setRadioSpatial;

			// See issue https://github.com/IDI-Systems/acre2/issues/692
			// Fixed, will be included in release 2.7.0
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