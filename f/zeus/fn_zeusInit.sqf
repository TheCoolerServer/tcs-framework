// F3 Zeus Support  - Initialization
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// SERVER CHECK
// Ensure this script only executes on the server:

if !(isServer) exitWith {};

// ====================================================================================

// DECLARE VARIABLES

private ["_curator"];

// ====================================================================================

// SET KEY VARIABLES
// Using variables passed to the script instance, we will create some local variables:

params [
	["_unit", objNull],
	["_addons", true, ["",true,[]]],
	["_objects", [], [objNull,true,[],west]],
	["_announce", false, [true]]
];

// ====================================================================================

// SETUP CURATOR

// Exit if no unit was passed
if (isNull _unit) exitWith {};

// Exit if no unit was passed
if !(isNull (getAssignedCuratorLogic _unit)) exitWith {
	diag_log format ["DEBUG (f\zeus\fn_zeusInit.sqf): ZEUS already assigned to %1.",_unit];
	systemchat format ["DEBUG (f\zeus\fn_zeusInit.sqf): ZEUS already assigned to %1.",_unit];
};

// Exit if the unit is not a player
if !(isPlayer _unit) exitWith {
	diag_log format ["DEBUG (f\zeus\fn_zeusInit.sqf): Did not assign ZEUS to %1 because it is not under control of a player.",_unit];
	systemchat format ["DEBUG (f\zeus\fn_zeusInit.sqf): Did not assign ZEUS to %1 because it is not under control of a player.",_unit];
};

// Make sure a side logic exists, if not create it
if (isNil "f_var_sideCenter") then {
	f_var_sideCenter = createCenter sideLogic;
	publicVariable "f_var_sideCenter";
};

// Create a new curator logic
_curator = (createGroup f_var_sideCenter) createUnit ["ModuleCurator_F", [0,0,0], [], 0, "NONE"];

// Assign the passed unit as curator
_unit assignCurator _curator;

//Add desired addons
[_curator,_addons] spawn f_fnc_zeusAddAddons;

//Add desired objects
[_curator,_objects] spawn f_fnc_zeusAddObjects;

// Reduce costs for all actions
_curator setCuratorWaypointCost 0;
{_curator setCuratorCoef [_x,0];} forEach ["place","edit","delete","destroy","group","synchronize"];

// Check if F3 AI Skill Selector is active and assign corresponding event-handler
if({!isNil _x} count ["f_param_AISkill_BLUFOR","f_param_AISkill_INDP","f_param_AISkill_OPFOR"] > 0) then {
	_curator addEventHandler ['CuratorObjectPlaced',{
		params[
			["_curator", objNull, [objNull]],
			["_entity", objNull, [objNull]]
		];
		{
			[_x] call f_fnc_setAISkill;
		} forEach crew _entity;
	}];
};

// Setup

// If announce is set to true, the new curator will be announced to all players
if (_announce) then {
	_curator setVariable ["owner",format["%1",_unit],true];
	["Alert",[format ["%1 has become curator!",name _unit]]] remoteExec ["BIS_fnc_showNotification", 0];
};

// ====================================================================================

// Return the newly created curator
_curator
