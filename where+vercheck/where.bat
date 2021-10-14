set item=unzip.exe
set "check=-v"
set "command=where /R C:\ %item%"
for /f "usebackq tokens=*" %%a in (`"%command%"`) do (
       @cecho {0A}%%a{0B}{\n}
       %%a %check%
)
pause