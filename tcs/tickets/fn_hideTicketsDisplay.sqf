/**
	Description:
		Hides the tickets display if it is visible.
	
	Parameters:
		None

	Returns:
		None
*/

if (!TCS_var_ticketsDisplayVisible) exitWith {};

TCS_var_ticketsDisplayVisible = false;

terminate TCS_var_ticketsDisplayID;

"TCS_layer_tickets" cutFadeout 0.1;
