class TCS {
  tag = "TCS";

  class Root {
    file = "tcs";

    class initGroup {};
    class initZeus {};
    
    class configure {PreInit = 1;};
  };

  class Base{
    file = "tcs\base";

    //Player-side stuff
    class initPlayer {};
    class initGroupPlayer {};

    class onPlayerKilled {};
    class onPlayerRespawn {};

    //Server-side stuff
    class initServer {};
    class initGroupServer {};
  };

  class GroupMarkers {
    file = "tcs\groupMarkers";

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


};