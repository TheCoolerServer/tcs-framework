#include "..\..\script_macros.hpp"


params ["_groupcaller", ["_enemycaller", objnull, [objnull]]];

private _sidecaller = side _groupcaller;
private _posCaller = getposATL leader _groupcaller;

if (GVAR(Debug)) then {
	TRACE_3("radiocomms params",_groupcaller,_enemycaller,_sidecaller);
};

private _respondingInfantry = [];
private _respondingMotorized = [];
private _respondingMechanized = [];
private _respondingArmored = [];

private _knownEnemy = !(_enemycaller isEqualTo objnull);
private _nearbyEnemy = [];
private _enemyHasArmored = false;
private _enemyHasVehicles = false;
private _reportedLocation = [_posCaller, 30] call CBA_fnc_randPos;
//IGNORE_PRIVATE_WARNING ["_x"]
if (_knownEnemy) then {
	_nearbyEnemy = [_enemycaller, 50] call FUNC(nearbyFriendlyEntities);
    _nearbyEnemy params [["_nearbyInfantry", [], [[]]], ["_nearbyCars", [], [[]]], ["_nearbyAPCs", [], [[]]], ["_nearbyTanks", [], [[]]]];
    _enemyHasVehicles = !(_nearbyCars isEqualTo []) || {!(_nearbyAPCs isEqualTo [])} || {!(_nearbyTanks isEqualTo [])};
    _enemyHasArmored = _enemyHasVehicles && {!(_nearbyAPCs isEqualTo []) || {!(_nearbyTanks isEqualTo [])}};
	_reportedLocation = [_nearbyEnemy select 0, 30] call CBA_fnc_randPos;
};

// Radio friendly groups and get responses
allGroups select {
	private _leader = leader _x;
	(GETVAR(_x,Spawned,false)) &&
	{!(_groupcaller isEqualTo _x)} &&
	{!(isNull _leader)} &&
	{(alive _leader)} &&
	{!(GETVAR(_leader,NOAI,false))} &&
	{!(isPlayer _leader)} && 
	{side _leader in GVAR(SideBasedExecution)} &&
	{!([_x] call FUNC(isInCombat))}
} apply {
	private _group = _x;
	//private _aliveUnits = units _group select {alive _x};
	private _leader = leader _group;
	private _side = side _leader;
	//private _task = GETVAR(_group,Task,"NONE");
	//private _position = getposATL _leader;
	//private _areaAssigned = GETVAR(_group,areaAssigned,"NONE");
	private _assetType = GETVAR(_group,assetType,"Infantry");
	//private _groupcount = count _aliveUnits;
	//private _behaviour = behaviour _leader;
	private _target = GETVAR(_group,CurrentTarget,objnull);
	private _distanceToGroup = (leader _groupcaller) distance2d _leader;
    if (
    	([_sidecaller, _side] call BIS_fnc_sideIsFriendly) && 
    	{!_knownEnemy || {_target isEqualTo objnull} || {!(_target in _nearbyEnemy)}} &&
    	{_distanceToGroup <= GVAR(RadioDistance)} &&
    	{!(GETMVAR(RadioNeedRadio,false)) || {_group call FUNC(hasRadioGroup)}}
    ) then {
    	private _response = [_group, _groupcaller, _distanceToGroup, _reportedLocation, CBA_MissionTime, _nearbyEnemy, _enemyHasArmored] call FUNC(ReinforcementResponse);
    	TRACE_3("reinforcement response",_groupcaller,_group,_response);
    	if (_response) then {
    		switch _assetType do {
    		    case "Infantry": {
    				_respondingInfantry pushBackUnique _group;
    		    };
    			case "Motorized": {
    				_respondingMotorized pushBackUnique _group;
    		    };
    			case "Mechanized": {
    				_respondingMechanized pushBackUnique _group; 
    		    };
    			case "Armored": {
    				_respondingArmored pushBackUnique _group;
    		    };
    		    default {
    				_respondingInfantry pushBackUnique _group;
    		    };
    		};
    	};
    };
};

private _groupCount = count _respondingInfantry + count _respondingMotorized + count _respondingMechanized + count _respondingArmored;
if (GVAR(Debug)) then {
	TRACE_2("groups responding for call",_groupcaller,_groupCount);
};

// Act on responses
private _veryCloseGroups = [];
{
	if !(_x isEqualTo []) then {
        {
            _x params ["_arrayGroup"];
            if ((leader _arrayGroup distance2d _posCaller) <= 250) then {
    			_veryCloseGroups pushback _arrayGroup;
    		};
        } forEach _x;
	};
} foreach [_respondingInfantry, _respondingMotorized, _respondingMechanized, _respondingArmored];

//IGNORE_PRIVATE_WARNING ["_x"];
_respondingInfantry = [_respondingInfantry, [], {(leader _x distance2d _posCaller)}, "ASCEND"] call BIS_fnc_sortBy;
_respondingMotorized = [_respondingMotorized, [], {(leader _x distance2d _posCaller)}, "ASCEND"] call BIS_fnc_sortBy;
_respondingMechanized = [_respondingMechanized, [], {(leader _x distance2d _posCaller)}, "ASCEND"] call BIS_fnc_sortBy;
_respondingArmored = [_respondingArmored, [], {(leader _x distance2d _posCaller)}, "ASCEND"] call BIS_fnc_sortBy;
//private _sortedResponding = [_respondingInfantry, _respondingMotorized, _respondingMechanized, _respondingArmored];

if (GVAR(Debug)) then {
	TRACE_2("verclosegroups for call",_groupcaller,_veryCloseGroups);
};

private _targetPos = if (_knownEnemy) then {
	[_nearbyEnemy select 0, 30] call CBA_fnc_randPos
} else {
	[_posCaller, 30] call CBA_fnc_randPos
};

private _reinforcingGroup = grpNull;

if (_knownEnemy) then {
	if !(_veryCloseGroups isEqualTo []) then {
		{
		    [_x, _targetPos] call FUNC(CombatAttack);
		} forEach _veryCloseGroups;
	} else {
		private _enemyCount = count _nearbyEnemy;
		if (_enemyCount <= 8) then {
			_reinforcingGroup = if !(_respondingInfantry isEqualTo []) then {
				 _respondingInfantry select 0;
			} else {
				if !(_respondingMotorized isEqualTo []) then {
					_respondingMotorized select 0;
				} else {
					if !(_respondingMechanized isEqualTo []) then {
						_respondingMechanized select 0;
					} else {
						if !(_respondingArmored isEqualTo []) then {
							_respondingArmored select 0;
						} else {
							grpNull
						};
					};
				};
			};
		} else {
			_reinforcingGroup = if !(_respondingMechanized isEqualTo []) then {
				_respondingMechanized select 0;
			} else {
				if !(_respondingMotorized isEqualTo []) then {
					_respondingMotorized select 0;
				} else {
					if !(_respondingArmored isEqualTo []) then {
						_respondingArmored select 0;
					} else {
						if !(_respondingInfantry isEqualTo []) then {
							_respondingInfantry select 0;
						} else {
							grpNull
						};
					};
				};
			};
		};
	};
} else {
	if !(_veryCloseGroups isEqualTo []) then {
		{
		    [_x, _targetPos] call FUNC(CombatAttack);
		} forEach _veryCloseGroups;
	} else {
		_reinforcingGroup = if !(_respondingInfantry isEqualTo []) then {
			_respondingInfantry select 0
		} else {
			if !(_respondingMotorized isEqualTo []) then {
				_respondingMotorized select 0
			} else {
				if !(_respondingMechanized isEqualTo []) then {
					_respondingMechanized select 0
				} else {
					if !(_respondingArmored isEqualTo []) then {
						_respondingArmored select 0
					} else {
						grpnull
					};
				};
			};
		};
	};
};

if (_reinforcingGroup isEqualTo grpNull) then {
	if (GVAR(Debug)) then {
		TRACE_1("no successful calls for",_groupcaller);
	};
} else {
	[_reinforcingGroup, _targetPos] call FUNC(CombatAttack);
};
