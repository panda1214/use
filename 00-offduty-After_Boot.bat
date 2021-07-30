REM  程式非上班期間,主機重開機,將啟動後待命程式刪除
REM  https://dotblogs.com.tw/c5todo/2016/08/21/155005
REM  OUTLOOK.EXE ask_Speaker.exe FreeAlarmClock.ex
::::::::::::::::::::::::::::
REM  Get_admin_sample  
@echo off
CLS

REM::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::GOTO L0_GET_ADMIN
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
::REM ***** 程式由此向下
::setlocal enableDelayedExpansion
echo. 
echo.
echo.
echo.

::::::::::::::::::::::::::::
:: 
::::::::::::::::::::::::::::
:L1_STR_CK_FILE_ERR01
set M0_RUNDIR=\Msg\use
set M0_LOG=%M0_RUNDIR%\LOG\00-offduty-After_Boot.log
D:
CD %M0_RUNDIR%
IF NOT EXIST %M0_RUNDIR%\msg_str_sec_bye.eee GOTO L1_CK_FILE_ERR01
:L1_END_CK_FILE_ERR01


:L1_STR_CK_FILE_ERR02
IF NOT EXIST %M0_RUNDIR% GOTO L1_CK_FILE_ERR02
:L1_END_CK_FILE_ERR02


:L1_STR_CK_FILE_ERR03
IF NOT EXIST %M0_LOG% GOTO L1_CK_FILE_ERR03
:L1_END_CK_FILE_ERR03


:L1_STR_CK_FILE_ERR04
REM Change Notepad Background Color
IF NOT EXIST D:\cg_color.reg GOTO L1_CK_FILE_ERR02
regedit /s D:\cg_color.reg
::C:\Windows\System32\reg.exe Delete HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce /va /f
:L1_END_CK_FILE_ERR04





::C:\Windows\System32\reg.exe Delete HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce /va /f
:L0_MAIN_START_01
echo. > %M0_LOG%
echo. *****************************************************	>> %M0_LOG%
echo. 程式執行名稱 00-offduty-After_Boot.bat				>> %M0_LOG%
echo. 程式執行日期 %date%,%time%							>> %M0_LOG%
echo. *****************************************************	>> %M0_LOG%
echo. >> %M0_LOG%
echo. >> %M0_LOG%
ECHO. Change Notepad Background Color		>> %M0_LOG%
regedit /s D:\cg_color.reg 					>> %M0_LOG%
SET /A M1_KILL_COUNT=1



:L0_TASK_KILL_01
::msg_str_sec_bye.eee '執行_%M1_KILL_COUNT%_00-offduty-After_Boot.bat' 3
MSG * /TIME:3 執行_%M1_KILL_COUNT%_00-offduty-After_Boot.bat
::REM timeout /t 36000
echo. >> %M0_LOG%
echo. ================================	>> %M0_LOG%
echo. %date%-%TIME%						>> %M0_LOG%
tasklist.exe /FI "IMAGENAME eq OUTLOOK.EXE"  			>> %M0_LOG%
tasklist.exe /FI "IMAGENAME eq ask_Speaker.exe"			>> %M0_LOG%
tasklist.exe /FI "IMAGENAME eq FreeAlarmClock.exe"		>> %M0_LOG%
tasklist.exe /FI "IMAGENAME eq HYVideoDesktop.exe"		>> %M0_LOG%
tasklist.exe /FI "IMAGENAME eq Rainlendar2.exe"			>> %M0_LOG%
tasklist.exe /FI "IMAGENAME eq Rainmeter.exe"			>> %M0_LOG%
tasklist.exe /FI "IMAGENAME eq lync.exe"				>> %M0_LOG%
tasklist.exe /FI "IMAGENAME eq caffeine64.exe"			>> %M0_LOG%


"C:\WINDOWS\system32\taskkill.exe" /F /IM OUTLOOK.EXE /T 			>> %M0_LOG%
"C:\WINDOWS\system32\taskkill.exe" /F /IM ask_Speaker.exe /T 		>> %M0_LOG%
"C:\WINDOWS\system32\taskkill.exe" /F /IM FreeAlarmClock.exe /T 	>> %M0_LOG%
"C:\WINDOWS\system32\taskkill.exe" /F /IM HYVideoDesktop.exe /T 	>> %M0_LOG%
"C:\WINDOWS\system32\taskkill.exe" /F /IM Rainlendar2.exe /T 	>> %M0_LOG%
"C:\WINDOWS\system32\taskkill.exe" /F /IM Rainmeter.exe /T 	>> %M0_LOG%
"C:\WINDOWS\system32\taskkill.exe" /F /IM lync.exe /T 	>> %M0_LOG%
"C:\WINDOWS\system32\taskkill.exe" /F /IM caffeine64.exe /T 	>> %M0_LOG%
echo. ================================	>> %M0_LOG%
echo. >> %M0_LOG%
GOTO L0_TASK_KILL_COUNT
GOTO L0_EXIT



:L0_TASK_KILL_COUNT
IF %M1_KILL_COUNT% GTR 2 GOTO L0_EXIT
TIMEOUT /t 900


SET /A M1_KILL_COUNT=M1_KILL_COUNT+1
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
echo. *****************************************************	>> %M0_LOG%
echo. 程式執行名稱 00-offduty-After_Boot.bat				>> %M0_LOG%
echo. 程式完成日期 %date%,%time%							>> %M0_LOG%
echo. *****************************************************	>> %M0_LOG%
echo Bye!!! Bye!!!
::msg_str_sec_bye.eee '完成%M1_KILL_COUNT%_00-offduty-After_Boot.bat' 3
MSG * /TIME:3 完成%M1_KILL_COUNT%_00-offduty-After_Boot.bat
::DEBUG TIMEOUT /T 3600
EXIT



EXIT
REM :: :::::::::::::::::::::::::::::::::::::::::::::::::::
REM :: 	SUB FUNCTION
REM :: :::::::::::::::::::::::::::::::::::::::::::::::::::
:L1_CK_FILE_ERR01
	echo  *** 找不到   %M0_RUNDIR%\msg_str_sec_bye.eee  >> %M0_LOG%
	echo  *** 找不到   %M0_RUNDIR%\msg_str_sec_bye.eee  >> %M0_LOG%	
	echo  *** 找不到   %M0_RUNDIR%\msg_str_sec_bye.eee  >> %M0_LOG%
GOTO L1_END_CK_FILE_ERR01

:L1_CK_FILE_ERR02
	msg_str_sec_bye.eee  找不到%M0_RUNDIR%目錄 300
	echo  找不到  %M0_RUNDIR% 目錄 ，請檢查 %M0_RUNDIR% 該目錄 >> %M0_LOG%
	echo  找不到  %M0_RUNDIR% 目錄 ，請檢查 %M0_RUNDIR% 該目錄 >> %M0_LOG%
	echo  找不到  %M0_RUNDIR% 目錄 ，請檢查 %M0_RUNDIR% 該目錄 >> %M0_LOG%
GOTO L1_END_CK_FILE_ERR02

:L1_CK_FILE_ERR03
	d:
	CD %M0_RUNDIR%
	msg_str_sec_bye.eee  找不到%M0_LOG% 300
	echo  *** 找不到  %M0_LOG% ***  >> %M0_LOG%
	echo  *** 找不到  %M0_LOG% ***  >> %M0_LOG%	
	echo  *** 找不到  %M0_LOG% ***  >> %M0_LOG%
GOTO L1_END_CK_FILE_ERR03


:L1_CK_FILE_ERR04
	msg_str_sec_bye.eee 找不到D:\cg_color.reg 300
	echo  *** 找不到  D:\cg_color.reg***  >> %M0_LOG%
	echo  *** 找不到  D:\cg_color.reg***  >> %M0_LOG%	
	echo  *** 找不到  D:\cg_color.reg***  >> %M0_LOG%
	::TIMEOUT /T 3600
GOTO L1_END_CK_FILE_ERR04	
	






REM :: :::::::::::::::::::::::::::::::::::::::::::::::::::
REM :: 	SUB FUNCTION
REM :: :::::::::::::::::::::::::::::::::::::::::::::::::::
::REM END OF SUB FUNCTION
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