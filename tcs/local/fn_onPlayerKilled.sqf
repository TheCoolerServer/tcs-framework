cutText ["", "BLACK OUT", 5];
5 fadeSound 0.1;

[] spawn {
	sleep 5;
	["Initialize", [player]] call BIS_fnc_EGSpectator;

	cutText ["", "BLACK IN", 1];
	1 fadeSound 1;
};