//-------------------Group markers--------------------------
TCS_var_showMarkersOfOtherSides = true;

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


//---------------Radios---------------------
//Should the radios defined here be added to the group units?
TCS_var_addRadiosToGroup = true;
//Should the radios that the unit had before the new radios are added be removed?
TCS_var_removeRadiosInInventory = true;

TCS_var_defaultRadioPreset = TCS_fnc_defaultRadios;

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