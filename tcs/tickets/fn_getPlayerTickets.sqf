/**
	Description:
		Returns the current amount of tickets the player has depending on which ticket type is selected.

	Parameters:
		None

	Returns:
		(number) The amount of tickets the player has
*/

if (TCS_var_ticketsMode == TCS_var_ticketsModeShared) exitWith {
	private _tickets = TCS_var_westTickets;

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

	_tickets;
};

TCS_var_individualTickets;