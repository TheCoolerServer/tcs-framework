/**
	Description:
		Adds the radios defined in the configuration file to the player.

	Parameters:
		None

	Returns:
		None
*/

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
	} forEach (_radioPreset select 0); // Group leader radios
} else {
	{	
		(uniformContainer player) addItemCargoGlobal [_x, 1];
	} forEach (_radioPreset select 1); // Group member radios
};