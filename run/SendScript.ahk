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
    IniRead, key%A_Index%, %scriptName%.ini, %scriptName%, key%A_Index%, %A_Space%
    IniRead, value%A_Index%, %scriptName%.ini, %scriptName%, value%A_Index%, %A_Space%
    If (key%A_Index% == "" And value%A_Value% == "")
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
    FileAppend, `nkey%temp%=%newKey%`nvalue%temp%=%newValue%, %scriptName%.ini
}
If (custom == "")
    Return
SplashTextOn,,,Sending %custom%...,
Loop % sendCount
{
    If (custom == key%A_Index%) {
        Send, % value%A_Index%
        GoSub, SENDDONE
    }
}
SENDDONE:
SplashTextOff
Return