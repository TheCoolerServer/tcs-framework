# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased
### Added
* Server FPS monitor for admins.
* Group type, name and color are now saved in the group.

### Changed
* Changed default value of the option for the switch to spectator option to appear to 1h 30 minutes.
* Changed text of the spectator option to "Switch to spectator" from of "Spectate".
* Changed for the spectator option to no longer appear in the middle of the screen when players respawn.

## 1.3.0 (2020-02-23)
### Added
* Voluntary spectator option.

### Changed
* Update group markers even if there is nobody in the group. That way when a player joins that group the marker updates.
* Tickets dispay now hides with the spectator display.
* Altered the radio module's options.

### Removed
* Individual tickets duplicate functions.

### Fixed
* Ticket's respawn time not aligned properly when there were no tickets left.

## 1.2.1 (2019-06-23)
### Added
* Added Pliskin's ID to the zeuses.

### Fixed
* Hingle's zeus ID
* Debug messages were left in fn_savePlayerRadioSettings.sqf.
* Individual tickets template had the wrong name in description.ext.
* Duplicate tickets respawn template section.

## 1.2.0 (2019-06-16)
### Added
* Individual ticket respawn option.
* Ability to define mission, author, display text, and load picture in description.ext.
* Option to disable FSM on AI again.
* Options for the mission maker to disable Free and third person spectator camera modes.
* Radio settings are now restored on respawn.
* Dumbname's ID to the compositions.

### Changed
* Endings 1 and 2 now default to Success and Failure.
* The readme is now more like a quickstart.

### Fixed
* Headless client composition slots not having names.

### Removed
* Player's ability to see AI when in spectator.

## 1.1.5 (2019-04-08)
### Fixed
* Safe start time counting before the briefing was finished.

## 1.1.4 (2019-03-13)
### Fixed
* Missing private keyword in the admin briefing.
* Error in the endings parameter causing the first ending to always be executed.

### Added
* Missing comment in fn_mpEndReceiver.

## 1.1.3 (2019-03-02)
### Removed
* Disable FSM loop that caused AI to stop responding.

### Fixed
* Pre-init freeze parameter variable name.

### Changed
* Group markers now appear in SP and local MP.

## 1.1.2 (2019-02-14)
### Fixed
* fn_loadoutNotes isnt called on fn_createBriefing.
* Fixed JIP clients ignoring the updated mission parameters that caused safe start being enabled even though it shouldn't be.

## 1.1.1 (2019-02-10)
### Added
* Changelog
### Changed
* Made the framework version macros make more sense and not require the `_STRING` suffix.
### Fixed
* TCS_fnc_mpEnd was still calling f_fnc_mpEndReceiver.
* Tickets display was still apprearing if the player was respawned by something else.
* Loadout notes was broken.


## 1.1.0 (2019-01-24)
### Changed
* Undocumented changes