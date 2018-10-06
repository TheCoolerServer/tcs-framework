/**
	Creates a marker that tracks a group's position on the map, the location of the marker is the group leader's position.

	Parameters:
		0 - (Group) The group that should be tracked.
		1 - (String) What kind of group this group is. (@see tcs\fn_configure.sqf)
		2 - (String) The text that should appear on the marker.
		3 - (String) What color should the marker have.
	
	Returns:
		None

	Example:
		[group1, "Lead", "ASL", "ColorRed"] call TCS_fnc_createGroupMarker;
*/

if (hasInterface) then {
	_this spawn {
		params [
			"_group",
			"_groupType",
			"_text",
			"_color"
		];

		waitUntil {
			sleep 1;
			!isNull player
		};

		if (!TCS_var_showMarkersOfOtherSides && (side _group != side player)) exitWith {};

		private _markerType = [_group, _groupType] call TCS_fnc_getMarkerByGroup;
		[_group, _markerType, _text, _color] spawn TCS_fnc_groupMarker;
	}
};