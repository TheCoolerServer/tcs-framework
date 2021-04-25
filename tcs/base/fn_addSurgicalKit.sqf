/**
	Description:
		Adds surgical kits to the current unit if it doesn't have one already.

	Parameters:
		None

	Returns:
		None
*/

private _alreadyHasSurgicalKit = [player, "ACE_surgicalKit"] call BIS_fnc_hasItem;

if (!_alreadyHasSurgicalKit) then {
	private _backpack = backpackContainer player;

	if (!isNull _backpack) exitWith {
		_backpack addItemCargoGlobal ["ACE_surgicalKit", 1];
	};

	private _vest = vestContainer player;

	if (!isNull _vest) exitWith {
		_vest addItemCargoGlobal ["ACE_surgicalKit", 1];
	};

	// If all else fails add it to the uniform
	(uniformContainer player) addItemCargoGlobal ["ACE_surgicalKit", 1];
};
