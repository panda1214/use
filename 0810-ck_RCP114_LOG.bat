@echo off
REM  程�??��?設�???Administrator 權�?
REM  https://dotblogs.com.tw/c5todo/2016/08/21/155005
REM
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
@echo off
REM  ftp://10.93.3.33/dn/common/	

echo X=MsgBox("�ˬd�u�@-�Ƶ{" +vbCrLf+ "***�ˬd����FTP�D�� ftp://10.93.3.33/dn/common/***" + vbCrLf+  vbCrLf+  "(1)���U[�O]_�Ұ��ˬd" +vbCrLf+ "(2)���U[����]������������,�h5����A����" +vbCrLf+ "(3)���U[�_]�h�����{�����ʧ@" ,vbYesNoCancel+vbQuestion,"�ǰe�u�@�����T��"^) > D:\temp_msg2.vbs
>>D:\temp_msg2.vbs echo wscript.quit X

D:
CD \Msg\Use
:L0_start_01
REM 20200821 CALL BEEP BEEP �iĵ�A����ؿ��U Alarm01.wav 1����========
start_cmd.vbs beep_bat.exe
REM 20200821 =========================================================

call D:\temp_msg2.vbs
echo %ERRORLEVEL%

IF %ERRORLEVEL% EQU 6 GOTO  L0_YES
IF %ERRORLEVEL% EQU 7 GOTO  L0_EXIT
IF %ERRORLEVEL% EQU 2 GOTO  L0_CANCEL
GOTO  L0_EXIT

:L0_YES
	"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" ftp://10.93.3.33/dn/common/
	goto L0_EXIT

	
:L0_CANCEL
	REM 20200821  KILL  BEEP BEEP �iĵ�A����ؿ��U Alarm01.wav 1����========
	REM sleep next time sstart loop
	"C:\WINDOWS\system32\tasklist.exe /FI "IMAGENAME eq beep_bat.exe"				
	"C:\WINDOWS\system32\taskkill.exe" /F /IM beep_bat.exe /T 		
	"C:\WINDOWS\system32\taskkill.exe" /F /IM beep_bat.exe /T 
	REM 20200821 =========================================================
	timeout /t 300
	goto L0_start_01
	
:L0_EXIT
echo Bye! Bye!
"C:\WINDOWS\system32\tasklist.exe /FI "IMAGENAME eq beep_bat.exe"				
"C:\WINDOWS\system32\taskkill.exe" /F /IM beep_bat.exe /T 		
"C:\WINDOWS\system32\taskkill.exe" /F /IM beep_bat.exe /T 		

EXIT



