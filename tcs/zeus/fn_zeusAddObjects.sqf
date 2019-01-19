/*
	Description:
		Adds objects to the given curator so that he can edit them.
		Must be run on the server.

	Parameters:
		0 - (object) The unit that the objects should be added to
		1 - (boolean, side, object, object[]) Which objects should be added
			Boolean - True to add all the objects in the mission
			Side - Side of the objects that should be added
			Object - Object that should be added
			Object[] - Objects that should be added
		2 - (boolean) [OPTIONAL] True and only the group leaders of the selected objects will be added, false does nothing

	Returns:
		None

	Example:
		All objects in the mission are added
		[curator1, true] call TCS_fnc_zeusAddObjects; 

		All the objects from the side west get added
		[curator1, west] call TCS_fnc_zeusAddObjects; 

		A specific object gets added
		[curator1, car1] call TCS_fnc_zeusAddObjects; 

		An array of objects get added
		[curator1, [car1, car2]] call TCS_fnc_zeusAddObjects; 

		Only the leader of the groups of those objects get added
		[curator1, [car1, car2], true] call TCS_fnc_zeusAddObjects; 

		All the BLUFOR group leaders get added
		[curator1, west, true] call TCS_fnc_zeusAddObjects; 
*/

if !(isServer) exitWith {};

params [
	["_curator", objNull],
	["_mode", [], [true,west,objNull,[]]],
	["_groupLeaders", false, [true]]
];

//If it wasn't a curator get the module assigned to the object
if !(_curator in allCurators) then {
	_curator = getAssignedCuratorLogic _curator;
};

//If still wasn't able to find a curator module, error out
if (isNull _curator || typeOf _curator != "ModuleCurator_F") exitWith {
	player GlobalChat format ["DEBUG (f\zeus\fn_zeusAddAddons.sqf): Could not resolve curator properly, is either null or not the correct type. IsNull = %1, _curator type : %2 (should be ModuleCurator_F)", isNull _curator, typeOf _curator];
	exitWith {};
};

// Decide which objects to add based on passed mode
private _objects = [];

switch (typeName _mode) do {
	case "ARRAY": {
		_objects = _mode;
	};

	case "OBJECT": {
		_objects = [_mode];
	};

	case "SIDE": {
		{
			if (side _x == _mode && !(vehicle _x in _objects)) then {
				_objects pushback (vehicle _x)
			};
		} forEach allUnits;
	};

	case "BOOL": {
		 if (_mode) then {
		 	_objects = allMissionObjects "";

		 	//To prevent unnecessary stress on the network compare the the new _objects array to the existing curator objects. If they are identical, reset _objects to an empty array
		 	if (_objects isEqualTo (curatorEditableObjects _curator)) then {
		 		_objects = [];
		 	};

		 } else {
		 	_curator removeCuratorEditableObjects [curatorEditableObjects _curator,true];
		 };
	 };
};

// Reduce list to group-leaders and empty vehicles if desired
private _leaders = [];
if (_groupLeaders) then {
	{
		if ((isNull group _x) || _x == leader group _x) then {
			_leaders pushBackUnique (vehicle _x);
		};
	} forEach _objects;

	_objects = _leaders;
};

// Add all selected objects to curator lists
_curator addCuratorEditableObjects [_objects,true];
