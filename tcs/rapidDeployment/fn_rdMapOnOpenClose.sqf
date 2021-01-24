/**
	Description:
		Rapid deployment handler for the Map event.

	Paramters:
		Same as: https://community.bistudio.com/wiki/Arma_3:_Event_Handlers/addMissionEventHandler#Map
	
	Returns:
		None

 */


params ["_mapIsOpened", "_mapIsForced"];

if (!_mapIsOpened) exitWith {
	TCS_var_RDShouldTeleportOnClick = false;
};
