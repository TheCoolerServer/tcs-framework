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
	private _marker = createMarkerLocal [_markerName,  _triggerPos];
	private _markerWithText = createMarkerLocal [_markerName + "_text", _triggerPos];
	
	if (_triggerArea select 3) then { //isRectangle
		_marker setMarkerShapeLocal "RECTANGLE";
	} else {
		_marker setMarkerShapeLocal "ELLIPSE";
	};

	_marker setMarkerSizeLocal [(_triggerArea select 0), (_triggerArea select 1)];
	_marker setMarkerBrushLocal "GRID";
	_marker setMarkerAlphaLocal 0.5;

	_markerWithText setMarkerTypeLocal "hd_dot";
	_markerWithText setMarkerColorLocal "ColorBlack";

	private _triggerActivationBy = _triggerActivation select 0;
	private _markerText = format["%1 %2", _triggerActivationBy, (_triggerActivation select 1)];

	switch (_triggerActivationBy) do {
		case "EAST": {
			_marker setMarkerColorLocal "ColorRed";
			_markerWithText setMarkerColorLocal "ColorRed";
		};
		case "WEST": {
			_marker setMarkerColorLocal "ColorBlue";
			_markerWithText setMarkerColorLocal "ColorBlue";
		};
		case "GUER": {
			_marker setMarkerColorLocal "ColorGreen";
			_markerWithText setMarkerColorLocal "ColorGreen";
		};

		case "ANYPLAYER": {
			_marker setMarkerColorLocal "ColorPink";
			_markerWithText setMarkerColorLocal "ColorPink";
		};

		case "NONE": {
			_marker setMarkerColorLocal "ColorYellow";
			_markerWithText setMarkerColorLocal "ColorYellow";
			_markerText = str ((triggerStatements _trigger) select 0);
		};

		default {
			_marker setMarkerColorLocal "ColorYellow";
			_markerWithText setMarkerColorLocal "ColorYellow";
		};
	};

	_markerWithText setMarkerTextLocal _markerText;
	_marker setMarkerDirLocal (_triggerArea select 2);

	[_trigger, _marker, _markerWithText] spawn {
		params ["_trigger", "_marker", "_markerWithText"];

		private _triggerRepeats = (triggerActivation _trigger) select 2;
		private _originalMarkerColor = markerColor _marker;
		private _originalMarkerAlpha = markerAlpha _marker;

		private _continueWaitingForTrigger = true;

		while {_continueWaitingForTrigger} do {
			if (triggerActivated _trigger) then {
				_markerWithText setMarkerTextLocal "Triggered";
				_markerWithText setMarkerColorLocal "ColorWhite";
				_marker setMarkerColorLocal "ColorBlack";
				_marker setMarkerAlphaLocal 0.3;

				private _triggerActivation = triggerActivation _trigger;
				_markerWithText setMarkerTextLocal (format["%1 %2 - TRIGGERED", (_triggerActivation select 0), (_triggerActivation select 1)]);

				if (!_triggerRepeats) then {
					_continueWaitingForTrigger = false;
				}
			}else {
				if (_triggerRepeats) then {
					private _triggerActivation = triggerActivation _trigger;

					_markerWithText setMarkerTextLocal (format["%1 %2", (_triggerActivation select 0), (_triggerActivation select 1)]);
					_markerWithText setMarkerColorLocal _originalMarkerColor;

					_marker setMarkerColorLocal _originalMarkerColor;
					_marker setMarkerAlphaLocal _originalMarkerAlpha;
				};
			};

			sleep 10;
		};
		
	};
 } forEach _allTriggers;