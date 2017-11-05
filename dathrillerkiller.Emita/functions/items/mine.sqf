private ["_minearray","_isInArea","_amount","_resource","_max","_infos","_name","_itemweight","_pos","_object"];
if(working)exitwith{systemChat  "You are collecting a resource, please wait";};
working=true;
_isInArea=false;
{if (player distance (getMarkerPos ((_x select 0) select 0)) < ((_x select 0) select 1) && isciv) then {_isInArea = true; _minearray = _x};} count miningarray;
_amount = floor (random 2)+1;
_resource = _minearray select 1;
_max      = _minearray select 2;
_infos    = _resource call INV_getitemArray;
_name     = (_infos call INV_getitemName);
_itemweight = (_infos call INV_getitemTypeKg)*_amount;
if (!_isInArea) then
{
systemChat  "You are not near a resource area.";
working = false;
}
else
{
for [{_i=0}, {_i < (floor(random 5))}, {_i=_i+1}] do 
{
titletext ["Machine Running...", "PLAIN DOWN", 1];
sleep 5;
titletext [format ["The Machine has collected %1!", _resource], "PLAIN"];
systemChat  format["There is %1 %2s on the ground collect them.", _amount, _name];
switch true do
{
case (_resource == "oil"):{
_pos = getposASL player;
_object = "Barrel4" createvehicle (position player);
_object setPos [ getPos this select 0, (getPos this select 1)+4, (getPos this select 2)];
_object setvariable ["droparray", [_amount, _resource], true];
};
case (_resource == "iron"):{
_pos = getposASL player;
_object = "MAP_R2_Boulder2" createvehicle (position player);
_object setPos [ getPos this select 0, (getPos this select 1)+4, (getPos this select 2)];
_object setvariable ["droparray", [_amount, _resource], true];
};
case (_resource == "gold"):{
_pos = getposASL player;
_object = "R_Stone_01_EP1" createvehicle (position player);
_object setPos [ getPos this select 0, (getPos this select 1)+4, (getPos this select 2)];
_object setvariable ["droparray", [_amount, _resource], true];
};
case (_resource == "copper"):{
_pos = getposASL player;
_object = "R_Stone_02_EP1" createvehicle (position player);
_object setPos [ getPos this select 0, (getPos this select 1)+4, (getPos this select 2)];
_object setvariable ["droparray", [_amount, _resource], true];
};
case (_resource == "coal"):{
_pos = getposASL player;
_object = "MAP_R2_Boulder1" createvehicle (position player);
_object setPos [ getPos this select 0, (getPos this select 1)+4, (getPos this select 2)];
_object setvariable ["droparray", [_amount, _resource], true];
};
};

_object  setvehicleinit format["
this addaction ['Pickup %1 (%2)','scripts\pickup.sqf',[this, '%3', %2]];
", _name, _amount,_resource];
processInitCommands;

titletext ["Restart the machine it has shut down...", "PLAIN DOWN", 3];
};
working=false;
};