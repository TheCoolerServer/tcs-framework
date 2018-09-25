if (!isDedicated && hasInterface && TCS_var_groupMarkersEnabled) then {
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