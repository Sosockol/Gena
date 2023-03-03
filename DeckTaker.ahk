#NoEnv
#Warn
#IfWinActive  Path of Exile
#SingleInstance , Force

+F1::
	; First trade slot
	base_I := 339
	base_J := 228
	; First inventory slot
	base_X := 1288
	base_Y := 613

	SetDefaultMouseSpeed, 0
	SetMouseDelay, 0
	BlockInput, MouseMove
	While (true) {
	While (true) {
		PixelGetColor, color, 1606, 777, Alt
		Sleep 50
		if (color == 0x010A1A) {
			MouseMove 1606, 777
			Sleep 300
			Click
			Sleep 700
			break
		}

			if (GetKeyState("F5","P") == true) {
		        BlockInput, MouseMoveOff
		        SendEvent {Control up}
		        return
        	}
		}

		; MouseOver
		buf_x := 0
		buf_y := 0
		x_coord := 0
		y_coord := 0

		loop, 60 {
		  x_coord := base_I + buf_x * 53
		  y_coord := base_J + buf_y * 53
		  Sleep 5

		  MouseMove x_coord, y_coord
		  Sleep 50


		  ++buf_y
		  if (buf_y = 5) {
		    ++buf_x
		    buf_y := 0
		  }

		  if (GetKeyState("F5","P") == true) {
		    BlockInput, MouseMoveOff
		    return
		  }
		}

		; Accept
		MouseMove 404, 831
		Sleep 100
		Click
		Sleep 1000

		; Stash click
		MouseMove 894, 444
		Sleep 100
		Click
		Sleep 300

		; Inventory -> Stash cycle
		buf_x := 0
		buf_y := 0
		x_coord := 0
		y_coord := 0

		SendEvent {Control down}
		loop, 60
		{
			x_coord := base_X + buf_x * 53
			y_coord := base_Y + buf_y * 53
			Sleep 5

			MouseMove x_coord, y_coord
			Sleep 50
			Click, up
			Sleep 15

			++buf_y
			if (buf_y = 5)
			{
				++buf_x
				buf_y := 0
			}

			if (GetKeyState("F5","P") == true)
			{
				BlockInput, MouseMoveOff
				SendEvent {Control up}
				return
			}
		}
		SendEvent {Control up}
	}
	BlockInput, MouseMoveOff
	return