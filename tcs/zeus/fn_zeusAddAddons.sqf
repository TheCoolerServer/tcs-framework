/*
	Description:
		Makes addons available to a given curator.
		Must be run on the server.
	
	Parameters:
		0 - (object) The object whose units should be added to.
		1 - (boolean, string or string[]) What should be added
			Boolean - True if all addons are to be made available, false does nothing.
			String - Enabled the given addon for the curator
			Stirng[] - Enabled the given addons for the given curator

		Returns:
			None

		Example:
			Enables all addons for the curator
			[zeus1, true] call TCS_fnc_zeusAddAddons;

			Enables all that specific addon for the curator
			[zeus1, "Some cfgPatches entry"] call TCS_fnc_zeusAddAddons;

			Enables addon1 and addon2 for the curator
			[zeus1, ["addon1", "addon2"]] call TCS_fnc_zeusAddAddons;
*/

if !(isServer) exitWith {};

params [
	["_curator", objNull],
	["_mode", true, ["",true,[]]]
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

// Decide which addons to add based on passed mode
private _addons = [""];
_curator setVariable ["Addons", 0, true];

switch (typeName _mode) do {
	case "ARRAY": {
		_addons = _mode
	};

	case "STRING": {
		_addons = [_mode]
	};

	case "BOOL": {
		if (_mode) then {
			_curator setVariable ["Addons", 3, true];
			// If true was passed, add all available addons to curator list
			private _cfgPatches = configfile >> "cfgpatches";

			for "_i" from 0 to (count _cfgPatches - 1) do {
				_class = _cfgPatches select _i;

				if (isclass _class) then {
					_addons pushBack (configname _class);
				};
			};

			_addons call bis_fnc_activateaddons;
			removeallcuratoraddons _curator;
		} else {
			_curator setVariable ["Addons", 0, true];
			removeallcuratoraddons _curator;
		};
	};
};

_curator addcuratoraddons _addons;
