/*
File: fn_init.sqf
Desc: Inizlizes the players keys and allows them to set custom ones
Author: DaThrillerKiller -PureGaming Founder
Youtube: https://www.youtube.com/channel/UCY-d_qX9l2ABnJ3cDO7VUIQ
Email: dathrillerkiller@gmail.com 
Instagram: https://www.instagram.com/tuckeeeee

	Use Without Permission is prohibited

Prams: 
	none
*/

if (dtk_server)exitWith {};

private ["_KeybindingsDone"];

_KeybindingsDone = profileNamespace getVariable "SFGKeys123";
KeybindingsDone = if (isNil '_KeybindingsDone')then {profileNamespace setVariable ['SFGKeys123',keybindingDefaults]; keybindingDefaults}else {_KeybindingsDone};

call compile preprocessFile  format ['CORE\CLIENT\ACTIONS\%1KeyPressFunctions.sqf',ar_side];
call compile preprocessFile format ['CORE\CLIENT\ACTIONS\%1actions.sqf',ar_side];
call compile preprocessFile format ['CORE\CLIENT\ACTIONS\%1OnKeyPress.sqf',ar_side];
call compile preprocessFile 'CORE\CLIENT\ACTIONS\TFRKeyPress.sqf';

(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call keybindings_KeyDown"];
(findDisplay 46) displayAddEventHandler ["KeyUp", "_this call keybindings_keyUp"];

keybindings_init_done = true;