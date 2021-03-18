REM :: 顯示訊息,並設定600(M1_WT)秒無人按鍵自動結束
REM :: %1 顯示訊息
REM :: %2 自動關閉秒數 
REM :: %3 下次再提醒(休眠)300秒數
REM :: %2 < %3
REM :: %4 選擇 YES 則執行參數4 程式
SET M1_L3=
::REM@@ SET M1_L3="訊息測試_訊息測試_訊息測試_訊息測試_訊息測試_訊息測試" +vbCrLf+vbCrLf+vbCrLf
SET M1_L4=
::SET M1_L4="(1)按下 確定 , 關閉提醒離開本視窗後,再執行程式:  "+%M1_PGM_RUN% +vbCrLf
SET /A M1_AUTO_CLOSE=%2
set /A M1_SLEEP_Tsec=%3
set M1_PGM_RUN=%4



::REM@@ goto L1_END_DISP_HELP
IF (%1)==() (goto L1_DISP_HELP)
::REM %1 Message fo POP windows
SET M1_L3=%1% +vbCrLf+vbCrLf+vbCrLf
:L1_END_DISP_HELP
::REM@@ SET M1_L3="訊息測試_訊息測試_訊息測試_訊息測試_訊息測試_訊息測試" +vbCrLf+vbCrLf+vbCrLf


IF (%2)==() (goto L1_SET_AUTO_CLOSE_SECS)
SET /A M1_AUTO_CLOSE=%2
:L1_END_SET_AUTO_CLOSE_SECS


IF (%3)==() (goto L1_SET_SLEEP_SECS)
set /A M1_SLEEP_Tsec=%3
:L1_END_SET_SLEEP_SECS




SET M1_H1="_傳送工作提醒訊息_"
:: M1_H1=MagBox TITLE


SET M1_L1="訊息提醒  %M1_AUTO_CLOSE% 秒後,(表無人在螢幕前按下 按紐),則自動關閉提醒並離開程式" +vbCrLf
SET M1_L2="%tmp%\temp%num%.vbs" +vbCrLf+vbCrLf+vbCrLf
::SET M1_L2= ' '+%1%+' ' +vbCrLf+vbCrLf

SET M1_L4="(1)按下 確定 , 關閉提醒並離開" +vbCrLf
IF (%4)==() (goto L1_SET_PGM_RUN)
set M1_PGM_RUN=%4
SET M1_L4="(1)按下 確定 , 關閉提醒離開本視窗後,再執行程式:  "+%M1_PGM_RUN% +vbCrLf
:L1_END_SET_PGM_RUN


SET M1_L5="(2)按下 取消 , 休眠%M1_SLEEP_Tsec%秒,再次提醒" +vbCrLf++vbCrLf
:: M1_L1~l5 =MagBox content line1~5

::SET M1_BTN= vbQuestion + vbOKOnly + vbOKCancel + vbDefaultButton2
SET M1_BTN= vbQuestion + vbOKCancel + vbDefaultButton2

:: M1_BTN = Message   Icon + Button

echo %M1_L1%+%M1_L2%+%M1_L3%+%M1_L4%+%M1_L5%
::timeout /t 3600
set tmpfile=%tmp%\temp%random%.vbs
echo Set objShell = CreateObject("WScript.Shell") > %tmpfile%
echo x=objShell.PopUp( %M1_L1%+%M1_L2%+%M1_L3%+%M1_L4%+%M1_L5%, %M1_AUTO_CLOSE%, %M1_H1%, %M1_BTN% ) >> %tmpfile%
>>%tmpfile% echo wscript.quit X

:L1_start_01 
call %tmpfile%
echo you choice %ERRORLEVEL%
echo you choice %x%

IF %ERRORLEVEL% EQU 0 GOTO  L1_NO_BUTTON_CLICK
IF %ERRORLEVEL% EQU 1 GOTO  L1_YES
IF %ERRORLEVEL% EQU 2 GOTO  L1_CANCEL
GOTO L1_NO_BUTTON_CLICK

GOTO  L1_EXIT

:L1_YES
	%M1_PGM_RUN%
	goto L1_EXIT
	
:L1_CANCEL
	timeout /t %M1_SLEEP_Tsec%
	goto L1_start_01
	
:L1_NO_BUTTON_CLICK
	goto L1_EXIT
	
:L1_EXIT
DEL  %tmpfile%
echo Bye! Bye!

timeout /t 10
EXIT
REM:: MsgBox (prompt, [ buttons, ] [ title, ] [ helpfile, context ])
REM:: REM:: REM:: REM:: REM:: REM:: REM:: REM:: 
REM:: buttons 引數設定為：
REM::	常數					值		描述
REM::	vbOKOnly				0		僅顯示 [確定]**** 按鈕。
REM::	vbOKCancel				1		顯示 [確定]**** 與 [取消]**** 按鈕。
REM::	vbAbortRetryIgnore		2		顯示 [中止]****、[重試]****，和 [略過]**** 按鈕。
REM::	vbYesNoCancel			3		顯示 [是]****、[否]****，和 [取消]**** 按鈕。
REM::	vbYesNo					4		顯示 [是]**** 和 [否]**** 按鈕。
REM::	vbRetryCancel			5		顯示 [重試]**** 和 [取消]**** 按鈕。
REM::	vbCritical				16		顯示嚴重訊息圖示。
REM::	vbQuestion				32		顯示警告查詢圖示。
REM::	vbExclamation			48		顯示警告訊息圖示。
REM::	vbInformation			64		顯示資訊訊息圖示。
REM::	vbDefaultButton1		0		預設值是第一個按鈕。
REM::	vbDefaultButton2		256		預設值是第二個按鈕。
REM::	vbDefaultButton3		512		預設值是第三個按鈕。
REM::	vbDefaultButton4		768		預設值是第四個按鈕。
REM::	vbApplicationModal		0		應用程式強制回應；使用者必須回應訊息方塊，才能繼續使用目前的應用程式。
REM::	vbSystemModal			4096	系統強制回應；所有應用程式會暫停，直到使用者回應訊息方塊。
REM::	vbMsgBoxHelpButton		16384	新增說明訊息方塊的按鈕。
REM::	vbMsgBoxSetForeground	65536	指定訊息方塊視窗做為前景視窗。
REM::	vbMsgBoxRight			524288	文字是靠右對齊。
REM::	vbMsgBoxRtlReading		1048576	指定文字在希伯來語和阿拉伯語系統上應顯示為從右到左閱讀。

REM::傳回值
REM:: REM:: REM:: REM:: 
REM:: 常數		值	描述
REM:: vbOK		1	確定
REM:: vbCancel	2	Cancel
REM:: vbAbort	3	中止
REM:: vbRetry	4	重試
REM:: vbIgnore	5	Ignore
REM:: vbYes		6	是
REM:: vbNo		7	否



::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::SUB FUNCTION
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
EXIT
:L1_DISP_HELP
@echo off
cls
echo.
echo.
echo.
echo.
echo.	語法 Msg_choice_box.bat Message
echo.	語法 Msg_choice_box.bat M1 S1			S1:自動關閉秒數(60)
echo.	語法 Msg_choice_box.bat M1 S1 S2 		S2:下次再提醒(休眠)300秒數 [ S1 小於 S2 ]
echo.	語法 Msg_choice_box.bat M1 S1 S2 R1		R1:執行程式名稱 EX: "notepad.exe"
echo.	語法 Msg_choice_box.bat 顯示訊息 自動關閉秒數 下次再提醒(休眠)300秒數 "notepad.exe"
echo.
echo.
echo.	DEBUG範例    (1)  Msg_choice_box.bat 顯示訊息 
echo.	背景程式範例 (2)  Msg_choice_box.bat 顯示訊息 5
echo.	排程決定範例 (3)  Msg_choice_box.bat 顯示訊息 60 300   
echo.	排程決定範例 (4)  Msg_choice_box.bat 是否開啟記事本 60 600 "notepad.exe"
echo.	排程決定範例 (5)  Msg_choice_box.bat 是否登入簽到 60 600 "C:\Program Files\Internet Explorer\iexplore.exe" https://go.linyuan.com.tw/FKWeb/
echo.
echo.
echo.
echo.

timeout /t 99999
goto L1_EXIT


:L1_SET_AUTO_CLOSE_SECS
::重設自動關閉秒數
::SET /A M1_AUTO_CLOSE=%2
::REM :: %2 自動關閉秒數
SET /A M1_AUTO_CLOSE=60
GOTO L1_END_SET_AUTO_CLOSE_SECS


:L1_SET_SLEEP_SECS
::設定下次再提醒(休眠)300秒數
::SET /A M1_SLEEP_Tsec=%3 
::REM :: %3 下次再提醒(休眠)300秒數
set M1_SLEEP_Tsec=300

GOTO L1_END_SET_SLEEP_SECS

:L1_SET_PGM_RUN
::設定下次再提醒(休眠)300秒數
::SET /A M1_SLEEP_Tsec=%3 
::REM :: %3 下次再提醒(休眠)300秒數
set M1_PGM_RUN=echo. 執行程式名稱
GOTO L1_END_SET_PGM_RUN


