["Terminate"] call BIS_fnc_EGSpectator;

if (TCS_var_wasKilled && TCS_var_reinitializeRadiosOnRespawn) then {
	[] call TCS_fnc_initPlayerRadios;
};

TCS_var_wasKilled = false;