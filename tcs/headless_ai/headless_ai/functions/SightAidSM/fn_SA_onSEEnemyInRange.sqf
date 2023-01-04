#include "script_component.hpp"

params ["_unit"];


private _enemyInRange = [];
private _enemyArray = group _unit call FUNC(EnemyArray);
if (_enemyArray isNotEqualTo []) then {
	_enemyInRange = _enemyArray select {((vehicle _unit) distance2d _x) <= (GETMVAR(SightAidDistance,600))};
};

SETVAR(_unit,SA_seeChecks,0);
SETVAR(_unit,SA_enemyInRange,_enemyInRange);
SETVAR(_unit,SA_enemyTargetGroup,0);
