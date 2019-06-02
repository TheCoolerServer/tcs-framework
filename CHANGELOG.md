# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

##1.1.6 (2019-06-02)
### Added
* Individual ticket respawn option.
* Ability to define mission, author, display text, and load picture in description.ext.

### Changed
* Endings 1 and 2 now default to Success and Failure.

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