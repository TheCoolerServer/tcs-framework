/*
	Initializes a group.

	Parameters:
		0 - (group) The group that should be initialized
		1 - (string) What kind of group this group is (See fn_configure.sqf)
		2 - (string) The text that should appear on the map.
		3 - (string) The color that this group should have.
*/

if (isServer) then {
	//Nothing yet
} else {
	if (TCS_var_groupMarkersEnabled) then {
		_this call TCS_fnc_createGroupMarker;
	};
};
