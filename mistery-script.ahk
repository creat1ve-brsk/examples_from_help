Process, WaitClose, %PID%, %WaitSecs%
If (Errorlevel) ;  <-- Timed out !!
      Return 0 ;   so cancel out   ...
Run, %ExpPath% ; and definitely do not run this