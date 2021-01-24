/**
	Description:
		Attaches the necessary event handlers for the rapid deployment to work.

	Paramters:
		None

	Returns:
		None

	Example:
		[] call TCS_fnc_rdSetupEventHandlers;

 */

addMissionEventHandler ["Map", TCS_fnc_rdMapOnOpenClose];
addMissionEventHandler ["MapSingleClick", TCS_fnc_rdMapOnSingleClick];
