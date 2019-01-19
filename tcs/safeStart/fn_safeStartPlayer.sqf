/*
	Description:
		Initializes the safe start on the player.

	Parameters:
		None

	Returns:
		None:

	Example:
		[] call TCS_fnc_safeStartPlayer;
*/

if (TCS_param_safeStartTime > 0) then {
	[true] call TCS_fnc_toggleSafeStart;
};