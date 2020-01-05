/**
	Description:	
		Sets up the internal state of the tickets module based on the respawn templates.
		It's done this way to prevent having duplicate code that is a pain in the ass to change.

	Parameters:
		None

	Returns:
		None
*/

TCS_var_ticketsModeShared = 0;
TCS_var_tickesModeIndividual = 1;

TCS_var_ticketsMode = TCS_var_ticketsModeShared;
TCS_var_ticketsDisplayVisible = false;
TCS_var_ticketsDeathTime = 0;

private _templates = getArray (missionConfigFile >> "respawnTemplates");

if ((_templates find "TCS_Tickets") >= 0) exitWith {
	TCS_var_ticketsMode = TCS_var_ticketsModeShared;
};

if ((_templates find "TCS_Individual_Tickets") >= 0) exitWith {
	TCS_var_ticketsMode = TCS_var_tickesModeIndividual;
};