/**
	Description:
		Creates the cut grass action and adds it to the player's self-interact menu.

	Parameters:
		None
	
	Returns:
		None
*/

private _cutGrassAction = [
	"cut-grass",
	"Cut grass",
	"",
	TCS_fnc_cutGrassAction,
	{stance player == "CROUCH"}
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions"], _cutGrassAction] call ace_interact_menu_fnc_addActionToObject;
