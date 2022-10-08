/**
	Initializes everything that is needed by the framework on the player.
*/

[] call TCS_fnc_initParameterVariables;

{_x setSpeaker "ACE_NoVoice"} forEach playableUnits;

[] call TCS_fnc_createBriefing;

[] call TCS_fnc_safeStartPlayer;

// Add the surgical kit first so the saved loadout already has it
if (TCS_var_addSurgicalKitsToMedics) then {
	private _isMedic = [player] call ACE_common_fnc_isMedic;

	if (_isMedic) then {
		[] call TCS_fnc_addSurgicalKit;
	};
};

// Wait for ACRE to initialize any editor-given radios.
waitUntil {
	sleep 0.5;
	[] call acre_api_fnc_isInitialized;
};

// Remove the player's editor-given radios, to avoid ID collision on respawn.
_radioList = [] call acre_api_fnc_getCurrentRadioList;
[_radioList] call TCS_fnc_removePlayerRadios;

// Save the voiceless, radioless loadout to TCS variable
TCS_var_playerLoadout = getUnitLoadout player;

// Save the list of editor-given radios with IDs removed to TCS variable
TCS_var_playerRadios = [];
{
	_regout = _x regexFind ["(.*?)_ID"];
	_radio = _regout select 0 select 1 select 0;
	TCS_var_playerRadios append [_radio];
} forEach _radioList;

// Re-add any radios that were given in the editor.
{
	(uniformContainer player) addItemCargoGlobal [_x, 1];
} forEach TCS_var_playerRadios;

// Give framework radios
[] spawn TCS_fnc_initPlayerRadios;

[] spawn TCS_fnc_adminInit;

if (TCS_var_showKilledByMessage) then {
	[] spawn TCS_fnc_killedBy;
};

if (TCS_var_autoAssignFireteams) then {
	[] call TCS_fnc_assignTeamColors;
};

if (TCS_var_fireteamMarkersEnabled) then {
	[] call TCS_fnc_initFireteamMarkers;
};

if (TCS_var_rapidDeploymentEnabled) then {
	TCS_var_mapClickTeleport_Rejoin = false;
	
	[] call TCS_fnc_rdSetupEventHandlers;
	[true] call TCS_fnc_mapClickTeleportAction;
};

if ([] call TCS_fnc_areTicketsEnabled) then {
	[] call TCS_fnc_bootstrapTicketsFramework;
};

if (TCS_var_enableCutGrassAction) then {
	[] call TCS_fnc_createCutGrassAction;
};

if ([getPlayerUID player] call TCS_fnc_isPlayerSpectating) then {
	[] call TCS_fnc_moveToSpectator;
};

if (TCS_var_preventGrassDisable) then {
	P_PREVENT_GRASS_DISABLE = TRUE;
};
