
class COMPONENT {
	tag = COMPONENT;

    class BunkerSM {
		file = "tcs\headless_ai\headless_ai\functions\BunkerSM";
		class OnSEInitial {};
		class OnSECheckNearbyEnemies {};
		class OnSERemoveCantSeeEnemy {};
		class OnSEEnemyInRange {};
		class OnSECombatMode {};
		class OnSETarget {};
		class OnSEFire {};
		class OnSEAimed {};
		class OnSETimeOutReset {};
		class OnSEBurstReset {};
		class CondBurstCount {};
	};

    class CachingSM {
    	file = "tcs\headless_ai\headless_ai\functions\CachingSM";
    	class CH_onSEDistanceCheck {};
    	class CH_transCacheGroup {};
    	class CH_transUnCacheGroup {};
    };

	class Combat {
		file = "tcs\headless_ai\headless_ai\functions\Combat";
		class ArmEmptyStatic {};
		class CombatAttack {};
		class CombatAssault {};
		class CombatAssaultVehicle {};
		class CombatDefend {};
		class CombatDropOff {};
		class CombatLand {};
		class CombatMode {};
		class CombatMoveTo {};
		class CombatResponse {};
		class DefaultGroupPatrol {};
		class DestroyBuilding {};
		class FindCoverPos {};
		class FireUGL {};
		class FlankManeuver {};
		class FocusedAccuracy {};
		class ForceHeal {};
		class FormationChange {};
		class FragmentMove {};
		class Garrison {};
		class GarrisonClear {};
		class GarrisonClearPatrol {};
		class GroupLoiter {};
		class GroupPatrol {};
		class LightGarrison {};
		class LoiterAction {};
		class MoveInCombat {};
		class MoveToCover {};
		class PlaceMine {};
		class RadioCallForSupport {};
		class RadioCommsEnemy {};
		class RadioReportThreat {};
		class ReinforcementResponse {};
		class FireWeapon {};
		class SuppressDirection {};
		class SuppressingShots {};
		class ThrowGrenade {};
		class WatchEnemy {};
		class SearchBuilding {};
		class VehicleEject {};
	};

	class Commander {
		file = "tcs\headless_ai\headless_ai\functions\Commander";
		class assignToArea {};
		class CommanderHandler {};
		class CommanderInit {};
	};

    class create {
    	file = "tcs\headless_ai\headless_ai\functions\create";
        class createFunctions {};
        class createGroup {};
        class createUnit {};
        class createVehicle {};
        class createEmptyVehicle {};
        class createObject {};
        class createWaypoint {};
        class createWaypointModified {};
        class createWaypoints {};
        class createZone {};
        class finishGroupSpawn {};
        class finishVehicleSpawn {};
        class setAssignedVehicle {};
        class spawnArray {};
        class spawnGroupPFH {};
        class spawnUnitsGroupPFH {};
        class spawnUnitsVehiclePFH {};
    };

    class DangerCauses {
    	file = "tcs\headless_ai\headless_ai\functions\DangerCauses";
    	class CombatMovement {};
    	class CurrentStance {};
    	class DeadBodyDetection {};
    	class ExplosionDetection {};
    	class MoveToCoverGroup {};
    	class RecentEnemyDetected {};
    	class SetCombatStance {};
    	class stopToShoot {};
    	class VehicleHandleDanger {};
    };

    class Diag {
    	file = "tcs\headless_ai\headless_ai\functions\Diag";
    	class checkView {};
    	class closestEnemy {};
    	class ClosestObject {};
    	class DriverCheck {};
    	class EnemyArray {};
    	class getStance {};
    	class hasMine {};
    	class hasAT {};
    	class hasMG {};
    	class hasUGL {};
    	class HasRadioGroup {};
    	class IRCheck {};
    	class isAimed {};
    	class isInCombat {};
    	class isMoveTask {};
    	class LOSCheck {};
    	class tempRemovePrimaryMags {};
    	class nearbyFriendlyEntities {};
    };

    class Eventhandlers {
		file = "tcs\headless_ai\headless_ai\functions\Eventhandlers";
		class onFiredMan {};
	};

    class get {
		file = "tcs\headless_ai\headless_ai\functions\get";
	    class getBuildingList {};
	    class getBuildings {};
	    class getGroupVariables {};
	    class getNearestBuilding {};
	    class getNearestBuildings {};
	    class getNearestGroupBuildings {};
	    class getNewPos {};
	    class getRandomBuilding {};
	    class getRandomBuildings {};
	    class getRandomGroupBuildings {};
	    class getRandomPositionCircle {};
	    class getStartBuilding {};
	    class getTurrets {};
	    class getWaypointDetails {};
	    class getVehicleRoles {};
	};

	class GetInfo {
		file = "tcs\headless_ai\headless_ai\functions\GetInfo";
	    class getDetailsGroup {};
	    class getDetailsThing {};
	    class getDetailsVehicle {};
	    class getDetailsVehicleEmpty {};
	    class getDetailsUnit {};
	    class getSynced {};
	    class getSyncedObjects {};
	};

    class Main {
		file = "tcs\headless_ai\headless_ai\functions\Main";
		class GroupHandler {};
		class initMain {};
		class MapMarkers {};
	};

	class Misc {
		file = "tcs\headless_ai\headless_ai\functions\Misc";
		class checkifHC {};
		class setunitskill {};
		class UnitInit {};
		class SetInit {};
		class initPostMan {};
		class findUniqueName {};
		class deleteVehicles {};
		class searchNestedArray {};
	};

    class set {
		file = "tcs\headless_ai\headless_ai\functions\set";
	    class setAssignedVehicle {};
	    class setBuildingPos {};
	    class setFlashlights {};
	    class setGroupBehaviour {};
	    class setGroupVariables {};
        class setMultiOccupy {};
	    class setRespawn {};
	    class setStance {};
	    class setSurrender {};
	    class setVehicle {};
	};

    class SightAidSM {
		file = "tcs\headless_ai\headless_ai\functions\SightAidSM";
		class SA_OnSECheckNearbyEnemies {};
		class SA_OnSECombatMode {};
		class SA_onSEEnemyInRange {};
		class SA_OnSERemoveCantSeeEnemy {};
	};

	class StateMachine {
		file = "tcs\headless_ai\headless_ai\functions\statemachine";
		class addEventTransition {};
		class addState {};
		class addTransition {};
		class clockwork {};
		class create {};
		class createFromConfig {};
		class delete {};
		class getCurrentState {};
		class manualTransition {};
		class toString {};
		class updateList {};
		class dumpPerformanceCounters {};
	};

	class task {
		file = "tcs\headless_ai\headless_ai\functions\task";
	    class taskAssign {};
	    class taskAssault {};
	    class taskDropOff {};
	    class taskLoiter {};
	    class taskHoldUntil {};
	    class taskRelease {};
	    class taskBuildingPatrol {};
	    class taskBuildingDefend {};
	    class taskMoveBuilding {};
	    class taskMoveBuildings {};
	    class taskMoveGroupBuildingsDefend {};
	    class taskMoveGroupBuildingsPatrol {};
	    class taskMoveMultipleBuildingsDefend {};
	    class taskMoveMultipleBuildingsPatrol {};
	    class taskMoveNearestBuildingDefend {};
	    class taskMoveNearestBuildingPatrol {};
	    class taskMoveRandomBuildingDefend {};
	    class taskMoveRandomBuildingPatrol {};
	    class taskMoveRandomGroupBuildingsDefend {};
	    class taskMoveRandomGroupBuildingsPatrol {};
	    class taskMoveRandomMultipleBuildingsDefend {};
	    class taskMoveRandomMultipleBuildingsPatrol {};
	    class taskSearchNearby {};
	    class taskPickup {};
	    class taskBunker {};
        class taskDefend {};
        class taskAttack {};
	    class taskSentry {};
	    class taskStationary {};
	    class taskPatrol {};
	    class taskPatrolPerimeter {};
	};

    class UnitStanceSM {
		file = "tcs\headless_ai\headless_ai\functions\UnitStanceSM";
		class US_onSEInitial {};
		class US_onSEResetStance {};
		class US_onSEStanceCheck {};
		class US_onSEUnitChecks {};
	};
};
