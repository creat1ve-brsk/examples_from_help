CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

MouseClick, Left, 50, 50
Sleep 500
sendPlay i
Sleep 500
SendPlay ^r
Sleep 500
IfWinNotExist, ahk_class ConsoleWindowClass
	Run, cmd.exe
WinWait, ahk_class ConsoleWindowClass
WinActivate

ExitApp