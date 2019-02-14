if (!hasInterface) exitWith {};

private _playerSide = side player;

[] call TCS_fnc_loadoutNotes;

//================================ Admin briefing ================================
if (serverCommandAvailable "#kick") then {
	[] call TCS_fnc_briefing_admin;
} else {
	//getAssignedCuratorLogic and getAssignedCuratorUnit do not work properly on mission time 0
	//and the mission time doesn't increase on the briefing screen, so we need to wait for the time
	//to increase and then make sure we have a curator logic assigned to include the admin briefing
	if (TCS_var_allZeusesGetAdminBriefing) then {
		[] spawn {
			private _start = time;

			while {(time - _start) < 10} do {
				if (!isNull (getAssignedCuratorLogic player)) exitWith {
					[] call TCS_fnc_briefing_admin;
				};
				sleep 1;
			};
		}
	};
};

//============================ West briefing (BLUFOR) ============================
if (_playerSide == west) exitwith {
	[] call TCS_fnc_briefing_west;
};

//============================= East briefing (OPFOR) ============================
if (_playerSide == east) exitwith {
	[] call TCS_fnc_briefing_east;
};

//============================= Independent briefing =============================
if (_playerSide == independent) exitwith {
	[] call TCS_fnc_briefing_independent;
};

//=============================== Civilian briefing ==============================
if (_playerSide == civilian) exitwith {
	[] call TCS_fnc_briefing_civilian;
};

//================================= Zeus briefing ================================
if (_playerSide == sideLogic) exitwith {
	[] call TCS_fnc_briefing_zeus;
};