/**
	Description:
		Event handler for the onPlayerRespawn of the TCS_Respawn respawn template.
*/

["Terminate"] call BIS_fnc_EGSpectator;

if (TCS_var_saveAndRestoreLoadouts) then {
	player setUnitLoadout TCS_var_playerLoadout;
};

/** 
	In my testing, this specific case ended up with the player missing framework radios on respawn,
	thus I add this line of code to add them back.
*/
if ((TCS_var_addRadiosToPlayers) and (not TCS_var_saveAndRestoreLoadouts)) then {
	[] call TCS_fnc_addConfigurationRadiosToPlayer;
};

[] spawn TCS_fnc_initPlayerRadios;

if (CBA_missionTime > TCS_var_allowVoluntarySpectatorAfter) then {
	[TCS_var_spectatorOptionTimeout] call TCS_fnc_addSpectateAction;
};
