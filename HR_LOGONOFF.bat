@echo off
D:
CD \MSG\use
REM echo msgbox %M0_MSG_CHT_STR%,%M0_MSG_ICON%,"檢查檔案%DATE%-%TIME%">1.vbs && start 1.vbs && ping -n 2 127.1>nul && del 1.vbs
REM set M0_RUNDRIVE=D:
REM SET M0_RUNDIR=\msg\schedule
REM %M0_RUNDRIVE%
REM CD %M0_RUNDIR% 
regedit /s D:\cg_color.reg
set M1_tmpfile=%tmp%\temp%random%.vbs

echo X=MsgBox("工作提醒" +vbCrLf+ "記得進入人資系統簽到或簽退" +vbCrLf+ "如需5分鐘後再次提醒,請按下取消",vbYesNoCancel+vbQuestion,"傳送工作提醒訊息"^) > %M1_tmpfile%
>>%M1_tmpfile% echo wscript.quit X

:L0_START_01
call %M1_tmpfile%
echo %ERRORLEVEL%

IF %ERRORLEVEL% EQU 6 GOTO  L0_YES
IF %ERRORLEVEL% EQU 7 GOTO  L0_EXIT
IF %ERRORLEVEL% EQU 2 GOTO  L0_CANCEL
GOTO  L0_EXIT

:L0_CANCEL
timeout /t 300
GOTO L0_START_01

:L0_YES
"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" https://go.linyuan.com.tw/FKWeb/
:: start /max "C:\Program Files\Internet Explorer\iexplore.exe" https://go.linyuan.com.tw/FKWeb/
:: CALL D:\Msg\Use\Log_ID_pass.exe
GOTO L0_EXIT

:L0_EXIT
del %M1_tmpfile%
EXIT

