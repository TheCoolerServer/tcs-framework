/*
	Description:
		Initializes the safe start looop on the server.

	Parameters:
		None

	Returns:
		None:

	Example:
		[] call TCS_fnc_safeStartServer;
*/

if (TCS_param_safeStartTime > 0) then {
	[] spawn TCS_fnc_safeStartLoop;
};