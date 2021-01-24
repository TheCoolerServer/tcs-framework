/**
	Description:
		Single click map handler for the RapidDeployment option.

	Parameters:
		Same as: https://community.bistudio.com/wiki/Arma_3:_Event_Handlers/addMissionEventHandler#MapSingleClick

	Returns:
		None

 */

params ["_units", "_pos", "_alt", "_shift"];

if (TCS_var_RDShouldTeleportOnClick) then {
	// Is squad leader and is initial squad teleport
	if (TCS_var_mapClickTeleport_GroupTeleport) then {
		// Is in a vehicle? Teleport it
		if (vehicle player != player) then {
			(vehicle player) setPos (_pos findEmptyPosition [0, 150, typeOf (vehicle player)]);
		} else {
			// Otherwise teleport him and everyone on his group that isn't in a vehicle
			player setPos _pos;

			// Teleport the player's group next to him.
			{
				if (isNull (objectParent _x)) then {
					[_x, _pos] remoteExec ["TCS_fnc_mapClickTeleportGroup", _x];
				};
			} forEach ((units group player) - [player]);
		};

		openMap false;

		["RapidDeploymentSystemActive", ["Deployed With Your Team"]] call BIS_fnc_showNotification;
	} else {
		if (vehicle player != player) then {
			(vehicle player) setPos (_pos findEmptyPosition [0, 150, typeOf (vehicle player)]);
		} else {
			player setPos _pos;
		};
		
		openMap false;

		["RapidDeploymentSystemActive", ["Deployed"]] call BIS_fnc_showNotification;

		// Remove Rapid Deployment action if player is within 300m of any playable units after teleporting.
		if ({_x distance player < 300} count (playableUnits) - [player] > 0) then {
			player removeAction TCS_mapClickTeleportAction;
		};
	};
};
