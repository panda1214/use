::::::::::::::::::::::::::::
REM  Get_admin_sample  
@echo off
CLS

REM::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
GOTO L0_GET_ADMIN
REM  程式自動設定為 Administrator 權限
REM  https://dotblogs.com.tw/c5todo/2016/08/21/155005
REM
:L0_END_GET_ADMIN
REM::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:L0_MAIN_START
::::::::::::::::::::::::::::
::START L0_MAIN_START
::::::::::::::::::::::::::::
::REM ***** 程式由此向下
setlocal enableDelayedExpansion
echo. 
echo.
echo.
echo.

::::::::::::::::::::::::::::
:: SET & Check FILE
::::::::::::::::::::::::::::
set M0_RUNDRV=D:
set M0_RUNDIR=\Msg\use
SET M0_SENDMSG_1=\Msg\use\send_msg1_panda.bat
set M0_LOG=%M0_RUNDIR%\LOG\00_kill_Before_Boot.log
%M0_RUNDRV%
CD %M0_RUNDIR%
echo. > %M0_LOG%


:L1_STR_CK_FILE_ERR01
IF NOT EXIST %M0_RUNDIR% GOTO L1_CK_FILE_ERR01
:L1_END_CK_FILE_ERR01

:L1_STR_CK_FILE_ERR02
IF NOT EXIST %M0_LOG% GOTO L1_CK_FILE_ERR02
:L1_END_CK_FILE_ERR02

:L1_STR_CK_FILE_ERR03
IF NOT EXIST %M0_RUNDIR%\msg_str_sec_bye.exe1 GOTO L1_CK_FILE_ERR03
:L1_END_CK_FILE_ERR03

:L1_STR_CK_FILE_ERR04
REM Change Notepad Background Color
IF NOT EXIST D:\cg_color.reg GOTO L1_CK_FILE_ERR02
regedit /s D:\cg_color.reg
::C:\Windows\System32\reg.exe Delete HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce /va /f
:L1_END_CK_FILE_ERR04





::sg_str_sec_bye.exe 執行00_kill_Before_Boot.bat 3
::REM timeout /t 3600
:L0_MAIN_START_01

echo. *****************************************************	>> %M0_LOG%
echo. 程式執行名稱 00_kill_Before_Boot.bat					>> %M0_LOG%
echo. 程式執行日期 %date%,%time%							>> %M0_LOG%
echo. *****************************************************	>> %M0_LOG%
echo. >> %M0_LOG%
echo. >> %M0_LOG%
ECHO. Change Notepad Background Color		>> %M0_LOG%
regedit /s D:\cg_color.reg 					>> %M0_LOG%
SET /A M1_KILL_COUNT=1
echo. ================================	>> %M0_LOG%
echo. ================================	>> %M0_LOG%

::msg_str_sec_bye.exe '執行-00_kill_Before_Boot.bat' 3
MSG * /TIME:3 執行-00_kill_Before_Boot.bat

:L0_TASK_KILL_01
::REM timeout /t 36000
echo. >> %M0_LOG%
echo. ================================	>> %M0_LOG%
echo. %date%-%TIME%						>> %M0_LOG%
tasklist.exe /FI "IMAGENAME eq OUTLOOK.EXE"  			>> %M0_LOG%
tasklist.exe /FI "IMAGENAME eq Rainlendar2.exe"			>> %M0_LOG%
tasklist.exe /FI "IMAGENAME eq notepad++.exe"			>> %M0_LOG%
tasklist.exe /FI "IMAGENAME eq cmd.exe"					>> %M0_LOG%

echo. kill OUTLOOK.EXE										>> %M0_LOG%
"C:\WINDOWS\system32\taskkill.exe" /F /IM OUTLOOK.EXE /T 	>> %M0_LOG%
"C:\WINDOWS\system32\taskkill.exe" /F /IM OUTLOOK.EXE /T 	>> %M0_LOG%

echo. kill Rainlendar2										>> %M0_LOG%
"C:\WINDOWS\system32\taskkill.exe" /F /IM Rainlendar2.exe /T 	>> %M0_LOG%
"C:\WINDOWS\system32\taskkill.exe" /F /IM Rainmeter.exe /T 	>> %M0_LOG%


echo. kill notepad++.exe									>> %M0_LOG%
"C:\WINDOWS\system32\taskkill.exe" /F /IM notepad++.exe /T 	>> %M0_LOG%


echo. kill cmd.exe			>> %M0_LOG%
:: "C:\WINDOWS\system32\taskkill.exe" /F cmd.exe" /T 		>> %M0_LOG%
:: "C:\WINDOWS\system32\taskkill.exe" /F cmd.exe" /T 		>> %M0_LOG%
::REM 
"C:\WINDOWS\system32\taskkill.exe" /F /IM ask_Speaker.exe /T 		>> %M0_LOG%
"C:\WINDOWS\system32\taskkill.exe" /F /IM FreeAlarmClock.exe /T 	>> %M0_LOG%
"C:\WINDOWS\system32\taskkill.exe" /F /IM HYVideoDesktop.exe /T 	>> %M0_LOG%
echo. ================================	>> %M0_LOG%
echo. >> %M0_LOG%

::echo %M1_KILL_COUNT%
::timeout /t 3600

:L0_TASK_KILL_COUNT
SET /A M1_KILL_COUNT=%M1_KILL_COUNT%+1
::timeout /t 600
IF %M1_KILL_COUNT% GTR 1 GOTO L0_EXIT
::REM 執行 1次
::echo %M1_KILL_COUNT%
::echo %M1_KILL_COUNT%
::echo %M1_KILL_COUNT%
::timeout /t 3600
::msg_str_sec_bye.exe '等待900秒繼續執行_第%M1_KILL_COUNT%次-00_kill_Before_Boot.bat' 900
MSG * /TIME:900 等待900秒繼續執行_第%M1_KILL_COUNT%次-00_kill_Before_Boot.bat
GOTO L0_TASK_KILL_01
GOTO L0_EXIT




EXIT
:L1_END_MESSAGE_FINISH
::REM ***** 程式由此向上
::REM ***** 程式由此向上

:L0_EXIT
REM :: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
REM :: 	END OF L0_MAIN_START
REM :: ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo. >> %M0_LOG%
echo. >> %M0_LOG%
echo. *************************************************  ****	>> %M0_LOG%
echo. 程式執行名稱 00_kill_Before_Boot.bat					>> %M0_LOG%   
echo. 程式完成日期 %date%,%time%					      	  	>> %M0_LOG%
echo. *****************************************************	>> %M0_LOG%
echo Bye!!! Bye!!!
MSG * /TIME:3 完成-00_kill_Before_Boot.bat
TIMEOUT /T 10
EXIT B

:L0_SENDMSG1 
:: sendMail
%M0_RUNDRV%
CD %M0_RUNDIR%
call %M0_SENDMSG_1%
::timeout /t 300
GOTO L0_EXIT



EXIT
REM :: :::::::::::::::::::::::::::::::::::::::::::::::::::
REM :: 	SUB FUNCTION
REM :: :::::::::::::::::::::::::::::::::::::::::::::::::::

:L1_CK_FILE_ERR01
	msg_str_sec_bye.exe 找不到%M0_RUNDIR%目錄 60
	echo  找不到  %M0_RUNDIR% 目錄 ，請檢查 %M0_RUNDIR% 該目錄 >> %M0_LOG%
	echo  找不到  %M0_RUNDIR% 目錄 ，請檢查 %M0_RUNDIR% 該目錄 >> %M0_LOG%
	echo  找不到  %M0_RUNDIR% 目錄 ，請檢查 %M0_RUNDIR% 該目錄 >> %M0_LOG%
	echo  找不到  %M0_RUNDIR% 目錄 ，請檢查 %M0_RUNDIR% 該目錄 >> %M0_LOG%
	timeout /t 300
	SET M0_MSG_CHT_STR="%date%-%time%_00_kill_Before_Boot.bat_[ 找不到  %M0_RUNDIR% 目錄,請檢查 %M0_RUNDIR% 該目錄 ]"
   call %M0_SENDMSG_1%   
GOTO L1_END_CK_FILE_ERR01

:L1_CK_FILE_ERR02
	msg_str_sec_bye.exe 找不到%M0_LOG%檔案 60
	echo  找不到  %M0_LOG% 檔案 ，請檢查 %M0_LOG% 該檔案  >> %M0_LOG%
	echo  找不到  %M0_LOG% 檔案 ，請檢查 %M0_LOG% 該檔案  >> %M0_LOG%
	echo  找不到  %M0_LOG% 檔案 ，請檢查 %M0_LOG% 該檔案  >> %M0_LOG%
	SET M0_MSG_CHT_STR="%date%-%time%-00_kill_Before_Boot.bat-[找不到%M0_LOG%檔案，請檢查%M0_LOG%該檔案]"
   call %M0_SENDMSG_1%
GOTO L1_END_CK_FILE_ERR02

:L1_CK_FILE_ERR03
	echo  *** 找不到   %M0_RUNDIR%\msg_str_sec_bye.exe  >> %M0_LOG%
	echo  *** 找不到   %M0_RUNDIR%\msg_str_sec_bye.exe  >> %M0_LOG%	
	echo  *** 找不到   %M0_RUNDIR%\msg_str_sec_bye.exe  >> %M0_LOG%
	SET M0_MSG_CHT_STR="%date%"-"%time%"_00_kill_Before_Boot.bat_[ 找不到   %M0_RUNDIR%\msg_str_sec_bye.exe ，請檢查該檔案 ]
	call %M0_SENDMSG_1%
	::timeout /t 60
GOTO L1_END_CK_FILE_ERR03

:L1_CK_FILE_ERR04
	msg_str_sec_bye.exe 找不到D:\cg_color.reg 60
	echo  *** 找不到  D:\cg_color.reg***  >> %M0_LOG%
	echo  *** 找不到  D:\cg_color.reg***  >> %M0_LOG%	
	echo  *** 找不到  D:\cg_color.reg***  >> %M0_LOG%
	SET M0_MSG_CHT_STR="%date%"-"%time%"_00_kill_Before_Boot.bat_[ 找不到  D:\cg_color.reg ，請檢查該檔案 ]
	call %M0_SENDMSG_1%
	::TIMEOUT /T 60
GOTO L1_END_CK_FILE_ERR04	



REM :: :::::::::::::::::::::::::::::::::::::::::::::::::::
::REM END OF SUB FUNCTION
REM :: :::::::::::::::::::::::::::::::::::::::::::::::::::
EXIT



::REM END OF L0_GET_ADMIN
EXIT
::::::::::::::::::::::::::::
:::L0_GET_ADMIN
::::::::::::::::::::::::::::
:L0_GET_ADMIN
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
ENDLOCAL 

GOTO L0_END_GET_ADMIN

::[產生 BAT EXE 把=======下面放到最上面]
::======================
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