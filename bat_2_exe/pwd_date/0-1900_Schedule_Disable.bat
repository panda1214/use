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
schtasks /CHANGE /DISABLE /TN "\0800_�Z\0010_���ҥD��������Ұ�"	>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\0800_�Z\0725-1800-���}��"			>> %M0_LOG%
schtasks /CHANGE /DISABLE /TN "\0800_�Z\0730-OPEN_MAIL"				>> %M0_LOG%

REM :::  ��L_ENABLE��,����Disable,,,��L_DISABLE��,����ENable
schtasks /CHANGE /ENABLE /TN "\0800_�Z\0730_1805_(�𰲮�)_�R����Ұ�ALARM�{��"	>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\0800_�Z\0750-�Х��}��z" 			>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\0800_�Z\0758-�O�oñ��"				>> %M0_LOG% 


schtasks /CHANGE /DISABLE /TN "\0800_�Z\0810_�R��1400�Ұʳ�z�Ƶ{"	>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\0800_�Z\0812-D-�ˬdAS400-RCP114LOG"	>> %M0_LOG% 

schtasks /CHANGE /DISABLE /TN "\0800_�Z\1530-W-�C�P�|_�@��-�ƥ��w�и�Ʀ��H���w��"	>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\0800_�Z\1658-1700_D-�����H��ñ�h"					>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\0800_�Z\1805-D-���}�����{���ݾ�"					>> %M0_LOG% 

REM schtasks /CHANGE /DISABLE /TN "\0800_�Z\2100-D-�ˬd-ArcSlight-Logger"				>> %M0_LOG% 
 

schtasks /query /TN "\0800_�Z" >> %M0_LOG% 


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
SET M0_WEP=
set M0_event=
GOTO L0_EXIT_OUT


L0_EXIT_OUT
::timeout /t 3600
ENDLOCAL









 
                   
:: start /max C:\Windows\System32\taskschd.msc
exit  

