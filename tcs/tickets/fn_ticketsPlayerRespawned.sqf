/**
	Called by the player by remoteExecCall on the server to tell the server that a player just respawned
	so that it can update the tickets and broadcast the ticket value to everyone else.

	Parameters:
		0 - (player) Who just respawned
		1 - (side) The side of that player.

	Returns:
		None

	Example: 
		[player, playerSide] remoteExecCall ["TCS_fnc_ticketsPlayerRespawned", 2];

		[player, (side player)] remoteExecCall ["TCS_fnc_ticketsPlayerRespawned", 2];
*/

if (!isServer) exitWith {};


private _player = _this select 0;
private _side = _this select 1;

switch (_side) do {
	case west: {
		TCS_var_westTickets = (TCS_var_westTickets - 1);

		if (TCS_var_westTickets < 0) then {
			TCS_var_westTickets = 0;
		};

		publicVariable "TCS_var_westTickets";
	};

	case east: {
		TCS_var_eastTickets = (TCS_var_eastTickets - 1);
		
		if (TCS_var_eastTickets < 0) then {
			TCS_var_eastTickets = 0;
		};

		publicVariable "TCS_var_eastTickets";
	};

	case independent: {
		TCS_var_independentTickets = (TCS_var_independentTickets - 1);
		
		if (TCS_var_independentTickets < 0) then {
			TCS_var_independentTickets = 0;
		};

		publicVariable "TCS_var_independentTickets";
	};

	case civilian: {
		TCS_var_civilianTickets = (TCS_var_civilianTickets - 1);
		
		if (TCS_var_civilianTickets < 0) then {
			TCS_var_civilianTickets = 0;
		};

		publicVariable "TCS_var_civilianTickets";
	};
};