REM :: 顯示訊息,並設定60秒自動結束
REM :: 
REM :: 

SET M1_H1="傳送工作提醒訊息"
:: M1_H1=MagBox TITLE

SET M1_L1="不執行工作,只提醒訊息" +vbCrLf+vbCrLf
SET M1_L2="LINE 2 Test Me" +vbCrLf
SET M1_L3="LINE 3 Test Me" +vbCrLf
SET M1_L4="LINE 4 Test Me" +vbCrLf
SET M1_L5="LINE 5 Test Me" 
:: M1_L1~l5 =MagBox content line1~5

SET /A M1_WT= 60
:: M1_WT =Message BOX Wait TIME seconds

SET M1_BTN= vbQuestion + vbOKOnly
:: M1_BTN = Message   Icon + Button

echo %M1_L1%+%M1_L2%+%M1_L3%+%M1_L4%+%M1_L5%
::timeout /t 3600
echo Set objShell = CreateObject("WScript.Shell") > %tmp%\temp1.vbs
echo x=objShell.PopUp( %M1_L1%+%M1_L2%+%M1_L3%+%M1_L4%+%M1_L5%, 10, %M1_H1%, %M1_BTN% ) >> %tmp%\temp1.vbs
>>%tmp%\temp1.vbs echo wscript.quit X

call %tmp%\temp1.vbs

echo you choice %ERRORLEVEL%


IF %ERRORLEVEL% EQU 6 GOTO  L0_YES
IF %ERRORLEVEL% EQU 7 GOTO  L0_EXIT
IF %ERRORLEVEL% EQU 2 GOTO  L0_CANCEL



del  %tmp%\temp1.vbs



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

