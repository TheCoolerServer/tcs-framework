/**
	Respawn loop responsible by updating the controls on the top of the screen when the tickets respawn template is used.
*/

"TCS_layer_tickets" cutRsc ["TicketsDisplay", "PLAIN"];

private _ticketsControl = ((uiNamespace getVariable "TCS_var_ticketDisplay") displayCtrl 1100);
private _countdownControl = ((uiNamespace getVariable "TCS_var_ticketDisplay") displayCtrl 1101);
private _respawnTime = playerRespawnTime;
private _start = time;

//This loop is going to be terminated by the respawn event handler
while {true} do {
	private _tickets = TCS_var_westTickets;
	private _timeRemaining = _respawnTime - (time - _start);

	switch(playerSide) do {
		case east: {
			_tickets = TCS_var_eastTickets;
		};

		case independent: {
			_tickets = TCS_var_independentTickets;
		};

		case civilian: {
			_tickets = TCS_var_civilianTickets;
		};
	};

	//Setup the text to be displayed in the controls
	private _countdownText = "";
	private _ticketsText = "";

	if (_tickets <= 0) then {
		_countdownText = parseText ("<t align='center'>Respawn timer: <t color='#FF0000'>--:--</t></t>");
		_ticketsText = parseText ("<t alight='right'>Tickets remaining: <t color='#FF0000'>0</t></t>");
	}else {
		private _minutes = 0;
		private _seconds = 0;

		if (_timeRemaining > 60) then {
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

	

	//Set the text in the controls
	_ticketsControl ctrlSetStructuredText _ticketsText;
	_countdownControl ctrlSetStructuredText _countdownText;

	//Make sure the player isn't respawned by arma because this will handle the respawn
	setPlayerRespawnTime _respawnTime;

	
	//Handle the respawn
	if(_timeRemaining < 0 && _tickets > 0) then {
		[player, playerSide] remoteExecCall ["TCS_fnc_ticketsPlayerRespawned", 2]; //Tell the server we just respawned

		//Need to set the respawn time properly after the player has respawned
		[_respawnTime] spawn {
			waitUntil {sleep 1; alive player};
			setPlayerRespawnTime (_this select 0);
		};

		//Respawn the player
		setPlayerRespawnTime 0;
		sleep 0.1;
		forceRespawn player;
	};

	sleep 1;
};
