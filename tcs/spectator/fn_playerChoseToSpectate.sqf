/**
	Description:
		Function called when the player chose to spectate. Refunds any tickets if they are enabled and shared.

	Parameters:
		None

	Returns:
		None
*/

[getPlayerUID player] remoteExec ["TCS_fnc_playerNowSpectating", 2];

if ([] call TCS_fnc_areTicketsEnabled) then {
	if (TCS_var_ticketsMode == TCS_var_ticketsModeShared) then {
		[playerSide, 1] remoteExec ["TCS_fnc_addTickets", 2];
	};
};

[] call TCS_fnc_moveToSpectator;