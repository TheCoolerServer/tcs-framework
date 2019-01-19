/*
	Description:
		Determines if the specified unit is the Curator (Zeus).
		Taken from: https://github.com/astruyk/Ares/blob/master/src/addons/ares_zeusExtensions/functions/fn_IsZeus.sqf
	
	Parameters:
		0 - [Object] The unit to test for zeusness
		
	Returns:
		True if the provided unit was associated with a curator module, false otherwise.
*/

_candidateUnit = _this select 0;
_result = false;

{
	_zeusUnit = getassignedcuratorunit _x;
	if (_candidateUnit == _zeusUnit) exitWith {
		_result = true 
	};
} foreach allCurators;

_result;