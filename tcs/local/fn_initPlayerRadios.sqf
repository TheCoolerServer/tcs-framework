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

			systemChat format["Removed  %1 radio from unit %2", _radioClass, player];
		};
	}forEach _radiosToRemove;
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
	}forEach (_radioPreset select 0);//First one is the leader's radios
} else {
	{	
		(uniformContainer player) addItemCargoGlobal [_x, 1];
	}forEach (_radioPreset select 1);//Group member radios
};