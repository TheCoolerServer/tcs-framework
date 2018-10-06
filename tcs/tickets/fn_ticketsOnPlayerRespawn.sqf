/**
	Event handler for the onPlayerRespawn event of the tickets respawn template.
*/
//The display is deleted here to make sure it is removed once the player respawns.
"TCS_layer_tickets" cutFadeout 2; //Remove the tickets display

if (!isNil "TCS_var_ticketsRespawnLoopID") then {
	terminate TCS_var_ticketsRespawnLoopID;
	TCS_var_ticketsRespawnLoopID = nil;
};