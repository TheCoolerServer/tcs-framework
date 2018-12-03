/**
	Called by the server to tell the player to show the freeze title text countdown.

	Parameters:
		0 - (number) How many seconds does the freeze last.

	Returns: 
		None
	
	Example:
		[] call TCS_fnc_showFreezeCountdown;
*/

_this spawn {
	params ["_seconds"];

	while {_seconds > 0} do {
		private _text = format ["Pre-init freeze\n%1 seconds remaining", _seconds];
		titleText [_text, "PLAIN"];
		_seconds = _seconds - 1;
		sleep 1;
	};

	titleText ["", "PLAIN"];
}
