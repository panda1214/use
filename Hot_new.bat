@echo off
REM :: 顯示訊息,並設定60秒自動結束
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
SET M1_H1="詢問是否打開喇叭訊息提醒視窗"
:: M1_H1=MagBox TITLE

SET M1_L1="工作提醒" +vbCrLf+vbCrLf
SET M1_L2="***本程式如未選擇: 表示無人值守 1800 秒後自動結束程式***" +vbCrLf+vbCrLf
SET M1_L3="(1)按下[是]_請打開喇叭" +vbCrLf+vbCrLf
SET M1_L4="(2)按下[否]則結束程式不動作" +vbCrLf+vbCrLf
SET M1_L5="(3)按下[取消]取消本次提醒,則5分後再提醒"
:: M1_L1~l5 =MagBox content line1~5
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
REM :: echo X=MsgBox("工作提醒" +vbCrLf+ "***本程式如未選擇: 表示無人值守_0710_1410_另一排程會結束程式***" + vbCrLf+  vbCrLf+ "(1)按下[是]_請打開喇叭" +vbCrLf+ "(2)按下[取消]取消本次提醒,則5分後再提醒" +vbCrLf+ "(3)按下[否]則結束程式不動作" ,vbYesNoCancel+vbQuestion,"傳送工作提醒訊息"^) > D:\temp_msg2.vbs
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
	D:\Msg\Use\EXE\nircmd.exe mutesysvolume 0
	D:\Msg\Use\EXE\nircmd.exe setsysvolume 65535 
	D:\Msg\Use\EXE\msg_str_sec_bye.exe 喇叭音量已打開 30
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
	echo  找不到  %M0_RUNDIR% 目錄 ，請把 nircmd.exe msg_str_sec_bye.exe 放入該目錄 %M0_RUNDIR%
	TIMEOUT /T 36000
GOTO L0_EXIT
:L0_CK_FILE_ERR02
	echo  找不到  %M0_RUNDIR%\msg_str_sec_bye.exe 檔案 ，請把 msg_str_sec_bye.exe 放入該目錄
	TIMEOUT /T 36000
GOTO L0_EXIT
:L0_CK_FILE_ERR01
	echo  找不到  %M0_RUNDIR%\nircmd.exee 檔案 ，請把 nircmd.exe 放入該目錄
	TIMEOUT /T 36000
GOTO L0_EXIT


	
	