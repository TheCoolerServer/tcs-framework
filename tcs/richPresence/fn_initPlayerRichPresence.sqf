/**
	Description:	
		Sets information for the Discord Rich Presence module after mission start.

	Parameters:
		None

	Returns:
		None
*/

private _cleanPlayerRole = "";
if (isMultiplayer) then
{
	private _playerRole = roleDescription player;
	_cleanPlayerRole = (((_playerRole regexFind ["([^@]+)"]) select 0) select 0) select 0;
	_cleanPlayerRole = format["%1 %2", (groupId group player), _cleanPlayerRole];
};

private _mapName = getText (configFile >> "CfgWorlds" >> worldName >> "description");

[
    ["UpdateDetails", getText (missionConfigFile >> "OnLoadName")],
	["UpdateState", _mapName],
	["UpdateLargeImageText", _cleanPlayerRole],
	["UpdateStartTimestamp", [0,0]]
] call (missionNameSpace getVariable ["DiscordRichPresence_fnc_update",{}]);

onPreloadFinished {
	[
		["UpdateSmallImageText", format["Tickets: %1", [] call TCS_fnc_getPlayerTickets]]
	] call (missionNameSpace getVariable ["DiscordRichPresence_fnc_update",{}])
};