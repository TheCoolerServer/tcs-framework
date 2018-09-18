// F3 - Respawn Templates
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

class CfgRespawnTemplates{
	class TCS_Respawn{
		onPlayerKilled = "tcs\local\fn_onPlayerKilled.sqf";
		onPlayerRespawn = "tcs\local\fn_onPlayerRespawn.sqf";
	};

	#include "tcs\tickets\RespawnTemplate.hpp"
};