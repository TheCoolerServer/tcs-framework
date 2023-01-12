#include "script_component.hpp"

//This script will dictate how the loiter WP works for the AI
params ["_Unit", "_Group","_thisFSM"];

private _Unitleader = leader _Group;
SETVAR(_group,Task,"LOITER");

//We need a list of actions that the AI can do for loitering.
private _UnitArray = units _Group;
_UnitArray apply {
	if (_x isEqualTo (vehicle _x)) then
	{
		//Each AI will need to join their own group. The plan is to make them re-form when combat starts.
		//[_x] joinsilent grpnull;
		//(group _x)SETVAR(,Mission,"LOITERING");
		SETVAR(_x,LOITERINGACT,0);
		[_x,_UnitArray] spawn FUNC(LoiterAction);
	};
};

[_Unitleader,_UnitArray,_group] spawn {
	params ["_Unitleader","_UnitArray","_group"];
	waituntil {({if ((behaviour _x) in ["COMBAT","STEALTH","AWARE"]) then {if (true) exitwith {true}} else {if (true) exitwith {false}}} foreach _UnitArray) || ((GETVAR(_group,CurrentTarget,objnull)) isNotEqualTo objnull)};
	[_Group] call FUNC(CombatResponse);
};
