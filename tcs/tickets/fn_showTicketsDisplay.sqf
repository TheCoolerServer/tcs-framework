/**
	Description:
		Shows the tickets display if it is not visible.

	Parameters:
		None

	Returns:
		None
*/

if (TCS_var_ticketsDisplayVisible) exitWith {};

"TCS_layer_tickets" cutRsc ["TicketsDisplay", "PLAIN"];

TCS_var_ticketsDisplayVisible = true;

[] spawn TCS_fnc_ticketsDisplayLoop;