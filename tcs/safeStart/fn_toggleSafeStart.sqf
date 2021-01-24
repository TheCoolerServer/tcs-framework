/*
	Description:
		Toggles the safe start measures of the current player.

	Parameters:
		0 - (boolean) [OPTIONAL] True enables the safe start measures, false disables them. [DEFAULT: true]

	Returns:
		None

	Example:
		[true] call TCS_fnc_toggleSafeStart;
*/

if(isDedicated) exitwith {};

params [["_enableSafeStart", true, [true]]];

switch (_enableSafeStart) do {
	//Turn safety on
	case true: {
		// Delete bullets from fired weapons
		if (isNil "TCS_var_safetyHandleMan") then {
			TCS_var_safetyHandleMan = player addEventHandler["Fired", {
				deletevehicle (_this select 6);
				}
			];
		};

		// Disable guns and damage for vehicles if player is crewing a vehicle
		if (vehicle player != player && {player in [gunner vehicle player, driver vehicle player, commander vehicle player]}) then {
			player setVariable ["TCS_var_safetyHandleVehicle", vehicle player];
			(player getVariable "TCS_var_safetyHandleVehicle") allowDamage false;

			if (isNil "TCS_var_safetyHandleVehicle") then {
				TCS_var_safetyHandleVehicle = (player getVariable "TCS_var_safetyHandleVehicle") addEventHandler ["Fired", {
					deletevehicle (_this select 6);
					}
				];
			};
		};

		// Make player invincible
		player allowDamage false;
	};

	//Turn safety off
	case false;
	default {
		//Allow player to fire weapons
		if !(isNil "TCS_var_safetyHandleMan") then {
			player removeEventhandler ["Fired", TCS_var_safetyHandleMan];
			TCS_var_safetyHandleMan = nil;
		};

		// Re-enable guns and damage for vehicles if they were disabled
		if !(isNull(player getVariable ["TCS_var_safetyHandleVehicle",objnull])) then {
			(player getVariable "TCS_var_safetyHandleVehicle") allowDamage true;

			if !(isNil "TCS_var_safetyHandleVehicle") then {
				(player getVariable "TCS_var_safetyHandleVehicle") removeeventhandler ["Fired", TCS_var_safetyHandleVehicle];
				TCS_var_safetyHandleVehicle = nil;
			};

			player setVariable ["TCS_var_safetyHandleVehicle",nil];
		};

		// Make player vulnerable
		player allowDamage true;

		// Remove Rapid Deployment action
		if (TCS_var_rapidDeploymentEnabled) then
		{
			if !(isNil "TCS_mapClickTeleportAction") then
			{
				player removeAction TCS_mapClickTeleportAction;
			};
		};
	};
};
