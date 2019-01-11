/**
	Initializes everything that is needed by the framework on the server.
*/

[] call TCS_fnc_safeStartServer;

if (TCS_var_preInitFreezeEnabled) then {
	[] call TCS_fnc_startFreezeLoop;
};

if (TCS_var_disableAIFSM) then {
	[] spawn TCS_fnc_continuouslyDisableFSM;
};