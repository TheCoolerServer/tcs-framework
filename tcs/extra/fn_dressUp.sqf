/**
	Description:
		Main Dress Up function, getting the loadout and spawning the arsenal.

	Parameters: 
		0 - (object) Player who called the function.

	Returns:
		None
*/
params ["_caller"];

//get vars from addaction params
_plr = _this select 0;
//get player's role and use regex to remove anything after "@"
_role = roleDescription _plr;
_cleanrole = _role regexReplace ["@.*", ""];
// Make an invisible heli pad (this is so each player can have their own arsenal
_temp = "HeliHEmpty" createVehicle position _plr;
// Store the helipad in the player's namespace
_plr setVariable ["_arsenal", _temp, false];

// Get the loadout corresponding to the player's role from the hashmap.
_loadout = [];
if (_cleanrole in TCS_var_arsenalMap) then {
	_loadout = TCS_var_arsenalMap get _cleanrole;
} else {
	if ("generic" in TCS_var_arsenalMap) then {
		_loadout = TCS_var_arsenalMap get "generic"
		} else {
		hint "No loadout found for your class!";
	};
};

//call an ace arsenal with that set
[_temp, _loadout] call ace_arsenal_fnc_initBox;
[_temp, _plr] call ace_arsenal_fnc_openBox;
