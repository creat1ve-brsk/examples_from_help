#SingleInstance Force
#MaxHotkeysPerInterval 2000

SetTitleMatchMode, 3
SetBatchLines, -1

; Prompt user for auto-spam key
vKey := 0
While vKey = 0
{
	InputBox, spamKey, Enter key, Enter your desired auto-spam key:`n(visit autohotkey.com/docs/KeyList.htm for valid keys)
	if ErrorLevel
		Exit
	vKey := GetKeyVK(spamKey)
	if vKey = 0
		MsgBox, "%spamKey%" is not a valid key.
}

; Main loop
keyDown := false
textIsHidden := false
Loop
{
	if WinActive("ahk_class W2ViewportClass")
	{
		GetKeyState, stateOfSpamKey, %spamKey%, P
		if (stateOfSpamKey = "D")
		{
			if (!keyDown)
			{
				SetTopLevelText("AUTO", 0x00ffff)
				textIsHidden := false
			}

			Send {Space down}{Space up}
			KeyWait, Space, L
			keyDown := true
		}
		else
		{
			HideTopLevelText(textIsHidden)
			textIsHidden := true
			keyDown := false
		}
	}
	else
	{
		HideTopLevelText(textIsHidden)
		textIsHidden := true
		Sleep, 1000
	}
}

; Set top-level text
SetTopLevelText(string, color)
{
	Gui, tlt:destroy
	Gui, tlt: -Caption +E0x80000 +LastFound +OwnDialogs +Owner +AlwaysOnTop +E0x20
	Gui, tlt:Color, c000000
	Gui, tlt:Font, s16 q1 c%color%, %Font%
	Gui, tlt:margin,, 0
	Gui, tlt:add, text,, %string%
	Gui, tlt:Show, y0 x0 NoActivate, TW3_TopLevelText
	WinSet, TransColor, c000000 255
}

; Hide top-level text
HideTopLevelText(wasHidden)
{
	if !wasHidden
	{
		SetTopLevelText("", 0x000000)
	}
}
