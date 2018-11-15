/**
	Event handler for the onPlayerRespawn of the TCS_Respawn respawn template.
*/

["Terminate"] call BIS_fnc_EGSpectator;

if (TCS_var_reinitializeRadiosOnRespawn) then {
	[] call TCS_fnc_initPlayerRadios;
};