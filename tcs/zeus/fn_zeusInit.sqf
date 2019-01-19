/*
	Description:
		Initializes the zeus module for the given unit allowing them to enter zeus.
		Must be run on the server.

	Parameters:
		0 - (object) The unit that should be given zeus access.
		1 - (boolean, String or String[]) [DEFAULT: true]
			Boolean - Makes all the addons available for the given zeus
			String - Enables only 1 addon
			String[] - Enables all the given addons
		
		2 - (boolean, side, object, object[]) [DEFAULT: []] Which objects should be given to the curator (Can be edited)
			Boolean - True if all objects should be added, false does nothing
			Side - All of the objects of the given side will be given to the added
			Object - Only that object will be added
			Object[] - Only those objects will be added

		3 - (boolean) Whether it should be announced that the unit just got given zeus [DEFAULT: false]



	Returns:
		NONE

	Example:
		[newZeus, true] call TCS_fnc_zeusInit;

		[newZeus, west] call TCS_fnc_zeusInit;

		[newZeus, "Addon1", [unit2, unit3]] call TCS_fnc_zeusInit;

		[newZeus, true, true, true] call TCS_fnc_zeusInit;

*/

if !(isServer) exitWith {};

params [
	["_unit", objNull],
	["_addons", true, ["",true,[]]],
	["_objects", [], [objNull,true,[],west]],
	["_announce", false, [true]]
];

//Make sure the unit is valid
if (isNull _unit) exitWith {};

//If the unit already has access to zeus don't do anything
if !(isNull (getAssignedCuratorLogic _unit)) exitWith {
	diag_log format ["DEBUG (tcs\zeus\fn_zeusInit.sqf): ZEUS already assigned to %1.",_unit];
	systemchat format ["DEBUG (tcs\zeus\fn_zeusInit.sqf): ZEUS already assigned to %1.",_unit];
};

// Exit if the unit is not a player
if !(isPlayer _unit) exitWith {
	diag_log format ["DEBUG (tcs\zeus\fn_zeusInit.sqf): Did not assign ZEUS to %1 because it is not under control of a player.",_unit];
	systemchat format ["DEBUG (tcs\zeus\fn_zeusInit.sqf): Did not assign ZEUS to %1 because it is not under control of a player.",_unit];
};

//Create a new curator module and assign it to the player with the correct addons
_curator = (createGroup sideLogic) createUnit ["ModuleCurator_F", [0,0,0], [], 0, "NONE"];

_unit assignCurator _curator;
[_curator,_addons] spawn TCS_fnc_zeusAddAddons;
[_curator,_objects] spawn TCS_fnc_zeusAddObjects;

// Reduce costs for all actions
_curator setCuratorWaypointCost 0;
{
	_curator setCuratorCoef [_x, 0];
} forEach ["place", "edit", "delete", "destroy", "group", "synchronize"];

if (_announce) then {
	_curator setVariable ["owner", format["%1", _unit], true];
	["Alert", [format ["%1 has become curator!", name _unit]]] remoteExec ["BIS_fnc_showNotification", 0];
};

// Return the newly created curator
_curator
