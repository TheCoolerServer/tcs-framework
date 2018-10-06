/**
	Event handler for the onPlayerKilled event of the tickets respawn template.
*/

if (isNil "TCS_var_ticketsRespawnLoopID") then {
	TCS_var_ticketsRespawnLoopID = [] spawn TCS_fnc_ticketsRespawnLoop;
}else {
	systemChat "ERROR - Tried to start the respawn loop while it is still running.";
};