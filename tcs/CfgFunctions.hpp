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
  };

  class GroupMarkers {
    file = "tcs\groupMarkers";

    class createGroupMarker {};
    class getMarkerByGroup {};
    class groupMarker {};
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

		class safety{};

    class safeStartLoop {};

    class safeStartPlayer {};
    class safeStartServer {};

    class safeStart {};
	};

};