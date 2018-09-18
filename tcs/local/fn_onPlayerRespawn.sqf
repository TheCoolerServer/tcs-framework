["Terminate"] call BIS_fnc_EGSpectator;

if (TCS_var_reinitializeRadiosOnRespawn) then {
	[player] call TCS_fnc_initUnitRadios;
};