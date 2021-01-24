class cfgNotifications{
	// Notification Template
	class Template{
		title = ""; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = ""; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = ""; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1}; // Icon and text color
		duration = 5; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};

	// A generic warning notification
	class Alert{
		title = "ALERT";
		description = "%1";
		iconPicture="\A3\ui_f\data\map\markers\military\warning_ca.paa";
		duration = 3;
		priority = 9;
	};

	// Notifications for the F3 Safe Start Component
	class SafeStart{
		title = "SAFE START";
		description = "%1";
		iconPicture="\A3\UI_F\data\IGUI\Cfg\Actions\settimer_ca.paa";
		duration = 10;
		priority = 0;
	};

	class SafeStartMissionStarting{
		title = "SAFE START";
		description = "%1";
		iconPicture="\A3\UI_F\data\IGUI\Cfg\Actions\settimer_ca.paa";
		duration = 3;
		priority = 1;
	};

	// Notification for the Rapid Deployment Teleport component
	class RapidDeploymentSystemReady {
		title= "RAPID DEPLOYMENT SYSTEM";
		description= "%1";
		iconPicture = "\A3\ui_f\data\map\markers\military\start_ca.paa";
		color[] = {0,1,0,1};
		duration = 5;
		priority = 15;
	};

	class RapidDeploymentSystemActive {
		title= "RAPID DEPLOYMENT SYSTEM";
		description= "%1";
		iconPicture = "\A3\ui_f\data\map\markers\military\start_ca.paa";
		duration = 3;
		priority = 15;
	};

	// Notification for the F3 JIP Component
	class JIP {
		title= "REINFORCEMENTS";
		description= "%1";
		iconPicture = "\A3\ui_f\data\map\markers\military\flag_ca.paa";
		duration = 3;
		priority = 5;
	};
};