#include "script_macros.hpp"

#ifdef description
	#include "StateMachines.hpp"
	#include "CfgRemoteExec.hpp"
#endif

#ifdef description_functions
	#include "CfgFunctions.hpp"
#endif

#ifdef description_XEH_PreInit
		Init = "call compile preProcessFileLineNumbers 'tcs\headless_ai\headless_ai\cfgXEH\init\GlobalPreInit.sqf';";
		serverInit = "call compile preProcessFileLineNumbers 'tcs\headless_ai\headless_ai\cfgXEH\init\ServerPreInit.sqf';";
		clientInit = "call compile preProcessFileLineNumbers 'tcs\headless_ai\headless_ai\cfgXEH\init\ClientPreInit.sqf';";
#endif

#ifdef description_XEH_FiredMan_CAManBase
#endif

