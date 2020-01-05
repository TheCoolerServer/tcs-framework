/**
	Description:
		Respawn loop responsible by updating the controls on the top of the screen and respawning the player when the tickets respawn template is used.
*/
#define SPECTATOR_DISPLAY_ID 60492
private _spectatorDisplay = findDisplay SPECTATOR_DISPLAY_ID;

private _respawnTime = playerRespawnTime;

//This loop is going to be terminated by the respawn event handler
while {!(alive player)} do {
	private _tickets = [] call TCS_fnc_getPlayerTickets;
	private _timeRemaining = _respawnTime - (time - TCS_var_ticketsDeathTime);

	//Make sure the player isn't respawned by arma because this will handle the respawn
	setPlayerRespawnTime _respawnTime;

	
	//Handle the respawn and exit the loop
	if(_timeRemaining < 0 && _tickets > 0) exitWith {
		if (TCS_var_ticketsMode == TCS_var_ticketsModeShared) then {
			// We need to tell the server we respawned to subtract the tickets
			[player, playerSide] remoteExec ["TCS_fnc_ticketsPlayerRespawned", 2];
		};

		//Need to set the respawn time properly after the player has respawned
		[_respawnTime] spawn {
			waitUntil {sleep 1; alive player};
			setPlayerRespawnTime (_this select 0);
		};

		//Respawn the player
		setPlayerRespawnTime 0;
		sleep 1;
	};

	sleep 1;
};

//Fade out the display;
"TCS_layer_tickets" cutFadeout 1;