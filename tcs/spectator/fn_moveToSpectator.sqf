/**
	Description:
		Moves the player to spectator and:
			- Sets the player invincible.
			- Sets the player invisible.
		
	Parameters:
		None

	Returns:
		None
*/

private _group = createGroup playerSide;
[player] joinSilent _group;

player allowDamage false;
[player, true] remoteExec ["hideObjectGlobal", 2];

player setPos [0, 0, 0];
[player, false] remoteExec ["enableSimulationGlobal", 2];

[] call TCS_fnc_spectate;