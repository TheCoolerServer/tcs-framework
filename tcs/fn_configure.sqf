//==================================== General ===================================
TCS_var_allZeusesGetAdminBriefing = true;
TCS_var_fpsMarkerUpdateInterval = 5;
TCS_var_addSurgicalKitsToMedics = true;
TCS_var_saveAndRestoreLoadouts = true;

//================================= Group Markers ================================
TCS_var_groupMarkersEnabled = true;
TCS_var_showMarkersOfOtherSides = false;
TCS_var_groupMarkerUpdateInterval = 5;

TCS_var_westGroupMarkers = [
	["Lead", "b_hq"], 			// Command elements
	["Fireteam", "b_inf"], 		// Fireteams
	["Support", "b_support"],	// Support units (MMG,HMG)
	["Launcher", "b_motor_inf"],// Launchers (MAT, HAT)
	["Mortar", "b_mortar"],		// Mortars
	["Engineer", "b_maint"],	// Engineers
	["IFV", "b_mech_inf"],		// IFVs & APCs
	["Armor", "b_armor"],		// Tanks
	["Recon", "b_recon"],		// Recon (ST)
	["Helicopter", "b_air"],	// Helicopters
	["Plane", "b_plane"]		// Planes
];

TCS_var_eastGroupMarkers = TCS_var_westGroupMarkers;
TCS_var_independentGroupMarkers = TCS_var_westGroupMarkers;
TCS_var_civilianGroupMarkers = TCS_var_westGroupMarkers;

//=============================== Fireteam Markers ===============================
TCS_var_fireteamMarkersEnabled = true;
TCS_var_fireteamMarkersUpdateInterval = 3;

//=============================== Fireteam Colors ===============================
TCS_var_autoAssignFireteams = true;
TCS_var_FTColors = [
	["RED", "GREEN"],	// A1
 	["BLUE", "YELLOW"],	// A2
	["RED", "GREEN"],	// B1
 	["BLUE", "YELLOW"],	// B2
	["RED", "GREEN"],	// C1
 	["BLUE", "YELLOW"],	// C2
	["RED", "GREEN"],	// D1
 	["BLUE", "YELLOW"]	// D2
];

//==================================== Radios ====================================
TCS_var_addRadiosToPlayers = true;
TCS_var_saveAndRestoreRadioSettings = true;

//Radios to be given to a unit.
//The first index are the radios given to the group leader.
//The second index are the radios given to the other units in the group.
TCS_var_westRadios = [
	["ACRE_PRC152", "ACRE_PRC343"],
	["ACRE_PRC343"]
];

TCS_var_eastRadios = TCS_var_westRadios;
TCS_var_independentRadios = TCS_var_westRadios;
TCS_var_civilianRadios = TCS_var_westRadios;

//==================================== Tickets ===================================
TCS_var_westTickets = 10;
TCS_var_eastTickets = 10;
TCS_var_independentTickets = 10;
TCS_var_civilianTickets = 10;
TCS_var_individualTickets = 3;

//=================================== Spectator ==================================
TCS_var_spectatorAllowFreeCamera = false;
TCS_var_spectatorAllowThirdPersonCamera = true;
TCS_var_spectatorAllowOtherPlayerSides = false;
TCS_var_allowVoluntarySpectatorAfter = 5400; // 90 minutes
TCS_var_spectatorOptionTimeout = 90;

//=============================== Rapid Deployment ===============================
TCS_var_rapidDeploymentEnabled = false;

//===================================== OCAP =====================================
TCS_var_ocapMissionType = "PvE";
// TCS_var_ocapMissionType = "PvP";

//=================================== Dress Up ===================================
TCS_var_enableDressUp = false;

set_generic = [];
set_rifleman = [];
// uncomment this line to add everything from generic to rifleman (good for facewear etc)
// set_rifleman append set_generic; 
set_lead = [];

// Fill this array with the roles (as seen on the slotting screen) and their arsenal loadouts.
// Generic will be given to players that do not match other roles.
// You can get the loadout arrays by filling an ACE arsenal in the editor and pressing 'export'.
TCS_var_arsenalMap = createHashMapFromArray [
	["Rifleman", set_rifleman],
	["Team Leader", set_lead],
	["Squad Leader", set_lead],
	["generic", set_generic] 
];


//===================================== Extra ====================================
TCS_var_showKilledByMessage = true;

TCS_var_disableAIFSM = false;
TCS_var_disableFSMSides = [east];
TCS_var_disableFSMInterval = 60;

TCS_var_enableTriggerDebugMarkers = false;

TCS_var_enableCutGrassAction = true;

TCS_var_preventGrassDisable = true;
