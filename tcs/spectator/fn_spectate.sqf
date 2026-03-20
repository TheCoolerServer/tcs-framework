/**
	Description:
		Starts the EG Spectator based on the mission settings.

	Parameters:
		None
	
	Returns:
		None
*/

if (TCS_var_spectatorAllowOtherPlayerSides == false) then
{
	[true] call ace_spectator_fnc_setSpectator;
	[[TCS_var_spectator_side], [west,east,independent,civilian]] call ace_spectator_fnc_updateSides;
}
else
{
	[true] call ace_spectator_fnc_setSpectator;
	[[west,east,independent,civilian]] call ace_spectator_fnc_updateSides;
};
