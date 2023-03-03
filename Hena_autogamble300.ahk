; ##################
; # Unstacked deck #
; ##################

#IfWinActive  Path of Exile
#NoEnv 
#SingleInstance , Force
SetMouseDelay 0
SetWorkingDir %A_ScriptDir% 
SendMode, Input
ConfigINI=%A_scriptdir%\Config.ini
ifnotexist,%ConfigINI%
{
  IniWrite, 0  , %ConfigINI%, GroundPos, xx
  IniWrite, 100  , %ConfigINI%, GroundPos, yy
}
return

$F1::
IfWinActive, Path of Exile
{
  lol:= 0
  kek:= 0
  buf_y:= 0
  x_coord:= 0
  y_coord:= 0
  base_X:= 0
  base_Y:= 0

  MouseGetPos base_X, base_Y
  BlockInput, MouseMove

  if (GetKeyState("F1","P") == true)
  {
    Loop, 300
    {

  y_coord:= base_y + (kek * 50)
  x_coord:= base_x + (lol * 50)

  MouseMove x_coord, y_coord
    Sleep 100
    Click, Right
    Sleep 50

  IniRead, CordXX, Config.ini, GroundPos, xx

  MouseMove CordXX, y_coord
    Sleep 100
    Click
    Sleep 50

  buf_y:=buf_y+1

  if (buf_y = 10) {
      lol:= lol + 1
    }
  if (buf_y = 20){
      lol:= lol + 1
    }
  if (buf_y = 30){
      lol:= lol + 1
      IniRead, CordYY, Config.ini, GroundPos, yy
      MouseMove CordXX, CordYY
      Sleep 100
      Click
      sleep 750
    }
  if (buf_y = 40){
    lol:= lol + 1
    }
  if (buf_y = 50){
    lol:= lol + 1
    }
  if (buf_y = 60){
    lol:= 0
    buf_y:= 0
    kek:= kek + 1
    MouseMove CordXX, CordYY
    Sleep 100
    Click
    sleep 750
    }
  }
  }
}

  BlockInput, MouseMoveOff
return



+F9::
  MouseGetPos xx, yy
  IniWrite,%xx%  ,  %ConfigINI%, GroundPos, xx
  IniWrite,%yy%  ,  %ConfigINI%, GroundPos, yy
return



F2::
IfWinActive, Path of Exile
{
SetDefaultMouseSpeed, 0
SetMouseDelay, 0
buf_x:= 0
buf_y:= 0
x_coord:= 0
y_coord:= 0
base_X:= 0
base_Y:= 0
MouseGetPos, base_X,base_Y
SendEvent {Control down}
while (getkeystate("F2", "P")) {
    x_coord:= base_X + buf_x * 53
    y_coord:= base_Y + buf_y * 53
    Sleep 5
    MouseMove x_coord, y_coord
    Sleep 30
    Click, up
    Sleep 5
    buf_y:=buf_y+1
    if (buf_y = 5) {
        buf_x:=buf_x+1
        buf_y:=0
    }
}
SendEvent {Control up}
MouseMove, base_X,base_Y
}
Return