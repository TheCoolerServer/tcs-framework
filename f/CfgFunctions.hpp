// F3 Functions

class F{ // Defines the "owner"
	class common {  // category
		file = "f\common";
		class processParamsArray{preInit = 1; postInit=1;};
		class nearPlayer{};
	};

	class mpEnd{
		file = "f\mpEnd";
		class mpEnd{};
		class mpEndReceiver{};
	};

	class FTMemberMarkers{
		file = "f\FTMemberMarkers";
		class SetLocalFTMemberMarkers{};
		class GetMarkerColor{};
		class LocalFTMarkerSync{};
	};

	class mapClickTeleport{
		file = "f\mapClickTeleport";
		class mapClickTeleportUnit{};
		class mapClickTeleportGroup{};
		class mapClickTeleportParachute{};
	};
	
	class zeus{
		file = "f\zeus";
		class zeusInit{};
		class zeusAddAddons{};
		class zeusAddObjects{};
	};
};