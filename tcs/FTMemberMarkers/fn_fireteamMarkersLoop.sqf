/*
  Description: 
		Sync the groups teamcolors to other players in the group.

  Parameters
		0: (group) The group whose fireteam marker should be tracked.

	Returns:
		Nothing

 	Example:
 		[group, unit] call f_fnc_LocalFTMarkerSync;
*/

private ["_colorTeam"];
params["_group"];

while{player == (leader _group) && alive player} do{
	{
		private _groupUnit = _x;

		if (alive _groupUnit) then {
			_colorTeam = [assignedTeam _x] call TCS_fnc_teamColorToMarkerColor;

			// if _colorTeam is not equal to whatever is set on the unit we must update the other units in the group
			if((_x getvariable ["assignedTeam","ColorWhite"]) != _colorTeam) then {
				_groupUnit setvariable ["assignedTeam", _colorTeam, true];
			};
		};
	} foreach units _group;

	sleep 3;
};

//We died and are not the group leader anymore, tell the new leader to synchronize the markers
if(!isnil "_group") then {
	private _leader = leader _group;
	[_group, _leader] remoteExec ["TCS_fnc_fireteamMarkersLoop", _leader];
};
