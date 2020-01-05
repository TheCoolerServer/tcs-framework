/**
	Description:
		Event handler for the onPlayerKilled event of the tickets respawn template.
*/

TCS_var_ticketsDeathTime = time;
TCS_var_ticketsRespawnLoopID = [] spawn TCS_fnc_ticketsRespawnLoop;

[] call TCS_fnc_showTicketsDisplay;