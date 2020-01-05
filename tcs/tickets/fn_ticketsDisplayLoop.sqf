

private _ticketsDisplay = uiNamespace getVariable "TCS_var_ticketDisplay";
private _ticketsControl = (_ticketsDisplay displayCtrl 1100);
private _countdownControl = (_ticketsDisplay displayCtrl 1101);

private _respawnTime = playerRespawnTime;

while {TCS_var_ticketsDisplayVisible} do {
	private _tickets = [] call TCS_fnc_getPlayerTickets;
	private _timeRemaining = _respawnTime - (time - TCS_var_ticketsDeathTime);

	//Setup the text to be displayed in the controls
	private _countdownText = "";
	private _ticketsText = "";

	if (_tickets <= 0) then {
		_countdownText = parseText ("<t align='left'>Respawn in: <t color='#FF0000'>--:--</t></t>");
		_ticketsText = parseText ("<t alight='right'>Tickets remaining: <t color='#FF0000'>0</t></t>");
	} else {
		private _minutes = 0;
		private _seconds = 0;

		if (_timeRemaining >= 60) then {
			_minutes = floor (_timeRemaining / 60);
			_timeRemaining = round (_timeRemaining - _minutes * 60);
		};
		_seconds = round _timeRemaining;

		//Make sure it has at least 2 digits
		if (_seconds < 10) then {
			_seconds = format ["0%1", _seconds];
		};

		if (_minutes < 10) then {
			_minutes = format["0%1", _minutes];
		};

		_countdownText = parseText (format["<t align='left'>Respawn in: %1:%2</t>", _minutes, _seconds]);
		_ticketsText = parseText (format ["<t alight='right'>Tickets remaining: %1</t>", _tickets]);
	};

	_ticketsControl ctrlSetStructuredText _ticketsText;
	_countdownControl ctrlSetStructuredText _countdownText;
};

"TCS_layer_tickets" cutFadeout 1;