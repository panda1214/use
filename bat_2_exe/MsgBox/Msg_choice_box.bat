REM :: ��ܰT��,�ó]�w600(M1_WT)��L�H����۰ʵ���
REM :: %1 ��ܰT��
REM :: %2 �۰�������� 
REM :: %3 �U���A����(��v)300���
REM :: %2 < %3
REM :: %4 ��� YES �h����Ѽ�4 �{��
SET M1_L3=
::REM@@ SET M1_L3="�T������_�T������_�T������_�T������_�T������_�T������" +vbCrLf+vbCrLf+vbCrLf
SET M1_L4=
::SET M1_L4="(1)���U �T�w , �����������}��������,�A����{��:  "+%M1_PGM_RUN% +vbCrLf
SET /A M1_AUTO_CLOSE=%2
set /A M1_SLEEP_Tsec=%3
set M1_PGM_RUN=%4



::REM@@ goto L1_END_DISP_HELP
IF (%1)==() (goto L1_DISP_HELP)
::REM %1 Message fo POP windows
SET M1_L3=%1% +vbCrLf+vbCrLf+vbCrLf
:L1_END_DISP_HELP
::REM@@ SET M1_L3="�T������_�T������_�T������_�T������_�T������_�T������" +vbCrLf+vbCrLf+vbCrLf


IF (%2)==() (goto L1_SET_AUTO_CLOSE_SECS)
SET /A M1_AUTO_CLOSE=%2
:L1_END_SET_AUTO_CLOSE_SECS


IF (%3)==() (goto L1_SET_SLEEP_SECS)
set /A M1_SLEEP_Tsec=%3
:L1_END_SET_SLEEP_SECS




SET M1_H1="_�ǰe�u�@�����T��_"
:: M1_H1=MagBox TITLE


SET M1_L1="�T������  %M1_AUTO_CLOSE% ���,(��L�H�b�ù��e���U ����),�h�۰��������������}�{��" +vbCrLf
SET M1_L2="%tmp%\temp%num%.vbs" +vbCrLf+vbCrLf+vbCrLf
::SET M1_L2= ' '+%1%+' ' +vbCrLf+vbCrLf

SET M1_L4="(1)���U �T�w , �������������}" +vbCrLf
IF (%4)==() (goto L1_SET_PGM_RUN)
set M1_PGM_RUN=%4
SET M1_L4="(1)���U �T�w , �����������}��������,�A����{��:  "+%M1_PGM_RUN% +vbCrLf
:L1_END_SET_PGM_RUN


SET M1_L5="(2)���U ���� , ��v%M1_SLEEP_Tsec%��,�A������" +vbCrLf++vbCrLf
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
REM:: buttons �޼Ƴ]�w���G
REM::	�`��					��		�y�z
REM::	vbOKOnly				0		����� [�T�w]**** ���s�C
REM::	vbOKCancel				1		��� [�T�w]**** �P [����]**** ���s�C
REM::	vbAbortRetryIgnore		2		��� [����]****�B[����]****�A�M [���L]**** ���s�C
REM::	vbYesNoCancel			3		��� [�O]****�B[�_]****�A�M [����]**** ���s�C
REM::	vbYesNo					4		��� [�O]**** �M [�_]**** ���s�C
REM::	vbRetryCancel			5		��� [����]**** �M [����]**** ���s�C
REM::	vbCritical				16		����Y���T���ϥܡC
REM::	vbQuestion				32		���ĵ�i�d�߹ϥܡC
REM::	vbExclamation			48		���ĵ�i�T���ϥܡC
REM::	vbInformation			64		��ܸ�T�T���ϥܡC
REM::	vbDefaultButton1		0		�w�]�ȬO�Ĥ@�ӫ��s�C
REM::	vbDefaultButton2		256		�w�]�ȬO�ĤG�ӫ��s�C
REM::	vbDefaultButton3		512		�w�]�ȬO�ĤT�ӫ��s�C
REM::	vbDefaultButton4		768		�w�]�ȬO�ĥ|�ӫ��s�C
REM::	vbApplicationModal		0		���ε{���j��^���F�ϥΪ̥����^���T������A�~���~��ϥΥثe�����ε{���C
REM::	vbSystemModal			4096	�t�αj��^���F�Ҧ����ε{���|�Ȱ��A����ϥΪ̦^���T������C
REM::	vbMsgBoxHelpButton		16384	�s�W�����T����������s�C
REM::	vbMsgBoxSetForeground	65536	���w�T��������������e�������C
REM::	vbMsgBoxRight			524288	��r�O�a�k����C
REM::	vbMsgBoxRtlReading		1048576	���w��r�b�ƧB�ӻy�M���ԧB�y�t�ΤW����ܬ��q�k�쥪�\Ū�C

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
echo.	�y�k Msg_choice_box.bat Message
echo.	�y�k Msg_choice_box.bat M1 S1			S1:�۰��������(60)
echo.	�y�k Msg_choice_box.bat M1 S1 S2 		S2:�U���A����(��v)300��� [ S1 �p�� S2 ]
echo.	�y�k Msg_choice_box.bat M1 S1 S2 R1		R1:����{���W�� EX: "notepad.exe"
echo.	�y�k Msg_choice_box.bat ��ܰT�� �۰�������� �U���A����(��v)300��� "notepad.exe"
echo.
echo.
echo.	DEBUG�d��    (1)  Msg_choice_box.bat ��ܰT�� 
echo.	�I���{���d�� (2)  Msg_choice_box.bat ��ܰT�� 5
echo.	�Ƶ{�M�w�d�� (3)  Msg_choice_box.bat ��ܰT�� 60 300   
echo.	�Ƶ{�M�w�d�� (4)  Msg_choice_box.bat �O�_�}�ҰO�ƥ� 60 600 "notepad.exe"
echo.	�Ƶ{�M�w�d�� (5)  Msg_choice_box.bat �O�_�n�Jñ�� 60 600 "C:\Program Files\Internet Explorer\iexplore.exe" https://go.linyuan.com.tw/FKWeb/
echo.
echo.
echo.
echo.

timeout /t 99999
goto L1_EXIT


:L1_SET_AUTO_CLOSE_SECS
::���]�۰��������
::SET /A M1_AUTO_CLOSE=%2
::REM :: %2 �۰��������
SET /A M1_AUTO_CLOSE=60
GOTO L1_END_SET_AUTO_CLOSE_SECS


:L1_SET_SLEEP_SECS
::�]�w�U���A����(��v)300���
::SET /A M1_SLEEP_Tsec=%3 
::REM :: %3 �U���A����(��v)300���
set M1_SLEEP_Tsec=300

GOTO L1_END_SET_SLEEP_SECS

:L1_SET_PGM_RUN
::�]�w�U���A����(��v)300���
::SET /A M1_SLEEP_Tsec=%3 
::REM :: %3 �U���A����(��v)300���
set M1_PGM_RUN=echo. ����{���W��
GOTO L1_END_SET_PGM_RUN


