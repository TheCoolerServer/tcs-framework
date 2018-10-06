/**
	Initializes a zeus object. Should be called in the init field of thhe game master slot module.
	
	Paramters:
		0 - (Zeus) The zeus game object that should be initialized.

	Returns:
		None

	Example:
		[zeus1] call TCS_fnc_initZeus;
*/


_this spawn {
	private _zeus = _this select 0;

	waitUntil {!isNull player};

	if (player == _zeus) then {
		//Start the camera at the zeus position
		curatorCamera setPos (getPos _zeus);
		_zeus enableSimulationGlobal false;
		
		while {true} do{ 
			sleep 0.5; 
			_zeus setPos (getPos curatorCamera);
		};
	};
};