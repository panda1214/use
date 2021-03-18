REM today   & Update M1_TAGFILE day **0 =today  (VBSCRIPT)
REM +1 tomorrow
echo wscript.echo dateadd("d",+1,date) >%tmp%\tmp.vbs
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set ex=%%i
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set y=%%j
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set z=%%k
DEL  %tmp%\tmp.vbs
SET/A cx= ex-1911
set/A  x= %ex%
if %y% LSS 10 set y=0%y%
if %z% LSS 10 set z=0%z%

REM ******USE (VBSCRIPT)
echo wscript.echo weekday("%x%-%y%-%z%",2) >%tmp%\tmp1.vbs
for /f "tokens=1 delims= " %%a in ('cscript /nologo %tmp%\tmp1.vbs') do set weekno=%%a
echo %weekno%
REM DEL  %tmp%\tmp1.vbs


echo weekno %weekno%
pause

REM >>%tmp%\tmp1.vbs echo wscript.quit X
REM CALL %tmp%\tmp1.vbs


REM type 2 firstdayofweek Monday
REM 1->mon 2->tue
REM ******USE



echo Set objShell = CreateObject("WScript.Shell") > %tmp%\_tempmsg.vbs
echo x=objShell.PopUp( %M9_L1%,%M9_WT%,%M9_H1%, %M9_BTN% ) >> %tmp%\_tempmsg.vbs
>>%tmp%\_tempmsg.vbs echo wscript.quit X
	
CALL %tmp%\_tempmsg.vbs
DEL %tmp%\_tempmsg.vbs

