/**
	Description:
		Returns wether the player with the given UID is spectating
	
	Parameters:
		0 - (string) The player's UID.

	Returns:
		true or false
*/

params ["_uid"];

if (isNil "TCS_var_spectatorList") exitWith {
	private _result = false;
	_result;
};

private _result = (TCS_var_spectatorList find _uid) >= 0;

_result;