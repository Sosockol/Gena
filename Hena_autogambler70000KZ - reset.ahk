; ######################
; ## Hena AutoGambler ##
; ######################
; ## Made by Sosockol ##
; ######################
; #IfWinActive  Path of Exile
#NoEnv
#SingleInstance , Force
SetMouseDelay 0
SetDefaultMouseSpeed, 0
SendMode, Input
SetWorkingDir %A_ScriptDir%



; ### Portal click ###
F9::
MouseMove 512, 400
Sleep 30
Click
return



; ### GUI ###
F4::
Gui, Add, Button, x39 y60 w120 h40 , Auto Gambler
Gui, Add, Button, x39 y120 w120 h40 , Trasher
Gui, Add, Button, x39 y180 w120 h40 , Trader
Gui, Add, Button, x39 y240 w120 h40 , Autotrader
Gui, Add, Button, x39 y300 w120 h40 , VOID
Gui, Add, Button, x39 y360 w120 h40 , AxeOrBody
Gui, Add, Button, x39 y420 w120 h40 , Glimmer
Gui, Show, x100 y195 h480 w202, New GUI Window
return
GuiClose:
Gui, Hide
return



; ### Auto Gambler ###
ButtonAutoGambler:
Gui, Hide

; Clean filter
Send ^f
Sleep 5
Send asd
MouseMove, 750, 115
Sleep 30
Click
Sleep 120

stashColors := ["0x262020", "0x231c1c", "0x2d2727", "0x261f1f", "0x3b3737", "0x464343", "0x383434", "0x3c3838", "0x4d4a4a", "0x292323", "0x190e0e", "0x201717", "0x231c1c", "0x383434"]
FirstSlot_X := 160
FirstSlot_Y := 610
buf_X := 0
buf_Y := 0


BlockInput, MouseMove
Loop, 10 {
  For Each, Color in stashColors {
    AutoGambler(FirstSlot_X + buf_X * 55, FirstSlot_Y + buf_Y * 55, Color)
    buf_X++
    if (buf_X == 7) {
      buf_X := 0
      buf_Y := 1
    }
  }
}

divTabFilter()
i := 1
; Curr
Cards := []
Loop, read, %A_ScriptDir%\CardArrays\Curr.txt
{
  Cards.Push(StrSplit(A_LoopReadLine, ","))
}
While (i < Cards.MaxIndex() + 1) {
  While (deckCheck(Cards[i, 1]) == 0) {
    rerunDecks(200, 5000, 10000)
    deckTake(Cards[i, 1], 60)
    decksTrade(60)
    stashClick()
    inventoryWithdraw(60)
  }
  i++
}
i = 1

; GCP
Cards := []
Loop, read, %A_ScriptDir%\CardArrays\GCP.txt
{
  Cards.Push(StrSplit(A_LoopReadLine, ","))
}
While (i < Cards.MaxIndex() + 1) {
  While (deckCheck(Cards[i, 1]) == 0) {
    rerunDecks(200, 5000, 10000)
    deckTake(Cards[i, 1], 60)
    decksTrade(60)
    liliSell()
    inventoryWithdraw(60)
    sellButtClick()
    stashClick()
    inventoryWithdraw(10)
  }
  i++
}
i = 1

; Loreweave
Cards := []
Loop, read, %A_ScriptDir%\CardArrays\Loreweave.txt
{
  Cards.Push(StrSplit(A_LoopReadLine, ","))
}
While (i < Cards.MaxIndex() + 1) {
  While (deckCheck(Cards[i, 1]) == 0) {
    deckTake(Cards[i, 1], 70)
    decksTrade(60)
    liliSell()
    inventoryWithdraw(60)
    sellButtClick()
    stashClick()
    inventoryWithdraw(10)
  }
  i++
}
i = 1

liliSell()
inventoryWithdraw(60)
sellButtClick()
liliSell()
inventoryWithdraw(60)
sellButtClick()
liliSell()
inventoryWithdraw(60)
sellButtClick()
liliSell()
inventoryWithdraw(60)
sellButtClick()
liliSell()
inventoryWithdraw(60)
sellButtClick()
liliSell()
inventoryWithdraw(60)
sellButtClick()
stashClick()
inventoryWithdraw(60)

; SixL
Cards := []
Loop, read, %A_ScriptDir%\CardArrays\SixL.txt
{
  Cards.Push(StrSplit(A_LoopReadLine, ","))
}
While (i < Cards.MaxIndex()) {
  While (deckCheck(Cards[i, 1]) == 0) {
    rerunDecks(200, 5000, 10000)
    deckTake(Cards[i, 1], 5)
    decksTrade(5)
    liliSell()
    horisontalWithdraw(1,,2, 6)
    sellButtClick()
    stashClick()
    inventoryWithdraw(5)
  }
  i++
}
; Humility
While (Cards[i, 1] == """Humility""") {
  While (deckCheck(Cards[i, 1]) == 0) {
    rerunDecks(200, 5000, 10000)
    deckTake(Cards[i, 1], 2)
    decksTrade(2)
    liliSell()
    horisontalWithdraw(, 2, 2, 2)
    sellButtClick()
    stashClick()
    inventoryWithdraw(2)
  }
  i++
}
i = 1

; Big cards (TODO)
Cards := []
Loop, read, %A_ScriptDir%\CardArrays\Bigs.txt
{
  Cards.Push(StrSplit(A_LoopReadLine, ","))
}
While (i == 999 && i == 999) {
  i++
}
i = 1

; Trash
Cards := []
Loop, read, %A_ScriptDir%\CardArrays\Trash.txt
{
  Cards.Push(StrSplit(A_LoopReadLine, ","))
}
While (i < Cards.MaxIndex() + 1) {
  While (deckCheck(Cards[i, 1]) == 0) {
    rerunDecks(200, 5000, 10000)
    deckTake(Cards[i, 1], 58)
    liliSell()
    inventoryWithdraw(60)
    sellButtClick()
    stashClick()
  }
  i++
}
BlockInput, MouseMoveOff
Return



; ### Inventory withdrawer ###
F2::
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

    MouseMove x_coord, y_coord
    Sleep 30
    Click, up
    Sleep 5

    buf_y := buf_y + 1
    if (buf_y = 5) {
        buf_x:=buf_x+1
        buf_y:=0
    }
}
SendEvent {Control up}
MouseMove, base_X,base_Y
Return



; ###Full Stacks Autotrader###
+F3::
BlockInput, MouseMove
Send {Esc}
decksTrade(60)
BlockInput, MouseMoveOff
Return

; ### Full Stacks Trader ###
F3::
buf_x := 0
buf_y := 0
x_coord := 0
y_coord := 0
p_coord := 0
base_X := 0
base_Y := 0
CordLL := 619
CordPP := 734
BlockInput, MouseMove
MouseGetPos, base_X, base_Y
SendEvent {Control down}
while (getkeystate("F3", "P")) {
  x_coord := base_X + buf_x * 53
  y_coord := base_Y + buf_y * 53

  MouseMove x_coord, y_coord
  Sleep 30
  Click, up
  Sleep 5

  MouseMove CordLL, CordPP
  Sleep 100
  Click
  Sleep 100

  p_coord := CordPP - 100

  MouseMove CordLL, p_coord
  Sleep 30
  Click, up
  Sleep 5

  ++buf_y
  if (buf_y = 5) {
    ++buf_x
    buf_y := 0
  }
}
SendEvent {Control up}
MouseMove, base_X,base_Y
BlockInput, MouseMoveOff
Return



; ### Trasher ###
ButtonTrasher:
Gui, Hide
InputBox, card, Hena, Which card delete?
  If (ErrorLevel != 0) {
    return
  }
InputBox, decks, Hena, How many times?
  If (ErrorLevel != 0) {
    return
  }
BlockInput, MouseMove
Loop, %decks% {
  deckTake(card, 60)
  liliSell()
  inventoryWithdraw(60)
  sellButtClick()
  stashClick()
}
BlockInput, MouseMoveOff
Return



; ### Trader ###
ButtonTrader:
Gui, Hide
InputBox, card, Hena, Which card trade?
  If (ErrorLevel != 0) {
    return
  }
InputBox, decks, Hena, How many times?
  If (ErrorLevel != 0) {
    return
  }
BlockInput, MouseMove
Loop, %decks% {
    deckTake(card, 60)
    decksTrade(60)
    stashClick()
    inventoryWithdraw(60)
}
BlockInput, MouseMoveOff
Return



; ### Full Autotrader ###
ButtonAutoTrader:
Gui, Hide
divTabFilter()
InputBox, cycle, Hena, Start:1-Currency 2-GCP 3-Stuff 4-SixL 5-Bigs 6-Trash
BlockInput, MouseMove
i := 1

; Curr
if (cycle == 1) {
  Cards := []
  Loop, read, %A_ScriptDir%\CardArrays\Curr.txt
  {
    Cards.Push(StrSplit(A_LoopReadLine, ","))
  }
  While (i < Cards.MaxIndex() + 1) {
    While (deckCheck(Cards[i, 1]) == 0) {
      rerunDecks(200, 5000, 10000)
      deckTake(Cards[i, 1], 60)
      decksTrade(60)
      stashClick()
      inventoryWithdraw(60)
    }
    i++
  }
  i = 1
  cycle++
}

; GCP
if (cycle == 2) {
  Cards := []
  Loop, read, %A_ScriptDir%\CardArrays\GCP.txt
  {
    Cards.Push(StrSplit(A_LoopReadLine, ","))
  }
  While (i < Cards.MaxIndex() + 1) {
    While (deckCheck(Cards[i, 1]) == 0) {
      rerunDecks(200, 5000, 10000)
      deckTake(Cards[i, 1], 60)
      decksTrade(60)
      liliSell()
      inventoryWithdraw(60)
      sellButtClick()
      stashClick()
      inventoryWithdraw(10)
    }
    i++
  }
  i = 1
  cycle++
}

; Loreweave
if (cycle == 3) {
  Cards := []
  Loop, read, %A_ScriptDir%\CardArrays\Loreweave.txt
  {
    Cards.Push(StrSplit(A_LoopReadLine, ","))
  }
  While (i < Cards.MaxIndex() + 1) {
    While (deckCheck(Cards[i, 1]) == 0) {
      deckTake(Cards[i, 1], 70)
      decksTrade(60)
      liliSell()
      inventoryWithdraw(60)
      sellButtClick()
      stashClick()
      inventoryWithdraw(10)
    }
    i++
  }
  i = 1
  cycle++
}

liliSell()
inventoryWithdraw(60)
sellButtClick()
liliSell()
inventoryWithdraw(60)
sellButtClick()
liliSell()
inventoryWithdraw(60)
sellButtClick()
liliSell()
inventoryWithdraw(60)
sellButtClick()
liliSell()
inventoryWithdraw(60)
sellButtClick()
liliSell()
inventoryWithdraw(60)
sellButtClick()
stashClick()
inventoryWithdraw(60)

; SixL
if (cycle == 4) {
  Cards := []
  Loop, read, %A_ScriptDir%\CardArrays\SixL.txt
  {
    Cards.Push(StrSplit(A_LoopReadLine, ","))
  }
  While (i < Cards.MaxIndex()) {
    While (deckCheck(Cards[i, 1]) == 0) {
      rerunDecks(200, 5000, 10000)
      deckTake(Cards[i, 1], 5)
      decksTrade(5)
      liliSell()
      horisontalWithdraw(1,,2, 6)
      sellButtClick()
      stashClick()
      inventoryWithdraw(5)
    }
    i++
  }
  ; Humility
  While (Cards[i, 1] == """Humility""") {
    While (deckCheck(Cards[i, 1]) == 0) {
      rerunDecks(200, 5000, 10000)
      deckTake(Cards[i, 1], 2)
      decksTrade(2)
      liliSell()
      horisontalWithdraw(, 2, 2, 2)
      sellButtClick()
      stashClick()
      inventoryWithdraw(2)
    }
    i++
  }
  i = 1
  cycle++
}


; Big cards (TODO)
if (cycle == 5) {
  Cards := []
  Loop, read, %A_ScriptDir%\CardArrays\Bigs.txt
  {
    Cards.Push(StrSplit(A_LoopReadLine, ","))
  }
  While (i == 999 && i == 999) {
    i++
  }
  i = 1
  cycle++
}

; Trash
if (cycle == 6) {
  Cards := []
  Loop, read, %A_ScriptDir%\CardArrays\Trash.txt
  {
    Cards.Push(StrSplit(A_LoopReadLine, ","))
  }
  While (i < Cards.MaxIndex() + 1) {
    While (deckCheck(Cards[i, 1]) == 0) {
      rerunDecks(200, 5000, 10000)
      deckTake(Cards[i, 1], 58)
      liliSell()
      inventoryWithdraw(60)
      sellButtClick()
      stashClick()
    }
    i++
  }
}
BlockInput, MouseMoveOff
Return





; ### VOID ###
ButtonVOID:
Gui, Hide
divTabFilter()
BlockInput, MouseMove
loop, 1000 {
    deckTake("void", 10)
    decksTrade(10)
    stashClick()
    inventoryWithdraw(10)
    Send {esc}
    liliSell()
    inventoryWithdraw(60)
    sellButtClick()
    stashClick()
    inventoryWithdraw(10)
  }
Return


; ### AXE/Body ###
ButtonAxeOrBody:
Gui, Hide
InputBox, card, Hena, Battle Born or The Body?
divTabFilter()
BlockInput, MouseMove
While (GetKeyState("F5","P") == false) {
  deckTake(card, 5)
  decksTrade(5)
  liliSell()
  horisontalWithdraw(, 1, 2, 6)
  sellButtClick()
  stashClick()
  inventoryWithdraw(5)
}
Return

#include %A_ScriptDir%\Sources\dummy.ahk

;_________________________________________________________________________________________________________________________________________________________________________________________________________



Rerun(SMALLDELAY, MIDDELAY, BIGDELAY) {
  PixelGetColor, color, 1506, 716
  while (color !== 0x090909) {
    Send !{F4}
    Sleep MIDDELAY
    Send {LWin}
    Sleep SMALLDELAY
    Send Path of Exile
    Sleep SMALLDELAY
    Send {Enter}
    Sleep BIGDELAY
    Click, 1506, 716
    Sleep SMALLDELAY
    Send {Tab}
    Sleep SMALLDELAY
    Send {Tab}
    Sleep SMALLDELAY
    Send Lbvf\]\=-09
    Sleep SMALLDELAY
    Send {Enter}
    Sleep BIGDELAY
    Sleep MIDDELAY
    Send {Enter}
    Sleep BIGDELAY
    Send {Enter}
    Sleep SMALLDELAY
    Send /hideout
    Sleep SMALLDELAY
    Send {Enter}
    Sleep BIGDELAY
    Send {Enter}
    Sleep SMALLDELAY
    Send /dnd
    Sleep SMALLDELAY
    Send {Enter}
    Sleep SMALLDELAY
    MouseMove 512, 400
    Sleep SMALLDELAY
    Click
    Sleep MIDDELAY
    Send ^f
    Sleep SMALLDELAY
    Send asd
    Sleep SMALLDELAY
    Send {Enter}
    Sleep SMALLDELAY
    MouseMove, 1870, 773
    Sleep 30
    click
    Sleep 150
    inventoryWithdraw(60)
    if (GetKeyState("F5","P") == true) {
      BlockInput, MouseMoveOff
      SendEvent {Control up}
      Exit
    }
    PixelGetColor, color, 1506, 716
  }
}


inventoryWithdraw(loopNum) {
    firstInventory_X := 1287
    firstInventory_Y := 614
    buf_x := 0
    buf_y := 0
    x_coord := 0
    y_coord := 0

    SendEvent {Control down}
    while (loopNum > 0) {
      x_coord := firstInventory_X + buf_x * 53
      y_coord := firstInventory_Y + buf_y * 53

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
      loopNum--

      if (GetKeyState("F5","P") == true)
      {
        BlockInput, MouseMoveOff
        SendEvent {Control up}
        Exit
      }
    }
    SendEvent {Control up}
  }

decksTrade(loopNum) {
  firstInventory_X := 1287
  firstInventory_Y := 614
  buf_x := 0
  buf_y := 0
  x_coord := 0
  y_coord := 0
  tradeButt_X := 619
  tradeButt_Y := 734

  ; Lili Click
  MouseMove 944, 333
  Sleep 200
  Click
  Sleep 200

  ; Trade Cards Click
  MouseMove 1102, 226
  Sleep 100
  Click
  Sleep 200

  SendEvent {Control down}
  loop, %loopNum% {

    ; Inventory Slot Calc
    x_coord := firstInventory_X + buf_x * 53
    y_coord := firstInventory_Y + buf_y * 53
    Sleep 5

    ; Inventory Slot
    MouseMove x_coord, y_coord
    Sleep 30
    Click, up
    Sleep 5

    ; Trade Button
    MouseMove tradeButt_X, tradeButt_Y
    Sleep 150
    Click
    Sleep 150

    ; CardTrade window
    MouseMove tradeButt_X, tradeButt_Y - 100
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
      Exit
    }
  }
  SendEvent {Control up}
  Sleep 5
  Send {Esc}
  Sleep 15
}

deckTake(card, loopNum) {
  Send ^f
  Sleep 30
  Send %card%
  Send {Enter}
  Sleep 100
  MouseMove 134, 272
  SendEvent {Control down}
  Loop, %loopNum%
  {
    Click
    Sleep 150

    if (GetKeyState("F5","P") == true)
    {
      BlockInput, MouseMoveOff
      SendEvent {Control up}
      Exit
    }
  }
  SendEvent {Control up}
  Sleep 5
  Send {esc}
  Sleep 15
}

deckCheck(card) {
  Send ^f
  Sleep 30
  Send %card%
  Send {Enter}
  Sleep 500
  PixelGetColor, color, 123, 240, Alt
  Sleep 50
  if (color == 0x121619) {
    return 1
  }
  return 0
}

divTabFilter() {
  ; Curr Tab
  MouseMove 735, 112
  Sleep 50
  Click
  Sleep 15

  ; Div tab
  MouseMove 762, 128
  Sleep 50
  Click
  Sleep 15

  ; Filter
  MouseMove 555, 806
  Sleep 50
  Click
  Sleep 15

  ; Full stacks
  MouseMove 505, 866
  Sleep 50
  Click
  Sleep 15
}

sellButtClick() {
  MouseMove 404, 863
  Sleep 200
  Click
  Sleep 200
}

stashClick() {
  MouseMove 883, 433
  Sleep 200
  Click
  Sleep 500
}

liliSell() {
  SendEvent {Control down}
  MouseMove 945, 390
  Sleep 200
  Click
  Sleep 200
  SendEvent {Control up}
}

horisontalWithdraw(buf_x := 0, buf_y := 0, buf := 1, loopNum := 0) {
    firstInventory_X := 1287
    firstInventory_Y := 614
    x_coord := 0
    y_coord := 0

    SendEvent {Control down}
    loop, %loopNum%
    {
      x_coord := firstInventory_X + buf_x * 53
      y_coord := firstInventory_Y + buf_y * 53
      Sleep 5

      MouseMove x_coord, y_coord
      Sleep 30
      Click, up
      Sleep 5

      buf_x += buf
      if (GetKeyState("F5","P") == true)
      {
        BlockInput, MouseMoveOff
        SendEvent {Control up}
        Exit
      }
    }
    SendEvent {Control up}
  }

RerunDecks(SMALLDELAY, MIDDELAY, BIGDELAY) {
  PixelGetColor, color, 1506, 716
  while (color !== 0x090909) {
    Send !{F4}
    Sleep MIDDELAY
    Send {LWin}
    Sleep SMALLDELAY
    Send Path of Exile
    Sleep SMALLDELAY
    Send {Enter}
    Sleep BIGDELAY
    Click, 1506, 716
    Sleep SMALLDELAY
    Send {Tab}
    Sleep SMALLDELAY
    Send {Tab}
    Sleep SMALLDELAY
    Send Lbvf\]\=-09
    Sleep SMALLDELAY
    Send {Enter}
    Sleep BIGDELAY
    Sleep MIDDELAY
    Send {Enter}
    Sleep BIGDELAY
    Send {Enter}
    Sleep SMALLDELAY
    Send /hideout
    Sleep SMALLDELAY
    Send {Enter}
    Sleep BIGDELAY
    Send {Enter}
    Sleep SMALLDELAY
    Send /dnd
    Sleep SMALLDELAY
    Send {Enter}
    Sleep SMALLDELAY
    MouseMove 512, 400
    Sleep 30
    Click
    Sleep MIDDELAY
    divTabFilter()
    inventoryWithdraw(60)
    MouseMove, 1870, 773
    Sleep 30
    click
    Sleep 150
    inventoryWithdraw(60)
    if (GetKeyState("F5","P") == true) {
      BlockInput, MouseMoveOff
      SendEvent {Control up}
      Exit
    }
    PixelGetColor, color, 1506, 716
    }
}

decksFilterTrade(loopNum, colorFilter) {
  firstInventory_X := 1287
  firstInventory_Y := 614
  buf_x := 0
  buf_y := 0
  x_coord := 0
  y_coord := 0
  tradeButt_X := 619
  tradeButt_Y := 734

  ; Lili Click
  MouseMove 944, 333
  Sleep 200
  Click
  Sleep 200

  ; Trade Cards Click
  MouseMove 1102, 226
  Sleep 100
  Click
  Sleep 200

  SendEvent {Control down}
  loop, %loopNum% {

    ; Inventory Slot Calc
    x_coord := firstInventory_X + buf_x * 52
    y_coord := firstInventory_Y + buf_y * 53
    Sleep 5

    PixelGetColor, color, x_coord, y_coord
    MsgBox, %color%
    if (color == colorFilter) {
      ; Inventory Slot
      MouseMove x_coord, y_coord
      Sleep 30
      Click, up
      Sleep 5

      ; Trade Button
      MouseMove tradeButt_X, tradeButt_Y
      Sleep 200
      Click
      Sleep 200

      ; CardTrade window
      MouseMove tradeButt_X, tradeButt_Y - 100
      Sleep 30
      Click, up
      Sleep 5
    }

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
      Exit
    }
  }
  SendEvent {Control up}
  Sleep 5
  Send {Esc}
  Sleep 15
}

AutoTrader(X, Y) {
  ; Take Card
  MouseMove X, Y
  Sleep 50
  Click, Right
  Sleep 30

  ; Div tab click
  MouseMove 151, 111
  Sleep 50
  Click
  Sleep 30

  ; Put Card
  MouseMove 150, 173
  Sleep 50
  Click
  Sleep 30

  ; Curr tab click
  MouseMove 78, 115
  Sleep 50
  Click
  Sleep 30

  ; Save Exit
  if (GetKeyState("F5","P") == true) {
    BlockInput, MouseMoveOff
    Exit
  }
}

AutoTraderCheck(X, Y) {
  ;rerun(200, 5000, 10000)
  Click
  Sleep 150

  PixelGetColor, colorStashCheck, X, Y
  MsgBox, %colorStashCheck%
  return colorStashCheck
}

AutoGambler(X, Y, colourArg) {
  counter := 0
  PixelGetColor, colorStash, X, Y, alt
  While (colorStash == colourArg || colorStash == 0x413a35) {
    AutoTrader(X, Y)
    counter++
    if (counter == 100) {
      rerun(200, 5000, 10000)
      MouseMove 78, 115
      Sleep 50
      PixelGetColor, colorStash, X, Y, alt
      if (colorStash == 0x7f746b) {
        MouseMove 78, 115
        Sleep 50
        Click
        Sleep 150

        MouseMove X, Y
        Sleep 50
        Click
        Sleep 200
        PixelGetColor, colorStash, X, Y, alt
      }
      counter = 0
    }
    ; Save Exit
    if (GetKeyState("F5","P") == true) {
      BlockInput, MouseMoveOff
      return
    }
  }
}