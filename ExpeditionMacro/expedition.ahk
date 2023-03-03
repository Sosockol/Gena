; ###########################
; # Expedition Tujen Haggle #
; ###########################
Process,Priority,,A
#IfWinActive   Path of Exile
#NoEnv  
#SingleInstance  , Force
SetMouseDelay 150
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
return

$1::
if !GetKeyState("capslock","T")
 {
 Send, 1
 }

 else
 {
	Send {Click}
	Sleep 100
	Loop, 15
	{
		Send {WheelDown 1}
	}
	Sleep 100
	MouseGetPos xx, yy
	rCordXX = %xx%
	rCordYY = %yy%
	BlockInput, MouseMove
	IniRead, CordXX, Config.ini, ConfirmPos, xx
	IniRead, CordYY, Config.ini, ConfirmPos, yy
	MouseMove, CordXX , CordYY , 0
	Sleep 100
	Send {Click}
	Sleep 100
	Loop, 8
	{
		Send {WheelDown 1}
	}
	Sleep 100
	Send {Click}
	Sleep 100
	Send {Click}
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
	MouseMove, CordXX , CordYY , 03
	Sleep 150
	Send {Click}
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