/**
	Killed event handler for the TCS_BackToGroup respawn template.

	Same parameters as onPlayerKilled.sqf
	https://community.bistudio.com/wiki/Event_Scripts
*/

params["_oldUnit", "_killer", "_respawn", "_respawnDelay"];

TCS_var_btgDeathPosition = getPos _oldUnit;