//================================ Admin briefing ================================
private _briefing = "
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
private _endings = [];

private _i = 1;
while {true} do {
	private _title = getText (missionconfigfile >> "CfgDebriefing" >> format ["end%1", _i] >> "title");
	private _description = getText (missionconfigfile >> "CfgDebriefing" >> format ["end%1", _i] >> "description");

	if (_title == "") exitWith {};

	private _ending = [_i, _title, _description];
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
	_briefing = _briefing + format [
		"<execute expression=""[%1, false] remoteExec ['TCS_fnc_mpEnd', 2];"">'end%1'</execute> - %2:<br/>
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
	TCS_param_safeStartTime = TCS_param_safeStartTime + 1;
	publicVariable 'TCS_param_safeStartTime';
	hintsilent format ['Mission Timer: %1', TCS_param_safeStartTime];
""> Increase Safe Start timer by 1 minute </execute><br/>

|- <execute expression=""
	TCS_param_safeStartTime = TCS_param_safeStartTime - 1;
	publicVariable 'TCS_param_safeStartTime';
	hintsilent format ['Mission Timer: %1', TCS_param_safeStartTime];
""> Decrease Safe Start timer by 1 minute </execute><br/>

|- <execute expression=""
	[true] remoteExec ['TCS_fnc_toggleSafeStart', playableUnits + switchableUnits];
	['SafeStart', ['Safe start enabled']] remoteExec ['BIS_fnc_showNotification', 0];
	hintsilent 'Safe Start started!';
""> Begin safe start timer </execute><br/>

|- <execute expression=""
	TCS_param_safeStartTime = -1;
	publicVariable 'TCS_param_safeStartTime';

	['SafeStartMissionStarting', ['Mission starting now!']] remoteExec ['BIS_fnc_showNotification', 0];

	[false] remoteExec ['TCS_fnc_toggleSafeStart', playableUnits + switchableUnits];
	hintsilent 'Safe Start ended!';
""> End safe start timer </execute><br/>
<br/>
";

// =========================== Zeus support section =============================

_briefing = _briefing + "
<font size='18'>ZEUS SUPPORT</font><br/>
|- <execute expression=""
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


player createDiaryRecord ["diary", ["TCS Admin Menu", _briefing]];