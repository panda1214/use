::::::::::::::::::::::::::::
REM  timeout_sec.bat  45		&& ���� 45 ��
REM  timeout_sec.bat  		 	&& ���� 60 �� (�w�])
@echo off
CLS
set M0_Tsec=60

::::::::::::::::::::::::::::
::START L0_MAIN_START
::::::::::::::::::::::::::::
::L0_SET_SECS=60(�w�])  

IF (%1)==() (goto L0_GO_SET_SECS)

:: (%1)NEQ() 
set M0_Tsec=%1%


:L0_END_SET_SECS
echo %1%
::pause


:L0_START_01

timeout /t %M0_Tsec%
REM :: M1_WT ��ܰT��,�ó]�w�ǤJ��۰ʵ���



:L0_EXIT
EXIT

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::SUB FUNCTION
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:L0_GO_SET_SECS
set M0_Tsec=60
GOTO L0_END_SET_SECS

EXIT