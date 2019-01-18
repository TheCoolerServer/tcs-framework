// F3 - Mute Orders and Reports
{_x setSpeaker "NoVoice"} forEach playableUnits;

// F3 - Fireteam Member Markers
[] spawn f_fnc_SetLocalFTMemberMarkers;

// F3 - Briefing
f_script_briefing = [] execVM "briefing.sqf";

// F3 - Loadout Notes
[] spawn TCS_fnc_briefing;

[] call TCS_fnc_initPlayer;