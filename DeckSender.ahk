#NoEnv
#Warn
#IfWinActive  Path of Exile
#SingleInstance , Force

; ### Portal click ###
F9::
  MouseMove 416, 389
  Sleep 30
  Click
  return

+F10::
  InputBox, slotNumber, Hena, Slot number(0 to 13):
  while (true)
  {
    If (ErrorLevel != 0)
    {
      return
    }
    else if slotNumber is not Integer
    {
      InputBox, slotNumber, Hena, Slot number(0 to 13):
    }
    else if (slotNumber < 0 || slotNumber > 13)
    {
      InputBox, slotNumber, Hena, Slot number(0 to 13):
    }
    else
    {
      break
    }
  }

  InputBox, decksAmount, Hena, Amount of decks(0 to 70k):
  while (true)
  {
    If (ErrorLevel != 0)
    {
      return
    }
    if decksAmount is not Integer
    {
      InputBox, decksAmount, Hena, Amount of decks(0 to 70k):
    }
    else if (decksAmount < 0 || decksAmount > 70000)
    {
      InputBox, decksAmount, Hena, Amount of decks(0 to 70k):
    }
    else
    {
      break
    }
  }

  ; Declaring variables
  counter := slotNumber * 9

  if (slotNumber <= 6)
  {
    buf_i := slotNumber
    buf_j := 0
  }
  else
  {
    buf_i := slotNumber - 7
    buf_j := 1
  }

  ; First deck in stash slot
  CordII := 152
  CordJJ := 590

  ; First invenory slot
  base_Y := 596
  base_X := 1068

  ; Program starts
  SetDefaultMouseSpeed, 0
  SetMouseDelay, 0
  BlockInput, MouseMove

  loopTimes := Ceil(decksAmount / 600)
  Loop, %loopTimes%
  {	
  	; Take decks from Stash
  	cord_i := CordII + buf_i * 52
    cord_j := CordJJ + buf_j * 52
    MouseMove cord_i, Cord_j
    SendEvent {Control down}
    Loop, 60
    { 
      Sleep 50
      Click
      Sleep 25

      if (GetKeyState("F5","P") == true)
      {
        BlockInput, MouseMoveOff
        SendEvent {Control up}
        return
      }
    }
    SendEvent {Control up}
    Sleep 50
    Send {esc}
    Sleep 100

  	; Card counter and coordinator
    ++counter
    if (mod(counter, 9) == 0)
    {
      ++buf_i
    }

    ; End of first 7 slots
    if (counter == 63)
    {
      buf_i := 0
      ++buf_j
    }

    ; Party click
    MouseMove 47, 234
    Sleep 200
    Click, Right
    Sleep 50

    ; Trade request
    MouseMove 178, 358
    Sleep 200
    Click
    Sleep 50

    ; W8 for accept
    Sleep 1000

    ; Inventory => Trade
	buf_x := 0
    buf_y := 0
    x_coord := 0
    y_coord := 0

    SendEvent {Control down}
    loop, 60
    {
      x_coord := base_X + buf_x * 50
      y_coord := base_Y + buf_y * 50
      Sleep 5

      MouseMove x_coord, y_coord
      Sleep 30
      Click, up
      Sleep 5

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

    ; Accept
    MouseMove 273, 812
    Sleep 200
    Click
    Sleep 50

    ; Stash click
    MouseMove 818, 414
    Sleep 50
    Click
  }
  BlockInput, MouseMoveOff
  return