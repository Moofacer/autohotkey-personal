#NoEnv
#SingleInstance force
SendMode Input
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Menu, middleMenu, Add, (no action), menuHandler
Menu, middleMenu, Disable, (no action)
SetTimer,UPDATEDSCRIPT,5000
return

menuHandler:
return

UPDATEDSCRIPT:
FileGetAttrib,attribs,%A_ScriptFullPath%
IfInString,attribs,A
{
FileSetAttrib,-A,%A_ScriptFullPath%
SplashTextOn,,,Updating script...,
Sleep,500
Reload
}
Return

#Del::
if NumLockToggle = 0
NumLockToggle = 1
else
NumLockToggle = 0
return
$1::
if NumLockToggle = 0
Send 1
else
Send {Numpad1}
return
$2::
if NumLockToggle = 0
Send 2
else
Send {Numpad2}
return
$3::
if NumLockToggle = 0
Send 3
else
Send {Numpad3}
return
$4::
if NumLockToggle = 0
Send 4
else
Send {Numpad4}
return
$5::
if NumLockToggle = 0
Send 5
else
Send {Numpad5}
return
$6::
if NumLockToggle = 0
Send 6
else
Send {Numpad6}
return
$7::
if NumLockToggle = 0
Send 7
else
Send {Numpad7}
return
$8::
if NumLockToggle = 0
Send 8
else
Send {Numpad8}
return
$9::
if NumLockToggle = 0
Send 9
else
Send {Numpad9}
return
$0::
if NumLockToggle = 0
Send 0
else
Send {Numpad0}
return

;Middle-click context menu
;MButton::Menu, middleMenu, Show

Capslock::Send {Enter}
#Capslock::SetCapsLockState, % GetKeyState("CapsLock", "T")? "Off":"On"
#LButton::MButton

^!w::Send {Up}
^!a::Send {Left}
^!s::Send {Down}
^!d::Send {Right}

+#Space::Suspend

; Hotkeys mapped to Win+Space -> Combination.
#Space::
Suspend Off
SplashTextOn,,,Inputting hotkey...,
Input,custom,L1 T0.5,{Esc}{Enter}
if (custom == "") {
	SplashTextOff
	return
}
Input,custom2,L1 T0.5,{Esc}{Enter}
if (custom2 == "") {
	SplashTextOff
	return
}
custom .= custom2
if (custom == " " or custom == "  ")
        GoSub #Space
if (custom == "mp") {
	MouseGetPos xPos,yPos
	clipboard = %xPos%,%yPos%
}
if (custom == "at")
	Winset, Alwaysontop, , A
if (custom == "gc") {
	Send, ^c
	ClipWait
	Run, http://www.google.com/search?q=%clipboard%
}
if (custom == "gh")
	Run, http://www.google.com/
if (custom == "bl")
	Run, https://docs.google.com/document/d/12nxQC3tWm3krPkD4amjWxvJYPvczLk6Mc7U8Eskrc3w/edit
if (custom == "dl")
	Run C:\Users\Moofacer\Downloads
if (custom == "dc")
	Run C:\Users\Moofacer\Documents
if (custom == "ds")
	Run, C:\Users\Moofacer\Desktop\Desktop Shortcuts
if (custom == "vo")
	Run, C:\Users\Moofacer\AppData\Local\Google\Chrome\Application\chrome.exe chrome-extension://dbepggeogbaibhgnhhndojpepiihcmeb/options/options.html
if (custom == "am")
	Run, C:\Users\Moofacer\AppData\Local\Google\Chrome\Application\chrome.exe chrome-extension://nhjloagockgobfpopemejpgjjechcpfd/popup.html?mode=normal
if (custom == "mo")
	Run, C:\Users\Moofacer\AppData\Local\Google\Chrome\Application\chrome.exe chrome-extension://nhjloagockgobfpopemejpgjjechcpfd/options.html
if (custom == "rl")
	Run, C:\Users\Moofacer\AppData\Local\Google\Chrome\Application\chrome.exe chrome-extension://decdfngdidijkdjgbknlnepdljfaepji/main.html
if (custom == "za")
	Send moofacer
if (custom == "z1")
	Send seriously
if (custom == "z2")
	Send ArsArcanum12
if (custom == "z3")
	Send RasutoArukanamu1728
if (custom == "z4")
	Send AinSophAur131072
if (custom == "e1")
	Send gamemoo@gmail.com
if (custom == "e2")
	Send kevinxie93@hotmail.com
if (custom == "e3")
	Send kevin.xie@berkeley.edu
if (custom == "e4")
	Send moofacer@hotmail.com
if (custom == "ct") {
; the number of the tray icon that you need to click, followed by a space and then the filename containing the icon :

iconstr = 3 C:\Program Files\Winamp\Plugins\gen_delete.dll 

;replace this with your filename. I used beardboys Icon Browser - http://www.autohotkey.com/forum/viewtopic.php?t=5587&highlight=iconviewer - to find the icon inside the dll

   coordmode, mouse, screen
   MouseGetPos, mouseX, mouseY
   coordmode, pixel, screen
   WinGetPos, trayX, trayY, trayWidth, trayHeight, ahk_class Shell_TrayWnd
   ImageSearch, imageX, imageY, trayX, trayY, trayX+trayWidth, trayY+trayHeight, *Icon%iconstr%
MouseMove,%imageX%,%imageY%,0    
MouseClick,left,%imageX%,%imageY%,1,0
   MouseMove,%mouseX%,%mouseY%,0 
}
if (custom == "si")
	Send 23935362
if (custom == "p1")
	Run, powercfg -s a1841308-3541-4fab-bc81-f71556f20b4a
if (custom == "p2")
	Run, powercfg -s 381b4222-f694-41f0-9685-ff5bb260df2e
if (custom == "p3")
	Run, powercfg -s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
if (custom == "ss")
	Run, C:\Users\Moofacer\Desktop\AHK\nircmd.exe screensaver
if (custom == "po")
	Run, C:\Users\Moofacer\Desktop\AHK\nircmd.exe monitor off
if (custom == "ri")
	Run, C:\Users\Moofacer\Desktop\AHK\resetIP.bat
if (custom == "nt")
	Run, C:\Users\Moofacer\Desktop\AHK\nagle.bat
if (custom == "re")
	Run, C:\Users\Moofacer\Desktop\AHK\RemUMS.exe E:\
if (custom == "cp")
	Run, cmd.exe
if (custom == "vm")
	Run, sndvol.exe
if (custom == "ca")
	Run, calc.exe
if (custom == "rd")
	Run, mstsc.exe
if (custom == "st")
	Run, SnippingTool.exe
if (custom == "vg")
	IfExist, E:\
	Run, E:\AppData\VGHD\VgHD\vghd.exe
if (custom == "qv")
	Process, Close, vghd.exe
if (custom == "fl") {
	clipboard =
	Send, ^c
	ClipWait
	clipboard = %clipboard%
}
if (custom == "es")
	Edit
if (custom == "rs")
	Reload
if (custom == "ps")
	Pause Toggle
if (custom == "mc")
	Run, C:\Users\Moofacer\Desktop\Desktop Shortcuts\Minecraft.exe
if (custom == "os")
	IfExist, C:\Users\Moofacer\Documents\[ASL] Yanagi Nagi - Owari no Hoshi no Love Song [MP3] [w Scans]\01 Owari no Sekai Kara.mp3
	SoundPlay, C:\Users\Moofacer\Documents\[ASL] Yanagi Nagi - Owari no Hoshi no Love Song [MP3] [w Scans]\01 Owari no Sekai Kara.mp3
if (custom == "sm")
	SoundPlay, Stop
if (custom == "wp") {
DllCall("SystemParametersInfo", UInt, 0x14, UInt, 0, Str, "C\Users\Moofacer\Desktop\Wallpapers\1Reimu.jpg", UInt, 2)
}
if (custom <> "") {
SplashTextOn,,,Executed hotkey: %custom%,
Sleep 500
}
SplashTextOff
return