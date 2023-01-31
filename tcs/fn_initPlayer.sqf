/**
	Initializes everything that is needed by the framework on the player.
*/

[] call TCS_fnc_initParameterVariables;

{_x setSpeaker "NoVoice"} forEach playableUnits;

[] call TCS_fnc_createBriefing;

[] call TCS_fnc_safeStartPlayer;

// Add the surgical kit first so the saved loadout already has it
if (TCS_var_addSurgicalKitsToMedics) then {
	private _isMedic = [player] call ACE_common_fnc_isMedic;

	if (_isMedic) then {
		[] call TCS_fnc_addSurgicalKit;
	};
};

if (TCS_var_addRadiosToPlayers) then {
	[] call TCS_fnc_addConfigurationRadiosToPlayer;
};

if (TCS_var_saveAndRestoreLoadouts) then {
	// Filter any ACRE radios with IDs, replacing with the base class.
	TCS_var_playerLoadout = [getUnitLoadout player] call acre_api_fnc_filterUnitLoadout;
};

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

if (TCS_var_enableDressUp) then {
	[] call TCS_fnc_createDressUp;
};

[] call TCS_fnc_initPlayerRichPresence;
