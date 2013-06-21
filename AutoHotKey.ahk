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

Custom Parser
GUI Click Grid Interface
Map Mod-Click to introduce new shortcut
Clipboard History
*/

#SingleInstance Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode, Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir, %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include include\array.ahk
SetTimer, UPDATESCRIPT, 5000
OnExit, QUIT
runningScripts := Array()
Loop, run\*.*
{
    Run %A_LoopFileFullPath%,,,process_id
    runningScripts.append(process_id)
}
Return

UPDATESCRIPT:
FileGetAttrib, attributes, %A_ScriptFullPath%
IfInString, attributes, A
{
    FileSetAttrib, -A, %A_ScriptFullPath%
    Reload
}
Loop, run\*.*
{
    FileGetAttrib, attributes, %A_LoopFileFullPath%
    IfInString, attributes, A
    {
        FileSetAttrib, -A, %A_LoopFileFullPath%
        Reload
    }
}
Return

#x::Reload

#q::
QUIT:
Loop, % runningScripts.len()
{
    Process, Close, % runningScripts.pop()
}
ExitApp