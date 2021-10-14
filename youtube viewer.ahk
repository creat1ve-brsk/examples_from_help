;- modified=20201022  ; change URL if not works ( ID1 )
;- created =20190422 
;- PLAY Youtube video with videolan (vlc.exe) 
Filename1=VLCPlugin_Youtube-Play    ;- only videos allowed for embed
Gui,2:default
Gui,2:-border
GUI,2:Font,s14 cGray,Lucida Console
Gui,2: -DPIScale
Gui,2: Color, Black,Black 

;- if not work change URL
;id1=yKbzBGntI8Q;Ye lai xiang - Li Xiang Lan
id1=GZ-3YwVQV0M;Сериал Слуга народа

stringsplit,c,id1,`;
F1=https://www.youtube.com/watch?v=%c1%
wa:=A_screenwidth,ha:=A_screenHeight,xx:=101
LW:=(wa*88)/xx,LH:=(ha*88)/xx,wm:=(wa*88.7)/xx,hm:=(ha*90)/xx,GW:=(wa*99.5)/xx,GH:=(ha*96)/xx  
x1:=(wa*1.5)/xx,y1:=(ha*2)/xx,x2:=(wa*1.2)/xx,y2:=(ha*.5)/xx
xxb=VideoLAN.VLCPlugin.2
   Gui,2:Add,ActiveX, x%x1% y%y1% w%lw%  h%lh% vVlcx,%xxb%
   xp:=(wa*90.3)/xx,yp:=(ha* 1.3)/xx,wp:=(wa* 8.4)/xx,hp:=(ha*89.2)/xx
   Gui,2:add,GroupBox,x%x2% y%y2% w%WM% h%HM%
y:=(ha*92) /xx  
Gui,2:Add,Text,x%x2% y%y% , %c2%   ( use ESC to quit )
Gui,2:Show,x0 y0 w%gw% h%gh%,%filename1%
vlcx.playlist.add(F1,"","""""")
vlcx.playlist.next()
return
2Guiclose:
exitapp
esc::exitapp
;============ END script Youtube PLAY =====================================