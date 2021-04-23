#include "..\..\script_macros.hpp"

params ["_unit"];

private _relpos = _unit getPos [20, (getDir _unit)];
private _defaultLaserPos = [(_relpos) select 0, (_relpos) select 1, (((getposASL _unit)) select 2)];
//private _laserPos = GETVAR(_unit,laserPos,_defaultLaserPos);
private _laserTarget = GETVAR(_unit,laserTarget,objnull);
//_laserTarget setposASL _laserPos;
_laserTarget setposASL _defaultLaserPos;
[_unit, false, _laserTarget] call FUNC(WatchEnemy);

if (GETMVAR(VerboseDebug,false)) then {
    LOG_1("%1 timed out from bunker engage, resetting",_unit);
};

SETVAR(_unit,TargetSet,false);
SETVAR(_unit,burstCount,0);
