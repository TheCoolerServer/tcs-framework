/** F3 - ORBAT Notes
	Heavily Modified by MexterInfinite for TCS Framework and Compositions.

	Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
    ====================================================================================
**/

if (!hasInterface) exitWith {}; //Exit if not a player.

// Group IDs need to be set before the ORBAT listing can be created
// waitUntil {scriptDone f_script_setGroupIDs};

// Define needed variables
private ["_orbatText", "_groups", "_precompileGroups","_maxSlots","_freeSlots"];
_orbatText = "<font size='18'>Order of Battle</font><br/>
|- <execute expression=""
	player removeDiarySubject 'ORBAT';
	[] call TCS_fnc_orbatNotes;
	hintsilent 'Orbat List Refreshed';
""> Click here to refresh your ORBAT list.</execute><br/>";
_groups = [];
_hiddenGroups = [];

{
	// Add to ORBAT if side matches, group isn't already listed, and group has players
	if ((side _x == side group player) && !(_x in _groups) && ({_x in playableUnits} count units _x) > 0) then {
	//if ((side _x == side group player) && !(_x in _groups)) then {
		_groups pushBack _x;
	};
} forEach allGroups;

// Remove groups we don't want to show
_groups = _groups - _hiddenGroups;

// Loop through the group, print out group ID, leader name and medics if present
{
	
	// Highlight the group with a different color (based on the group color in TCS_fnc_initGroup)
	_color = "#FFFFFF";
	_color = switch (_x getVariable "TCS_var_groupColor") do {
		case "ColorBlack": {"#000000"};
		case "ColorGrey": {"#808080"};
		case "ColorRed": {"#E60000"};
		case "ColorBrown": {"#804000"};
		case "ColorOrange": {"#D96600"};
		case "ColorYellow": {"#D9D900"};
		case "ColorKhaki": {"#809966"};
		case "ColorGreen": {"#00CC00"};
		case "ColorBlue": {"#0000FF"};
		case "ColorPink": {"#FF4C66"};
		case "ColorWhite": {"#FFFFFF"};
		case "ColorWEST": {"#004C99"};
		case "ColorEAST": {"#800000"};
		case "ColorGUER": {"#008000"};
		case "ColorCIV": {"#660080"};
		case "ColorUNKNOWN": {"#B29900"};
		case "colorBLUFOR": {"#004C99"};
		case "ColorBLUFOR": {"#004C99"};
		case "colorOPFOR": {"#800000"};
		case "ColorOPFOR": {"#800000"};
		case "colorIndependent": {"#008000"};
		case "ColorIndependent": {"#008000"};
		case "colorCivilian": {"#660080"};
		case "ColorCivilian": {"#660080"};
		case "Color1_FD_F": {"#B13339"};
		case "Color2_FD_F": {"#ADBF83"};
		case "Color3_FD_F": {"#F08231"};
		case "Color4_FD_F": {"#678B9B"};
		case "Color5_FD_F": {"#B040A7"};
		case "Color6_FD_F": {"#5A595A"};
		default {"#FFFFFF"};
	};
	_type = _x getVariable "TCS_var_groupType";
	
	// Get Group name from ID in TCS_fnc_initGroup
	_groupName = roleDescription leader _x;
	_groupSearch = _groupName find "@";
	if !(_groupSearch == -1) then {
		_groupNameArray = (_groupName splitString "@");
		groupNameString = _groupNameArray select 1;
	} else {
		groupNameString = groupId _x;
	};
	
	
	
	// Handle Radio Frequencies in line with TCS roster spreadsheet.
	_groupID = _x getVariable "TCS_var_groupName";
	_frequency = switch _groupID do {
		case "CO": {"7"};
		case "A1": {"1"};
		case "A2": {"1"};
		case "B1": {"2"};
		case "B2": {"2"};
		case "C1": {"3"};
		case "C2": {"3"};
		case "D1": {"4"};
		case "D2": {"4"};
		case "MMG": {"5"};
		case "MMG1": {"5"};
		case "MMG2": {"5"};
		case "MAT": {"6"};
		case "MAT1": {"6"};
		case "MAT2": {"6"};
		case "ENG": {"9"};
		case "ENG1": {"9"};
		case "ENG2": {"9"};
		case "TNK": {"8"};
		case "TNK1": {"8"};
		case "TNK2": {"8"};
		case "IFV": {"8"};
		case "IFV1": {"8"};
		case "IFV2": {"8"};
		case "IFV3": {"8"};
		case "IFV4": {"8"};
		case "MTR": {"10"};
		case "MTR1": {"10"};
		case "MTR2": {"10"};
		case "ST": {"11"};
		case "ST1": {"11"};
		case "ST2": {"11"};
		default {"Unknown"};
	};
	
	

	_name = groupNameString;
	_orbatText = _orbatText + format ["<font size='16' face='EtelkaMonospaceProBold'>%1<font color='%2'> --- %3<br/></font></font><font size='12' face='EtelkaMonospacePro'>SR Channel: </font><font size='12' face='LCD14'>%4</font>", _name, _color, _type, _frequency];
	

	{
		_roleDescrip = roleDescription _x;
		_roleDescripArray = _roleDescrip splitString "@";
		_roleDescripName = _roleDescripArray select 0;
		
		_orbatText = _orbatText + format["<br />|- <font face='PuristaBold'>%1</font> - <font face='PuristaLight'>%2</font>",name _x, _roleDescripName];
	} forEach units _x;
	_orbatText = _orbatText + "<br />";
} forEach _groups;

// Insert final result into subsection ORBAT of section Notes
_orbatSubject = player createDiarySubject ["orbat", "> ORBAT <"];
orbat = player createDiaryRecord ["orbat", ["ORBAT", _orbatText]];