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
    x_coord:= base_X + buf_x * 50
    y_coord:= base_Y + buf_y * 50
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



F1::
IfWinActive, Path of Exile
{
SetDefaultMouseSpeed, 0
SetMouseDelay, 0

SendEvent {Control down}
while (getkeystate("F1", "P")) {

    Click, up
    Sleep 50

}
SendEvent {Control up}
MouseMove, base_X,base_Y
}
Return



F4::
IfWinActive, Path of Exile
{
SetDefaultMouseSpeed, 0
SetMouseDelay, 0
buf_x:= 0
buf_y:= 0
x_coord:= 0
y_coord:= 0
p_coord:= 0
base_X:= 0
base_Y:= 0
CordLL:= 619
CordPP:= 734
MouseGetPos, base_X,base_Y
SendEvent {Control down}
while (getkeystate("F4", "P")) {
    x_coord:= base_X + buf_x * 53
    y_coord:= base_Y + buf_y * 53
    Sleep 5
    MouseMove x_coord, y_coord
    Sleep 30
    Click, up
    Sleep 5

    MouseMove CordLL, CordPP
    Sleep 200
    Click
    Sleep 250

    p_coord:= CordPP - 100
    Sleep 5

    MouseMove CordLL, p_coord
    Sleep 30
    Click, up
    Sleep 5

    buf_y:= buf_y+1
    if (buf_y = 5) {
        buf_x:=buf_x+1
        buf_y:=0
    }
}
SendEvent {Control up}
MouseMove, base_X,base_Y
}
Return