class TCS {
  tag = "TCS";

  class Root {
    file = "tcs";

    class initGroup {};

    class initPlayer {};
    class initServer {};

    class configure {PreInit = 1;};
  };

  class Base{
    file = "tcs\base";

    class onPlayerKilled {};
    class onPlayerRespawn {};

    class initZeus {};

    class mpEnd {};
    class mpEndReceiver {};

    class initParameterVariables {};
  };

  class Briefings {
    file = "tcs\briefing";

    class createBriefing {};

    class briefing_admin {};
    class briefing_civilian {};
    class briefing_east {};
    class briefing_independent {};
    class briefing_west {};
    class briefing_zeus {};

    class loadoutNotes {};
  };

  class GroupMarkers {
    file = "tcs\groupMarkers";

    class createGroupMarker {};
    class getMarkerByGroup {};
    class groupMarker {};
  };

  class FireteamMarkers {
    file = "tcs\FTMemberMarkers";

    class teamColorToMarkerColor {};
    class fireteamMarkersLoop {};
    class initFireteamMarkers {};
    class localFTMemberMarker {};
  };

  class Radios {
    file = "tcs\radios";

    class initPlayerRadios {};
  };

  
  class Tickets {
    file = "tcs\tickets";

    class ticketsOnPlayerKilled {};
    class ticketsOnPlayerRespawn {};

    class ticketsRespawnLoop {};

    class ticketsPlayerRespawned {};

    class setTickets {};
    class addTickets {};
  };

  class safeStart{
		file = "tcs\safeStart";

		class toggleSafeStart{};

    class safeStartLoop {};

    class safeStartPlayer {};
    class safeStartServer {};
	};


  class Debug {
    file = "tcs\debug";

    class createDebugTriggerMarkers {};
  };

  class PreInitFreeze {
    file = "tcs\preInitFreeze";
    
    class revealPlayableUnits {};
    class startFreezeLoop {};
  };

  class Zeus {
    file = "tcs\zeus";

    class isZeus {};

    class zeusInit {};
    class zeusAddAddons {};
    class zeusAddObjects {};
  };

  class Extra {
    file = "tcs\extra";
  };
};