/**
	Description:	
		Checks if the tickets module is enabled in the respawn templates.
		It will return true wether the tickets or the individual tickets templates are enabled.

	Parameters:
		None

	Returns:
		true or false
*/

private _templates = getArray (missionConfigFile >> "respawnTemplates");

private _hasTicketsTemplates = false;

{
	if (_x == "TCS_Tickets" || _x == "TCS_Individual_Tickets") exitWith {
		_hasTicketsTemplates = true;
	};
} forEach _templates;

_hasTicketsTemplates;