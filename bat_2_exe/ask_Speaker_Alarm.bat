@echo off
REM :: ��ܰT��,�ó]�w60��۰ʵ���
REM :: 
REM :: 
SET M0_RUNDIR=D:\Msg\Use
echo.
echo.
echo.
echo.
IF NOT EXIST %M0_RUNDIR% GOTO L0_CK_FILE_ERR01
IF NOT EXIST %M0_RUNDIR%\nircmd.exe GOTO  L0_CK_FILE_ERR02
IF NOT EXIST %M0_RUNDIR%\msg_str_sec_bye.exe GOTO  L0_CK_FILE_ERR01

@echo off
:L0_MAIN_START01
SET M1_H1="�߰ݬO�_���}_��z��_Free_Alarm_Clock�T����������"
:: M1_H1=MagBox TITLE

SET M1_L1="�u�@����" +vbCrLf+vbCrLf
SET M1_L2="***���{���p�����: ��ܵL�H�Ȧu 1800 ���۰ʵ����{��***" +vbCrLf+vbCrLf
SET M1_L3="(1)���U[�O]_�N���}��z���q��_Free_Alarm_Clock_AP" +vbCrLf+vbCrLf
SET M1_L4="(2)���U[�_]_�h�����{�����ʧ@" +vbCrLf+vbCrLf
SET M1_L5="(3)���U[����]������������,�h5����A����"
:: M1_L1~l5 =MagBox content line1~5
SET /A M1_WT=1800
:: M1_WT =Message BOX Wait TIME seconds
SET M1_BTN= vbQuestion + vbYesNoCancel
:: M1_BTN = Message   Icon + Button

echo %M1_L1%+%M1_L2%+%M1_L3%+%M1_L4%+%M1_L5%
::timeout /t 3600
echo Set objShell = CreateObject("WScript.Shell") > %tmp%\temp1.vbs
echo x=objShell.PopUp( %M1_L1%+%M1_L2%+%M1_L3%+%M1_L4%+%M1_L5%, %M1_WT%, %M1_H1%, %M1_BTN% ) >> %tmp%\temp1.vbs
>>%tmp%\temp1.vbs echo wscript.quit X

 
:L0_start_01 
call %tmp%\temp1.vbs
REM :: call D:\temp_msg2.vbs
echo %ERRORLEVEL%

IF %ERRORLEVEL% EQU 2 GOTO  L0_CANCEL
IF %ERRORLEVEL% EQU 6 GOTO  L0_YES
IF %ERRORLEVEL% EQU 7 GOTO  L0_EXIT

GOTO  L0_EXIT

:L0_YES
	D:
	CD %M0_RUNDIR%
	CALL %M0_RUNDIR%\nircmd.exe mutesysvolume 0
	CALL %M0_RUNDIR%\nircmd.exe setsysvolume 65535 
	%M0_RUNDIR%\Trayconizer.exe "C:\Program Files (x86)\FreeAlarmClock\FreeAlarmClock.exe"
	CALL %M0_RUNDIR%\WIN_D.exe
	CALL %M0_RUNDIR%\EXE\msg_str_sec_bye.exe ��z���q��ree_Alarm_Clock_AP_�w���}_ 30
	goto L0_EXIT

	
:L0_CANCEL
	timeout /t 300
	goto L0_start_01
	
:L0_EXIT
echo Bye! Bye!

::timeout /t 3
EXIT

EXIT
REM :: :::::::::::::::::::::::::::::::::::::::::::::::::::
REM :: 	SUB FUNCTION
REM :: :::::::::::::::::::::::::::::::::::::::::::::::::::
:L0_CK_FILE_ERR01
	echo  �䤣��  %M0_RUNDIR% �ؿ� �A�Ч� nircmd.exe msg_str_sec_bye.exe ��J�ӥؿ� %M0_RUNDIR%
	TIMEOUT /T 36000
GOTO L0_EXIT
:L0_CK_FILE_ERR02
	echo  �䤣��  %M0_RUNDIR%\msg_str_sec_bye.exe �ɮ� �A�Ч� msg_str_sec_bye.exe ��J�ӥؿ�
	TIMEOUT /T 36000
GOTO L0_EXIT
:L0_CK_FILE_ERR01
	echo  �䤣��  %M0_RUNDIR%\nircmd.exee �ɮ� �A�Ч� nircmd.exe ��J�ӥؿ�
	TIMEOUT /T 36000
GOTO L0_EXIT


	
	