/**
	Description:
		Creates markers where all the triggers in the mission are positionated to make it easier to test each trigger.

	Paramters:
		None

	Returns:
		None

	Example:
		[] call TCS_fnc_triggerMarkers;

 */

 private _allTriggers = allMissionObjects "EmptyDetector";

 {
	private _trigger = _x;
	private _triggerActivation = triggerActivation _trigger;
	private _triggerArea = triggerArea _trigger;
	private _triggerPos = getPos _trigger;

	private _markerName = format ["marker_%1_%2_%3_%4", _triggerPos # 0, _triggerPos # 1, _triggerPos # 2, random 99999];
	private _marker = createMarker [_markerName,  _triggerPos];
	private _markerWithText = createMarker [_markerName + "_text", _triggerPos];
	
	if (_triggerArea select 3) then { //isRectangle
		_marker setMarkerShape "RECTANGLE";
	} else {
		_marker setMarkerShape "ELLIPSE";
	};

	_marker setMarkerSize [(_triggerArea select 0), (_triggerArea select 1)];
	_marker setMarkerBrush "GRID";
	_marker setMarkerAlpha 0.5;

	_markerWithText setMarkerType "hd_dot";
	_markerWithText setMarkerColor "ColorBlack";

	private _triggerActivationBy = _triggerActivation select 0;
	private _markerText = format["%1 %2", _triggerActivationBy, (_triggerActivation select 1)];

	switch (_triggerActivationBy) do {
		case "EAST": {
			_marker setMarkerColor "ColorRed";
			_markerWithText setMarkerColor "ColorRed";
		};
		case "WEST": {
			_marker setMarkerColor "ColorBlue";
			_markerWithText setMarkerColor "ColorBlue";
		};
		case "GUER": {
			_marker setMarkerColor "ColorGreen";
			_markerWithText setMarkerColor "ColorGreen";
		};

		case "ANYPLAYER": {
			_marker setMarkerColor "ColorPink";
			_markerWithText setMarkerColor "ColorPink";
		};

		case "NONE": {
			_marker setMarkerColor "ColorYellow";
			_markerWithText setMarkerColor "ColorYellow";
			_markerText = str ((triggerStatements _trigger) select 0);
		};

		default {
			_marker setMarkerColor "ColorYellow";
			_markerWithText setMarkerColor "ColorYellow";
		};
	};

	_markerWithText setMarkerText _markerText;
	_marker setMarkerDir (_triggerArea select 2);

	[_trigger, _marker, _markerWithText] spawn {
		params ["_trigger", "_marker", "_markerWithText"];

		private _triggerRepeats = (triggerActivation _trigger) select 2;
		private _originalMarkerColor = markerColor _marker;
		private _originalMarkerAlpha = markerAlpha _marker;

		private _continueWaitingForTrigger = true;

		while {_continueWaitingForTrigger} do {
			if (triggerActivated _trigger) then {
				_markerWithText setMarkerText "Triggered";
				_markerWithText setMarkerColor "ColorWhite";
				_marker setMarkerColor "ColorBlack";
				_marker setMarkerAlpha 0.3;

				private _triggerActivation = triggerActivation _trigger;
				_markerWithText setMarkerText (format["%1 %2 - TRIGGERED", (_triggerActivation select 0), (_triggerActivation select 1)]);

				if (!_triggerRepeats) then {
					_continueWaitingForTrigger = false;
				}
			}else {
				if (_triggerRepeats) then {
					private _triggerActivation = triggerActivation _trigger;

					_markerWithText setMarkerText (format["%1 %2", (_triggerActivation select 0), (_triggerActivation select 1)]);
					_markerWithText setMarkerColor _originalMarkerColor;

					_marker setMarkerColor _originalMarkerColor;
					_marker setMarkerAlpha _originalMarkerAlpha;
				};
			};

			sleep 10;
		};
		
	};
 } forEach _allTriggers;
