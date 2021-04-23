#include "..\..\script_macros.hpp"


params[["_blds",[],[[]]],"_group","_pos",["_radius",0,[0]],["_wait",3,[0]],["_behaviour","SAFE",[""]],["_combat","RED",[""]],["_speed","LIMITED",[""]],["_formation","WEDGE",[""]],["_Type","MOVE",[""]],["_oncomplete","",[""]],["_compradius",0,[0]],["_bldPos",[],[[]]],["_bld1",objNull,[objNull]],["_bld2",[],[[]]],["_patrol",false,[false]]];
_group call CBA_fnc_clearWaypoints;
{_x forcespeed -1; _x enableAI "Path";} foreach units _group;
private _bpos = _pos;
if (count _blds < 1) then {
    _bld1 = [_pos,_radius] call FUNC(getNearestBuilding);
    if (!isNull _bld1) then {
        _bpos = getPosATL _bld1;
        _blds pushBack _bld1;
        _bld2 = [_bpos,_radius,3] call FUNC(getNearestGroupBuildings);
        {_blds pushBack _x;} forEach (_bld2 select {_bld1 != _x});
    };
    if (count _blds < 1) then {
        _bpos = _pos;
        _patrol = true;
    };
};
if (_patrol) then {
    if (_radius < 1) then {_radius = 30;};
    [_group,_bpos,_radius,_wait,_behaviour,_combat,_speed,_formation] spawn FUNC(taskPatrol);
} else {
    [0,"ARRAY",1,_bpos,_this] call FUNC(createWaypointModified);
    deleteWaypoint ((waypoints _group) select 0);
    while {{alive _x} count (units _group) <= ((count (units _group)) * 0.5) || (((getPosATL leader _group) distance _pos) > 50)} do { sleep 5; };
    {
        _x setvariable[QGVAR(Occupy),true];
        private _uBld = _blds select (_forEachIndex % (count _blds));
        _bldPos = _uBld buildingPos -1;
        [_x,_uBld,_bldPos,_wait,[_behaviour,_combat,_speed,_formation]] spawn FUNC(taskBuildingDefend);
    } forEach (units _group);
};
if (GETMVAR(Debug,false)) then {
    if (_patrol) then {
        if (_radius < 1) then {_radius = 30;};
        [_group,_bpos,"BLDERROR PATROL","ColorOPFOR"] call FUNC(debugCreateMarker);
    } else {
        {
            [_group,(getPosATL _x),format["gBldD%1",_forEachIndex]] call FUNC(debugCreateMarker);
        } forEach _blds;
    };
};
SETVAR(_Group,InitialWPSet,true);
true
