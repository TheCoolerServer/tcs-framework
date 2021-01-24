if (!hasInterface) exitWith {};

private _playerSide = side player;

[] call TCS_fnc_loadoutNotes;

//================================ Admin briefing ================================
// Admin briefing is added on TCS_fnc_adminInit;

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
