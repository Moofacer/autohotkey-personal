﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#If WinActive("Sword Girls") and WinActive("ahk_class Chrome_WidgetWin_1")
1::Click 350,580
2::Click 420,580
3::Click 490,580
4::Click 560,580
5::Click 630,580

+1::Click 500,350
+2::Click 620,350
+3::Click 740,350
+4::Click 860,350

^+1::Click 500,400
^+2::Click 620,400
^+3::Click 740,400
^+4::Click 860,400

^1::Click 940,590
^2::Click 1020,590
^3::Click 940,620
^4::Click 1020,620

!1::Click 350,580,0
!2::Click 420,580,0
!3::Click 490,580,0
!4::Click 560,580,0
!5::Click 630,580,0

#1::Click 840,215
#2::Click 840,270
#3::Click 840,325
#4::Click 840,380
#5::Click 840,435
#6::Click 840,490

u::Click 360,160,0
i::Click 450,160,0
j::Click 380,295,0
k::Click 470,295,0
n::Click 360,430,0
m::Click 450,430,0

p::Click 740,160,0
[::Click 810,160,0
l::Click 720,295,0
`;::Click 790,295,0
,::Click 740,430,0
.::Click 810,430,0

q::Click 825,575
w::Click 825,615
a::Click 680,560
e::Click 545,510
s::Click 680,510
d::Click 655,410
f::Click 720,410
r::Click 890,510
z::Click 445,505
x::Click 515,505
c::Click 720,365