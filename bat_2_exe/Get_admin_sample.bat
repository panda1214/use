::::::::::::::::::::::::::::
REM  Get_admin_sample  
@echo off
CLS




REM::
GOTO L0_GET_ADMIN
REM  程式自動設定為 Administrator 權限
REM  https://dotblogs.com.tw/c5todo/2016/08/21/155005
REM
:L0_END_GET_ADMIN
REM::

:L0_MAIN_START
::::::::::::::::::::::::::::
::START L0_MAIN_START
::::::::::::::::::::::::::::
::REM ***** 程式由此向下
::REM ***** 程式由此向下
::::::::::::::::::::::::::::
:: 檢查所需執行檔及目錄
::::::::::::::::::::::::::::
IF NOT EXIST %M0_RUNDIR% GOTO L0_CK_FILE_ERR01
IF NOT EXIST %M0_RUNDIR%\nircmd.exe GOTO  L0_CK_FILE_ERR02
IF NOT EXIST %M0_RUNDIR%\msg_str_sec_bye.exe GOTO  L0_CK_FILE_ERR03



::::::::::::::::::::::::::::
::END START L0_MAIN_START
::::::::::::::::::::::::::::
EXIT





::REM ***** 程式由此向上
::REM ***** 程式由此向上
EXIT
REM :: :::::::::::::::::::::::::::::::::::::::::::::::::::
REM :: 	SUB FUNCTION
REM :: :::::::::::::::::::::::::::::::::::::::::::::::::::
:L0_CK_FILE_ERR01
	echo  找不到  %M0_RUNDIR% 目錄 ，請把 nircmd.exe msg_str_sec_bye.exe 放入該目錄 %M0_RUNDIR%
	TIMEOUT /T 36000
GOTO L0_EXIT
:L0_CK_FILE_ERR02
	echo  找不到  %M0_RUNDIR%\msg_str_sec_bye.exe 檔案 ，請把 msg_str_sec_bye.exe 放入該目錄
	TIMEOUT /T 36000
GOTO L0_EXIT
:L0_CK_FILE_ERR03
	echo  找不到  %M0_RUNDIR%\nircmd.exee 檔案 ，請把 nircmd.exe 放入該目錄
	TIMEOUT /T 36000
GOTO L0_EXIT


EXIT
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

