/**
	Initializes everything that is needed by the framework on the server.
*/

[] call TCS_fnc_safeStartServer;

if (TCS_var_preInitFreezeEnabled) then {
	[] spawn {
		{
			_x enableSimulationGlobal false;
		}forEach playableUnits;
		[TCS_var_preInitCountdownTime] remoteExec ["TCS_fnc_showFreezeCountdown", 0];

		sleep TCS_var_preInitCountdownTime;
		
		{
			_x enableSimulationGlobal true;
		}forEach playableUnits;
		[] remoteExec ["TCS_fnc_revealPlayableUnits", 0];
	};
};