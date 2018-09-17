/**
	Returns the marker type based on the group's side and what kind of group it is.

	Parameters:
		0 - (Group) The group.
		1 - (string) What kind of group it is. (See fn_configure.sqf)
*/

private _groupSide = side (_this select 0);
private _groupType = _this select 1;

//Select which markers to use
private _markerArray = TCS_var_westgroupMarkers;

switch(_groupSide) do{
	case east: {
		_markerArray = TCS_var_eastGroupMarkers;
	};

	case independent: {
		_markerArray = TCS_var_independentGroupMarkers;
	};

	case civilian: {
		_markerArray = TCS_var_civilianGroupMarkers;
	};
};

//Get the correct marker based on the given group type
private _markerType = nil;

{
	private _definition = _x;

	if ((_definition select 0) == _groupType) exitWith {
		_markerType = (_definition select 1);
	};
} forEach _markerArray;

if (isNil "_markerType") then {
	_markerType = "b_hq";
};

_markerType