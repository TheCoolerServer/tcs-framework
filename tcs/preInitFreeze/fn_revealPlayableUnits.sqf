/**
	Description:
		This function should be called after the simulation is enabled on the player units after the freeze ends
		due to the first comment on https://community.bistudio.com/wiki/enableSimulationGlobal.

	Parameters:
		None

	Returns:
		None

	Example:
		[] call TCS_fnc_revealPlayableUnits
*/

{
	player reveal _x;
} forEach playableUnits;