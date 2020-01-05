/**
	Description:
		Event handler for the onPlayerRespawn of the TCS_Respawn respawn template.
*/

["Terminate"] call BIS_fnc_EGSpectator;

[] spawn TCS_fnc_initPlayerRadios;