/*
	Description:
		Gets all the mission parameters and puts them in variables.

	Parameters:
		None.

	Returns:
		None

	Example:
		[] call TCS_fnc_initParameterVariables;

*/
TCS_param_safeStartTime = ["TCS_param_safeStart_Time", 3] call BIS_fnc_getParamValue;
TCS_param_preInitFreezetTime = ["TCS_param_preInitFreeze_Time", 20] call BIS_fnc_getParamValue;