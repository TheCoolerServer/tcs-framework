/**
	Starts the pre-init freeze countdown.

	MUST BE CALLED ON THE SERVER.

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

	while {(time - _start) < _freezeTime} do {
		private _secondsRemaining = floor (time - _start);
		private _text = format ["Pre-init freeze\n%1 seconds remaining", _secondsRemaining];

		[[_text, "PLAIN"]] remoteExec ["titleText", -2];
		
		sleep 1;
	};

	[["", "PLAIN"]] remoteExec ["titleText", -2];
}
