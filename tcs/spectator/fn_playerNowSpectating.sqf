/**
	Description:
		Called by the player on the server to tell the server he is now spectating.

	Parameters:
		None

	Returns:
		None
*/

params["_playerUID"];

TCS_var_spectatorList pushBack _playerUID;
publicVariable "TCS_var_spectatorList";