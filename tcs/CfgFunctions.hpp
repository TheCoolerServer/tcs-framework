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
    class addSurgicalKit {};

    class serverFpsLoop {};
    class adminInit {};
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
    class addConfigurationRadiosToPlayer {};
    class removePlayerRadios {};

    class savePlayerRadioSettings {};
    class restoreRadioSettings {};
  };

  
  class Tickets {
    file = "tcs\tickets";
    
    class bootstrapTicketsFramework {};
    class areTicketsEnabled {};
    
    class getPlayerTickets {};
    class ticketsOnPlayerKilled {};
    class ticketsOnPlayerRespawn {};

    class addSpectatorEventHandlers {};
    class spectatorOnKeyPressed {};

    class showTicketsDisplay {};
    class hideTicketsDisplay {};

    class ticketsRespawnLoop {};
    class ticketsDisplayLoop {};

    class ticketsPlayerRespawned {};

    class setTickets {};
    class addTickets {};
  };
  
  class individualTickets {
    file = "tcs\indTickets";

    class addTicketsIndividual {};
    class setTicketsIndividual {};
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
    class createLocalDebugTriggerMarkers {};
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

    class continuouslyDisableFSM {};
	class dressUp {};
	class createDressUp {};
    class createCutGrassAction {};
    class cutGrassAction {};
  };

  class Spectator {
    file = "tcs\spectator";

    class initSpectatorServer {};
    class isPlayerSpectating {};
    class playerChoseToSpectate {};
    class playerNowSpectating {};
    class addSpectateAction {};
    class moveToSpectator {};
    class spectate {};
  };
  
  class KilledBy {
    file = "tcs\killedBy";

    class killedBy {};
  };
  
  class OneLife {
    file = "tcs\oneLife";

    class oneLife_onPlayerKilled {};
  	class oneLife_onPlayerRespawn {};
	  class oneLife_respawnDialog {};
  };

  class RapidDeployment {
    file = "tcs\rapidDeployment";

    class mapClickTeleportAction {};
  	class mapClickTeleportGroup {};
	  class mapClickTeleportUnit {};
    class rdMapOnOpenClose {};
    class rdMapOnSingleClick {};
    class rdSetupEventHandlers {};
  };

  class FTMemberColors {
    file = "tcs\FTMemberColors";

    class assignTeamColors {};
  };

  class SlingLocality {
    file = "tcs\slingLocality";

    class localizeSling {};
  };

    class RichPresence {
    file = "tcs\richPresence";

    class initPlayerRichPresence {};
    class updatePlayerRPTicketCount {};
  };

  class VehicleRespawn {
		file = "tcs\vehicleRespawn";

		class vehicleLoadout {};
		class vehicleMonitor {};
		class vehicleRespawn {};
	};
};
