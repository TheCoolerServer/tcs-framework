/**
	Description:
		This function saves the player's radio settings to be then restored when the radios are re-initialized on respawn.

	Parameters:
		None

	Returns:
		None
*/

private _radios = [] call acre_api_fnc_getCurrentRadioList;

TCS_var_playerMPTTSettings = ([] call acre_api_fnc_getMultiPushToTalkAssignment) apply {
	private _radioClass = [_x] call acre_api_fnc_getBaseRadio;
	
	_radioClass;
};


TCS_var_playerRadioSettings = [];
{
	private _radio = _x;
	private _radioClass = [_radio] call acre_api_fnc_getBaseRadio;
	private _radioChannel = "";

	if (_radioClass == "ACRE_PRC77") then {
		// https://github.com/IDI-Systems/acre2/issues/1121
		private _txData = [_radio, "getCurrentChannelData"] call acre_sys_data_fnc_dataEvent;
		_radioChannel = _txData getVariable "frequencyTX";
	} else {
		_radioChannel = [_radio] call acre_api_fnc_getRadioChannel;
	};


	TCS_var_playerRadioSettings pushBack [
		_radioClass,
		_radioChannel,
		[_radio] call acre_api_fnc_getRadioSpatial,
		[_radio] call acre_api_fnc_getRadioVolume
	];
} forEach _radios;
