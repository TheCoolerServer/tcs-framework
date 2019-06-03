//==================================== General ===================================
TCS_var_allZeusesGetAdminBriefing = true;

//================================= Group markers ================================
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

//=============================== Fireteam markers ===============================
TCS_var_fireteamMarkersEnabled = true;
TCS_var_fireteamMarkersUpdateInterval = 3;

//==================================== Radios ====================================
TCS_var_radiosModuleEnabled = true;
TCS_var_removeRadiosInInventory = true;

TCS_var_reinitializeRadiosOnRespawn = true;

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

//====================================== AI ======================================
TCS_var_disableAIFSM = true;
TCS_var_disableFSMSides = [east];
TCS_var_disableFSMInterval = 60;

//===================================== Debug ====================================
TCS_var_enableTriggerDebugMarkers = false;