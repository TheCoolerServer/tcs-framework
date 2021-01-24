if (oneLifeSpectatorActive == 1) then
{
	hint "Press 'R' to enable the rejoin button.";
	sleep 5;
	hint "";
	waitUntil {inputAction "reloadMagazine" > 0};
	createDialog "RespawnDialogButton";
	hint "Press 'ESC' to disable the rejoin button and take full control of spectator mode.\n\nPressing 'space' while the rejoin button is active will click it.";
}
else
{
	oneLifeSpectatorActive = 0;
};