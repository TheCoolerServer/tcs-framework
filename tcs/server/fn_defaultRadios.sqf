/**
	Gives the radios to the given group.
	Parameters:
		0 - (Group) The group
	
	Returns:
		None

*/

private _group = _this select 0;

if (TCS_var_removeRadiosInInventory) then {
	private _radiosToRemove = ["ACRE_PRC152", "ACRE_PRC343", "ACRE_PRC148"];	

	{
		private _unit = _x;

		{
			private _radioClass = _x;
			while {[_unit, _radioClass] call acre_api_fnc_hasKindOfRadio} do {

				_unit unassignItem _radioClass;

				_unit removeItem _radioClass;
				_unit removeItemFromBackpack _radioClass;
				_unit removeItemFromUniform  _radioClass;
				_unit removeItemFromVest  _radioClass;
			};
		}forEach _radiosToRemove;

	}forEach (units _group);
};

private _radioPreset = TCS_var_eastRadios;

switch (side _group) do{
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

{
	private _unit = _x;

	if (leader _group == _unit) then {
		{
			(uniformContainer _unit) addItemCargoGlobal [_x, 1];
		}forEach (_radioPreset select 0);//First one is the leader's radios
	}else {
		{	
			(uniformContainer _unit) addItemCargoGlobal [_x, 1];
		}forEach (_radioPreset select 1);//Group member radios
	};
} forEach (units _group);