/*
Todo List:

GUI Click Grid Interface
Sort through user scripts
*/

#SingleInstance Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode, Input  ; Recommended for new scriptProcesses due to its superior speed and reliability.
ListLines, Off
SetWorkingDir, %A_ScriptDir%  ; Ensures a consistent starting directory.
OnExit #x
GoSub #z
Return

#z::
GoSub #q
scriptInfo := "Scripts started:"
Loop, run\*.ahk
{
    Run %A_LoopFileFullPath%,,,process_id
    scriptProcesses%A_Index% := process_id
    scriptCount++
    scriptInfo .= "`n" . A_LoopFileName
}
scriptState := True
Gosub #Space
Return

#q::
DetectHiddenWindows, On
Loop %scriptCount%
{
    process_id := "AHK_pid " . scriptProcesses%A_Index%
    WinClose, %process_id%
    WinWaitClose, %process_id%, 0
    If ErrorLevel <> 0
        WinKill, %process_id%
    scriptProcesses%A_Index% := ""
}
DetectHiddenWindows, Off
scriptCount := 0
scriptInfo := "Scripts stopped."
Gosub #Space
Return

#w::Reload

#Space::
TrayTip, %A_ScriptName%, %scriptInfo%
Return

#x::
GoSub #q
ExitApp