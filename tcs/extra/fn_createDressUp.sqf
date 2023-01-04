/**
	Description:
		Adds an ace action to the local player, which opens the Dress Up Arsenal feature.

	Parameters: 
		None

	Returns:
		None
*/

// Add Ace Action for the arsenal to all players.
// The condition means it will be visible only during safe start.
_action = ["DressUp","Play Dress Up!","",{[player] call TCS_fnc_dressUp},{TCS_param_safeStartTime > 0},{},[], [0,0,0], 10] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

// Add the event handler to save the loadout when the player closes the arsenal.
_id =  ["ace_arsenal_displayClosed", 
{
	// First remove any voice the player might have taken
	// It needs to be remoteExec because this has to run on all clients 
	[player, "ACE_NoVoice"] remoteExec ["setSpeaker"];
	
	//Next remove the radios before saving the loadout (otherwise ID overlap issues)
	_radioList = [] call acre_api_fnc_getCurrentRadioList;
	[_radioList] call TCS_fnc_removePlayerRadios;
	
	// Save the voiceless, radioless loadout to TCS variable
	TCS_var_playerLoadout = getUnitLoadout player;
	
	// Give the player's radios back
	{
		(uniformContainer player) addItemCargoGlobal [_x, 1];
	} forEach TCS_var_playerRadios;
	
	[] spawn TCS_fnc_initPlayerRadios;
	
	// Delete the invisible helipad (the actual arsenal)
	_abox = player getVariable "_arsenal";
	deleteVehicle _abox;
	
	// Give the player a hint so they know something happened
	hint "Loadout Saved!";
}] call CBA_fnc_addEventHandler;