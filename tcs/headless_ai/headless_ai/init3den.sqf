diag_log "started init3den";

PZAI_fnc_StanceToInit = {
	params ["_object"];
	private _init = (_object get3DENAttribute "init") select 0;
	private _stance = (_object get3DENAttribute "unitpos") select 0;
	private _unitstance = ["UP","MIDDLE","DOWN","Auto"] select _stance;
	private _stanceInit = format ["this setUnitPos '%1'; this setvariable ['unitpos','%1',true];",_unitstance];
	if (_init isEqualTo "") then {
		_init = format ["call{%1}",_stanceInit];
	} else {
		if ((_init find _unitstance) isEqualto -1) then {
			if !((_init find "UP") isEqualto -1) then {
				_init = [_init,"UP",_unitstance] call CBA_fnc_replace;
			} else {
				if !((_init find "MIDDLE") isEqualto -1) then {
					_init = [_init,"MIDDLE",_unitstance] call CBA_fnc_replace;
				} else {
					if !((_init find "DOWN") isEqualto -1) then {
						_init = [_init,"DOWN",_unitstance] call CBA_fnc_replace;
					} else {
						if !((_init find "Auto") isEqualto -1) then {
							_init = [_init,"Auto",_unitstance] call CBA_fnc_replace;
						} else {
							_init = _init select [0,((count _init) - 2)];
							_init = _init + "; " + _stanceInit + "};"
						};
					};
				};
			};
		};
	};
	_object set3DENAttribute ["init",_init];
};

{
	_x call PZAI_fnc_StanceToInit;
	_x addEventHandler ["AttributesChanged3DEN", {
		params ["_object"];
		_object call PZAI_fnc_StanceToInit;
	}];
} foreach (all3DENEntities select 0);
