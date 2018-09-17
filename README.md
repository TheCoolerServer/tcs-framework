# TCS Mission Framework
Mission framework made for TCS based on F3 which currently includes: 

* Compositions for: East and West sides.

* Side-independent group markers that are only visible to their side. (Configurable)

* Automatic radio insertion into the player's inventory. (Radios do not come configured with specific channels)


## Installation
1. Download the repository.
2. Copy all the files except "mission.sqm" into your mission folder.
3. Place one of the side compositions into the map.


## Configuration
All configuration options are set in the `tcs/fn_configure.sqf` file, the only ones not self explanatory are:  

* `TCS_var_westGroupMarkers`  
To make it easier to customize and add new groups into the mission the group markers were made independent of the group variable name. For that it was necessary to define somewhere which marker would represent what "kind" of squad. So that mission maker's don't have to remember the exact name of the marker class a translation "table" was created, which is what this variable is.  
There are "translation tables" for each side, making it possible to have different markers for each side.

* `TCS_var_defaultRadioPreset`  
Contrary to what the variable name might seem like, this variable actually contains a function that is responsable for applying a radio preset to a given group. With the only parameter being passed being the group.  
This function then takes a group and handles all the radio operations needed to have the radios properly set for a group when it is initalized.

* `TCS_var_westRadios`  
This variable contains a definition of which radios should a unit have. It is an array of arrays whose index `0` indicates which radios the leader of the group should have and index `1` contains a list of radios which all of the other units in the group should have.


## Adding new groups into the mission
If you want to add any new groups to the mission, all that is needed for the framework to work is to call the function `TCS_fnc_initGroup` in the groups `init` field. This function takes these arguments:  
```sqf
  0 - (group) The group that should be initialized
  1 - (string) What kind of group this group is (One of the entries in TCS_var_xxxxGroupMarkers)
  2 - (string) The text that should appear on the map.
  3 - (string) The color that this group should have. (One of the arma colors)
```
Example:
```sqf
[this, "Lead", "ASL", "ColorRed"] call TCS_fnc_initGroup;
```
Thihs will create a marker on the map that is a `Lead` element being `ASL` whose color will be red. The group will also have the proper radios if the configuration option to initialize the radios is enabled.
