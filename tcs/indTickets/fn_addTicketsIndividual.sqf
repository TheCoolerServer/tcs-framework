/**
	Descritpion:
		Adds the given amount of tickets to the given player, all players or everyone but a player.

		Must be run on the server.

	Parameters:
		0 - (number) The ID of the player to give tickets to. 0 can be used to give tickets to all players and 
			negative numbers to give to everyone except the player with that ID.
		1 - (number) The number of tickets to add or subtract.

	Returns:
		None
*/

if (!isServer) exitWith {};

params ["_id", "_amount"];

[[_amount], {
	params ["_amount"];

	TCS_var_individualTickets = TCS_var_individualTickets + _amount;
}] remoteExec ["call", _id];