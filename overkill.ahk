; <COMPILER: v1.1.24.01>
Box_Init(C="FF0000") {
Gui, 96: -Caption +ToolWindow +E0x20
Gui, 96: Color, % C
Gui, 97: -Caption +ToolWindow +E0x20
Gui, 97: Color, % C
Gui, 98: -Caption +ToolWindow +E0x20
Gui, 98: Color, % C
Gui, 99: -Caption +ToolWindow +E0x20
Gui, 99: Color, % C
}
Box_Draw(X, Y, W, H, T="1", O="I") {
If(W < 0)
X += W, W *= -1
If(H < 0)
Y += H, H *= -1
If(T >= 2)
{
If(O == "O")
X -= T, Y -= T, W += T, H += T
If(O == "C")
X -= T / 2, Y -= T / 2
If(O == "I")
W -= T, H -= T
}
Gui, 96: Show, % "x" X " y" Y " w" W " h" T " NA", Horizontal 1
Gui, 96:+AlwaysOnTop
Gui, 98: Show, % "x" X " y" Y + H " w" W " h" T " NA", Horizontal 2
Gui, 98:+AlwaysOnTop
Gui, 97: Show, % "x" X " y" Y " w" T " h" H " NA", Vertical 1
Gui, 97:+AlwaysOnTop
Gui, 99: Show, % "x" X + W " y" Y " w" T " h" H " NA", Vertical 2
Gui, 99:+AlwaysOnTop
}
Box_Destroy() {
Loop, 4
Gui, % A_Index + 95 ":  Destroy"
}
Box_Hide() {
Loop, 4
Gui, % A_Index + 95 ":  Hide"
}
guif:
#NoEnv
#SingleInstance force
SkinForm(Apply, A_ScriptDir . "\USkin.dll", A_ScriptDir . "\Milikymac.msstyles")
Firing := 0
Gui Add, Text, x220 y25 w130 h30, Run 1920x1080 Mode [F2]
Gui Add, Text, x220 y45 w110 h30, Restart Program [F3]
Gui Add, Text, x220 y65 w160 h30, Performance Statistics [F4]
Gui Add, Text, x220 y85 w110 h30, Pause/Resume [ALT]


Gui Add, GroupBox, x10 y120 w160 h45, Aim Speed Control
Gui Add, GroupBox, x10 y10 w160 h100, Intro
Gui Add, Text, x20 y30 w65 h25, active when fire


Gui Add, Text, x40 y144 w35 h20, rx:
Gui Add, Edit, x80 y140 w50 h20 vrx, 1
Gui Add, Button, x230 y210 w100 h20 gsub4, About Aim Speed
Gui Add, Button, x240 y230 w80 h20 gsub1, Issue
Gui Add, GroupBox, x8 y265 w187 h210, Misc
Gui Add, CheckBox, x16 y288 w160 h20 voverlayActive, Overlay
;Gui Add, CheckBox, x16 y288 w160 h20 vmccree, Mccree Right Click No Recoil
;Gui Add, CheckBox, x16 y308 w160 h20 vtorbjorn, Torbjorn Fast Reload
;Gui Add, CheckBox, x16 y328 w160 h20 vpharah, Pharah Fast Reload
Gui Add, CheckBox, x16 y328 w160 h20 vreaper, Reaper Fast Reload
;Gui Add, CheckBox, x16 y368 w160 h20 vroadhog, RoadHog Fast Reload
;Gui Add, CheckBox, x16 y388 w160 h20 vroadhog1, RoadHog Combo
;Gui Add, CheckBox, x16 y408 w160 h20 vgenji, Genji combo
;Gui Add, CheckBox, x16 y288 w160 h20 vbunny, Bunnyhop

Gui Add, Text, x16 y200 w33 h20, x-axis:
Gui Add, Slider,x48 y200 w130 h25 vxrange Invert Tickinterval1 range1-4, 4
Gui Add, Text, x16 y224 w35 h19, y-axis:
Gui Add, Slider,x48 y224 w130 h25 vyrange Invert Tickinterval1 range1-4, 4
Gui Add, Button, x240 y250 w80 h20 gsub2, How-to
Gui Add, Button, x240 y270 w80 h20 gsub3, Best
Gui Add, GroupBox, x8 y176 w185 h80, Range
Gui Add, Edit, x315 y140 w30 h20 vxy, 85
Gui Add, Text, x280 y140 w35 h20, y-axis:
Gui Add, Text, x208 y140 w35 h20, x-axis:
Gui Add, Edit, x240 y140 w35 h20 vxa, 58
Gui Add, GroupBox, x205 y120 w160 h45, Aim Settings
Gui Add, Button, x230 y170 w100 h20 gsub5, About Range
Gui Add, Button, x230 y190 w100 h20 gsub6, About Aim
Gui Add, Text, x220 y300 w130 h150, `n`nThe software is just for fun`n`nYou should only use it for legal propose`n`n
Gui Show, w372 h480, Overkill
Loop {
Gui, Submit, NoHide
Sleep -1
}
Return
TrigerSub:
GuiControlGet, trigger
if trigger
setbatchlines,-1
dir := "1.png"
if (!fileexist(dir)) {
URLDownloadToFile,http://i.imgur.com/wrQBaYL.png, % dir
while (!fileexist(dir))
sleep, 50
}
wingetpos,,,ww,wh, % "ahk_class TankWindowClass"
center_x := ww/2
center_y := wh/2
loop {
ImageSearch, , , % center_x, 0, % center_x, % center_y, % "*80 " dir
If (!Errorlevel) {
ImageSearch, , , % center_x, % center_y, % center_x, % wh, % "*80 " dir
If (!Errorlevel)
Send {Click down}
Sleep,225
Send {Click up}
Sleep,20
}}
Return
F4::
Send {Ctrl Down}{Shift Down}{R Down}{Ctrl Up}{Shift Up}{R Up}
Return
#If bunny=1
*~$Space::
sleep 20
loop
{
GetKeyState, SpaceState, Space, P
if SpaceState = U
break
Sleep 1
Send, {Blind}{Space}
}
Return
#If
Return
Return

mouseXY(x,y)
{
DllCall("mouse_event",int,1,int,x,int,y,uint,0,uint,0)
}
#If
return
#If aimtype2=1
~capslock::
GoSub MouseMoves2
Return
#If
Return
sub1:
{
msgbox, Having issues?`n`nMccree Right Click No Recoil Does NOT!!! work with right click aimlock`nHOLD DOWN RIGHT CLICK FOR IT TO WORK DONT JUST PRESS BUTTON`n`nAll Combos are middle mouse button`n`nCheat is CPU intensive and only uses math.`n`nLowFPS: Lower Aim speed to 1.`nLowFPS: Lower resolution to 720p and play on low.`nLowFPS: If you get low fps after a playthrough, press F3 to restart the cheat.`n`nCursor jumping left or right when using Aim key?`n`nJumpBug:Your PC is lagging out when using Aimkey. Check LowFPS solution.`nJumpBug: Switch your resolution to 720p but use F2(1080p) with Aim Speed 1.`n`nAlways try the cheat out in Practice Range to find your best settings.
}
return
sub2:
{
msgbox, How-to:`n`nLaunch Game. Switch to Borderless Windowed mode.`nResolution has to be 720p or 1080p. As precaution, set your quality settings to Low.`n`nTo-use:`nPress F1 or F2 depending on your resolution.`nShoot an Enemy. When the Health Bar is visible press the aimkey to snap onto the target.`n`nIf nothing is happening make sure you are not using any desktop applications that alter your color settings or are recording your gameplay such as W10 DVR or Fraps.
}
return
sub3:
{
msgbox, Best Settings for the cheat (Legit):`n`nResolution: 1920x1080`nAim Speed: 1
}
return
sub4:
{
msgbox, Higher the number, Faster the it locks on. `n`Lower the number, The slower it locks on.
}
return
sub5:
{
msgbox, Has 4 settings. `n`nStarts on its Lowest FoV. `n`nThe higher the fov the more the bot can see. `n`nX-Axis is side ways Y-Axis is up and down
}
return
sub6:
{
msgbox, This is where it aims. `n`nThe default settings is what is in all my previous verions. `n`nAs always X-Axis is side ways Y-Axis is up and down
}
return
GuiClose:
ExitApp
return
SkinForm(Param1 = "Apply", DLL = "", SkinName = ""){
if(Param1 = Apply){
DllCall("LoadLibrary", str, DLL)
DllCall(DLL . "\USkinInit", Int,0, Int,0, AStr, SkinName)
}else  if(Param1 = 0) {
DllCall(DLL . "\USkinExit")
}}
Change1:
MsgBox,  Applied
Gui,Submit, Nohide
return

F2::
#Persistent
#KeyHistory, 0
#NoEnv
#HotKeyInterval 1
#MaxHotkeysPerInterval 2000
#InstallKeybdHook
#UseHook
#SingleInstance, Force
SetKeyDelay,-1, 8
SetControlDelay, -1
SetMouseDelay, 0
SetWinDelay,-1
SendMode, InputThenPlay
SetBatchLines,-1
ListLines, Off
CoordMode, Mouse, client
PID := DllCall("GetCurrentProcessId")
Process, Priority, %PID%, Normal
ZeroX := 960
ZeroY := 540
CFovX := 80
CFovY := 200
ScanL := 660
ScanR := 1250
ScanT := 280
ScanB := 610
LargeX1 := 0 + (A_Screenwidth * (xrange/10))
LargeY1 := 0 + (A_Screenheight * (yrange/10))
LargeX2 := A_Screenwidth - (A_Screenwidth * (xrange/10))
LargeY2 := A_Screenheight - (A_Screenheight * (yrange / 10))
SmallX1 := LargeX1 + 40
SmallY1 := LargeY1
SmallX2 := LargeX2 - 70
SmallY2 := LargeY2 - 100

FoundFlag :=false
GuiControlget, rX
GuiControlget, xa
GuiControlget, ya
GuiControlget, xrange
GuiControlget, yrange
Loop, {
Gui,Submit, Nohide

GetKeyState, Mouse2, LButton, P
if ( Mouse2 == "D" ) {
	if ( not FoundFlag ) {
		imageSearch, AimPixelX, AimPixelY, LargeX1, LargeY1, LargeX2, LargeY2, *4 hhp.bmp
		if ErrorLevel = 1  
			FoundFlag:=false
		else 
			FoundFlag := true
	}
	else {
		imageSearch, AimPixelX, AimPixelY, SmallX1, SmallY1, SmallX2, SmallY2,  *4 hhp.bmp
		if ErrorLevel = 1
			FoundFlag := false		
	}


GoSub GetAimOffset2
GoSub GetAimMoves1
GoSub MouseMoves2

}










Box_Init("FF0000")
X := 0 + (A_Screenwidth * (xrange/10))
Y := 0 + (A_Screenheight * (yrange/10))
W := (A_Screenwidth - (A_Screenwidth * (xrange/10))) - X
H := (A_Screenheight - (A_Screenheight * (yrange / 10))) -Y
Box_Draw(X, Y , W, H)
if(overlayActive=0){
Box_Hide()
}
}






MouseMoves2:
DllCall("mouse_event", uint, 1, int, MoveX, int, MoveY, uint, 0, int, 0)
Return

MouseMoves11:
If ( Mouse2 == "U" ) {
DllCall("mouse_event", uint, 1, int, MoveX, int, MoveY, uint, 0, int, 0)
}





GetAimOffset2:
Gui,Submit, Nohide
AimX := AimPixelX - ZeroX +42
AimY := AimPixelY - ZeroY +90
If ( AimX+4 > 0) {
DirX := rx / 10
}
If ( AimX+4 < 0) {
DirX := (-rx) / 10
}
If ( AimY+2 > 0 ) {
DirY := rX /10 *0.5
}
If ( AimY+2 < 0 ) {
DirY := (-rx) /10 *0.5
}
AimOffsetX := AimX * DirX
AimOffsetY := AimY * DirY
Return

GetAimMoves1:
RootX := Ceil(AimOffsetX)
RootY := Ceil(AimOffsetY)
;RootX := AimOffsetX
;RootY := AimOffsetY
MoveX := RootX * DirX
MoveY := RootY * DirY
;GoSub DebugTool1
Return

reload:
SleepF1:
SleepDuration = 1
TimePeriod = 1
DllCall("Winmm\timeBeginPeriod", uint, TimePeriod)
Iterations = 1
StartTime := A_TickCount
Loop, %Iterations% {
DllCall("Sleep", UInt, TimePeriod)
}
DllCall("Winmm\timeEndPeriod", UInt, TimePeriod)
Return


DebugTool1:
MouseGetPos, MX, MY
ToolTip, %xa% | %xy%
Return

~capslock::
pause
SoundBEEP
return
F3::
Reload
Return