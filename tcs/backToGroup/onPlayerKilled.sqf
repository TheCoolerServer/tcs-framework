/**
	Killed event handler for the TCS_BackToGroup respawn template.

	Same parameters as onPlayerKilled.sqf
	https://community.bistudio.com/wiki/Event_Scripts
*/

params["_oldUnit", "_killer", "_respawn", "_respawnDelay"];

M_var_deathPosition = getPos _oldUnit;
M_var_wasJustKilled = true;