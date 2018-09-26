private _unit = _this select 0;

if (TCS_var_removeRadiosInInventory) then {
	private _radiosToRemove = [] call acre_api_fnc_getCurrentRadioList;
	{
		private _radioClass = _x;
		
		while {[_unit, _radioClass] call acre_api_fnc_hasKindOfRadio} do {

			_unit unassignItem _radioClass;

			_unit removeItem _radioClass;
			_unit removeItemFromBackpack _radioClass;
			_unit removeItemFromUniform  _radioClass;
			_unit removeItemFromVest  _radioClass;

			systemChat format["Removed  %1 radio from unit %2", _radioClass, _unit];
		};
	}forEach _radiosToRemove;
};

private _radioPreset = TCS_var_westRadios;

switch (side _unit) do{
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

private _leader = (leader _unit);

if (_leader == _unit) then {
	{
		(uniformContainer _unit) addItemCargoGlobal [_x, 1];
	}forEach (_radioPreset select 0);//First one is the leader's radios
} else {
	{	
		(uniformContainer _unit) addItemCargoGlobal [_x, 1];
	}forEach (_radioPreset select 1);//Group member radios
};