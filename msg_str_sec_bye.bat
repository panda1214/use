REM  msg_str_sec_bye.bat  �ǤJ�T���r�� 10
@echo off
CLS
SETLOCAL
::::::::::::::::::::::::::::
::START L0_MAIN_START
::::::::::::::::::::::::::::
::L0_DISP_HELP='�ǤJ�T���r��'
::L0_SET_SECS=300(�w�])  �T�������Y�L�H���U�T�w, �h�֬��T�������������(�L�H�Ȧu��)

IF (%1)==() (goto L0_DISP_HELP)
set M0_CONSOLE_INPUT=%1
IF (%2)==() (goto L0_SET_SECS)
set /A M9_WT=%2

:L0_END_SET_SECS

:L0_START_01
REM :: M1_WT ��ܰT��,�ó]�w300��۰ʵ���
REM :: 
:: M1_WT =Message BOX Wait TIME seconds

SET M9_H1="          �u�@�����T��(������u�@,�u�����T��_�w�]10��۰����������T��)          "
:: M9_H1=MagBox TITLE
SET M9_L1= %1 +vbCrLf+vbCrLf
REM CMD �ǤJ�r�� �w�] " "
:: M9_L1~l5 =MagBox content line1~5
SET M9_BTN= vbInformation + vbOKOnly
:: M9_BTN = Message   Icon + Button
echo %M9_L1%
echo %M9_WT%


:L0_START_02
set M9_tmpfile=%tmp%\temp%random%.vbs
ECHO %M9_tmpfile%



echo Set objShell = CreateObject("WScript.Shell") > %M9_tmpfile%
echo x=objShell.PopUp( %M9_L1%,%M9_WT%,%M9_H1%, %M9_BTN% ) >> %M9_tmpfile%
echo wscript.quit X >>%M9_tmpfile% 


CLS
%M9_tmpfile%

echo you choice ERRORLEVEL %ERRORLEVEL%

ECHO %M9_tmpfile%
DEL %M9_tmpfile%
ENDLOCAL

EXIT /B 0



::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::SUB FUNCTION
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
EXIT
:L0_DISP_HELP
@echo on
cls

::echo �y�k msgbox.bat msg Tsec
::echo MSG:  ���ܰT��
::echo Tsec: �T�����d���
::echo 
REM :: M1_WT ��ܰT��,�ó]�w300��۰ʵ���
REM :: 
:: M1_WT =Message BOX Wait TIME seconds
SET /A M9_WT=300
SET M9_H1="          �u�@�����T��(������u�@,�u�����T��)          "
:: M9_H1=MagBox TITLE
SET M9_L1="�y�k msgbox.bat msg Tsec "+ vbCrLf + vbCrLf+ "MSG:  ���ܰT��" + vbCrLf + "Tsec:  �T�����d���" + vbCrLf
:: M9_L1~l5 =MagBox content line1~5
SET M9_BTN= vbInformation + vbOKOnly
:: M9_BTN = Message   Icon + Button
GOTO L0_START_02


:L0_GO_SET_SECS
set /A M9_WT=10
GOTO L0_END_SET_SECS