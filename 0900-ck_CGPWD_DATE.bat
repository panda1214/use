setlocal EnableDelayedExpansion
::@echo off
GOTO L0_start_Admin
:L0_start_Admin01
REM REM @@@ *************************************
REM REM �ϥΪ̳]�w�ܼư�
REM REM �ϥΪ̳]�w�ܼư�
SET /A M0_msg1001=60
:: = 60 �� ---> ��1�q�q�� , �q�� 1��

SET /A M0_msg1002=45
:: = 45 �� ---> ��2�q�q�� , �q�� 1��

SET /A M0_msg1003=16
:: < 16 �� ---> ��3�q�q�� ,***�C�ѳq��***

SET /A M0_msg1004=8
:: < 8  �� ---> ��4�q�q��  �q���אּ***ERROR***

REM REM @@@ ************************************


REM *************************************
REM 20200820 ����w ck_CGPWD_DATE.bat �ˬdAD_�b�������
REM ************************************

REM ���U��IFTTT��Line���_
REM curl -X POST -H "Content-Type: application/json" -d 
REM '{"value1":"J"}' https://maker.ifttt.com/trigger/{event}/with/key/dtLi4Ps62eMFj8FFCUGzCw
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::VB SCRIPE version
REM today   & Update M0_TAGFILE day **0 =today
echo wscript.echo dateadd("d",0,date) >%tmp%\tmp.vbs
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set ex=%%i
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set y=%%j
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set z=%%k
SET/A cx= ex-1911
set/A  x= %ex%
if %y% LSS 10 set y=0%y%
if %z% LSS 10 set z=0%z%
echo today yyyymmdd ,	%x%%y%%z%
echo today yyyy/mm/dd, %x%/%y%/%z%
echo today taiwan year yyy/mm/dd,	%cx%/%y%/%z%
REM ���� 2020/04/01 

REM *********** SET �{���U���Ѽ�  *********
SET M0_MSG_ICON=64
SET M0_event=err_msg
SET M0_WEP=d11JbnhamEDAVhh4fI4Sdp
REM ******DEBUG
set M0_SENDIP=10.93.9.65
set M0_ServerIP=10.93.9.65
set M0_ServerName=Panda_PC

SET M0_LOGON_USER=%username%
SET M0_TODAY="%x%/%y%/%z%"
SET M0_ENDDAY="2020/08/21"
::  �K�X�����
SET M0_DAYS=90
SET M0_MSG_CHT_STR="[�ˬd��]_���u[%M0_LOGON_USER%],�K�X����鬰[%M0_ENDDAY%],�ٳ�[%M0_DAYS%]�ѻݭn�ܧ�[FM-%M0_SENDIP%]"
SET M0_MSG_ENG_STR=[Process...]_Stuff[%M0_LOGON_USER%],Password_EndDate[%M0_ENDDAY%],Leave[%M0_DAYS%]Days_Need_To_Change[FM-%M0_SENDIP%]

	SET M0_RUNDRIVE=D:
	SET M0_RUNDIR=\Msg\Use
	SET M0_LOGDIR=%M0_RUNDIR%\Log
	SET M0_SETDIR=%M0_RUNDIR%
	SET M0_SENDMSG_1=%M0_SETDIR%\send_msg1_panda.bat
	SET M0_SENDMSG_2=%M0_SETDIR%\NO_send_msg2_panda.bat
	SET M0_SENDMSG_3=%M0_SETDIR%\NO_send_msg3_panda.bat

REM *********** SET �{���U���Ѽ�  *********


:L0_MKDIR00	
%M0_RUNDRIVE%
CD %M0_RUNDIR% 
if exist  %M0_LOGDIR% GOTO L0_MKDIR01
	MD %M0_LOGDIR%

:L0_MKDIR01	
CD %M0_RUNDIR% 
if exist  %M0_SETDIR% GOTO L0_MKDIREND
	MD %M0_SETDIR%
:L0_MKDIREND		

:L0_CREAT_REPORT
REM !!!####20190123######
SET M0_TAGFIL1=%M0_LOGDIR%\ck_net_user.txt
SET M0_LOG_HEAD=%M0_LOGDIR%\ck_CGPWD_DATE_LOG_HEAD.txt
SET M0_LOG=%M0_LOGDIR%\ck_CGPWD_DATE_RUNLOG.txt
REM �N LOG �g�b�e�� ***2019/01/21
SET M0_Swap_TMP=%M0_LOGDIR%\ck_CGPWD_DATE_LOG_TMP.txt
REM �C�����}�ɧ�M1_LOG �s�� M0_Swap_TMP
SET M0_Swap_OK=%M0_LOGDIR%\ck_CGPWD_DATE_LOG_OK.txt
REM �̫�@�����}�ɧ�LOG�g�b�e��, �᭱�A�[�W�� M0_LOG
REM !!!####20190123######



:L0_CHECK_START
echo. > %M0_TAGFIL1%
echo. > %M0_LOG_HEAD%
echo. > %M0_LOG%
echo. > %M0_Swap_TMP%
echo. > %M0_Swap_OK%

echo. **************************************************	>> %M0_LOG_HEAD%
echo. �{���W�� ck_CGPWD_DATE.BAT							>> %M0_LOG_HEAD%
echo. �{������ɶ� %ex%-%y%-%z%,%time%  					>> %M0_LOG_HEAD%
echo. **************************************************	>> %M0_LOG_HEAD%
echo. >> %M0_LOG%
echo. >> %M0_LOG%

:L0_CHECK_START_01

:L0_CHECK_STEP01
REM ======CMD======
net user %username% /domain >> %M0_TAGFIL1%
REM net user A123274643 /domain >> %M0_TAGFIL1%
REM ======CMD======
IF NOT EXIST %M0_TAGFIL1% GOTO L0_EXIT_ERROR

REM *************************************************************************************************
REM : ��X����m�W (���W)
for /f "usebackq tokens=1-4 delims= " %%i IN (`FIND "���W" %M0_TAGFIL1% `) DO (
	SET M0_i=%%i
	SET M0_j=%%j
	SET M0_k=%%k
	SET M0_l=%%l
	)
set M0_LOGON_USER=%M0_j%
REM : ��X����m�W (���W)
REM *************************************************************************************************

REM *************************************************************************************************
REM : �K�X���
for /f "usebackq tokens=1-4 delims= " %%i IN (`FIND "�K�X���" %M0_TAGFIL1% `) DO (
	SET M0_i=%%i
	SET M0_j=%%j
	SET M0_k=%%k
	SET M0_l=%%l
	)
::echo variable1, %M0_i%
::echo variable2, %M0_j%
::echo variable3, %M0_k%
::echo variable4, %M0_l%

set M0_ENDDAY="%M0_j%"
REM YYYY/MM/DD
set M0_TODAY="%x%/%y%/%z%"
REM YYYY/MM/DD
		
REM : �K�X���
REM *************************************************************************************************

::echo %M0_i% ,%M0_j%,%M0_k%,%M0_l%
::echo %M0_j%
::echo %M0_ENDDAY%
::echo %M0_ENDDAY%-%M0_TODAY%


echo wscript.echo DateDiff("d",%M0_TODAY%,%M0_ENDDAY%) >%tmp%\tmp.vbs
for /f %%i in ('cscript /nologo %tmp%\tmp.vbs') do set M0_DAYS=%%i

if %y% LSS 10 set y=0%y%
if %z% LSS 10 set z=0%z%
echo �K�X�����,%M0_ENDDAY%
echo   ������,%M0_TODAY%
echo �K�X����Ѽ�,%M0_DAYS%


echo ������,%M0_TODAY% 		>> %M0_LOG%
echo �K�X�����,%M0_ENDDAY%		>> %M0_LOG%
echo �K�X����Ѽ�,%M0_DAYS%		>> %M0_LOG%
echo. >> %M0_LOG%
echo. >> %M0_LOG%
::if %M0_DAYS%  LSS 50 echo less
::if %M0_DAYS%  LSS 62 echo hi

::timeout /t 180

echo. **************************************************	>> %M0_LOG%
echo. �{���W�� ck_CGPWD_DATE.BAT						>> %M0_LOG%
echo. �{�������ɶ� %ex%-%y%-%z%,%time%  					>> %M0_LOG%
echo. **************************************************	>> %M0_LOG%
REM GOTO L0_Drive_CHANGE_01
GOTO L0_EXIT_OK


:L0_EXIT_OK

if %M0_DAYS%  LSS  %M0_msg1004% goto L0_msg1004
if %M0_DAYS%  LSS  %M0_msg1003% goto L0_msg1003
if %M0_DAYS%  EQU  %M0_msg1002% goto L0_msg1002
if %M0_DAYS%  EQU  %M0_msg1001% goto L0_msg1001

::��L CASE ���B�z,�������}
goto GOTO L0_EXIT_OUT

:L0_msg1004
SET M0_MSG_CHT_STR="[***ERROR***]_���u[%M0_LOGON_USER%],�K�X����鬰[%M0_ENDDAY%],�ٳ�[%M0_DAYS%]�ѻݭn�ܧ�-[FM-%M0_SENDIP%]�p��%M0_msg1004%"
SET M0_MSG_ENG_STR=[***ERROR***]_Stuff[%M0_LOGON_USER%],Password_EndDate[%M0_ENDDAY%],Leave[%M0_DAYS%]Days_Need_To_Change"[FM-%M0_SENDIP%]
SET M0_MSG_ICON=16
SET M0_event=err_msg
GOTO L0_SENDMSG1

:L0_msg1003
SET M0_MSG_CHT_STR="[�C��q��]_���u[%M0_LOGON_USER%],�K�X����鬰[%M0_ENDDAY%],�ٳ�[%M0_DAYS%]�ѻݭn�ܧ�-[FM-%M0_SENDIP%]�p��%M0_msg1003%"
SET M0_MSG_ENG_STR=[Daily_Notice]_Stuff[%M0_LOGON_USER%],Password_EndDate[%M0_ENDDAY%],Leave[%M0_DAYS%]Days_Need_To_Change"[FM-%M0_SENDIP%]
GOTO L0_msg1001_END

:L0_msg1002
SET M0_MSG_CHT_STR="[�ȷ��q��]_���u[%M0_LOGON_USER%],�K�X����鬰[%M0_ENDDAY%],�ٳ�[%M0_DAYS%]�ѻݭn�ܧ�-[FM-%M0_SENDIP%]����%M0_msg1002%"
SET M0_MSG_ENG_STR=[Today_Notice]_Stuff[%M0_LOGON_USER%],Password_EndDate[%M0_ENDDAY%],Leave[%M0_DAYS%]Days_Need_To_Change"[FM-%M0_SENDIP%]
GOTO L0_msg1001_END

:L0_msg1001
SET M0_MSG_CHT_STR="[�ȷ��q��]_���u[%M0_LOGON_USER%],�K�X����鬰[%M0_ENDDAY%],�ٳ�[%M0_DAYS%]�ѻݭn�ܧ�-[FM-%M0_SENDIP%]����%M0_msg1001%"
SET M0_MSG_ENG_STR=[Today_Notice]_Stuff[%M0_LOGON_USER%],Password_EndDate[%M0_ENDDAY%],Leave[%M0_DAYS%]Days_Need_To_Change"[FM-%M0_SENDIP%]
GOTO L0_msg1001_END

:L0_msg1001_END
SET M0_MSG_ICON=64
SET M0_event=ok_msg
GOTO L0_SENDMSG1

:L0_EXIT_ERROR
echo. **************************************************	>> %M0_LOG%
echo. �d�߭��u�K�X���~	ERROR ERROR	ERROR					>> %M0_LOG%
echo. �䤣��K�X�d����  %M0_TAGFIL1%						>> %M0_LOG%
echo. **************************************************	>> %M0_LOG%
SET M0_MSG_CHT_STR="[***ERROR***]_���u[%M0_LOGON_USER%]�K�X�d�߿��~,�䤣��K�X�d����[ %M0_TAGFIL1%]-[FM-%M0_SENDIP%]"
SET M0_MSG_ENG_STR=[***ERROR***]Query_Stuff[%M0_LOGON_USER%]Password_EndDate_ERROR_CANNOT_FIND_Password_Query_File[%M0_TAGFIL1%]-[FM-%M0_SENDIP%]
SET M0_MSG_ICON=16
SET M0_event=err_msg
GOTO L0_SENDMSG1


:L0_SENDMSG1
REM �N LOG �g�b�e�� ***2019/01/21
TYPE %M0_LOG_HEAD% >> %M0_Swap_OK%
TYPE %M0_LOG% >> %M0_Swap_OK%
echo. >> %M0_LOG%
echo. >> %M0_LOG%
TYPE %M0_TAGFIL1% >> %M0_Swap_OK%
echo. >> %M0_LOG%
echo. >> %M0_LOG%
SET M0_LOG=%M0_Swap_OK%




REM �N LOG �g�b�e�� ***2019/01/21
::cd
::echo %M0_LOG%
::echo %M0_SENDMSG_1% 
::PAUSE

IF NOT EXIST %M0_SENDMSG_1% GOTO L0_SENDMSG2
call %M0_SENDMSG_1%
REM echo msgbox %M0_OK_STR%,64,"�ˬd�ɮװT��%DATE%-%TIME%">1.vbs && start 1.vbs && ping -n 2 127.1>nul && del 1.vbs
GOTO L0_SENDMSG2

:L0_SENDMSG2
IF NOT EXIST %M0_SENDMSG_2% GOTO L0_SENDMSG3
call %M0_SENDMSG_2%
REM sent %M0_SENDIP% %M0_MSG_CHT_STR%
GOTO L0_SENDMSG3

:L0_SENDMSG3
IF NOT EXIST %M0_SENDMSG_3% GOTO L0_EXIT_OUT
call %M0_SENDMSG_3%
REM START curl -S -X POST http://maker.ifttt.com/trigger/123msg/with/key/%M0_WEP% -F "value1=%M0_MSG_OK%"

GOTO L0_EXIT_OUT

REM ************************************************************
REM L0_EXIT_OUT
REM ************************************************************
:L0_EXIT_OUT
del %tmp%\tmp.vbs
ENDLOCAL
EXIT

:L0_start_Admin	
REM ************************************************************
REM �{���۰ʳ]�w�� Administrator �v��
REM ************************************************************
REM  �{���۰ʳ]�w�� Administrator �v��
REM  https://dotblogs.com.tw/c5todo/2016/08/21/155005
REM
setlocal enableDelayedExpansion
CLS
@echo off
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

::::::::::::::::::::::::::::
::START
::::::::::::::::::::::::::::
GOTO L0_start_Admin01

::net user A123274643 /domain >> %M0_TAGFIL1%
REM  �ϥΪ̦W��             A123274643
REM  ���W                   ����w
REM  ����                   [2012/05/15 ����]
REM  �ϥΪ̪�����
REM  ��a/�ϰ�X            000 (�t�ιw�]��)
REM  �b��ϥΤ�             Yes
REM  �b����               �q��

REM  �W���]�w�K�X           2020/7/13 �U�� 01:24:41
REM  �K�X���               2020/10/11 �U�� 01:24:41
REM  �i�ܧ�K�X             2020/7/14 �U�� 01:24:41
REM  �п�J�K�X             No
REM  �ϥΪ̥i�H�ܧ�K�X     Yes

REM  �e�\���u�@��           ����
REM  �n�J���O��
REM  �ϥΪ̳]�w��
REM  �D�ؿ�
REM  �W���n�J�ɶ�           2020/8/20 �U�� 01:05:35

REM  �i�e�\���n�J�ɼ�       ����

REM  �����s�շ|��
REM  ����s�շ|��           *Domain Users         *Cathaysec Server Main
REM  						   *Cathaysec Change Cont*GP26�n���������(w)
REM  						   *Cathaysec EIP HotNews*Cathaysec Mant AD-Use
REM  						   *grp6120000
REM  �R�O�w�g���\�����C


	