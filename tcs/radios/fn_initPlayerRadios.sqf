/**
	Initializes a player's radios with the option of removing existing radios.
	Spawns new thread that handles the initialization.

	Parameters:
		None

	Returns:
		None

	Example:
		[] spawn TCS_fnc_initPlayerRadios;

*/

waitUntil {
	sleep 0.5;
	[] call acre_api_fnc_isInitialized;
};

if (TCS_var_removeRadiosInInventory) then {
	private _radiosToRemove = [] call acre_api_fnc_getCurrentRadioList;
	
	{
		private _radioClass = _x;
		
		while {[player, _radioClass] call acre_api_fnc_hasKindOfRadio} do {

			player unassignItem _radioClass;

			player removeItem _radioClass;
			player removeItemFromBackpack _radioClass;
			player removeItemFromUniform  _radioClass;
			player removeItemFromVest  _radioClass;
		};
	} forEach _radiosToRemove;
};

private _radioPreset = TCS_var_westRadios;

switch (side player) do{
	case east: {
		_radioPreset = TCS_var_eastRadios;
	};
	case independent: {
		_radioPreset = TCS_var_independentRadios;
	};
	case civilian: {
		_radioPreset = TCS_var_civilianRadios;
	};
};

private _leader = (leader player);

if (_leader == player) then {
	{
		(uniformContainer player) addItemCargoGlobal [_x, 1];
	} forEach (_radioPreset select 0);//First one is the leader's radios
} else {
	{	
		(uniformContainer player) addItemCargoGlobal [_x, 1];
	} forEach (_radioPreset select 1);//Group member radios
};