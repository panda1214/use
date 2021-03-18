::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJHaR4E4/JxBoZQeNMle3A6YP6e/+oeOErS0=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdFu5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJHSX834FOx5oTgWWAzmFA60Z1OXo6NWUtl8iR+c8R43C3/qLOOVz
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
::::::::::::::::::::::::::::
REM  msg_str_sec_bye.bat  傳入訊息字串 10
@echo off
CLS

::::::::::::::::::::::::::::
::START L0_MAIN_START
::::::::::::::::::::::::::::
::L0_DISP_HELP='傳入訊息字串'
::L0_SET_SECS=300(預設)  訊息視窗若無人按下確定, 多少秒後訊息視窗停止執行(無人值守用)

IF (%1)==() (goto L0_DISP_HELP)
set M0_CONSOLE_INPUT=%1%
IF (%2)==() (goto L0_SET_SECS)
set M0_Tsec=%2%

:L0_END_SET_SECS

:L0_START_01
REM :: M1_WT 顯示訊息,並設定300秒自動結束
REM :: 
:: M1_WT =Message BOX Wait TIME seconds
SET /A M9_WT=M0_Tsec
SET M9_H1="          工作提醒訊息(不執行工作,只提醒訊息_預設10秒自動關閉提醒訊息)          "
:: M9_H1=MagBox TITLE
SET M9_L1=" %1% "+vbCrLf+vbCrLf
:: M9_L1~l5 =MagBox content line1~5
SET M9_BTN= vbInformation + vbOKOnly
:: M9_BTN = Message   Icon + Button
echo %M9_L1%

:L0_START_02
echo Set objShell = CreateObject("WScript.Shell") > %tmp%\_tempmsg.vbs
echo x=objShell.PopUp( %M9_L1%,%M9_WT%,%M9_H1%, %M9_BTN% ) >> %tmp%\_tempmsg.vbs
>>%tmp%\_tempmsg.vbs echo wscript.quit X
	
CALL %tmp%\_tempmsg.vbs
DEL %tmp%\_tempmsg.vbs


:L0_EXIT
EXIT

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::SUB FUNCTION
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
EXIT
:L0_DISP_HELP
@echo on
cls

::echo 語法 msgbox.bat msg Tsec
::echo MSG:  提示訊息
::echo Tsec: 訊息停留秒數
::echo 
REM :: M1_WT 顯示訊息,並設定300秒自動結束
REM :: 
:: M1_WT =Message BOX Wait TIME seconds
SET /A M9_WT=300
SET M9_H1="          工作提醒訊息(不執行工作,只提醒訊息)          "
:: M9_H1=MagBox TITLE
SET M9_L1="語法 msgbox.bat msg Tsec "+ vbCrLf + vbCrLf+ "MSG:  提示訊息" + vbCrLf + "Tsec:  訊息停留秒數" + vbCrLf
:: M9_L1~l5 =MagBox content line1~5
SET M9_BTN= vbInformation + vbOKOnly
:: M9_BTN = Message   Icon + Button
GOTO L0_START_02


:L0_GO_SET_SECS
SET M0_Tsec=300
GOTO L0_END_SET_SECS