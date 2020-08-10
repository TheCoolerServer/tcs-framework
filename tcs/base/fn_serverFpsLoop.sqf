/**
	Description: 
		Gets the server FPS and all the current units and broadcasts the event to all clients. Whoever is the admin
		or has the zeus modules will then update their markers with the given values.

	Parameters:
		None

	Returns:
		None
*/

while {true} do {
	private _fps = diag_fps;
	private _localUnitCount = {
		local _x;
	} count allUnits;
	private _localGroupCount = {
		local _x;
	} count allGroups;

	["TCS_evt_serverFPSUpdate", [_fps, _localUnitCount, _localGroupCount]] call CBA_fnc_globalEvent;
	sleep TCS_var_fpsMarkerUpdateIterval;
};