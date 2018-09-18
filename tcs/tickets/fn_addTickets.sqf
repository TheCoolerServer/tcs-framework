/**
	Adds tickets to a given side.

	Parameters:
		0 - (side) Which side to add tickets to.
		1 - (number) How many tickets to add.

	Returns:
		None

	Example:
		[east, 10] remoteExecCall ["TCS_fnc_addTickets", 2];
*/

if (!isServer) exitWith {};

private _val = round (_this select 1);

switch (_this select 0) do {
	case east: {
		TCS_var_eastTickets = (TCS_var_eastTickets + _val);
		publicVariable "TCS_var_eastTickets";
	};
	case west: {
		TCS_var_westTickets = (TCS_var_westTickets + _val);
		publicVariable "TCS_var_westTickets";
	};
	case independent: {
		TCS_var_independentTickets = (TCS_var_independentTickets + _val);
		publicVariable "TCS_var_independentTickets";
	};
	case civilian: {
		TCS_var_civilianTickets = (TCS_var_civilianTickets + _val);
		publicVariable "TCS_var_civilianTickets";
	};
};