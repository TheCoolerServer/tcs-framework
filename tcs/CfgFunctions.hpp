class TCS {
  tag = "TCS";

  class Local{
    file = "tcs\local";
    
    class getMarkerByGroup {};
    class groupMarker {};

    class initGroupPlayer {};
    
    class initPlayerRadios {};

    class onPlayerKilled {};
    class onPlayerRespawn {};

    class initPlayer {};
  };
  
  class Server{
    file = "tcs\server";

    class initGroupServer {};
    
    class initServer {};
  }


  class Default {
    file = "tcs";

    class initGroup {};
    class initZeus {};
    
    class configure {PreInit = 1;};
  };

  class Tickets {
    file = "tcs\tickets";

    class ticketsOnPlayerKilled {};
    class ticketsOnPlayerRespawn {};

    class ticketsRespawnLoop {};

    class ticketsPlayerRespawned {};

    class setTickets {};
    class addTickets {};
  }


};