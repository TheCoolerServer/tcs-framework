/**
	Description:
		Teleports the entire group to the leader's position.

	Parameters:
		None

	Returns:
		None

	Example:
		[] call TCS_fnc_mapClickTeleportGroup;
*/

// ====================================================================================

// SET KEY VARIABLES

private _unit = _this select 0;
private _pos = _this select 1;

// ====================================================================================

// LOCALITY CHECK
// The component should not run anywhere else but where the unit is local by default.
// This check is a redundancy to ensure this.

if !(local _unit) exitWith {};

// ====================================================================================

// TELEPORT UNITS
// Loop through the group's units (excluding the leader) and check if they are local.
// If true teleport them next to the leader and display a notification for players.

_unit setPos [((_pos select 0) + 3 + random 3),((_pos select 1) + 3 + random 3),(_pos select 2)];

// Display a notification for players
if (_unit == vehicle player) then {
	["RapidDeploymentSystemActive", ["Deployed To Your Leader"]] call BIS_fnc_showNotification
};
