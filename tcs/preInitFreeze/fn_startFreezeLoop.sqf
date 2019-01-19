/**
	Description:
		Starts the pre-init freeze countdown.
		Must be called on the server.

	Parameters:
		0 - (number) How many seconds does the freeze last.

	Returns: 
		None
	
	Example:
		[] call TCS_fnc_showFreezeCountdown;
*/

[] spawn {
	private _freezeTime = TCS_var_preInitCountdownTime;
	private _start = time;

	{
		_x enableSimulationGlobal false;
	} forEach playableUnits;

	while {(time - _start) < _freezeTime} do {
		private _secondsRemaining = floor (_freezeTime - (time - _start));
		private _text = format ["Pre-init freeze\n%1 seconds remaining", _secondsRemaining];

		[[_text, "PLAIN"]] remoteExec ["titleText", -2];

		sleep 1;
	};

	{
		_x enableSimulationGlobal true;
	} forEach playableUnits;

	[["", "PLAIN"]] remoteExec ["titleText", -2];
	remoteExec ["TCS_fnc_revealPlayableUnits", -2];
};
