SetBatchLines -1  ; Ensures maximum effectiveness of this method.

SleepDuration := 1  ; This can sometimes be finely adjusted (e.g. 2 is different than 3) depending on the value below.
TimePeriod := 7 ; Try 7 or 3.  See comment below.
; On a PC whose sleep duration normally rounds up to 15.6 ms, try TimePeriod:=7 to allow
; somewhat shorter sleeps, and try TimePeriod:=3 or less to allow the shortest possible sleeps.

DllCall("Winmm\timeBeginPeriod", "UInt", TimePeriod)  ; Affects all applications, not just this script's DllCall("Sleep"...), but does not affect SetTimer.
Iterations := 50
StartTime := A_TickCount

Loop %Iterations%
    ;~ Sleep, %SleepDuration%
    DllCall("Sleep", "UInt", SleepDuration)  ; Must use DllCall instead of the Sleep command.

DllCall("Winmm\timeEndPeriod", "UInt", TimePeriod)  ; Should be called to restore system to normal.
MsgBox % "Sleep duration = " . (A_TickCount - StartTime) / Iterations