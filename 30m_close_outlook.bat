REM **************************************
REM SUB FUNC  30m_close_outlook.exe
REM **************************************
@echo off
GOTO L0_start_Admin
REM ************************************************************
REM �{���۰ʳ]�w�� Administrator �v��
REM ************************************************************
:L0_start_Admin01

DEL D:\temp5_msg.vbs

echo. > d:\temp5_check.log
echo. > d:\outlook_off_flag.txt
echo. **************************************************	>> outlook_off_flag.txt
echo. �{���W�� D:\Msg\Schedule\30M_close_outlook.bat		>> outlook_off_flag.txt
echo. �{������ɶ� %ex%-%y%-%z%,%time%  					>> outlook_off_flag.txt
echo. **************************************************	>> outlook_off_flag.txt


echo X=MsgBox("�u�@����" +vbCrLf+ "***���{���p�����: ��ܵL�H�Ȧu_�h5�����N�۰ʵ����{��_��������B�z***" + vbCrLf+  vbCrLf+ "(1)���U[�O]_���� OUTLOOK" +vbCrLf+"(2)���U[�_]�h�����{�����ʧ@" +vbCrLf+ "(3)���U[����]�N������������_5����A����" ,vbYesNoCancel+vbQuestion+vbDefaultButton2,"�ǰe�u�@�����T��"^) > D:\temp5_msg.vbs
>>D:\temp5_msg.vbs echo wscript.quit X
REM echo X=MsgBox("�u�@����" +vbCrLf+ "***���{���p�����: ��ܵL�H�Ȧu_1405�t�@�Ƶ{�|�����{��***" + vbCrLf+  vbCrLf+ "(1)���U[�O]_�Х��}��z" +vbCrLf+"(2)���U[����]������������_�h5����A����" +vbCrLf+ "(3)���U[�_]�h�����{�����ʧ@" ,vbYesNoCancel+vbQuestion,"�ǰe�u�@�����T��"^) > D:\temp_msg2.vbs
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
	echo. ��� YES	>> outlook_off_flag.txt
	goto L0_EXIT
	
:L0_NO
	REM sleep next time sstart loop
	echo. ��� NO	>> outlook_off_flag.txt
	timeout /t 300
	goto L0_start_01


:L0_CANCEL
echo Bye! Bye!
echo. ��� CANCEL	>> outlook_off_flag.txt
goto L0_EXIT
	
:L0_EXIT
echo Bye! Bye!
del D:\temp5_msg.vbs
exit

:L0_start_Admin	
REM ************************************************************
REM �{���۰ʳ]�w�� Administrator �v��
REM ************************************************************
REM  �{���۰ʳ]�w�� Administrator �v��
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