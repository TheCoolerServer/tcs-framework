/*
	Initializes a group in the player's side.

	Parameters:
		0 - (group) The group that should be initialized
		1 - (string) What kind of group this group is (See configuration.sqf)
		2 - (string) The text that should appear on the map.
		3 - (string) The color that this group should have.
*/

if (TCS_var_groupMarkersEnabled) then {
	if (!isDedicated && hasInterface) then {
		_this spawn {
			private _group = _this select 0;
			private _groupType = _this select 1;
			private _text = _this select 2;
			private _color = _this select 3;

			waitUntil {
				sleep 1;
				!isNull player
			};

			if (!TCS_var_showMarkersOfOtherSides && (side _group != side player)) exitWith {};

			private _markerType = [_group, _groupType] call TCS_fnc_getMarkerByGroup;
			[_group, _markerType, _text, _color] spawn TCS_fnc_groupMarker;
		}
	};
};