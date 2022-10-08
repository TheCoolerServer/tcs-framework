/**
	Description:
		Event handler for the onPlayerRespawn of the TCS_Respawn respawn template.
*/

["Terminate"] call BIS_fnc_EGSpectator;

if (TCS_var_saveAndRestoreLoadouts) then {
	player setUnitLoadout TCS_var_playerLoadout;
};

// Re-add any radios that were given in the editor.
{
	(uniformContainer player) addItemCargoGlobal [_x, 1];
} forEach TCS_var_playerRadios;

[] spawn TCS_fnc_initPlayerRadios;

if (CBA_missionTime > TCS_var_allowVoluntarySpectatorAfter) then {
	[TCS_var_spectatorOptionTimeout] call TCS_fnc_addSpectateAction;
};
