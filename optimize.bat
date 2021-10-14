@ECHO OFF
setlocal enableextensions enabledelayedexpansion
set total=0
set total_opt=0
set total_sav=0
set tmp=0
pushd C:\
rem  ^| grep -E          "[a-zA-Z]+" ^| grep -Eo "[0-9]+ [a-z]+(.*)+[0-9]+ [a-z]+ = (.*)+" ^| sed -e "s/bytes//g" ^| sed -e "s/ (//g" ^| sed -e "s/ = //g"
for /F "useback         q tokens=*" %%a in (`"dir /s /b *.png"`) do (
   for /F "usebac         kq tokens=1,2*" %%b in (`du   -b "%%a" ^& optipng -clobber -strip all -quiet "%%a"`) do (
rem 		echo %%b          %%c %%d %%e %%f
      du -b "%%a" >          D:\AHKv2\my_scripts\example  s_from_help\tmpsize.txt
      set /P tmpsz=         <D:\AHKv2\my_scripts\example  s_from_help\tmpsize.txt
      set /A total=         !total! + %%b
      set /A total_         opt=!total_opt! + !tmpsz!
      cecho {08}%%a          {\n}
      cecho {0A}siz         e: %%b {\n}
      cecho {0D}tot         al size: !total! {\n}
      cecho {0B}opt         imized size: !tmpsz! {\ n}
      cecho {0E}tot         al optimized size: !tot al_op  t! {\n}
rem
rem 		set /A to         tal_sav=!total_sav! + " %%e"
rem 		cecho {0C         }saved: %%e %%f{\n}
rem
rem 		cecho {0F}total saved: !total_sa v! {\  n}
   )
)
popd
echo :checksize >> checksize.cmd
echo setlocal enableextensions enabled elayedexpansion >> checksize.cmd
echo if %%total%% GTR 1024 ( >> checks ize.cmd
echo 	set /A tmp=^^!tmp^^! + 1 >> chec ksize.cmd
echo 	set /A total=^^!total^^! / 1024  >> checksize.cmd
echo 	goto checksize >> checksize.cmd
echo ) else ( >> checksize.cmd
echo 	echo %%total%%^>answer.txt>> checksize.cmd
echo 	exit /b %%tmp%% >> checksize.cmd
echo ) >> checksize.cmd

set clearsize=%total%
set clearsize_opt=%total_opt%
rem set clearsize_sav=%total_sav%
set /A total=%total% / 1024
set /A total_opt=%total_opt% / 1024
rem set /A total_sav=%total_sav% / 1024
call checksize.cmd
set err=%ERRORLEVEL%
if %err% == 0 (
   set size=Kb
) else (
   if %err% == 1 (
      set size=Mb
   ) else (
      set size=Gb
   )
)
set /p endtotal=<answer.txt
set /A mbsize=%clearsize% / 1024 / 1024
set /A gbsize=%clearsize% / 1024 / 1024 / 1024
set /A mbsize_opt=%clearsize_opt% / 1024 / 1024
rem set /A mbsize_sav=%clearsize_sav% / 1024 / 1024
:end
cecho {0A}TOTAL SIZE OF ALL PNG^'s IS %endtotal% %size%{\n}
cecho {0B}TOTAL SIZE IN BYTES IS %clearsize% Bytes{\n}
cecho {0C}SIZE: %total% Kb	%mbsize% Mb	 %gbsize% Gb{\n}
cecho {0D}TOTAL OPTIMIZED SIZE IN BYTES IS %clearsize_opt% Bytes{\n}
cecho {0D}OPTIMIZED SIZE: %total_opt% Kb	 %mbsize_opt% Mb{\n}
rem cecho {0E}TOTAL SIZE SAVED: %clearsize_sav%		%total_sav% Kb	%mbsize_sav% Mb{\n}
del /f /q /s checksize.cmd> NUL
del /f /q /s answer.txt> NUL
del /f /q /s D:\AHKv2\my_scripts\examples_from_help\tmpsize.txt> NUL
exit /b
rem set "opting1=optipng -clobber -strip all "%%a" ^| grep -E "Output file size = [0-9]+ [a-z]+ \([0-9]+ [a-z]+" ^| grep -Eo "[0-9]+ [a-z]+ \([0-9]+ [a-z]+ = (.*)+%" ^| sed -e "s/bytes//g" ^| sed -e "s/ (//g" ^| sed -e "s/ = //g""