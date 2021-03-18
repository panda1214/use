::
::
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
CLS
@echo off

D:
CD \Msg\use

CAll Win_D.exe
call log_on_1214.exe
CAll Win_D.exe
REM LINE=panda0984 , REM SET M0_WEP=cGM_kBNLBP1ZXwh6WhmrNN
REM LINE=panda0921024364
SET M0_WEP=d11JbnhamEDAVhh4fI4Sdp
REM set M0_event=1_panda_ok_msg
REM set M0_event=1_panda_err_msg
REM set M0_event=123_ok_test
REM set M0_event=123_err_test

SET M0_event=time_line
SET M0_WEP=d11JbnhamEDAVhh4fI4Sdp
SET M0_MSG_ENG_STR=Panda_auto_schedule run IHR log OK, Please Check https://go.linyuan.com.tw/FKWeb/


curl -X POST http://maker.ifttt.com/trigger/%M0_event%/with/key/%M0_WEP% -F "value1=%M0_MSG_ENG_STR%"


REM 如何在命令行引數下產生一個區間的亂數
REM Windows Command Shell 底下內建一個亂數變數 %random%
REM 它產生的數值介於 0~32767 之間。
REM 要將它局限在一定區間，以便程式應用！
REM 以下批次檔，使用時，給與程式三個參數
