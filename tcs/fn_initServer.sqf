/**
	Initializes everything that is needed by the framework on the server.
*/
[] call TCS_fnc_initParameterVariables;

[] call TCS_fnc_safeStartServer;

[] call TCS_fnc_initSpectatorServer;

if (TCS_param_preInitFreezeTime > 0) then {
	[] call TCS_fnc_startFreezeLoop;
};

if (TCS_var_disableAIFSM) then {
	[] spawn TCS_fnc_continuouslyDisableFSM;
};

[] spawn TCS_fnc_serverFpsLoop; 