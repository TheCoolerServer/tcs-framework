/**
	Description:
		Event handler for the onPlayerRespawn of the TCS_Respawn respawn template.
*/

["Terminate"] call BIS_fnc_EGSpectator;

if (TCS_var_saveAndRestoreLoadouts) then {
	player setUnitLoadout TCS_var_playerLoadout;
};


if (CBA_missionTime > TCS_var_allowVoluntarySpectatorAfter) then {
	[TCS_var_spectatorOptionTimeout] call TCS_fnc_addSpectateAction;
};
