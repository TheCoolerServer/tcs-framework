/**
	Event handler for the onPlayerRespawn event of the tickets respawn template.
*/

//Just in case the player was respawned by some other method than the tickets
terminate TCS_var_ticketsRespawnLoopID;
"TCS_layer_tickets" cutFadeout 1;