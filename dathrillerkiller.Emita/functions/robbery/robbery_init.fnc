if (dtk_server)exitWith {};

private ["_name","_object"];

{
	_object = _x select 0;
	_name = _x select 1;

	_object addaction [format ["Rob %1",_name],"noscript.sqf", format ["%1 spawn robbery_rob",_object], 1, false, true, "", format ["isCiv && {(%1 getVariable ['robbery_avalible',true])} && {(%1 getVariable ['robbery_money',5000]) >= 5000}",_object]];
	true
}count robbery_actions;

robbery_init_done = true;