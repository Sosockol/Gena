; ##########################################
; # Expedition Tujen Haggle - version 1.06b #
; ##########################################
#IfWinActive  Path of Exile
#NoEnv 
#SingleInstance , Force
SetWorkingDir %A_ScriptDir% 
SendMode, Input
ConfigINI=%A_scriptdir%\Config.ini
ifnotexist,%ConfigINI%
{
	IniWrite, 0	, %ConfigINI%, ConfirmPos, xx
	IniWrite, 0	, %ConfigINI%, ConfirmPos, yy
	IniWrite, 0	, %ConfigINI%, RerollPos, xx
	IniWrite, 0	, %ConfigINI%, RerollPos, yy
}
;=Speed adjustments=
;per scroll down (haggling speed) in milisec
;wait time in milisec
vMouseMoveDelaySpeedMin = 35 
vMouseMoveDelaySpeedMax = 45 
vClickDelaySpeed = 50
;=haggling adjustments=
;haggling delay
vHagglingScrollSpeedMin = 20 
vHagglingScrollSpeedMax = 30
;first haggle number
vFirstMin = 14
vFirstMax = 16
;last haggle number
vLastMin = 5
vLastMax = 8
return


$1::
if !GetKeyState("capslock","T")
 {
 Send, 1
 }

 else
 {
	MouseClick, left
	Random, FirstH, %vFirstMin%, %vFirstMax%
	Loop, %FirstH%
	{
		Send {WheelDown 1}
		Random, vHagglingScrollSpeed, %vHagglingScrollSpeedMin%, %vHagglingScrollSpeedMax%
		Sleep %vHagglingScrollSpeed%
	}
	MouseGetPos xx, yy
	rCordXX = %xx%
	rCordYY = %yy%
	BlockInput, MouseMove
	IniRead, CordXX, Config.ini, ConfirmPos, xx
	IniRead, CordYY, Config.ini, ConfirmPos, yy
	MouseMove, CordXX , CordYY , 0
	Random, vMouseMoveDelaySpeed, %vMouseMoveDelaySpeedMin%, %vMouseMoveDelaySpeedMax%
	Sleep %vMouseMoveDelaySpeed%
	MouseClick, left
	Random, vMouseMoveDelaySpeed, %vMouseMoveDelaySpeedMin%, %vMouseMoveDelaySpeedMax%
	Sleep %vMouseMoveDelaySpeed%
	Random, LastH, %vLastMin%, %vLastMax%
	Loop, %LastH%
	{
		Send {WheelDown 1}
		Sleep %vHagglingScrollSpeed%
	}
	Random, vMouseMoveDelaySpeed, %vMouseMoveDelaySpeedMin%, %vMouseMoveDelaySpeedMax%
	Sleep %vMouseMoveDelaySpeed%
	MouseClick, left
	Sleep %vClickDelaySpeed%
	MouseClick, left
	MouseMove, rCordXX , rCordYY , 0	
	BlockInput, MouseMoveOff
 }
return

$2::
if !GetKeyState("capslock","T") 
 {
 Send, 2
 }

 else
 {
	BlockInput, MouseMove
	MouseGetPos xx, yy
	rCordXX = %xx%
	rCordYY = %yy%
	IniRead, CordXX, Config.ini, RerollPos, xx
	IniRead, CordYY, Config.ini, RerollPos, yy
	MouseMove, CordXX , CordYY , 0
	Sleep %vClickDelaySpeed%
	MouseClick, left
	MouseMove, rCordXX , rCordYY , 0
	BlockInput, MouseMoveOff
 }
return




+F9::
	MouseGetPos xx, yy
	IniWrite,%xx%	,	%ConfigINI%, ConfirmPos, xx
	IniWrite,%yy%	,	%ConfigINI%, ConfirmPos, yy
return


+F10::
	MouseGetPos xx, yy
	IniWrite,%xx%	,	%ConfigINI%, RerollPos, xx
	IniWrite,%yy%	,	%ConfigINI%, RerollPos, yy
return