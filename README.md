# TCS Mission Framework
Mission framework made for TCS based on F3 which currently includes: 

* Compositions for: East and West sides.

* Side-independent group markers that are only visible to their side. (Configurable)

* Automatic radio insertion into the player's inventory. (Radios do not come configured with specific channels)

* Proper group names in the role selection screen.

* Ticked based respawn system.


## Installation
1. Download the repository.
2. Copy all the files except "compositions" into your mission folder.
3. Copy the folders inside the "compositions" folder into your profile's compositions folder.
3. Place any of the compositions into the map.


## Configuration
All configuration options are set in the `tcs/fn_configure.sqf` file, the only ones not self explanatory are:  

* `TCS_var_westGroupMarkers`  
To make it easier to customize and add new groups into the mission the group markers were made independent of the group variable name. For that it was necessary to define somewhere which marker would represent what "kind" of squad. So that mission maker's don't have to remember the exact name of the marker class a translation "table" was created, which is what this variable is.  
There are "translation tables" for each side, making it possible to have different markers for each side.

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
Thihs will create a marker on the map that is a `Lead` element being `ASL` whose color will be red.


## Switching the default respawn system to the ticket-based one
To change the mission from having no respawns to a ticket-based respawn is really simple, all that is needed is for respawn to be enabled on the mission (`Attributes -> Multiplayer -> Respawn`) and the respawn template be changed to use the tickets.  

To change the respawn template to tickets all that is necessary is to change the `respawnTemplates` setting in the `description.ext` to include the `TCS_Tickets` template. For example, this are the default respawn templates:
```sqf
respawnTemplates[] = {"TCS_Respawn", "Counter"};
```

If we want to change this to use tickets, all that we have to do is remove the `Counter` template and add the `TCS_Tickets` one. Which would result in:
```sqf
respawnTemplates[] = {"TCS_Respawn", "TCS_Tickets"};
```

After that, the default ticket amount for each side is `10`. That can be changed in the `tcs\fn_configure.sqf` file.

If you are wondering why the `Counter` respawn template was removed, it was because the tickets respawn screen already contains a counter for how long the player has to wait until he respawns and the default one would be wrong since it would always be reset to the default value due to the way how respawns are handled.  

**Note:** The `TCS_Respawn` template is there to provide a smooth transition between death and the spectator screen and calls `BIS_fnc_EGSpectator`. If you don't want that behaviour you can remove that template and it will not affect the tickets. But you will have to call `BIS_fnc_EGSpectator` youself to get the nice spectator screen.

### Changing the amount of tickets of a side
There are `2` functions that can be called to set/add tickets to a side, both of these functions **MUST** be called on the server, if you are not executing the code in the server, `remoteExecCall` the function.  

* `TCS_fnc_addTickets`  
  Adds an amount of tickets to a side.  
  **Parameters:**
    * 0 - (side) Whose side you want to add tickets to.
    * 1 - (number) The amount of tickets you want to add. The number is rounded server-side.
* `TCS_fnc_setTickets`  
  Sets the amount of tickets of a side.  
  **Parameters:**
    * 0 - (side) Whose side you want to set the tickets of.
    * 1 - (number) The number of tickets that the given side should have. The number is rounded server-side.