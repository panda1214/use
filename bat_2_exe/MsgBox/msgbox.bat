@echo off
REM echo msgbox %M0_MSG_CHT_STR%,%M0_MSG_ICON%,"檢查檔案%DATE%-%TIME%">1.vbs && start 1.vbs && ping -n 2 127.1>nul && del 1.vbs
REM set M0_RUNDRIVE=D:
REM SET M0_RUNDIR=\msg\schedule
REM %M0_RUNDRIVE%
REM CD %M0_RUNDIR% 

IF (%1)==() (goto L0_DISP_HELP)
set M0_CONSOLE_INPUT=%1%
IF (%2)==() (goto L0_SET_SECS)
set M0_Tsec=%2%
:L0_SET_SECS
SET M0_Tsec=300

:L0_START_01
echo X=MsgBox("***工作提醒訊息(不執行工作,只提醒訊息)***" +vbCrLf+vbCrLf+vbCrLf+ "%M0_CONSOLE_INPUT%" +vbCrLf+vbCrLf+vbCrLf+ "如需%M0_Tsec%秒後再次提醒,請按下取消",vbOKCancel+vbInformation+vbDefaultButton1+vbSystemModal+vbMsgBoxSetForeground,"傳送工作提醒訊息"^) > D:\temp_msg2.vbs
>>D:\temp_msg2.vbs echo wscript.quit X

call D:\temp_msg2.vbs
echo %ERRORLEVEL%


IF %ERRORLEVEL% EQU 2 GOTO  L0_CANCEL
GOTO  L0_EXIT

:L0_CANCEL
timeout /t %M0_Tsec%
GOTO L0_START_01

:L0_EXIT

EXIT


:L0_DISP_HELP
@echo on
cls
echo
echo 
echo 語法 msgbox.bat msg Tsec
echo MSG:  提示訊息
echo Tsec: 下一次再提醒秒數
echo 
pause
GOTO  L0_EXIT

::
::
::
