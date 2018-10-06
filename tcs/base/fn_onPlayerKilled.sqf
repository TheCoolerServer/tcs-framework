/**
	Event handler for the onPlayerKilled of the TCS_Respawn respawn template.
*/

TCS_var_wasKilled = true;

cutText ["", "BLACK OUT", 5];
5 fadeSound 0.1;

[] spawn {
	sleep 5;

	//Just in case the player respawned immediately, otherwise he will get stuck in the spectator screen
	if (!alive player) then{
		["Initialize", [player]] call BIS_fnc_EGSpectator;	
	};

	cutText ["", "BLACK IN", 1];
	1 fadeSound 1;
};