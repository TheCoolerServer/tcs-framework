/**
	Event handler for the onPlayerKilled of the TCS_OneLife respawn template.
*/

cutText ["", "BLACK OUT", 5];
5 fadeSound 0.1;

oneLifeSpectatorActive = 1;
setPlayerRespawnTime 9999;

[] spawn {
	sleep 5;

	//Just in case the player respawned immediately, otherwise he will get stuck in the spectator screen
	if (!alive player) then
	{
		[] call TCS_fnc_spectate;
	};

	cutText ["", "BLACK IN", 1];
	1 fadeSound 1;
	
	createDialog "RespawnDialogButton";
	sleep 0.1;
	closeDialog 0;
};

if (TCS_var_saveAndRestoreRadioSettings) then {
	[] call TCS_fnc_savePlayerRadioSettings;
};