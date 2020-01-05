/**
	Description:
		Adds the option for the player to spectate the mission from this poin onwards.
		If the player chooses to spectate, this action cannot be undone.

	Parameters:
		0 - (number) Number of seconds the action should be available.

	Returns:
		None
*/

params ["_timeout"];

private _actionID = [
	player, // Target
	"Spectate", // Title
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forceRespawn_ca.paa", // Idle icon
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forceRespawn_ca.paa", // Progress icon
	"true", // Condition show
	"true", // Condition progress
	{
		 hint parseText "This action <t color='#FF0000'>CANNOT</t> be undone";
	}, // Code start
	nil, // Code progress
	TCS_fnc_playerChoseToSpectate, // Code complete
	nil, // Code interrupted
	[], // Arguments
	10, // Duration
	nil, // Priority
	true, // Remove completed
	false // Show unconscious
] call BIS_fnc_holdActionAdd;

[_timeout, _actionID] spawn {
	params ["_timeout", "_actionID"];
	sleep _timeout;
	[player, _actionID] call BIS_fnc_holdActionRemove
};