#NoEnv
#SingleInstance force
#NoTrayIcon
ListLines Off
SendMode Input
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
 
SysGet, maxXDblClk, 36
SysGet, maxYDblClk, 37
maxDblClk := 5
dblClkTime := DllCall("User32\GetDoubleClickTime")
current := 0
historyLimit := 10
Return

~LButton::
MouseGetPos, xPrev, yPrev
Return

~LButton Up::
MouseGetPos, xPos, yPos
dist := Abs(xPos - xPrev) + Abs(yPos - yPrev)
If (dist > maxDblClk)
    Goto TESTCOPY
Return

~*^LButton Up::
~*+LButton Up::
~*!LButton Up::
~*+Up::
~*+Down::
~*+Left::
~*+Right::
~*+Home::
~*+End::
~*+Pgdn::
~*+Pgup::
~^a::
SetTimer, TESTCOPY, Off
SetTimer, TESTCOPY, 1000
Return

TESTCOPY:
SetTimer, TESTCOPY, Off
oldClipboard := Clipboardall
Clipboard := ""
Send ^c
ClipWait
If (Clipboard == "")
{   
    Clipboard := oldClipboard
    oldClipboard := ""
    Return
}
$~^c::
$~^x::
Loop % historyLimit - 1
{
    temp1 := historyLimit - A_Index
    temp2 := temp1 + 1
    history%temp2% := history%temp1%
}
history1 := Clipboardall
oldClipboard := ""
ToolTip, Copied Selection
SetTimer, SELECTDONE, -500
Return

SELECTDONE:
ToolTip
Return

HISTORYDONE:
current := 0
Return

$^v::
current++
If (history%current% == "") {
    current := 1
}
If (A_ThisHotkey == A_PriorHotkey And A_TimeSincePriorHotkey <= 1000 And history%current% != "") {
    Send, ^z
    SetTimer, HISTORYDONE, -1000
}
Clipboard := history%current%
Send, ^v
Return