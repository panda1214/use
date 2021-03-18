REM  程式自動設定為 Administrator 權限
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
REM  停用 國安-電券早班 排程    
REM 指令	schtasks /CHANGE /DISABLE /TN "\國安-電券早班\0625-A-早班_-重開機" [/s computer [/u [domain\]user /p password]] /?   
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
schtasks /CHANGE /DISABLE /TN "\0800_班\0010_重啟主機後相關啟動"	>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\0800_班\0725-1800-重開機"			>> %M0_LOG%
schtasks /CHANGE /DISABLE /TN "\0800_班\0730-OPEN_MAIL"				>> %M0_LOG%

REM :::  其他_ENABLE時,本項Disable,,,其他_DISABLE時,本項ENable
schtasks /CHANGE /ENABLE /TN "\0800_班\0730_1805_(休假時)_刪除原啟動ALARM程式"	>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\0800_班\0750-請打開喇叭" 			>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\0800_班\0758-記得簽到"				>> %M0_LOG% 


schtasks /CHANGE /DISABLE /TN "\0800_班\0810_刪除1400啟動喇叭排程"	>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\0800_班\0812-D-檢查AS400-RCP114LOG"	>> %M0_LOG% 

schtasks /CHANGE /DISABLE /TN "\0800_班\1530-W-每周四_一般-備份硬碟資料至隨身硬碟"	>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\0800_班\1658-1700_D-金控人資簽退"					>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\0800_班\1805-D-重開機後砍程式待機"					>> %M0_LOG% 

REM schtasks /CHANGE /DISABLE /TN "\0800_班\2100-D-檢查-ArcSlight-Logger"				>> %M0_LOG% 
 

schtasks /query /TN "\0800_班" >> %M0_LOG% 


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
SET M0_MSG_CHT_STR="%date%"-"%time%"_1900-執行排程**[停用]**成功
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

