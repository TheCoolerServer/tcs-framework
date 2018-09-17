// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

if (!hasInterface) exitWith {}; //Exit if not a player.


// MAKE SURE THE PLAYER INITIALIZES PROPERLY
if (!isDedicated && (isNull player)) then{
    waitUntil {sleep 0.1; !isNull player};
};

private _playerSide = side player;

// DEBUG
if (f_param_debugMode == 1) then{
	player sideChat format ["DEBUG (briefing.sqf): Player side: %1", _playerSide];
};

// ====================================================================================
// BRIEFING: ADMIN

if (serverCommandAvailable "#kick") then {

	#include "f\briefing\f_briefing_admin.sqf"

	if (f_param_debugMode == 1) then{
		player sideChat format ["DEBUG (briefing.sqf): Briefing for host selected."];
	};
};

// ====================================================================================
// BRIEFING: WEST (BLUFOR)

if (_playerSide == west) exitwith {

	#include "f\briefing\f_briefing_west.sqf"

	if (f_param_debugMode == 1) then{
		player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.", west];
	};
};

// ====================================================================================
// BRIEFING: EAST (OPFOR)

if (_playerSide == east) exitwith {

	#include "f\briefing\f_briefing_east.sqf"

	if (f_param_debugMode == 1) then{
		player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.", east];
	};
};

// ====================================================================================
// BRIEFING: INDEPENDENT

if (_playerSide == independent) exitwith {

	#include "f\briefing\f_briefing_independent.sqf"

	if (f_param_debugMode == 1) then{
		player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.", independent];
	};
};

// ====================================================================================
// BRIEFING: CIVILIAN

if (_playerSide == civilian) exitwith {

	#include "f\briefing\f_briefing_civilian.sqf"

	if (f_param_debugMode == 1) then{
		player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.", civilian];
	};
};

// ====================================================================================
// BRIEFING: ZEUS

if (_playerSide == sideLogic) exitwith {

	#include "f\briefing\f_briefing_zeus.sqf"

	if (f_param_debugMode == 1) then{
		player sideChat format ["DEBUG (briefing.sqf): Briefing for %1 slot selected.", sideLogic];
	};
};


// ====================================================================================

// ERROR CHECKING
// If the faction of the unit cannot be defined, the script exits with an error.

player globalchat format ["DEBUG (briefing.sqf): Faction %1 is not defined.",_unitfaction];