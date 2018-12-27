// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

if (!hasInterface) exitWith {}; //Exit if not a player.


// MAKE SURE THE PLAYER INITIALIZES PROPERLY
if (isNull player) then{
    waitUntil {sleep 0.1; !isNull player};
};

private _playerSide = side player;

// ====================================================================================
// BRIEFING: ADMIN

if (serverCommandAvailable "#kick") then {
	#include "f\briefing\f_briefing_admin.sqf"
} else {
	//getAssignedCuratorLogic and getAssignedCuratorUnit do not work properly on mission time 0
	//and the mission time doesn't increase on the briefing screen, so we need to wait for the time
	//to increase and then make sure we have a curator logic assigned to include the admin briefing
	if (TCS_var_allZeusesGetAdminBriefing) then {
		[] spawn {
			private _start = time;

			while {(time - _start) < 10} do {
				if (!isNull (getAssignedCuratorLogic player)) exitWith {
					[] execVM "f\briefing\f_briefing_admin.sqf";
				};
				sleep 1;
			};
		}
	};
};

// ====================================================================================
// BRIEFING: WEST (BLUFOR)

if (_playerSide == west) exitwith {
	#include "f\briefing\f_briefing_west.sqf"
};

// ====================================================================================
// BRIEFING: EAST (OPFOR)

if (_playerSide == east) exitwith {
	#include "f\briefing\f_briefing_east.sqf"
};

// ====================================================================================
// BRIEFING: INDEPENDENT

if (_playerSide == independent) exitwith {
	#include "f\briefing\f_briefing_independent.sqf"
};

// ====================================================================================
// BRIEFING: CIVILIAN

if (_playerSide == civilian) exitwith {
	#include "f\briefing\f_briefing_civilian.sqf"
};

// ====================================================================================
// BRIEFING: ZEUS

if (_playerSide == sideLogic) exitwith {
	#include "f\briefing\f_briefing_zeus.sqf"	
};