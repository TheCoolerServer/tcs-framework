/**
	Description:	
		Sets information for the Discord Rich Presence module after mission start.

	Parameters:
		None

	Returns:
		None
*/

private _playerRole = roleDescription player;
private _cleanPlayerRole = (((_playerRole regexFind ["([^@]+)"]) select 0) select 0) select 0;

private _mapName = getText (configFile >> "CfgWorlds" >> worldName >> "description");

[
    ["UpdateDetails", getText (missionConfigFile >> "OnLoadName")],
	["UpdateState", _mapName],
	["UpdateLargeImageText", format["%1 %2", (groupId group player), _cleanPlayerRole]],
	["UpdateStartTimestamp",[0,0]]
] call (missionNameSpace getVariable ["DiscordRichPresence_fnc_update",{}]);

onPreloadFinished {
	[
		["UpdateSmallImageText", format["Tickets: %1", [] call TCS_fnc_getPlayerTickets]]
	] call (missionNameSpace getVariable ["DiscordRichPresence_fnc_update",{}])
};