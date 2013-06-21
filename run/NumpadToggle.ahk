#SingleInstance Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#NoTrayIcon
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

numpadToggleState = False
#Delete::numpadToggleState := numpadToggleState ? False : True
$0::Send % numpadToggleState ? "{Numpad0}" : "0"
$1::Send % numpadToggleState ? "{Numpad1}" : "1"
$2::Send % numpadToggleState ? "{Numpad2}" : "2"
$3::Send % numpadToggleState ? "{Numpad3}" : "3"
$4::Send % numpadToggleState ? "{Numpad4}" : "4"
$5::Send % numpadToggleState ? "{Numpad5}" : "5"
$6::Send % numpadToggleState ? "{Numpad6}" : "6"
$7::Send % numpadToggleState ? "{Numpad7}" : "7"
$8::Send % numpadToggleState ? "{Numpad8}" : "8"
$9::Send % numpadToggleState ? "{Numpad9}" : "9"
$.::Send % numpadToggleState ? "{NumpadDot}" : "."
$/::Send % numpadToggleState ? "{NumpadDiv}" : "/"
$*::Send % numpadToggleState ? "{NumpadMult}" : "*"
$+::Send % numpadToggleState ? "{NumpadAdd}" : "+"
$-::Send % numpadToggleState ? "{NumpadSub}" : "-"
$Enter::Send % numpadToggleState ? "{NumpadEnter}" : "{Enter}"