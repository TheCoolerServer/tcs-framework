/**
	Description:	
		Removes the given radio list from the player if he has them.

	Parameters:
		0 - (array[string]) Array of radio classes to remove from the player.

	Returns:
		None
 */

 params ["_radiosToRemove"];

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