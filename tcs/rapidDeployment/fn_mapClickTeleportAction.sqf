/**
	Description:
		Enables the Rapid Deployment System and adds an addAction for eligible players (Group leaders and newly rejoined units in One-Life missions).

	Parameters:
		0 - (Boolean) If player can teleport his entire group.

	Returns:
		None

	Example:
		[true] call TCS_fnc_mapClickTeleportAction;
*/

// Make sure the player initializes properly
if (isNull player) then {
    waitUntil {sleep 0.1; !isNull player};
};

// CHECK IF COMPONENT SHOULD BE ENABLED
// Script ends if player is not a group leader

if ((TCS_var_mapClickTeleport_Rejoin == false) and (player != leader group player)) exitWith { TCS_mapClickTeleportAction = nil };

// ====================================================================================

// SET UP VARIABLES
TCS_var_mapClickTeleport_GroupTeleport = _this select 0;
TCS_var_mapClickTeleport_Rejoin = false;

// ====================================================================================

// ADD TELEPORT ACTION TO PLAYER ACTION MENU
// While Safe Start is active, add the teleport action to the player's action menu.

if (TCS_param_safeStartTime > 0) then {
	// Pause the script for 10 seconds to allow the safe start notification to display first. Only happens at mission init.
	sleep 10;
};

TCS_mapClickTeleportAction = player addaction ["<t color='#63FF00'>Rapid Deployment</t>", TCS_fnc_mapClickTeleportUnit, nil, 10, false,true];

["RapidDeploymentSystemReady",["Rapid Deployment Ready"]] call BIS_fnc_showNotification;
