@echo off
REM :: ��ܰT��,�ó]�w60��۰ʵ���
REM :: 
REM :: 

echo.
echo.
echo.
echo.
D:
SET M0_RUNDIR=\Msg\Use
CD %M0_RUNDIR%
IF NOT EXIST %M0_RUNDIR% GOTO L0_CK_FILE_ERR01
IF NOT EXIST %M0_RUNDIR%\msg_str_sec_bye.eee GOTO  L0_CK_FILE_ERR02


@echo off
:L0_MAIN_START01
SET M1_H1="�O�o�i�J�H��t��ñ���ñ�h"
:: M1_H1=MagBox TITLE

SET M1_L1="�u�@����" +vbCrLf+vbCrLf
SET M1_L2="***���{���p�����: ��ܵL�H�Ȧu 1800 ���۰ʵ����{��***" +vbCrLf+vbCrLf
SET M1_L3="(1)���U[�O]_�i�J�H��t��ñ���ñ�h" +vbCrLf+vbCrLf
SET M1_L4="(2)���U[�_]�h�����{�����ʧ@" +vbCrLf+vbCrLf
SET M1_L5="(3)���U[����]������������,�h5����A����"
:: M1_L1~l5 =MagBox content line1~5
:: REM ���{���p�����: ��ܵL�H�Ȧu 1800 ���۰ʵ����{��
SET /A M1_WT=1800
:: M1_WT =Message BOX Wait TIME seconds
SET M1_BTN= vbYesNoCancel+vbQuestion
:: M1_BTN = Message   Icon + Button

echo %M1_L1%+%M1_L2%+%M1_L3%+%M1_L4%+%M1_L5%
::timeout /t 3600
echo Set objShell = CreateObject("WScript.Shell") > %tmp%\temp1.vbs
echo x=objShell.PopUp( %M1_L1%+%M1_L2%+%M1_L3%+%M1_L4%+%M1_L5%, %M1_WT%, %M1_H1%, %M1_BTN% ) >> %tmp%\temp1.vbs
>>%tmp%\temp1.vbs echo wscript.quit X


REM :: start D:\Msg\Use\beep_bat.exe 
REM :: echo X=MsgBox("�u�@����" +vbCrLf+ "***���{���p�����: ��ܵL�H�Ȧu_0710_1410_�t�@�Ƶ{�|�����{��***" + vbCrLf+  vbCrLf+ "(1)���U[�O]_�Х��}��z" +vbCrLf+ "(2)���U[����]������������,�h5����A����" +vbCrLf+ "(3)���U[�_]�h�����{�����ʧ@" ,vbYesNoCancel+vbQuestion,"�ǰe�u�@�����T��"^) > D:\temp_msg2.vbs
REM :: >>D:\temp_msg2.vbs echo wscript.quit X

 
:L0_start_01 
call %tmp%\temp1.vbs
REM :: call D:\temp_msg2.vbs
echo %ERRORLEVEL%

IF %ERRORLEVEL% EQU 2 GOTO  L0_CANCEL
IF %ERRORLEVEL% EQU 6 GOTO  L0_YES
IF %ERRORLEVEL% EQU 7 GOTO  L0_EXIT

GOTO  L0_EXIT

:L0_YES
	:: "C:\Program Files\Internet Explorer\iexplore.exe" https://go.linyuan.com.tw/FKWeb/
	start /max "C:\Program Files\Internet Explorer\iexplore.exe" https://go.linyuan.com.tw/FKWeb/
	::CALL D:\Msg\Use\Log_ID_pass.exe
	goto L0_EXIT

	
:L0_CANCEL
	timeout /t 300
	goto L0_start_01
	
:L0_EXIT
echo Bye! Bye!

timeout /t 3
EXIT

EXIT
REM :: :::::::::::::::::::::::::::::::::::::::::::::::::::
REM :: 	SUB FUNCTION
REM :: :::::::::::::::::::::::::::::::::::::::::::::::::::
:L0_CK_FILE_ERR01
	echo  �䤣��  %M0_RUNDIR% �ؿ� �A�Ч� nircmd.exe msg_str_sec_bye.eee ��J�ӥؿ� %M0_RUNDIR%

	TIMEOUT /T 36000
GOTO L0_EXIT
:L0_CK_FILE_ERR02
	echo  �䤣��  %M0_RUNDIR%\msg_str_sec_bye.eee �ɮ� �A�Ч� msg_str_sec_bye.eee ��J�ӥؿ�
	TIMEOUT /T 36000
GOTO L0_EXIT



	
	