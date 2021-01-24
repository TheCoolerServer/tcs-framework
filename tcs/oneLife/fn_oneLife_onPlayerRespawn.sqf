/**
	Description:
		Event handler for the onPlayerRespawn of the TCS_OneLife respawn template.
*/

["Terminate"] call BIS_fnc_EGSpectator;

[] spawn TCS_fnc_initPlayerRadios;

TCS_var_mapClickTeleport_Rejoin = true;

[false] call TCS_fnc_mapClickTeleportAction;

if (CBA_missionTime > TCS_var_allowVoluntarySpectatorAfter) then {
	[TCS_var_spectatorOptionTimeout] call TCS_fnc_addSpectateAction;
};