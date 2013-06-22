; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.

/*
Todo List:

Skype HoverZoom
Custom Parser
GUI Click Grid Interface
Map Mod-Click to introduce new shortcut
Clipboard History
*/

#SingleInstance Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode, Input  ; Recommended for new scriptProcesses due to its superior speed and reliability.
ListLines Off
SetWorkingDir, %A_ScriptDir%  ; Ensures a consistent starting directory.
OnExit #x
GoSub #z
Return

#z::
GoSub #q
SplashTextOn,,,Starting scripts...,
scriptCount := 0
Loop, run\*.ahk
{
    Run %A_LoopFileFullPath%,,,process_id
    scriptProcesses%A_Index% := process_id
    scriptCount++
}
SplashTextOff
Return

#q::
Loop %scriptCount%
{
    Process, Close, % scriptProcesses%A_Index%
    scriptProcesses%A_Index% := ""
    scriptCount--
}
Return

#x::
GoSub #q
ExitApp