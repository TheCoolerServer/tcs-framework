class TCS {
  tag = "TCS";

  class Local{
    file = "tcs\local";
    
    class getMarkerByGroup {};
    class groupMarker {};

    class initGroupPlayer {};
    class initUnit {};

    class onPlayerKilled {};
    class onPlayerRespawn {};
  };
  
  class Server{
    file = "tcs\server";

    class initGroupServer {};

    class initGroupRadios {};
    class initUnitRadios {};
  }


  class Default {
    file = "tcs";

    class initGroup {};
    class configure {PreInit = 1;};
  };


};