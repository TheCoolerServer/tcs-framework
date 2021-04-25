#include "..\..\script_macros.hpp"


params[["_bld",objNull,[objNull]],"_group","_pos",["_radius",0,[0]],["_wait",3,[0]],["_behaviour","SAFE",[""]],["_combat","RED",[""]],["_speed","LIMITED",[""]],["_formation","WEDGE",[""]],["_Type","MOVE",[""]],["_oncomplete","",[""]],["_compradius",0,[0]],["_bldPos",[],[[]]],["_patrol",false,[false]]];
_group call CBA_fnc_clearWaypoints;
{_x forcespeed -1; _x enableAI "Path";} foreach units _group;
private _bpos = _pos;
if (isNull _bld) then {
    _bld = [_pos] call FUNC(getNearestBuilding);
    if (!isNull _bld) then {
        if (_bldPos isEqualTo []) then {_bldPos = _bld buildingPos -1;};
        _bpos = getPosATL _bld;
    };
};
if (_patrol) then {
    [_group,_bpos,_radius,_wait,_behaviour,_combat,_speed,_formation] spawn FUNC(taskPatrol);
} else {
    [0,"OBJECT",1,_bpos,_this] call FUNC(createWaypointModified);
    deleteWaypoint ((waypoints _group) select 0);
    while {{alive _x} count (units _group) >= ((count (units _group)) * 0.5) && (((getPosATL leader _group) distance (getposatl _bld)) > 30)} do {sleep 5;};
    {
        _x setvariable[QGVAR(Occupy),true];
        [_x,_bld,_bldPos,_wait,[_behaviour,_combat,_speed,_formation]] spawn FUNC(taskBuildingPatrol);
    } forEach (units _group);
};
if (GETMVAR(Debug,false)) then {
    [_group,(getposatl _bld),"nBldP"] call FUNC(debugCreateMarker);
};
SETVAR(_Group,InitialWPSet,true);
true
