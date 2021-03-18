::::::::::::::::::::::::::::
REM  timeout_sec.bat  45		&& 等待 45 秒
REM  timeout_sec.bat  		 	&& 等待 60 秒 (預設)
@echo off
CLS
set M0_Tsec=60

::::::::::::::::::::::::::::
::START L0_MAIN_START
::::::::::::::::::::::::::::
::L0_SET_SECS=60(預設)  

IF (%1)==() (goto L0_GO_SET_SECS)

:: (%1)NEQ() 
set M0_Tsec=%1%


:L0_END_SET_SECS
echo %1%
::pause


:L0_START_01

timeout /t %M0_Tsec%
REM :: M1_WT 顯示訊息,並設定傳入秒自動結束



:L0_EXIT
EXIT

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::SUB FUNCTION
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:L0_GO_SET_SECS
set M0_Tsec=60
GOTO L0_END_SET_SECS

EXIT