

::::::::::::::::::::::::::::
REM  ���� ��w-�q�馭�Z �Ƶ{    
REM ���O	schtasks /CHANGE /DISABLE /TN "\��w-�q�馭�Z\0625-A-���Z_-���}��" [/s computer [/u [domain\]user /p password]] /?   
@echo off
CLS

REM::
GOTO L0_GET_ADMIN
REM  �{���۰ʳ]�w�� Administrator �v��
REM  https://dotblogs.com.tw/c5todo/2016/08/21/155005
REM
:L0_END_GET_ADMIN
REM::

:L0_MAIN_START
::::::::::::::::::::::::::::
::START
::::::::::::::::::::::::::::
REM  ���� ��w-�q�馭�Z �Ƶ{    
REM ���O	schtasks /CHANGE /DISABLE /TN "\��w-�q�馭�Z\0625-A-���Z_-���}��" [/s computer [/u [domain\]user /p password]] /?   
REM SCHTASKS /Create [/S system [/U username [/P [password]]]]
REM     [/RU username [/RP password]] /SC schedule [/MO modifier] [/D day]
REM     [/M months] [/I idletime] /TN taskname /TR taskrun [/ST starttime]
REM     [/RI interval] [ {/ET endtime | /DU duration} [/K] [/XML xmlfile] [/V1]]
REM     [/SD startdate] [/ED enddate] [/IT | /NP] [/Z] [/F] [/HRESULT] [/?]




SET M0_RUNDIR=\Msg\Use
SET M0_LOG=\Msg\Use\Log\AM0800_Schedule_Disable.txt  
D:
CD  %M0_RUNDIR%
echo. > %M0_LOG%                                
msg_str_sec_bye.exe ����0-1900_Schedule_Disable.bat 5  

echo. ::: run D:\Msg\Use\����0-1900_Schedule_Disable.bat  							>> %M0_LOG%                                                         
echo. :::  ============================================================= 			>> %M0_LOG%   
echo. :::  -----------     every thing  off-----------3,4,5 on	-----------			>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\0830_�Z\0825-�O�oñ��"								>> %M0_LOG%    
schtasks /CHANGE /DISABLE /TN "\0830_�Z\0900-START_HYVideoDesktop"					>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\0830_�Z\1-0750-�W�Z�e���}��"						>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\0830_�Z\1630-W-�C�P��_�ˬd�ƥ��w�Фw�Ƨ��ܩ����"	>> %M0_LOG%
schtasks /CHANGE /DISABLE /TN "\0830_�Z\1728-1730_D-�����H��ñ�h"					>> %M0_LOG%  
schtasks /CHANGE /DISABLE /TN "\0830_�Z\2-0800-1829-�W�Z�����t�ζ}����"				>> %M0_LOG% 
echo. ::: 0830_�Z\3-1825-�U�Z�᭫�}��" �û� ON 										>> %M0_LOG% 
echo. :::  ----------- 3 Always ON------------	---------------------				>> %M0_LOG%  
schtasks /CHANGE /ENABLE  /TN "\0830_�Z\3-1825-�U�Z�᭫�}��"						>> %M0_LOG% 
echo. :::  ----------- 3,4, 5 on	------------	---------------------			>> %M0_LOG%  
schtasks /CHANGE /ENABLE /TN "\0830_�Z\4-1830-0755-�U�Z-�t�ζ}����"					>> %M0_LOG% 
schtasks /CHANGE /ENABLE /TN "\0830_�Z\5-�𰲴���_0755_���}��"						>> %M0_LOG% 
echo. :::  ============================================================= 			>> %M0_LOG% 
echo. :::  >> %M0_LOG%  
echo. :::  >> %M0_LOG% 
echo. :::  ==========�d�ߥثe���A======================================== 			>> %M0_LOG% 
echo. :::  -----------     every thing  off-----------3,4,5 on	-----------			>> %M0_LOG% 
schtasks /query /fo csv /nh /TN "\0830_�Z\0825-�O�oñ��"							>> %M0_LOG%    
schtasks /query /fo csv /nh /TN "\0830_�Z\0900-START_HYVideoDesktop"				>> %M0_LOG% 
schtasks /query /fo csv /nh /TN "\0830_�Z\1-0750-�W�Z�e���}��"						>> %M0_LOG% 
schtasks /query /fo csv /nh /TN "\0830_�Z\1630-W-�C�P��_�ˬd�ƥ��w�Фw�Ƨ��ܩ����"	>> %M0_LOG%
schtasks /query /fo csv /nh /TN "\0830_�Z\1728-1730_D-�����H��ñ�h"					>> %M0_LOG%  
schtasks /query /fo csv /nh /TN "\0830_�Z\2-0800-1829-�W�Z�����t�ζ}����"			>> %M0_LOG%  
echo. :::  ----------- 3,4, 5 on	------------	---------------------			>> %M0_LOG%  
schtasks /query /fo csv /nh /TN "\0830_�Z\3-1825-�U�Z�᭫�}��"						>> %M0_LOG% 
schtasks /query /fo csv /nh /TN "\0830_�Z\4-1830-0755-�U�Z-�t�ζ}����"				>> %M0_LOG% 
schtasks /query /fo csv /nh /TN "\0830_�Z\5-�𰲴���_0755_���}��"					>> %M0_LOG% 
echo. :::  ============================================================== 			>> %M0_LOG% 


REM start /max C:\Windows\System32\taskschd.msc

::::::::::::::::::::::::::::
::Line
::::::::::::::::::::::::::::
D:
CD  %M0_RUNDIR%
SET M0_SETDIR=\Msg\Use
SET M0_SENDMSG_1=%M0_SETDIR%\send_msg1_panda.bat
REM :: SendMail
SET M0_SENDMSG_2=%M0_SETDIR%\send_msg1_panda1214.bat
REM :: SendSMS
SET M0_SENDMSG_3=%M0_SETDIR%\Nosend_msg3_panda.bat
REM :: Sendline
set M0_event=time_line
SET M0_MSG_CHT_STR="%date%"-"%time%"_1900-����Ƶ{**[����]**���\
SET M0_MSG_ENG_STR="%date%"-"%time%"_1900-START_Schedule_[Disable]**_OK
SET M0_WEP=bFfG7yiit9oGWtGh2OGaio



:L0_SENDMSG1 
:: sendMail
IF NOT EXIST %M0_SENDMSG_1% GOTO L0_SENDMSG2
call %M0_SENDMSG_1%
::timeout /t 3600
GOTO L0_SENDMSG2

:L0_SENDMSG2
IF NOT EXIST %M0_SENDMSG_2% GOTO L0_SENDMSG3
call %M0_SENDMSG_2%
::timeout /t 3600
GOTO L0_SENDMSG3

:L0_SENDMSG3
IF NOT EXIST %M0_SENDMSG_3% GOTO L0_EXIT_OUT
SET M0_MSG_ENG_STR=%date%-%time%_1900-START_Schedule_Disable
SET M0_WEP=bFfG7yiit9oGWtGh2OGaio
set M0_event=time_line
curl -X POST http://maker.ifttt.com/trigger/%M0_event%/with/key/%M0_WEP% -F "value1=%M0_MSG_ENG_STR%"
GOTO L0_EXIT_OUT

:L0_EXIT_OUT
SET M0_WEP=
set M0_event=
SET M0_RUNDIR=
SET M0_LOG=
EXIT

EXIT
:L0_GET_ADMIN
REM  �{���۰ʳ]�w�� Administrator �v��
REM  https://dotblogs.com.tw/c5todo/2016/08/21/155005
REM
@echo off
CLS
ECHO.
ECHO =============================
ECHO Running Admin Shell
ECHO =============================

:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
ECHO.
ECHO **************************************
ECHO Invoking UAC for Privilege Escalation
ECHO **************************************

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)
ENDLOCAL 

GOTO L0_END_GET_ADMIN

::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJHaR4E4/JxBoZQeNMleFCLAI6+78oeOErS0=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJHSX834FOx5oaTynAEm1CaEz28X+4f+4gUUSXeE6MKzT27qJJd882QzYdp4s2H1lt/hCCQNdHg==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
::@echo off

