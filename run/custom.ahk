#NoEnv
#SingleInstance force
#NoTrayIcon
ListLines Off
SendMode Input
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SplitPath, A_ScriptName,,,,scriptName
sendCount := 0
Loop
{
    IniRead, sendKey%A_Index%, %scriptName%.ini, send, key%A_Index%, %A_Space%
    IniRead, sendValue%A_Index%, %scriptName%.ini, send, value%A_Index%, %A_Space%
    If (sendKey%A_Index% == "" And sendValue%A_Value% == "")
    {
        Break
    }
    sendCount++
}

Return

#s::
SplashTextOn,,,Inputting send key...,
custom := ""
Loop
{
    temp := ""
    Input,temp,L1 T0.5,{Esc}{Enter}
    if (temp == "")
    {
        SplashTextOff
        Break
    }
    custom .= temp
}
If (GetKeyState("LWin"))
{
    InputBox, newKey, New Send Key, Enter the key of the key-value pair:
    if ErrorLevel <> 0  ; The user pressed Cancel.
        return
    InputBox, newValue, New Send Value, Enter the value of the key-value pair:
    if ErrorLevel <> 0  ; The user pressed Cancel.
        return
    ; Otherwise, add the pair and reload the script:
    temp := sendCount
    temp++
    IniWrite, %newKey%, %scriptName%.ini, send, key%temp%
    IniWrite, %newValue%, %scriptName%.ini, send, value%temp%
}
If (custom == "")
    Return
SplashTextOn,,,Sending %custom%...,
Loop % sendCount
{
    If (custom == sendKey%A_Index%) {
        Send, % sendValue%A_Index%
        GoSub, SENDDONE
    }
}
SENDDONE:
SplashTextOff
Return

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
if (custom == "cp")
	Run, cmd.exe
if (custom == "vm")
	Run, sndvol.exe
if (custom == "ca")
	Run, calc.exe
if (custom == "rd")
	Run, mstsc.exe
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
{
	IfExist, C:\Users\Moofacer\Documents\[ASL] Yanagi Nagi - Owari no Hoshi no Love Song [MP3] [w Scans]\01 Owari no Sekai Kara.mp3
	SoundPlay, C:\Users\Moofacer\Documents\[ASL] Yanagi Nagi - Owari no Hoshi no Love Song [MP3] [w Scans]\01 Owari no Sekai Kara.mp3
}
if (custom == "sm")
	SoundPlay, Stop
SplashTextOff
return