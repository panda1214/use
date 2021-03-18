::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJHaR4E4/JxBoZQeNMleFCLAI6+78oeOErS0=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
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
::Zh4grVQjdCuDJHSX834FOx5oaTynAEm1CaEz28X+4f+4gUUSXeE6MKzT27qJJd882QzYdp4s2H1lt/hCCQNdHg==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
::@echo off
REM **************************************************************************
REM :: 1.詢問是否切換開機作業系統
REM :: 2.是否密碼到期前7日 ,加上本程式 pwd_date_Plus.exe到排程
REM :: schtasks /Create /SD %M0_NEXTRUNDAY% /ST 09:00:00 /SC daily /TN "0900-檢查密碼到期日期排程"  /TR "d:\msg\use\pwd_date_Plus.exe"	
::setlocal enableDelayedExpansion

REM::  ************************************
REM::  程式自動設定為 Administrator 權限**
GOTO L0_GET_ADMIN
:L0_END_GET_ADMIN

:L0_GET BOOT DESC
REM::  ************************************
REM::  GET BOOT DESC
SET M0_TAGFIL1=%tmp%\bcdedit.log
bcdedit > %tmp%\bcdedit.log

REM *************************************************************************************************
REM : 找出中文姓名 (全名)
for /f "usebackq tokens=1-4 delims= " %%i IN (`FIND "全名" %M0_TAGFIL1% `) DO (
	SET M0_i=%%i
	SET M0_j=%%j
	SET M0_k=%%k
	SET M0_l=%%l
	)
set M0_LOGON_USER=%M0_j%
REM M0_LOGON_USER=登入帳號中文姓名
REM : 找出中文姓名 (全名)
REM *************************************************************************************************
REM::  ************************************



REM::  ************************************
REM::  主程式   主程式  主程式   主程式
REM::  L0_MAIN_START_001	
:L0_MAIN_START_001
REM::  ************************************
REM::  **	詢問是否切換開機作業系統提醒視窗**

SET M1_H1="詢問是否切換開機作業系統提醒視窗"
:: M1_H1=MagBox TITLE
SET M1_L1="工作提醒" +vbCrLf+vbCrLf
SET M1_L2="***本程式如未選擇: 表示無人值守 10分 後自動結束程式***" +vbCrLf+vbCrLf
SET M1_L3="(1)按下[是]_切換開機系統 Win10" +vbCrLf+vbCrLf
SET M1_L4="(2)按下[否]_切換開機系統 Win7_Pro" +vbCrLf+vbCrLf
SET M1_L5="(3)按下[取消]離開本程式"
:: M1_L1~l5 =MagBox content line1~5
SET /A M1_WT=600
:: M1_WT =Message BOX Wait TIME seconds
SET M1_BTN= vbYesNoCancel+vbQuestion
:: M1_BTN = Message   Icon + Button

echo %M1_L1%+%M1_L2%+%M1_L3%+%M1_L4%+%M1_L5%
::timeout /t 3600

:L0_START_01
echo Set objShell = CreateObject("WScript.Shell") > %tmp%\temp1.vbs
echo x=objShell.PopUp( %M1_L1%+%M1_L2%+%M1_L3%+%M1_L4%+%M1_L5%, %M1_WT%, %M1_H1%, %M1_BTN% ) >> %tmp%\temp1.vbs
>>%tmp%\temp1.vbs echo wscript.quit X

call %tmp%\temp1.vbs
echo %ERRORLEVEL%

IF %ERRORLEVEL% EQU 6 GOTO  L0_YES
IF %ERRORLEVEL% EQU 7 GOTO  L0_NO
IF %ERRORLEVEL% EQU 2 GOTO  L0_EXIT
GOTO  L0_EXIT
REM::傳回值
REM:: 常數		值	描述
REM:: vbOK		1	確定
REM:: vbCancel	2	Cancel
REM:: vbAbort	3	中止
REM:: vbRetry	4	重試
REM:: vbIgnore	5	Ignore
REM:: vbYes		6	是
REM:: vbNo		7	否

:L0_YES
	::REM Change boot From Win_10
	bcdedit /default {676e0dcc-7abd-11ea-8d1e-b1ab3c2d891c}
	goto L0_EXIT

	
:L0_No
	::REM Change boot From Win7
	bcdedit /default {c8181279-fc81-11ea-af16-4439c438c5c2}
	goto L0_EXIT
	
:L0_EXIT
bcdedit > %tmp%\bcdedit.log
::timeout /t 3600
::GOTO L0_READ_TXTMSG
::L0_END_READ_TXTMSG
notepad.exe  %tmp%\bcdedit.log

echo Bye! Bye!
EXIT


EXIT
:L0_GET_ADMIN
::@echo off
REM  程式自動設定為 Administrator 權限
REM  https://dotblogs.com.tw/c5todo/2016/08/21/155005
REM
CLS
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

GOTO L0_END_GET_ADMIN

::REM use admin cmd box 		bcdedit > d:\bcdedit.txt
::REM Windows 開機管理程式
::REM --------------------
::REM identifier              {bootmgr}
::REM device                  partition=\Device\HarddiskVolume8
::REM path                    \EFI\Microsoft\Boot\bootmgfw.efi
::REM description             Windows Boot Manager
::REM locale                  zh-TW
::REM inherit                 {globalsettings}
::REM default                 {default}
::REM resumeobject            {676e0dcb-7abd-11ea-8d1e-b1ab3c2d891c}
::REM displayorder            {current}
::REM                         {default}
::REM toolsdisplayorder       {memdiag}
::REM timeout                 7

::REM Windows 開機載入器
::REM -------------------
::REM identifier              {current}
::REM device                  partition=C:
::REM path                    \Windows\system32\winload.efi
::REM description             Windows 10
::REM locale                  zh-TW
::REM inherit                 {bootloadersettings}
::REM recoverysequence        {676e0dd9-7abd-11ea-8d1e-b1ab3c2d891c}
::REM displaymessageoverride  Recovery
::REM recoveryenabled         Yes
::REM isolatedcontext         Yes
::REM allowedinmemorysettings 0x15000075
::REM osdevice                partition=C:
::REM systemroot              \Windows
::REM resumeobject            {676e0dcb-7abd-11ea-8d1e-b1ab3c2d891c}
::REM nx                      OptIn
::REM bootmenupolicy          Standard
::REM hypervisorlaunchtype    Off

::REM Windows 開機載入器
::REM -------------------
::REM identifier              {default}
::REM device                  partition=G:
::REM path                    \Windows\system32\winload.efi
::REM description             Win 7_pro
::REM locale                  zh-TW
::REM osdevice                partition=G:
::REM systemroot              \Windows
::REM resumeobject            {5548bddc-fc82-11ea-8763-806e6f6e6963}
::REM bootmenupolicy          Standard

:L0_READ_TXTMSG
set M1_VBS=%tmp%\temp234.vbs
set M1_VBS=D:\temp234.vbs
echo' > %M1_VBS%
echo Dim strPath,strText				>> %M1_VBS%
echo strPath = "%M1_VBS%\bcdedit.log"	>> %M1_VBS%
echo '呼叫函式							>> %M1_VBS%
echo Call CreateFile(strPath)			>> %M1_VBS%
  
echo Sub CreateFile(strPath)			>> %M1_VBS%
  echo Dim objFso,objStream,str			>> %M1_VBS%
  echo '建立FileSystemObject物件		>> %M1_VBS%
  echo Set objFso = CreateObject ("Scripting.FileSystemObject")	>> %M1_VBS%
  echo '以只讀的方式開啟檔案，如果檔案不存在則建立它			>> %M1_VBS%
  echo 'Set objStream = objFso.OpenTextFile(strPath,1,true)		>> %M1_VBS%
  echo '如果當前的指標不在行末，則讀取文字內容					>> %M1_VBS%
  echo 'Do While objStream.AtEndOfLine <> true					>> %M1_VBS%
  echo '  str = str + objStream.Read(1)							>> %M1_VBS%
  echo 'Loop													>> %M1_VBS%
  echo 'msgbox str												>> %M1_VBS%
  echo str = ""													>> %M1_VBS%
  echo Set objStream = objFso.OpenTextFile(strPath,1,true)		>> %M1_VBS%
  echo '如果當前的指標不在文字末端，則讀取文字內容				>> %M1_VBS%
  echo Do While objStream.AtEndOfStream <> true					>> %M1_VBS%
  echo    str = str + objStream.Read(1)							>> %M1_VBS%
  echo Loop														>> %M1_VBS%
  echo MsgBox str												>> %M1_VBS%
  echo '關閉TextStream物件										>> %M1_VBS%
  echo objStream.Close											>> %M1_VBS%
  echo End Sub													>> %M1_VBS%
:: >>%M1_VBS%\temp234.vbs
echo wscript.quit X
call %M1_VBS%\temp234.vbs
::del %M1_VBS%\temp234.vbs
timeout /t 3600
GOTO L0_END_READ_TXTMSG