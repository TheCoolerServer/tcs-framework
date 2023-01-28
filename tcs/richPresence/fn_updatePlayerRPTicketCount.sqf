/**
	Description:	
		Updates player's ticket count for Discord Rich Presence on respawn.

	Parameters:
		None

	Returns:
		None
*/

[["UpdateSmallImageText", format["Tickets: %1", [] call TCS_fnc_getPlayerTickets]]] call (missionNameSpace getVariable ["DiscordRichPresence_fnc_update",{}]);