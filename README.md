# TCS Mission Framework
Mission framework made for TCS based on F3 which currently includes: 

* Compositions for: East, West and Independent sides.
* Side-independent group markers that are only visible to their side. (Configurable)
* Automatic radio insertion into the player's inventory.
* Proper group names in the role selection screen.
* Ticked based respawn system.


## Installation
1. Download the repository.
2. Copy all the files except "compositions" into your mission folder.
3. Copy the folders inside the "compositions" folder into your profile's compositions folder.
3. Place any of the compositions into the map.


## Quickstart
### Configuration
The framework is mostly configured by changing the values in the `fn_configure.sqf` file inside the `tcs` folder. It is divided in multiple sections that make it easier which setting affects what. For more information about each section, which represents a module, please check the wiki page for that specific module.

### Respawn templates
Respawn templates modify what happens when a player dies and respawns and are controlled by the `Respawn template` settings in the editor and the `respawnTemplates` setting in `description.ext`. One thing to note is that the respawn templates only work when the mission has respawns enabled, they will not do anything otherwise. If you want to emulate their behaviour you will have to copy their code inside `onPlayerRespawn.sqf` and `onPlayerKilled.sqf`.  
  
Note: When you open the `description.ext` file to change the respawn templates you'll notice that the "Tickets" options removes the `Counter` template. That is because the tickets template manipulates the respawn timer and it's not nice for the player to see that. So it is not recommended to use the `Counter` template with any of the "Tickets" templates.

The framework comes with 4 respawn templates that offer different behaviours when a player respawns, which are listed below:

#### TCS_Respawn
The base respawn template for the framework, responsible for the radios module and the spectator screen on death.

#### TCS_Tickets
Adds a ticket-based respawn system with a shared pool of tickets per side. When no tickets are availible the player will not respawn until more tickets are awarded.  
This respawn template NEEDS a respawn time greater than 0.

#### TCS_Tickets
Adds a ticket-based respawn system with a shared pool of tickets per side. When no tickets are availible the player will not respawn until more tickets are awarded. Incompatible with the `TCS_Individual_Tickets` respawn template.  
This respawn template NEEDS a respawn time greater than 0.

#### TCS_Individual_Tickets
Adds a ticket-based respawn system with individual tickets for each person instead of a shared pool. Incompatible with the `TCS_Tickets` respawn template.  
This respawn template NEEDS a respawn time greater than 0.

#### TCS_BackToGroup
Teleports the player back to his group on respawn. The player will be teleported around 100 meters back of the center of his group. If none of his group are still alive he will be teleported back to where he died.  

### Adding new groups into the mission
If you want to add any new groups to the mission, all that is needed for the framework to work is to call the function `TCS_fnc_initGroup` in the group's `init` field. This function takes 4 arguments:  
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

### Default radio settings
The variable `TCS_var_westRadios` (which is copied to the other sides) contains a definition of which radios should a unit have. It is an array of arrays whose index `0` indicates which radios the leader of the group should have and index `1` contains a list of radios which all of the other units in the group should have.  
The default settings say that all group leaders should contain a 343 and a 152 and all other members only a 343. You can change any of those values to any ACRE2 classname, you can also set the array empty to give no radios to the players.

### Changing the amount of tickets
For each tickets respawn template there are 2 functions that can be called to set/add tickets, both of these functions **MUST** be called on the server, if you are not executing the code in the server, `remoteExec` or `remoteExecCall` the function.  

For the default tickets template these are the functions:
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

For the individual tickets template, these are the functions:
* `TCS_fnc_addTicketsIndividual`  
  Adds an amount of tickets to a player.  
  **Parameters:**
    * 0 - (number) The ID of the player you want to add tickets to. 0 can be used to add tickets to everyone. You can also use negative numbers to add tickets to everyone but that player.
    * 1 - (number) The amount of tickets you want to add. The number is rounded server-side.
* `TCS_fnc_setTicketsIndividual`  
  Sets the amount of tickets of a player.  
  **Parameters:**
    * 0 - 0 - (number) The ID of the player you want to add tickets to. 0 can be used to add tickets to everyone. You can also use negative numbers to add tickets to everyone but that player.
    * 1 - (number) The number of tickets that the player should have. The number is rounded server-side.  