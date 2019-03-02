/**
	Initializes everything that is needed by the framework on the server.
*/
[] call TCS_fnc_initParameterVariables;

[] call TCS_fnc_safeStartServer;

if (TCS_param_preInitFreezetTime > 0) then {
	[] call TCS_fnc_startFreezeLoop;
};