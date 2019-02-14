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

/*
	When the server and the player load the mission the first time these variables will be undefined and it's OK to load them
	from the mission parameters. But when a player JIPs these variables may have already been overwritten by the server and we
	can't load them from the parameters anymore. Since the server broadcasts these variable changes by `publicVariable` these
	variables already be present before the player runs the initialization events. (https://community.bistudio.com/wiki/publicVariable)
*/
if (isNil "TCS_param_safeStartTime") then {
	TCS_param_safeStartTime = ["TCS_param_safeStart_Time", 3] call BIS_fnc_getParamValue;
};

if (isNil "TCS_param_preInitFreezetTime") then {
	TCS_param_preInitFreezetTime = ["TCS_param_preInitFreeze_Time", 20] call BIS_fnc_getParamValue;
};