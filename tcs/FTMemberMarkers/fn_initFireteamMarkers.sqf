/*
  Description:
		Starts the scheduled task that handles the fireteam markers.

  Parameters:
		None

	Returns:
		None

 	Example:
 		[] call TCS_fnc_initFireteamMarkers;
*/

[] spawn {
	TCS_var_aliveFireteamMembers = [];

	while{!isNull player} do
	{
		{
			// check if we already are drawing the FT marker and that _x is alive
			if(!(_x in TCS_var_aliveFireteamMembers) && alive _x) then {
				[_x] spawn TCS_fnc_localFTMemberMarker;
				TCS_var_aliveFireteamMembers pushBack _x;
			};
		} forEach units (group player);

		sleep 5;
	};
};

//If we are the group leader, we keep track of the color changes
if(player == leader (group player)) then {
	[group player] spawn TCS_fnc_fireteamMarkersLoop;
};
