// F3 - Mute Orders and Reports
{_x setSpeaker "NoVoice"} forEach playableUnits;

// F3 - Fireteam Member Markers
[] spawn f_fnc_SetLocalFTMemberMarkers;

// F3 - Briefing
f_script_briefing = [] execVM "briefing.sqf";

// F3 - Loadout Notes
[] execVM "f\briefing\f_loadoutNotes.sqf";


// F3 - MapClick Teleport
// Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//
// f_var_mapClickTeleport_Uses = 0;					// How often the teleport action can be used. 0 = infinite usage.
// f_var_mapClickTeleport_TimeLimit = 0; 			// If higher than 0 the action will be removed after the given time.
// f_var_mapClickTeleport_GroupTeleport = false; 	// False: everyone can teleport. True: Only group leaders can teleport and will move their entire group.
// f_var_mapClickTeleport_Units = [];				// Restrict map click teleport to these units
// f_var_mapClickTeleport_Height = 0;				// If > 0 map click teleport will act as a HALO drop and automatically assign parachutes to units
// [] execVM "f\mapClickTeleport\f_mapClickTeleportAction.sqf";

[] call TCS_fnc_initPlayer;