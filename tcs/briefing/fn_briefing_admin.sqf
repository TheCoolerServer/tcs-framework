//================================ Admin briefing ================================
_briefing ="
<br/>
<font size='18'>ADMIN SECTION</font><br/>
This briefing section can only be seen by the current admin.
<br/><br/>
";


//------------------------------ Mission maker notes -----------------------------
// This section displays notes made by the mission-maker for the admin
_briefing = _briefing + "<br/><font size='18'>MISSION-MAKER NOTES</font><br/>";


//------------------------------------ Endings -----------------------------------
// Grab all the endings in CfgDebriefings and format them for displaying

_title = [];
_ending = [];
_endings = [];

_i = 1;
while {true} do {
	_title = getText (missionconfigfile >> "CfgDebriefing" >> format ["end%1", _i] >> "title");
	_description = getText (missionconfigfile >> "CfgDebriefing" >> format ["end%1", _i] >> "description");

	if (_title == "") exitWith {};

	_ending = [_i,_title,_description];
	_endings append ([_ending]);
	_i = _i + 1;
};

// Create the briefing section to display the endings

_briefing = _briefing + "
<font size='18'>ENDINGS</font><br/>
These endings are available. To trigger an ending click on its link.<br/>
<br/>
";

{
	_end = _this select 0;
	_briefing = _briefing + format [
		"<execute expression=""[[%1], false] remoteExec ['TCS_fnc_mpEnd', 2];"">'end%1'</execute> - %2:<br/>
		%3<br/>
		<br/>",
		_x select 0,
		_x select 1,
		_x select 2
	];
} forEach _endings;

// ============================= Safe start ======================================

_briefing = _briefing + "
<font size='18'>SAFE START CONTROL</font><br/>
|- <execute expression=""
	TCS_param_mission_timer = TCS_param_mission_timer + 1;
	publicVariable 'TCS_param_mission_timer';
	hintsilent format ['Mission Timer: %1',TCS_param_mission_timer];
""> Increase Safe Start timer by 1 minute </execute><br/>

|- <execute expression=""
	TCS_param_mission_timer = TCS_param_mission_timer - 1;
	publicVariable 'TCS_param_mission_timer';
	hintsilent format ['Mission Timer: %1',TCS_param_mission_timer];
""> Decrease Safe Start timer by 1 minute </execute><br/>

|- <execute expression=""
	[] remoteExec ['TCS_fnc_safeStart', 0];
	hintsilent 'Safe Start started!';
""> Begin Safe Start timer </execute><br/>

|- <execute expression=""
	TCS_param_mission_timer = -1; publicVariable 'TCS_param_mission_timer';
	[['SafeStartMissionStarting',['Mission starting now!']] remoteExec ['BIS_fnc_showNotification', 0];
	[false] remoteExec ['TCS_fnc_safety', playableUnits + switchableUnits];
	hintsilent 'Safe Start ended!';
""> End Safe Start timer </execute><br/>

|- <execute expression=""
	[true] remoteExec ['TCS_fnc_safety', playableUnits + switchableUnits];
	hintsilent 'Safety on!';
""> Force safety on for all players </execute><br/>

|- <execute expression=""
	[false] remoteExec ['TCS_fnc_safety', playableUnits + switchableUnits];
	hintsilent 'Safety off!';
""> Force safety off for all players </execute><br/>
<br/>
";

// =========================== Zeus support section =============================

_briefing = _briefing + "
<font size='18'>ZEUS SUPPORT</font><br/>
<execute expression=""
	if !(isNull (getAssignedCuratorLogic player)) then {
		hintsilent 'ZEUS already assigned!'
	} else {
		[player, true] remoteExec ['TCS_fnc_zeusInit', 2];
		hintsilent 'Curator assigned.';
	};
""> Assign ZEUS to host </execute>.<br/>

|- <execute expression=""
	if (isNull (getAssignedCuratorLogic player)) then {
		hintsilent 'Assign ZEUS first!'
	} else {
		[player,false] remoteExec ['TCS_fnc_zeusAddObjects', 2];
		[player,false] remoteExec ['TCS_fnc_zeusAddAddons', 2];
		hintsilent 'Removed powers and units.';
	};
""> Remove all powers and objects from ZEUS </execute>.<br/>
<br/>
";


player createDiaryRecord ["diary", ["F3 Admin Menu", _briefing]];