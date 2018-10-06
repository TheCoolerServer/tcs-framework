/**
	Event handler for the onPlayerRespawn event of the tickets respawn template.
*/
if (!isNil "TCS_var_ticketsRespawnLoopID") then {
	terminate TCS_var_ticketsRespawnLoopID;
	TCS_var_ticketsRespawnLoopID = nil;
};