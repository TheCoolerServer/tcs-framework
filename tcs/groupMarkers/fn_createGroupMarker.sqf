if (!isDedicated && hasInterface) then {
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