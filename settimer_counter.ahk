#NoEnv
SetWorkingDir %A_ScriptDir%
CoordMode, Mouse, Screen
SendMode Play
#SingleInstance Force
SetTitleMatchMode 2
DetectHiddenWindows On
#WinActivateForce
SetControlDelay 50
SetWinDelay 0
SetKeyDelay, 100, 70
SetBatchLines -1
;~ SetMouseDelay, 300



Sleep, 1500
MouseMove , 217, 488, 50
Sleep, 1500
counter := new SecondCounter
counter.Start()
;~ 
While (counter.count < 10)
{
    MsgBox % counter.count
	;~ Click, 210, 484
    ;~ SendMouse_AbsoluteMove(210, 484)
    Sleep 10000
}
counter.Stop()
Sleep 2000
ExitApp

d::ExitApp

; An example class for counting the seconds...
class SecondCounter {
    __New() {
        this.interval := 1000
        this.count := 0
        ; Tick() has an implicit parameter "this" which is a reference to
        ; the object, so we need to create a function which encapsulates
        ; "this" and the method to call:
        this.timer := ObjBindMethod(this, "Tick")
    }
    Start() {
        ; Known limitation: SetTimer requires a plain variable reference.
        timer := this.timer
        SetTimer % timer, % this.interval
        ToolTip % "Counter started"
    }
    Stop() {
        ; To turn off the timer, we must pass the same object as before:
        timer := this.timer
        SetTimer % timer, Off
        ToolTip % "Counter stopped at " this.count
    }
    ; In this example, the timer calls this method:
    Tick() {
        ToolTip % ++this.count " , `nA_TimeIdleMouse= , "A_TimeIdleMouse
    }
}

;---------------------------------------------------------------------------
SendMouse_AbsoluteMove(x, y) { ; send fast absolute mouse moves
;---------------------------------------------------------------------------
    ; Absolute coords go from 0..65535 so we have to change to pixel coords
    ;-----------------------------------------------------------------------
    static SysX, SysY
    If (SysX = "")
        SysX := 65535//A_ScreenWidth, SysY := 65535//A_ScreenHeight
    DllCall("mouse_event", "UInt", 0x8001, "UInt", x*SysX, "UInt", y*SysY)
}