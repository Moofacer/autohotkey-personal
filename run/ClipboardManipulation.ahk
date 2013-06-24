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
ToolTip, Copied Selection
SetTimer, TOOLTIPCLOSE, 500
oldClipboard := ""
Return

TOOLTIPCLOSE:
SetTimer, TOOLTIPCLOSE, Off
ToolTip
Return