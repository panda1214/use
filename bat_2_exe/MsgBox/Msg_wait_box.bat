REM :: ��ܰT��,�ó]�w60��۰ʵ���
REM :: 
REM :: 

SET M1_H1="�ǰe�u�@�����T��"
:: M1_H1=MagBox TITLE

SET M1_L1="������u�@,�u�����T��" +vbCrLf+vbCrLf
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


timeout /t 3600

del  %tmp%\temp1.vbs

