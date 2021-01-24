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
	["Initialize", [player, [playerSide], false, TCS_var_spectatorAllowFreeCamera, TCS_var_spectatorAllowThirdPersonCamera]] call BIS_fnc_EGSpectator;
}
else
{
	["Initialize", [player, [], false, TCS_var_spectatorAllowFreeCamera, TCS_var_spectatorAllowThirdPersonCamera]] call BIS_fnc_EGSpectator;
};
