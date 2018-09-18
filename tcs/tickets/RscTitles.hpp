class TicketsDisplay {
  idd = -1;
  movingEnable = 0;
  enableSimulation = 1;
  controlsBackground[] = { };
  objects[] = { };
  duration = 1e+1000;

  onLoad = "uiNamespace setVariable ['TCS_var_ticketDisplay', _this select 0];";

  class controls {
    class TicketsControl: RscStructuredText{
      idc = 1100;
      text = "Tickets: -1"; //--- ToDo: Localize;
      x = 0.65 * safezoneW + safezoneX;
      y = 0.01 * safezoneH + safezoneY;
      w = 0.2625 * safezoneW;
      h = 0.056 * safezoneH;
      colorText[] = {0,0,0,0};
    };

    class CountdownControl: RscStructuredText{
      idc = 1101;
      text = "Respawn countdown"; //--- ToDo: Localize;
      x = 0.25 * safezoneW + safezoneX;
      y = 0.01 * safezoneH + safezoneY;
      w = 0.255937 * safezoneW;
      h = 0.056 * safezoneH;
      colorText[] = {0,0,0,0};
    };
  };
};