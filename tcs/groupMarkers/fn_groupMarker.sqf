/*
	Creates a marker that keeps track of the groups position.

	Parameters:
		0 - (Group) The group.
		1 - (string) Marker type (BIS classname)
		2 - (string) Marker text
		3 - (string) Marker color

	Returns:
		None

	Example:
		[group, "b_hq", "ASL", "ColorRed"] spawn TCS_fnc_groupMarker;

*/

params [
	"_group",
	["_markerType", "b_hq"],
	"_markerText",
	["_markerColor", "ColorBlack"]
];

private _markerName = "marker" + (groupId _group);

private _marker = createMarkerLocal [_markerName, getPos leader _group];

_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal  _markerType;
_marker setMarkerColorLocal _markerColor;
_marker setMarkerSizeLocal [0.8, 0.8];
_marker setMarkerTextLocal _markerText;

while {{!isNull _x} count units _group > 0} do{
	private _leaderPos = getPos leader _group;

	_marker setMarkerPosLocal _leaderPos;
	sleep TCS_var_groupMarkerUpdateInterval;
};
