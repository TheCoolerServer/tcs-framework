/**
	Description:
		Allows units to teleport to wherever they click on the map.

	Parameters:
		None

	Returns:
		None

	Example:
		[] spawn TCS_fnc_mapClickTeleportAction;
*/

// ====================================================================================

// TELEPORT FUNCTIONALITY
// Open the map for the player and display a notification, then set either the player's vehicle
// or the unit to the new position. If the group needs to be teleported too, set the group's position
// as well.

["RapidDeploymentSystemActive", ["Click To Deploy Anywhere"]] call BIS_fnc_showNotification;

TCS_var_RDShouldTeleportOnClick = true;
openMap [true, false];
