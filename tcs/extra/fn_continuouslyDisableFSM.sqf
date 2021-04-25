/**
	Description:
		Continuously disables the FSM of the AI in the server. The side whose units the AI should be disabled and how often this function runs can be configured in fn_configure.

	Parameters:
		None

	Returns:
		None

	Example:
		[] spawn TCS_fnc_continuouslyDisableFSM;

 */


while {TCS_var_disableAIFSM} do {
	{	
		private _group = _x;

		if ((side _group) in TCS_var_disableFSMSides) then {
			private _hasFSMBeenDisabled = _group getVariable ["TCS_var_isFSMDisabled", false];

			if (!_hasFSMBeenDisabled) then{
				_group setVariable ["TCS_var_isFSMDisabled", true];

				{
					private _unit = _x;

					if (alive _unit) then {
						[_unit, "FSM"] remoteExec ["disableAI", owner _unit];
					};
				} forEach (units _group);
			};
		};

		sleep 0.1;
	} forEach allGroups;

	sleep TCS_var_disableFSMInterval;
};