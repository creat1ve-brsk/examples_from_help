; #Warn
;#NoEnv             ; Add this if "temp" is not intended to be an environment variable.
;EnvGet temp, TEMP  ; This would copy the environment variable's value into the script variable.
temp := "" ; Despite this line, temp still seems to have a value.
MsgBox % temp ; This accesses the environment variable named "TEMP".

pwb := ComObjCreate("InternetExplorer.Application") ;create IE Object
pwb.visible := true ; Set the IE object to visible
pwb.Navigate("https://f2ko.de/programme/cmd-tools/") ;Navigate to URL
while pwb.busy or pwb.ReadyState != 4 ;Wait for page to load
    Sleep, 100

var := pwb.LocationURL ;grab current url
MsgBox % var
Varclass := pwb.document.getElementsByClassName("table-striped").item[0].Value ;Get classname and Array value
MsgBox % Varclass
While (Varclass.offsetWidth = 0) AND(Varclass.offsetHeight = 0) ;if height=0 & Width=0 then not visible
    Sleep, 50

;******Third example with While loop***Note a_index-1 is in first row, not each individual one*
While (ele := pwb.document.getElementsByClassName("table-striped")[a_index - 1]) { ;store reference to element in ele While looping over elements
    := ele.getElementsByClassName("table-striped").item[0].InnerTEXT ;Class Name
}

Links := pwb.Document.Links ; collection of hyperlinks on the page
Loop % Links.Length ; Loop through links
If ((Link := Links[A_Index - 1].InnerText) != "") { ; if the link is not blank
    (OuterHTML := Links[A_Index - 1].OuterHTML) ; Grab outerHTML for each link
    Link := StrReplace(Link, "`n")
    Link := StrReplace(Link, "`r")
    Link := StrReplace(Link, "`t")
    OuterHTML := StrReplace(OuterHTML, "`n")
    OuterHTML := StrReplace(OuterHTML, "`r")
    OuterHTML := StrReplace(OuterHTML, "`t")

    Msg .= A_Index - 1 A_Space A_Space A_Space Link A_Tab OuterHTML "`r`n" ; add items to the msg list
}

font, s12 cBlue q5, Book Antiqua
Gui, Add, Edit, w1000 h600 - Wrap, %msg%gui, show

return

exit