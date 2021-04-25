/**
	Description:
		This function saves the player's radio settings to be then restored when the radios are re-initialized on respawn.

	Parameters:
		None

	Returns:
		None
*/

private _radios = [] call acre_api_fnc_getCurrentRadioList;

TCS_var_playerRadioSettings = [];
TCS_var_playerMPTTSettings = ([] call acre_api_fnc_getMultiPushToTalkAssignment) apply {
	// Strip the ID at the end of the radio name and just get the class name
	private _parts = (_x splitString "_") select [0, 2];
	private _radioClass = _parts joinString "_";
	_radioClass;
};

{
	private _radio = _x;
	// Radios are always the radio class + "_ID_" + some number
	private _parts = (_radio splitString "_") select [0, 2];
	private _radioClass = _parts joinString "_";

	TCS_var_playerRadioSettings pushBack [
		_radioClass,
		[_radio] call acre_api_fnc_getRadioChannel,
		[_radio] call acre_api_fnc_getRadioSpatial,
		[_radio] call acre_api_fnc_getRadioVolume
	];
} forEach _radios;
