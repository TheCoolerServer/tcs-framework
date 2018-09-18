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