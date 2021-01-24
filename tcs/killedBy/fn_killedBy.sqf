// Informs the player in systemChat who and what killed them.

player addEventHandler ["killed",
{
	params ["_player", "_killer", "_instigator"];
	
	// Set killer's variables
	_killerName = name _instigator;
	_killerWeapon = getText(configFile >> "CfgWeapons" >> currentWeapon (vehicle _killer) >> "displayname");
	_killerType = getText (configFile >> "CfgVehicles" >> typeof (vehicle _killer) >> "Displayname");
	_killerDistance = _killer distance _player;
	_killerRoundDistance = round _killerDistance;
	
	// Get killer's side
	_killerSide = side _killer;
	_killerSideString = "";

	switch (_killerSide) do
	{
		case west:
		{
			_killerSideString = "BLUFOR";
		};
		
		case east:
		{
			_killerSideString = "OPFOR";
		};
		
		case resistance:
		{
			_killerSideString = "INDFOR";
		};
		
		case civilian:
		{
			_killerSideString = "CIVILIAN";
		};
		
		case sideEnemy:
		{
			_killerSideString = "RENEGADE";
		};
	};

	// Execute killedBy message in systemChat
	if (_killerName != "Error: No vehicle") then
	{
		if (_killerSide == playerSide) then
		{
			systemChat format ["Killed by [%1] %2 - %3: %4m with %5 (Friendly Fire)", _killerSideString, _killerName, _killerType, _killerRoundDistance, _killerWeapon];
		}
		else
		{
			systemChat format ["Killed by [%1] %2 - %3: %4m with %5", _killerSideString, _killerName, _killerType, _killerRoundDistance, _killerWeapon];
		};
	};
}];