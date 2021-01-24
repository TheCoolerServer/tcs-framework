class RespawnDialogButton
{
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "[] spawn TCS_fnc_oneLife_respawnDialog;";
	
	class Controls
	{
		class RespawnButton: OneLifeRscButton
		{
			idc = -1;
			text = "Rejoin"; //--- ToDo: Localize;
			x = 0.87875 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0.125 * safezoneW;
			h = 0.04 * safezoneH;
			//default = false;
			
			action = "closeDialog 0; createDialog ""RespawnConfirmationDialog""";
		};
	};
};

class RespawnConfirmationDialog
{
	idd = -1;
	movingEnable = false;
	onLoad = "";
	onUnload = "";
	
	class Controls
	{
		class BackgroundBox: OneLifeBOX
		{
			idc = -1;

			x = 0.357343 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.283594 * safezoneW;
			h = 0.22 * safezoneH;
		};
		class RespawnConfirmationFrame: OneLifeRscFrame
		{
			idc = -1;
			text = "Confirmation"; //--- ToDo: Localize;
			x = 0.3625 * safezoneW + safezoneX;
			y = 0.42 * safezoneH + safezoneY;
			w = 0.275 * safezoneW;
			h = 0.2 * safezoneH;
		};
		class ConfirmText: OneLifeRscText
		{
			idc = -1;

			text = "Are you sure you want to rejoin?"; //--- ToDo: Localize;
			x = 0.375028 * safezoneW + safezoneX;
			y = 0.4489 * safezoneH + safezoneY;
			w = 0.25 * safezoneW;
			h = 0.06 * safezoneH;
		};
		class ConfirmButtonNo: OneLifeRscButton
		{
			idc = -1;
			default = "true";
			action = "closeDialog 0;";

			text = "No"; //--- ToDo: Localize;
			x = 0.533855 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class ConfirmButtonYes: OneLifeRscButton
		{
			idc = -1;
			action = "setPlayerRespawnTime 1; oneLifeSpectatorActive = 0; closeDialog 0; hint '';";

			text = "Yes"; //--- ToDo: Localize;
			x = 0.425 * safezoneW + safezoneX;
			y = 0.54 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};