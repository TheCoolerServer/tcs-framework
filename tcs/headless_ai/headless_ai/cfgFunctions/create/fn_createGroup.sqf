#include "..\..\script_macros.hpp"


params [
    "",
    "_groupSet",
    "_groupMem",
    ["_currentVeh",objNull,[objNull]]
];

_groupSet params [
    /* 0 */ "_side",
    /* 1 */ "_groupPos",
    /* 2 */ "_behaviour",
    /* 3 */ "_combat",
    /* 4 */ "_speed",
    /* 5 */ "_formation",
    /* 6 */ "_groupStance",
    /* 7 */ "_groupInit",
    /* 8 */ "_createRadius",
    /* 9 */ "_taskRadius",
    /* 10 */ "_wait",
    /* 11 */ "_startBld",
    /* 12 */ "_task",
    /* 13 */ "_taskTimer",
    /* 14 */ "_multi",
    /* 15 */ "_occupyOption",
    /* 16 */ "_vehAssigned",
    /* 17 */ "_waypoints",
    /* 18 */ "_onWater",
    /* 19 */ "_fl",
    /* 20 */ "_surrender",
    /* 21 */ "_tracker",
    /* 22 */ "_storedVars",
    /* 23 */ "_name",
    /* 24 */ "_groupID"
];
createCenter _side;
private _group = createGroup _side;
_group setVariable ["lambs_danger_disableGroupAI", true, true];

if !(_name isEqualTo "") then {
    private _uniqueName = [_name] call FUNC(findUniqueName);
    missionNamespace setVariable [_uniqueName, _group, true];
};

if !(_groupID isEqualTo "") then {
    _group setGroupIdGlobal _groupID;
};

if !(_storedVars isEqualTo []) then {
    {
        _x params ["_varName", "_varValue"];
        _group setvariable [_varName, _varValue];
    } forEach _storedVars;
};

{
    if ((_x select 0)) then {
        private _u = [false, _group, _groupPos, _startBld, _foreachIndex, _x, _taskRadius, _currentVeh] call FUNC(createUnit);
    } else {
        private _vpos = (_x select 2);
        private _v = [_vpos, _x, _side] call FUNC(createVehicle);
        _currentVeh = _v;
    };
} foreach _groupMem;

[_group,_groupSet] call FUNC(setGroupVariables);
_group call CBA_fnc_clearWaypoints;


//if !(_tasks isEqualTo []) then {
//    [_group,_tasks] call FUNC(taskRegister);
//    _tasks = _tasks call FUNC(taskRemoveZoneActivated);
//};
//if !(_tasks isEqualTo []) then {GVAR(taskedGroups) pushBack [_group];};
if ((count _waypoints > 1) && {_task isEqualTo "NONE"}) then {
    LOG_2("Setting %1 to manual wp mode with: %2",_group,_waypoints);
    [_group,_waypoints] call FUNC(createWaypoints);
} else {
    LOG_2("Setting %1 to task: %2",_group,_task);
    private _passarray = [_task,_group,_groupPos,_taskRadius,_wait,_behaviour,_combat,_speed,_formation,_occupyOption];
    [{!((count waypoints (_this select 1)) isEqualTo 0)},{
        _this call FUNC(taskAssign);
    },_passarray] call CBA_fnc_waitUntilAndExecute;
    //if (!(_tasks isEqualTo []) && {(_group getVariable [QGVAR(TaskTimer),0]) isEqualTo 0}) then {
    //    [_group,_tasks] call FUNC(taskInit);
    //} else {
    //    _group setVariable [QGVAR(CurrentTaskEndTime),(CBA_MissionTime + _taskTimer)];
    //    private _passarray = [_task,_group,_groupPos,_taskRadius,_wait,_behaviour,_combat,_speed,_formation,_occupyOption];
    //    [{!((count waypoints (_this select 1)) isEqualTo 0)},{
    //        _this call FUNC(taskAssign);
    //    },_passarray] call CBA_fnc_waitUntilAndExecute;
    //};
};
_group
