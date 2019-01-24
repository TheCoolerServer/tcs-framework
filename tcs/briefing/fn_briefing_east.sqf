#include "..\base\FrameworkVersion.hpp"

//============================= East briefing (OPFOR) ============================
//------------------------------------ Credits -----------------------------------
player createDiaryRecord ["diary", ["Credits","
<br/>
*** Insert mission credits here. ***<br/>
<br/>
Made with " + FRAMEWORK_NAME_FULL_STRING]];

//-------------------------------- Administration --------------------------------
player createDiaryRecord ["diary", ["Administration","
<br/>
*** Insert information on administration and logistics here. ***
"]];

//------------------------------------ Mission -----------------------------------

player createDiaryRecord ["diary", ["Mission","
<br/>
*** Insert the mission here. ***
"]];

//----------------------------------- Situation ----------------------------------

player createDiaryRecord ["diary", ["Situation","
<br/>
*** Insert general information about the situation here.***<br/>
<br/>
<font size='18'>ENEMY FORCES</font>
<br/>
*** Insert information about enemy forces here.***<br/>
<br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
*** Insert information about friendly forces here.***
"]];