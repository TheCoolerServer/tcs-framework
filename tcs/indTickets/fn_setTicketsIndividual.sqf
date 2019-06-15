/**
	Descritpion:
		Sets the amount of tickets of a given player, all players or everyone but a player.

		Must be run on the server.

	Parameters:
		0 - (number) The ID of the player to set the tickets of. 0 can be used to set the tickets of all players and 
			negative numbers to set everyone's except the player with that ID.
		1 - (number) The number of tickets.

	Returns:
		None
*/

if (!isServer) exitWith {};

params ["_id", "_amount"];

[[_amount], {
	params ["_amount"];
	
	TCS_var_individualTickets = _amount;
}] remoteExec ["call", _id];