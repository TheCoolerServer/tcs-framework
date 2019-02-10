// Local function to set the proper magazine count.
private _buildMagazinesText = {
	params ["_weapon", "_allMagazines"];

	private _text = "";
	private _wepMags = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines"); //All the magazines for the given weapon
	private _magArr = [];

	{
		private _weaponMagazine = _x;
		_foundIndex = [_allMagazines, _weaponMagazine] call BIS_fnc_findInPairs;

		//If we have a match
		if (_foundIndex != -1) then {
			// Add the number of magazines to the list
			_magArr pushBack ([_allMagazines, [_foundIndex, 1]] call BIS_fnc_returnNestedElement);

			// Remove the entry
			_allMagazines deleteAt _foundIndex;
		};
	} forEach _wepMags;

	if (count _magArr > 0) then {
		_text = _text + format ["[%1]", _magArr joinString "+"];
	};

	_text;
};

private _text = "<br />NOTE: The loadout shown below is only accurate at mission start.<br />
<br />";

// All weapons minus the field glasses
private _weapons = weapons player - ["Rangefinder","Binocular","Laserdesignator"];

// Get a nested array containing all attached weapon items
private _wepItems = weaponsItems player;

// Get a nested array containing all unique magazines and their count
private _mags = (magazines player) call BIS_fnc_consolidateArray;

// Get a nested array containing all non-equipped items and their count
private _items = (items player) call BIS_fnc_consolidateArray;

// Weapons
// Add lines for all carried weapons and corresponding magazines
if (count _weapons > 0) then {
	_text = _text + "<font size='18'>WEAPONS [#MAGAZINES]:</font>";
	{
		private _weapon = _x;
		_text = _text + format["<br/>%1",getText (configFile >> "CfgWeapons" >> _weapon >> "displayname")];

		//Add magazines for weapon
		_text = _text + ([_weapon, _mags] call _buildMagazinesText);

		// Check if weapon has an underslung grenade launcher
		if ({_weapon in ["GL_3GL_F","EGLM","UGL_F"]} count (getArray (configFile >> "CfgWeapons" >> _weapon >> "muzzles")) > 0) then {
			_text = _text + "<br/> |- UGL";
			_text = _text + (["UGL_F", _mags] call _buildMagazinesText);
		};

		// List weapon attachments
		// Get attached items
		_attachments = _wepItems select (([_wepItems,_weapon] call BIS_fnc_findNestedElement) select 0);
		_attachments deleteAt 0; // Remove the first element as it points to the weapon itself

		{
			private _attachment = _x;
			if (!(_attachment isEqualType []) && {_attachment != ""}) then {
				_text = _text + format["<br/> |- %1",getText (configFile >> "CfgWeapons" >> _attachment >> "displayname")];
			};
		} forEach _attachments;
	} forEach _weapons;

	_text = _text + "<br/>";
};


// Add lines for all magazines not tied to any carried weapon (grenades etc.)
if (count _mags > 0) then {
	_text = _text + "<br/><font size='18'>OTHER [#]:</font><br/>";

	{
		_text = _text + format["%1 [%2]<br/>",getText (configFile >> "CfgMagazines" >> _x select 0 >> "displayname"),_x select 1];
	} forEach _mags;
};

// Backpack
if (backpack player != "") then {
	_text = _text + "<br/><font size='18'>BACKPACK [%FULL]:</font><br/>";

	_bp = backpack player;
	_text = _text + format["%1 [%2", getText (configFile >> "CfgVehicles" >> _bp >> "displayname"), 100 * (loadBackpack player)] + "%]<br/>";
};

// Items
if (count _items > 0) then {
	_text = _text + "<br/><font size='18'>ITEMS [#]:</font><br/>";

	{
		_text = _text + format["%1 [%2]<br/>",getText (configFile >> "CfgWeapons" >> _x select 0 >> "displayname"), _x select 1];
	} forEach _items;

	{
		_text = _text + format["*%1<br/>",getText (configFile >> "CfgWeapons" >> _x >> "displayname")];
	} forEach assignedItems player;

	_text = _text + "<br/>*Indicates an equipped item.";
};

player createDiaryRecord ["diary", ["Loadout", _text]];
