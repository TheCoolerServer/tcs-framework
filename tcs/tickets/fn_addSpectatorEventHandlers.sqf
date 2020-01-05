/**
	Description:
		Waits and adds the necessary event handlers to the spectator display.

	Parameters:
		None

	Returns:
		None
*/

#define SPECTATOR_DISPLAY_ID 60492
#define TIMEOUT 10

private _spectatorDisplay = findDisplay SPECTATOR_DISPLAY_ID;
private _startTime = time;

waitUntil {
	_spectatorDisplay = findDisplay SPECTATOR_DISPLAY_ID;
	sleep 0.1;

	(!isNull _spectatorDisplay) || ((time - _startTime) > TIMEOUT);
};


if (isNull _spectatorDisplay) exitWith {};

_spectatorDisplay displayAddEventHandler ["KeyDown", "_this call TCS_fnc_spectatorOnKeyPressed"];