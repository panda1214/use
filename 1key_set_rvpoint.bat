@echo off
GOTO L0_start_Admin
:L0_start_Admin01

REM *************************************
REM 20200817 董國安 ck_HardDisk_Space 檢查 自己PC硬碟空間 
REM ************************************

iF exist D:\Msg\Use\1key_set_rvpoint.vbs GOTO L0_MAIN_START01
echo can not find D:\Msg\Use\1key_set_rvpoint.vbs
CALL messagebox.exe SEND_MESSAGE "找不到檔案 D:\Msg\Use\1key_set_rvpoint.vbs 可執行" 0
::REM Call:  messagebox.exe [-h|-v] <title> <text> [flags]
EXIT

:L0_MAIN_START01
C:
CALL D:\Msg\Use\1key_set_rvpoint.vbs
EXIT


EXIT
:L0_start_Admin	
REM ************************************************************
REM 程式自動設定為 Administrator 權限
REM ************************************************************
REM  程式自動設定為 Administrator 權限
REM  https://dotblogs.com.tw/c5todo/2016/08/21/155005
REM
setlocal enableDelayedExpansion
CLS
@echo off
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
GOTO L0_start_Admin01