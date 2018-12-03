if (isNil "f_param_mission_timer") then {
	f_param_mission_timer = ["f_param_mission_timer",0] call BIS_fnc_getParamValue;
};

if (f_param_mission_timer > 0) then {
	[true] call TCS_fnc_safety;
};