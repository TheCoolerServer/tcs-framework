#include "script_component.hpp"


params [
    ["_group",grpNull,[grpNull]],
    ["_task","NONE",["NONE"]],
    ["_pos",[],[[]]],
    ["_radius",50,[0]],
    ["_wait",3,[0]],
    ["_behaviour", "UNCHANGED", [""]],
    ["_combat", "NO CHANGE", [""]],
    ["_speed", "UNCHANGED", [""]],
    ["_formation", "NO CHANGE", [""]],
    ["_occupyOption",0,[0]],
    ["_bld",objNull,[objNull]],
    ["_blds",[],[[]]]
];

private _taskSet = [_group,_pos,_radius,_wait,_behaviour,_combat,_speed,_formation];
private _taskSetBasic = [_group,_behaviour,_combat,_speed,_formation];
private _taskSetBld = [_bld,_group,_pos,_radius,_wait,_behaviour,_combat,_speed,_formation];
private _taskSetBlds = [_blds,_group,_pos,_radius,_wait,_behaviour,_combat,_speed,_formation];

_task = toUpper _task;
if (_task isEqualTo "NONE") then {
    _task = "PATROL";
    LOG_2("group:%1 defaulted to task: %2,",_group,_task);
};
LOG_2("group:%1 set to task: %2,",_group,_task);
switch (_task) do {
    case "MANUAL": {};
    case "GARRISON": {
        _taskSet call FUNC(taskPatrol);
    };
    case "PATROL": {
        _taskSet call FUNC(taskPatrol);
    };
    case "PERIMPATROL": {
        _taskSet call FUNC(taskPatrolPerimeter);
    };
    case "SENTRY": {
        _taskSet call FUNC(taskSentry);
    };
    case "ATTACK": {
        _taskSet call FUNC(taskAttack);
    };
    case "ASSAULT": {
        _taskSet call FUNC(taskAssault);
    };
    case "MOVE": {
        _taskSet call FUNC(taskPatrol);
    };
    case "DEFEND": {
        _taskSet call FUNC(taskDefend);
    };
    case "BUNKER": {
        _taskSet call FUNC(taskBunker);
    };
    case "LOITER": {
        _taskSet call FUNC(taskLoiter);
    };
    case "STATIONARY": {
        _taskSet call FUNC(taskStationary);
    };
    case "HOLD": {
        _taskSet call FUNC(taskPatrol);
    };
    case "BYPASS": {
        _taskSet call FUNC(taskPatrol);
    };
    case "BLDMOVE": {
        _taskSet call FUNC(taskPatrol);
    };
    case "BLDDEFEND": {
        _taskSet call FUNC(taskPatrol);
    };
    case "BLDSEARCH": {
        _taskSet call FUNC(taskPatrol);
    };
    case "PICKUP": {
        _taskSet call FUNC(taskPickup);
    };
    case "CARGO": {
        _group setVariable [QGVAR(Task),"CARGO"];
    };
    case "DROPOFF": {
        _taskSet call FUNC(taskDropOff);
    };
    default {
        _radius = GETMVAR(PatrolDistance, 200);
        [_group,_pos,_radius,_wait,_behaviour,_combat,_speed,_formation] call FUNC(taskPatrol);
    };
};
