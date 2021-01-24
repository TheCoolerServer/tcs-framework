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

// DECLARE VARIABLES AND FUNCTIONS

private ["_textSelect","_textDone"];

// ====================================================================================

// SET KEY VARIABLES
TCS_telePositionSelected = false;

// ====================================================================================

// TELEPORT FUNCTIONALITY
// Open the map for the player and display a notification, then set either the player's vehicle
// or the unit to the new position. If the group needs to be teleported too, set the group's position
// as well.

["RapidDeploymentSystemActive",["Click To Deploy Anywhere"]] call BIS_fnc_showNotification;
openMap [true, false];
onMapSingleClick "TCS_var_mapClickTeleport_telePos = _pos; TCS_telePositionSelected = true";
waitUntil {TCS_telePositionSelected};

// Teleport player
// If the player is in a vehicle, the entire vehicle is teleported. Otherwise, just the player is teleported.
if (TCS_var_mapClickTeleport_GroupTeleport) then
{
	if (vehicle player != player) then
	{
		(vehicle player) setPos (TCS_var_mapClickTeleport_telePos findEmptyPosition [0,150,typeOf (vehicle player)]);
	}
	else
	{
		player setPos TCS_var_mapClickTeleport_telePos;

		// Teleport the player's group next to him.
		{
			if (isNull (objectParent _x)) then
			{
				[_x,TCS_var_mapClickTeleport_telePos] remoteExec ["TCS_fnc_mapClickTeleportGroup", _x];
			};
		} forEach ((units group player) - [player]);
	};

	openMap false;

	["RapidDeploymentSystemActive",["Deployed With Your Team"]] call BIS_fnc_showNotification;
}
else
{
	if (vehicle player != player) then
	{
		(vehicle player) setPos (TCS_var_mapClickTeleport_telePos findEmptyPosition [0,150,typeOf (vehicle player)]);
	}
	else
	{
		player setPos TCS_var_mapClickTeleport_telePos;
	};
	
	openMap false;

	["RapidDeploymentSystemActive",["Deployed"]] call BIS_fnc_showNotification;

	// Remove Rapid Deployment action if player is within 300m of any playable units after teleporting.
	if ({_x distance player < 300} count (playableUnits) - [player] > 0) then
	{
		player removeAction TCS_mapClickTeleportAction;
	};
};