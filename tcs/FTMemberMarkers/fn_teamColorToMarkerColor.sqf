/*
  Description:
	 Converts group team colors to Marker colors

  Parameters
		0: (String) MAIN, RED, GREEN, BLUE, YELLOW

	Returns:
		0: (String) ColorWhite, ColorRed, ColorGreen, ColorBlue, ColorYellow

 	Example:
 		["MAIN"] call TCS_fnc_teamColorToMarkerColor;
*/
params [["_team", "MAIN", [""]]];

private _color = "ColorWhite";

switch (_team) do{
	case "MAIN": {
		_color = "ColorWhite"
	};

	case "RED": {
		_color = "ColorRed"
	};

	case "GREEN": {
		_color = "ColorGreen"
	};

	case "BLUE": {
		_color = "ColorBlue"
	};

	case "YELLOW": {
		_color = "ColorYellow"
	};
};

_color;
