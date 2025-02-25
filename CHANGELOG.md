# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## 1.7.3 (2024-12-26)
### Changed
* Added ORBAT Framework to briefing by MexterInfinite.

## 1.7.2 (2024-11-03)
### Changed
* Removed code specific to Action Builder.
* Added 8 man squad compositions from MexterInfinite.
* Added RivalHelicopter to TCS Staff composition and Debug Console
* Renamed HC variable names to work with HBQ Spawn System

## 1.7.1 (2023-03-19)
### Fixed
* Fixed adminInit "missionConfig" error.
* Fixed get-changed-files action returning deleted files as changed.
* Fixed Rich Presence error when loading mission in Single Player.
* Fixed TCS_var_preventGrassDisable after CHVD was added to repo.

## 1.7.0 (2023-02-04)
### Changed
* Github PR validations.
* Updated deprecated github action output.
* Updated github action version.
* Headless AI forced stances fixed, performance improvements, and new UGL/AT setting.
* Headless state machines updates.
* Updated fn_adminInit.sqf with new Mods and Admins.
* Re-ordered initPlayer to give framework radios before saving loadout, and to replace ACRE radios with their base classes.

### Fixed
* Master PR validation script paramters.
* Changed files not working properly for pull requests.
* Moved the VehicleRespawn folder to fix the release build.
* Modified dress-up to work with editor-added radios.

### Added
* Added Pull Request template.
* Added PR checklist validation.
* Added support for the Discord Rich Presence mod.
* Added Debug Console for all Mods and Admins.


## 1.6.0 (2022-07-03)
### Fixed
* Fixed the cut grass action not creating the module on animation end.

### Changed
* rgomezer updated the compositions with the new moderators.
* Lucas changed default setting for free camera to off.

### Added
* rgomezer added the vehicle respawn scripts.
* rgomezer added the headless client disable flag for ActionBuilder.
* Lucas added a toggle to prevent grass from being disabled.

## 1.5.4 (2022-02-21)
### Fixed
* Jimmie Rustler fixed some more errors with the headless client and headless AI module.

### Changed
* Jimmie Rustler changed the `AUTO`command to `Auto` for the headless AI module.

## 1.5.3 (2021-12-20)
### Fixed
* Jimmie Rustler fixed some errors with the headless client and headless AI module.

## 1.5.2 (2021-12-05)
### Fixed
* Lucas fixed the OCAP recording not being exported.

## 1.5.1 (2021-11-28)
### Added
* Lucas added the automatic export of the OCAP recording.
* Added support for saving and restoring PRC-77's frequencies.

### Fixed
* Lucas fixed the endings not being triggered as success or failure properly.

### Changed
* Lucas updated the compositions with the new moderadors.

## 1.5.0 (2021-04-25)
### Fixed
* Fixed add zeus method not working properly.
* Sherman fixed the stuttering with the tickets display when players died.

### Changed
* Changed debug trigger markers option to run on the server and update for everyone.
* Changed back the radio functions to also save and restore the volume.
* Pliskin updated the compositions to include a delta squad. Compositions are also now split into squads, support teams and zeus slots.

### Added
* Added a local version of the debug trigger markers that doesn't keep track of trigger states.
* Added option to automatically add surgical kits to medics if they don't have one.
* Added option to save/load loadouts so there is a consistent order in which they are loaded to prevent radios from duplicating.
* Added the "Cut grass" self-interaction.
* Jimmie added the headless client AI module from the Kobold framework.

### Removed
* Removed the option to remove the radios from the loadout when setting the radios.

## 1.4.0 (2021-01-24)
### Added
* One-life respawn template (allows rejoin if death was unfair).
* Inform players of who and what killed them in the chat.
* Rapid Deployment System. Allows leaders to teleport their groups to different parts of the map before Safe Start is turned off to allow different start scenarios designed by the mission-maker. Exclusively used by the one-life respawn template to allow players rejoining to quickly teleport back to their team.
* Automatic fireteam color assignments for further squad cohesion/organization.
* Spectator for either just the player's side or for every playable side.
* Hardcoded locality function to prevent sling loaded objects from breaking ropes.

### Changed
* Changed Safe Start default from 3 minutes to 15 minutes to avoid prematurely losing the Rapid Deployment System in certain scenarios. Safe Start can still be manually turned off at any time.

### Fixed
* Moved the server FPS marker to be handled by the server.
* "TCS_var_fpsMarkerUpdateInterval" was misspelled in two files.
* Fireteam marker spelling error in the OPFOR group composition.
* Removed deprecated ACE modules from group compositions.
* Removed extra rifleman in the INDEP group composition.
* Fixed admin briefing not appearing for admins and zeuzes, only for the logged in admin.

## 1.3.1 (2020-08-09)
### Added
* Server FPS monitor for admins.
* Group type, name and color are now saved in the group.

### Changed
* Changed default value of the option for the switch to spectator option to appear to 90 minutes.
* Changed text of the spectator option to "Switch to spectator" from "Spectate".
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
