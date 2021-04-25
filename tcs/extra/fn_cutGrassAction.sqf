/**
	Description:
		ACE action handler that plays an animation and places the clear cutter module where the player is.

	Paramters: 
		None

	Returns:
		None
*/

TCS_var_cutGrassAnimDone = false;

private _animEH = player addEventHandler ["AnimDone", {
	if (_this select 1 == "AinvPknlMstpSlayWrflDnon_medic") then {
		TCS_var_cutGrassAnimDone = true;
	};
}];

// [player, "AinvPknlMstpSlayWrflDnon_medic"] remoteExec ["playMove"];
player playMove "AinvPknlMstpSlayWrflDnon_medic";


[{mis_macheteDone}, {
	params ["_animEH"];

	createVehicle ["ClutterCutter_small_EP1", [getposATL player, 1, getDir player] call BIS_fnc_relPos, [], 0, "CAN_COLLIDE"];
	player removeEventHandler ["AnimDone", _animEH];

	TCS_var_cutGrassAnimDone = false;
}, _animEH] call CBA_fnc_waitUntilAndExecute;
