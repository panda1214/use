::::::::::::::::::::::::::::
REM  Get_admin_sample  
@echo off
CLS

REM::
GOTO L0_GET_ADMIN
REM  �{���۰ʳ]�w�� Administrator �v��
REM  https://dotblogs.com.tw/c5todo/2016/08/21/155005
REM
:L0_END_GET_ADMIN
REM::

:L0_MAIN_START
::::::::::::::::::::::::::::
::START L0_MAIN_START
::::::::::::::::::::::::::::
::REM ***** �{���Ѧ��V�U
::REM ***** �{���Ѧ��V�U
@echo off
D:
CD \Msg\Use

REM :: ��ܰT��,�ó]�w30����۰ʵ���
REM :: 
SET /A M1_WT= 1800
:: M1_WT =Message BOX Wait TIME seconds

SET M1_H1="***�ˬdPC�ƥ��˸m�O�_�w�Ƨ�***"
:: M1_H1=MagBox TITLE

SET M1_L1="������u�@,�u�����T��" +vbCrLf+vbCrLf
SET M1_L2="�бNDrive_F ����w�Щ�J" +vbCrLf
SET M1_L3="(1) �T�w    �|�Ұ��ˬd�w�ЪŶ��{��" +vbCrLf
SET M1_L4="(2) �_      �|���ˬd���}" +vbCrLf
SET M1_L5="(3) ����    �|5������A�q��" 
:: M1_L1~l5 =MagBox content line1~5


SET M1_BTN= vbQuestion + vbYesNoCancel
:: M1_BTN = Message   Icon + Button

echo %M1_L1%+%M1_L2%+%M1_L3%+%M1_L4%+%M1_L5%
::timeout /t 3600
echo Set objShell = CreateObject("WScript.Shell") > %tmp%\temp1.vbs
echo x=objShell.PopUp( %M1_L1%+%M1_L2%+%M1_L3%+%M1_L4%+%M1_L5%, %M1_WT%, %M1_H1%, %M1_BTN% ) >> %tmp%\temp1.vbs
>>%tmp%\temp1.vbs echo wscript.quit X


:L0_start_01
call %tmp%\temp1.vbs
echo you choice %ERRORLEVEL%


IF %ERRORLEVEL% EQU 6 GOTO  L0_YES
IF %ERRORLEVEL% EQU 7 GOTO  L0_EXIT
IF %ERRORLEVEL% EQU 2 GOTO  L0_CANCEL
GOTO  L0_EXIT

REM::	vbYesNoCancel			3		��� [�O]****�B[�_]****�A�M [����]**** ���s�C
REM::�Ǧ^��
REM:: REM:: REM:: REM:: 
REM:: �`��		��	�y�z
REM:: vbOK		1	�T�w
REM:: vbCancel	2	Cancel
REM:: vbAbort	3	����
REM:: vbRetry	4	����
REM:: vbIgnore	5	Ignore
REM:: vbYes		6	�O
REM:: vbNo		7	�_

:L0_YES
	IF NOT EXIST F: GOTO L0_CHECK_BACKUP_DRIVE
	::GOTO L9_GO_FINISH_MSG
	:::L9_END_FINISH_MSG
	CALL msg_str_sec_bye.exe PC�ƥ��˸m�w�Ƨ� 300
	::CALL 0600-ck_HardDisk_Space.exe
	goto L0_EXIT

	
:L0_CANCEL
	timeout /t 300
	goto L0_start_01
	
:L0_EXIT
::::::::::::::::::::::::::::
::END START L0_MAIN_START
::::::::::::::::::::::::::::
echo Bye! Bye!
del %tmp%\temp1.vbs

EXIT





::REM ***** �{���Ѧ��V�W
::REM ***** �{���Ѧ��V�W
EXIT

:L0_CHECK_BACKUP_DRIVE
CALL msgbox.exe ��1������NDrive_F ����w�Щ�J 30
GOTO L0_start_01


:L0_GET_ADMIN
REM  �{���۰ʳ]�w�� Administrator �v��
REM  https://dotblogs.com.tw/c5todo/2016/08/21/155005
REM
@echo off
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
ENDLOCAL 

GOTO L0_END_GET_ADMIN

::::::::::::::::::::::::::::
::finish Work Successful 
::::::::::::::::::::::::::::
:L9_GO_FINISH_MSG
REM :: M1_WT ��ܰT��,�ó]�w300��۰ʵ���
REM :: 
:: M1_WT =Message BOX Wait TIME seconds
SET /A M9_WT=300

SET M9_H1="�T���q��"
:: M9_H1=MagBox TITLE

SET M9_L1="PC�ƥ��˸m�w�Ƨ�" +vbCrLf+vbCrLf
SET M9_L2="PC�ƥ��˸m�w�Ƨ�"
:: M9_L1~l5 =MagBox content line1~5


SET M9_BTN= vbInformation + vbOKOnly
:: M9_BTN = Message   Icon + Button

echo %M9_L1%+%M1_L2%

echo Set objShell = CreateObject("WScript.Shell") > %tmp%\tempmsg.vbs
echo x=objShell.PopUp( %M9_L1%+%M9_L2%,%M9_WT%, %M9_H1%, %M9_BTN% ) >> %tmp%\tempmsg.vbs
>>%tmp%\tempmsg.vbs echo wscript.quit X

	
CALL %tmp%\tempmsg.vbs
DEL %tmp%\tempmsg.vbs
GOTO L9_END_FINISH_MSG

::[���� BAT EXE ��=======�U�����̤W��]
::======================
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

