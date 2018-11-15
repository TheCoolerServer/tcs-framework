/**
	Respawn event handler for the TCS_BackToGroup respawn template.

	Same parameters as onPlayerRespawn.sqf
	https://community.bistudio.com/wiki/Event_Scripts
*/

params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];
private _group = group _newUnit;

if ({alive _x} count (units _group) > 1) then {
	private _lookDirection = [0, 0, 0];
	private _groupCenter = [0, 0, 0];
	private _alivePlayerCount = 0;

	//Get the general direction all of the alive players are looking at
	{
		private _unit = _x;

		if (alive _unit && _unit != _newUnit) then {
			_groupCenter = _groupCenter vectorAdd (getPos _unit);
			_lookDirection = _lookDirection vectorAdd (vectorDir _unit);
			_alivePlayerCount = _alivePlayerCount + 1;
		};
	} forEach (units _group);

	//Normalize the vector
	_lookDirection = vectorNormalized _lookDirection;

	_groupCenter = _groupCenter vectorMultiply (1 / _alivePlayerCount);
	
	//For now we'll teleport the player behind where everyone is looking
	// -1 to make it the opposite direction and 100 being the distance
	private _spawnOffset = _lookDirection vectorMultiply (-1 * 100);

	//Find a safe position for the player to teleport to
	private _spawnPos = _groupCenter vectorAdd _spawnOffset;
	_spawnPos = [
		_spawnPos, 	//center
		0, 			//minDist
		10, 		//Max dist
		1, 			//Obj dist
		0, 			//Water mode (0 - Cannot be in water)
		1, 			//Max gradient (Terrain angle)
		0,			//Shore mode (0 - Does not have to be on shore)
		[], 		//Blacklist positions
		[_spawnPos, _spawnPos] //Default positions (If no position is found, teleport the player there anyway)
	] call BIS_fnc_findSafePos;

	//Teleport the player and make it look where everyone is looking
	_newUnit setPos _spawnPos;
	_newUnit setVectorDir _lookDirection;
} else {
	_newUnit setPos M_var_deathPosition;
};