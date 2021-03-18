REM **************************************
REM SUB FUNC  30m_close_outlook.exe
REM **************************************
@echo off
GOTO L0_start_Admin
REM ************************************************************
REM 程式自動設定為 Administrator 權限
REM ************************************************************
:L0_start_Admin01

DEL D:\temp5_msg.vbs

echo. > d:\temp5_check.log
echo. > d:\outlook_off_flag.txt
echo. **************************************************	>> outlook_off_flag.txt
echo. 程式名稱 D:\Msg\Schedule\30M_close_outlook.bat		>> outlook_off_flag.txt
echo. 程式執行時間 %ex%-%y%-%z%,%time%  					>> outlook_off_flag.txt
echo. **************************************************	>> outlook_off_flag.txt


echo X=MsgBox("工作提醒" +vbCrLf+ "***本程式如未選擇: 表示無人值守_則5分鐘將自動結束程式_不做任何處理***" + vbCrLf+  vbCrLf+ "(1)按下[是]_停止 OUTLOOK" +vbCrLf+"(2)按下[否]則結束程式不動作" +vbCrLf+ "(3)按下[取消]將取消本次提醒_5分後再提醒" ,vbYesNoCancel+vbQuestion+vbDefaultButton2,"傳送工作提醒訊息"^) > D:\temp5_msg.vbs
>>D:\temp5_msg.vbs echo wscript.quit X
REM echo X=MsgBox("工作提醒" +vbCrLf+ "***本程式如未選擇: 表示無人值守_1405另一排程會結束程式***" + vbCrLf+  vbCrLf+ "(1)按下[是]_請打開喇叭" +vbCrLf+"(2)按下[取消]取消本次提醒_則5分後再提醒" +vbCrLf+ "(3)按下[否]則結束程式不動作" ,vbYesNoCancel+vbQuestion,"傳送工作提醒訊息"^) > D:\temp_msg2.vbs
REM >>D:\temp_msg2.vbs echo wscript.quit X


:L0_start_01
call D:\temp5_msg.vbs
echo %ERRORLEVEL%

IF %ERRORLEVEL% EQU 1 GOTO  L0_YES
IF %ERRORLEVEL% EQU 2 GOTO  L0_NO
IF %ERRORLEVEL% EQU 7 GOTO  L0_CANCEL


:L0_YES
	"C:\WINDOWS\system32\taskkill.exe" /F /IM outlook.exe /T 
    "C:\WINDOWS\system32\taskkill.exe" /F /IM outlook.exe /T 
	echo. 選擇 YES	>> outlook_off_flag.txt
	goto L0_EXIT
	
:L0_NO
	REM sleep next time sstart loop
	echo. 選擇 NO	>> outlook_off_flag.txt
	timeout /t 300
	goto L0_start_01


:L0_CANCEL
echo Bye! Bye!
echo. 選擇 CANCEL	>> outlook_off_flag.txt
goto L0_EXIT
	
:L0_EXIT
echo Bye! Bye!
del D:\temp5_msg.vbs
exit

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