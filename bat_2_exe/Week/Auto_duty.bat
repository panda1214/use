@echo off
::REM ****************************************************
::REM 20210112 �Q�� FIND Ū�Jholiday.dat �N�̭��s�J�����X��
::REM workday.dat �ɤW�Z�u�@�� 20210220 M1_WORK_YN->A
::REM  �P���ΩP�� (�@��)�Ұ��� 20210109(6) 20210110(7) M1_WORK_YN->Y
::REM holiday.dat   �]�w�Ұ��� 20210101(5) 20210220(6) M1_WORK_YN->N

::REM (1) �ˬd����O�_�s�b   workday.dat ���ɤW�Z�u�@��
::REM (2) �ˬd����O�_�� �P���ΩP�� ,    �p���N���鬰�Ҥu(�@��)�Ұ���
::REM (3) ��蘆�������L�b holiday.dat �p���N���鬰�]�w�Ұ���
::REM ****************************************************
::REM holiday.dat
::REM 20210101
::REM 20210210

::REM workday.dat
::REM 20210220
::REM 20210911

REM ************************************

GOTO L1_start_Admin
:L1_start_Admin01


REM ���U��IFTTT��Line���_
REM curl -X POST -H "Content-Type: application/json" -d 
REM '{"value1":"J"}' https://maker.ifttt.com/trigger/{event}/with/key/dtLi4Ps62eMFj8FFCUGzCw
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::VB SCRIPE version
REM today   & Update M1_TAGFILE day **0 =today
echo wscript.echo dateadd("d",0,date) >%tmp%\tmp.vbs
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set ex=%%i
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set y=%%j
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set z=%%k
SET/A cx= ex-1911
set/A  x= %ex%
if %y% LSS 10 set y=0%y%
if %z% LSS 10 set z=0%z%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::VB SCRIPE version

::timeout /t 3600

REM *************************************
REM ����w FIND Ū�Jholiday.dat �N�̭��s�J �����X��
REM ************************************
REM ===================================================================================
REM �]�w�{���Ҧ��ܼ�
SET M1_TAG_WRK_FIL1=D:\msg\use\workday.dat
SET M1_TAG_HOL_FIL1=D:\msg\use\holiday.dat
REM ===============================
set M1_FIND_DATE=%x%%y%%z%
REM M1_FIND_DATE=YYYYMMDD	 �Ω�ǰe���� FIND *.dat  �������
set M1_TODAY=%x%%y%%z%
REM M1_TODAY=YYYYMMDD  	 ������
set M1_WORK_YN=1
::REM M1_WORK_YN=1  	     �w�]�������W�Z�u�@�� (1->  true(A) fail(go step2)   2->true(Y) fail(go step3) 		3->true(N) fail (S)
set M1_WEEK_D=0
REM M1_WEEK_D=0 	     �w�]����P 0

REM �]�w�{���Ҧ��ܼ�
REM ===================================================================================
REM *********** SET �{���U���Ѽ�  *********
REM !!! SET TAGDIR,RUNDIR,BAKDIR, CK_FILE,RUNLOG...
REM #########################
REM 
SET M1_event=err_msg
:: REM SET M1_event=err_msg  For Line Message Event
set M1_SENDIP=10.93.9.65
set M1_ServerIP=10.93.9.65
set M1_ServerName=Panda_PC
SET M1_MSG_CHT_STR="[�ˬd��]_������(01)%M1_TAG_WRK_FIL1% (2)�t�ΩP�X (3)%M1_TAG_HOL_FIL1%-[FM-%M1_SENDIP%]"
REM !!!####20190121######
	SET M1_RUNDRIVE=D:
	SET M1_RUNDIR=\Msg\Use
	SET M1_LOGDIR=%M1_RUNDIR%\LOG
	SET M1_SETDIR=\Msg\Use
	SET M1_SENDMSG_1=%M1_SETDIR%\send_msg1_panda.bat
	SET M1_SENDMSG_2=%M1_SETDIR%\NO_send_msg2_panda.bat
	SET M1_SENDMSG_3=%M1_SETDIR%\NO_send_msg3_panda.bat


:L1_CK_DIR00	
%M1_RUNDRIVE%
CD %M1_RUNDIR% 
if exist  %M1_LOGDIR% GOTO L1_MKDIR01
	MD %M1_LOGDIR%

:L1_MKDIR01	
CD %M1_RUNDIR% 
if exist  %M1_SETDIR% GOTO L1_MKDIREND
	MD %M1_SETDIR%
:L1_MKDIREND		

:L1_CREAT_SET_LOG_FILE
REM !!!####20190123######
SET M1_LOG_HEAD=%M1_LOGDIR%\FD_Holiday_LOG_HEAD.txt
     SET M1_LOG=%M1_LOGDIR%\FD_Holiday_RUNLOG.txt
REM �N LOG �g�b�e�� ***2019/01/21
SET M1_Swap_TMP=%M1_LOGDIR%\FD_Holiday_LOG_TMP.txt
REM �C�����}�ɧ�M1_LOG �s�� M1_Swap_TMP
SET M1_Swap_OK=%M1_LOGDIR%\FD_Holiday_LOG_OK.txt
REM �̫�@�����}�ɧ�LOG�g�b�e��, �᭱�A�[�W�� M1_LOG


:L1_CHECK_START01
::REM �_�l LOG File & empty log file
echo. > %M1_LOG_HEAD%
echo. > %M1_LOG%
SET M0_LOG=%M1_LOG%
::REM M1_LOG use in send mesg file name (mail attach file)
echo. > %M1_Swap_TMP%
echo. > %M1_Swap_OK%

echo. **************************************************	>> %M1_LOG_HEAD%
echo. �{���W�� Find_Holiday.BAT								>> %M1_LOG_HEAD%
echo. �{������ɶ� %ex%-%y%-%z%,%time%  					>> %M1_LOG_HEAD%
echo. **************************************************	>> %M1_LOG_HEAD%
::timeout /t 3600





:L1_CHECK_STEP01
REM *************************************************************************************************
REM SUB FUNC :L1_CHECK_STEP01
echo Process...Step 1 : ��X %M1_TODAY% �O�_�s�b %M1_TAG_WRK_FIL1% ���ɤW�Z�u�@�� 		>> %M1_LOG%
echo Process...Step 1 : ��X %M1_TODAY% �O�_�s�b %M1_TAG_WRK_FIL1% ���ɤW�Z�u�@��
REM *************************************************************************************************
SET M1_MSG_CHT_STR="[�ˬd��]_STEP01-��X %M1_TODAY% �O�_�s�b %M1_TAG_WRK_FIL1% �ΥH�P�O�ɤW�Z�u�@��-[FM-%M1_SENDIP%]"
set M1_FIND_DATE=%x%%y%%z%
REM M1_FIND_DATE=YYYYMMDD	 �Ω�ǰe���� FIND *.dat  �������
set M1_TODAY=%x%%y%%z%
REM M1_TODAY=YYYYMMDD  	 ������
set M1_WORK_YN=00
REM M1_WORK_YN=10  SUN FUNC true �������W�Z�u�@�� GOTO L1_CHECK_STEP_END
REM M1_WORK_YN=11  SUN FUNC fail �������W�Z�u�@�� goto step 2


for /f "usebackq tokens=1 delims= " %%i IN (`FIND "%M1_TODAY%" %M1_TAG_WRK_FIL1% `) DO (
	SET M1_i=%%i
	)
set M1_FIND_DATE=%M1_i%
::echo variable1, %M1_i% 
::echo M1_FIND_DATE, %M1_FIND_DATE% 
::echo M1_TODAY,%M1_TODAY%
::timeout /t 3600
IF %M1_FIND_DATE% EQU %x%%y%%z% GOTO L1_STEP01_YES
IF %M1_FIND_DATE% NEQ %x%%y%%z% GOTO L1_STEP01_NO



:L1_STEP01_YES
set M1_WORK_YN=10
REM ::SUN FUNC  M1_WORK_YN=1 true �������W�Z�u�@�� GOTO L1_CHECK_STEP_END
::echo L1_TODAY_WORK_YES
::echo variable1, %M1_i% 
::echo M1_FIND_DATE,  %M1_FIND_DATE%
::echo M1_TODAY,  %M1_TODAY%
::echo M1_WORK_YN,  %M1_WORK_YN%
::timeout /t 3600
echo END.....Process...Step 1 : �w��X %M1_TODAY% �s�b %M1_TAG_WRK_FIL1% ���ɤW�Z�u�@��						>> %M1_LOG%
SET M1_MSG_CHT_STR="[�ˬd����]_���ɤW�Z�u�@��]�w��_%M1_TAG_WRK_FIL1%-%M1_FIND_DATE%-[FM-%M1_SENDIP%]"
echo. >> %M1_LOG%
echo. >> %M1_LOG%
GOTO L1_CHECK_STEP_END

:L1_STEP01_NO
set M1_WORK_YN=11
REM M1_WORK_YN=2  SUN FUNC fail �������W�Z�u�@�� goto step 2

GOTO L1_CHECK_STEP02
::TEST
::GOTO L1_CHECK_STEP03
REM *************************************************************************************************
REM :: END FUNC L1_CHECK_STEP01	��X %M1_TODAY% �s�b %M1_TAG_WRK_FIL1% ���ɤW�Z�u�@��
REM *************************************************************************************************



:L1_CHECK_STEP02
echo END.....Process...Step 1 :  %M1_TODAY% ���s�b %M1_TAG_WRK_FIL1% ,�i�JSTEP 2�ˬd����O���P�X?	>> %M1_LOG%
echo. >> %M1_LOG%
echo. >> %M1_LOG%
REM *************************************************************************************************
REM :: SUB FUNC :L1_CHECK_STEP02
REM :: (2) �ˬd����O�_�� �P���ΩP�� ,    �p���N���鬰�Ҥu(�@��)�Ұ���
REM :: ���o���鬰�g ?
SET M1_MSG_CHT_STR="[�ˬd��]_STEP02-��X %M1_TODAY% �O�_�� �P���ΩP��,�p���N���鬰�Ҥu(�@��)�Ұ���-[FM-%M1_SENDIP%]"  
echo Process...Step 2 : ��X %M1_TODAY% �O�_�� �P���ΩP��,�p���N���鬰�Ҥu(�@��)�Ұ���								>> %M1_LOG%
echo Process...Step 2 : ��X %M1_TODAY% �O�_�� �P���ΩP��,�p���N���鬰�Ҥu(�@��)�Ұ���
REM *************************************************************************************************
set M1_FIND_DATE=%x%%y%%z%
REM :: M1_FIND_DATE=YYYYMMDD	 �Ω�ǰe���� FIND *.dat  �������
REM :: set M1_TODAY=%x%%y%%z%
REM M1_TODAY=YYYYMMDD  	 ������
set M1_WORK_YN=20
REM M1_WORK_YN=20  SUN FUNC �ˬd����O�_�� �P���ΩP��  true  GOTO L1_CHECK_STEP_END
REM M1_WORK_YN=21  SUN FUNC fail �������W�Z�u�@�� goto step 3




REM : (2) �ˬd����O�_�� �P���ΩP�� ,    �p���N���鬰�Ҥu(�@��)�Ұ���
REM ::���o���鬰�g ?

FOR /F "tokens=2" %%i IN ('date/t') DO (
  IF �g�@==%%i (set M1_WEEK_D=�g�@)
  IF �g�G==%%i (set M1_WEEK_D=�g�G)
  IF �g�T==%%i (set M1_WEEK_D=�g�T)
  IF �g�|==%%i (set M1_WEEK_D=�g�|)
  IF �g��==%%i (set M1_WEEK_D=�g��)
  IF �g��==%%i (set M1_WEEK_D=�g��)
  IF �g��==%%i (set M1_WEEK_D=�g��) 
SET M1_WEEKEND=%%i 
  )



IF %M1_WEEK_D% EQU �g�� GOTO L1_STEP02_YES
IF %M1_WEEK_D% EQU �g�� GOTO L1_STEP02_YES
::REM IF %M1_FIND_DATE% NEQ (�g��,�g��, =1-5) GOTO L1_STEP02_NO
GOTO L1_STEP02_NO


:L1_STEP02_YES
set M1_FIND_DATE=�t�Τ��_day_of_Week
set M1_WORK_YN=21
echo END....Process...Step 2 :  �t�Τ��%M1_TODAY% �O�P���ΩP��,�T�{���鬰(�@��)�𰲤�,�i�JSTEP 3�ˬd�O�_�ɥ𰲤�	>> %M1_LOG%
echo END....Process...Step 2 :  �t�Τ��%M1_TODAY% �O�P���ΩP��,�T�{���鬰(�@��)�𰲤�,�i�JSTEP 3�ˬd�O�_�ɥ𰲤�	
echo. >> %M1_LOG%
echo. >> %M1_LOG%				
GOTO GOTO L1_CHECK_STEP03


:L1_STEP02_NO
set M1_WORK_YN=20
set M1_FIND_DATE=
echo END....Process...Step 2 :  %M1_TODAY% ����D���P���ΩP��,������u�@��	>> %M1_LOG%
echo END....Process...Step 2 :  %M1_TODAY% ����D���P���ΩP��,������u�@��
echo. >> %M1_LOG%
echo. >> %M1_LOG%


::REM IF %%i 1-5 GOTO  L1_CHECK_STEP03
GOTO L1_CHECK_STEP_END 
REM *************************************************************************************************
REM :: END FUNC L1_CHECK_STEP02	(2) �ˬd����O�_�� �P���ΩP�� ,    �p���N���鬰�Ҥu(�@��)�Ұ���
REM *************************************************************************************************



:L1_CHECK_STEP03
REM *************************************************************************************************
REM : ��X    �P6,�� ���L�b holiday.dat �p���N���鬰�D�P6�P�餧�Ұ���
REM :: SUB FUNC L1_CHECK_STEP03
SET M1_MSG_CHT_STR="[�ˬd��]_STEP03-%M1_TAG_HOL_FIL1% ��X %M1_TODAY% ���L�]�w����ɥ𰲤�-[FM-%M1_SENDIP%]"	
echo Process...Step 3 : %M1_TAG_HOL_FIL1% ��X %M1_TODAY% ���L�]�w����ɥ𰲤�,�i�JSTEP 3�ˬd....				>> %M1_LOG%
echo Process...Step 3 : %M1_TAG_HOL_FIL1% ��X %M1_TODAY% ���L�]�w����ɥ𰲤�,�i�JSTEP 3�ˬd....
REM *************************************************************************************************
set M1_FIND_DATE=%x%%y%%z%
REM :: M1_FIND_DATE=YYYYMMDD	 �Ω�ǰe���� FIND *.dat  �������
REM :: set M1_TODAY=%x%%y%%z%
REM :: M1_TODAY=YYYYMMDD  	 ������
set M1_WORK_YN=30
REM M1_WORK_YN=30  SUN FUNC ��X FILE(%M1_TAG_HOL_FIL1%)��� %M1_TODAY% ,���鬰�ɥ𰲤�  true  L1_STEP03_FIND 
REM M1_WORK_YN=31  SUN FUNC ��X FILE(%M1_TAG_HOL_FIL1%)��� %M1_TODAY% ,���鬰�ɥ𰲤�  fail  L1_STEP03_NOFIND

::SET M1_TAG_HOL_FIL1=D:\msg\use\holiday.dat
::SET M1_TAG_WRK_FIL1=D:\msg\use\workday.dat
for /f "usebackq tokens=1 delims= " %%i IN (`FIND "%M1_TODAY%" %M1_TAG_HOL_FIL1% `) DO (
	SET M1_i=%%i
	)
set M1_FIND_DATE=%M1_i%	

IF %M1_FIND_DATE% EQU %x%%y%%z% GOTO L1_STEP03_FIND 
IF %M1_FIND_DATE% NEQ %x%%y%%z% GOTO L1_STEP03_NOFIND


:L1_STEP03_FIND 
set M1_FIND_DATE=
SET M1_MSG_CHT_STR="[�ˬd����]_FILE(%M1_TAG_HOL_FIL1%)��� %M1_TODAY% ,���鬰�ɥ𰲤�-[FM-%M1_SENDIP%]"
::echo PROCESS......L1_STEP03_FIND 
set M1_WORK_YN=30


echo End........Process...Step 3 : ��� %M1_TODAY% ,���鬰�ɥ𰲤�(�B�D�P���ΩP��)		>> %M1_LOG%
SET M1_MSG_CHT_STR="[�ˬd����]_�ɥ𰲤�]�w��_%M1_TAG_HOL_FIL1%��� %M1_FIND_DATE% ���鬰�ɥ𰲤�(�B�D�P���ΩP��)-[FM-%M1_SENDIP%]"
GOTO L1_CHECK_STEP_END


:L1_STEP03_NOFIND 
set M1_FIND_DATE=ERROR
SET M1_MSG_CHT_STR="[�ˬd���`]_M1_TAG_HOL_FIL1% ����� %M1_TODAY% -[FM-%M1_SENDIP%]"
echo @@@@End........Process...Step 3 : %M1_TAG_HOL_FIL1% ����� %M1_TODAY%  ,���鬰�u�@��(�D�P���ΩP��)@@@@		>> %M1_LOG%
set M1_WORK_YN=31
GOTO L1_SYSTEM_ERROR

REM *************************************************************************************************
REM :: END FUNC L1_CHECK_STEP03 	��X     ����O�_�s�b   workday.dat ���ɤW�Z�u�@��
REM *************************************************************************************************



:L1_SYSTEM_ERROR
echo. >> %M1_LOG%
echo. >> %M1_LOG%
echo Process...SYSTEM ERROR ERROR @@@		>> %M1_LOG%
echo Process...SYSTEM ERROR ERROR @@@		
GOTO L1_CHECK_STEP_END


:L1_CHECK_STEP_END
echo. >> %M1_LOG%
echo. >> %M1_LOG%
echo. ***********************************************************************************************	>> %M1_LOG%
echo. ***********************************************************************************************   >> %M1_LOG%
echo Process...CHECK_STEP_END		>> %M1_LOG%
echo Process...CHECK_STEP_END

echo ��������(M1_TODAY)��	%M1_TODAY%							
echo ����O�_���u�@��(M1_WORK_YN)��	%M1_WORK_YN%			
echo ���u�@�]�w��(%M1_TAG_WRK_FIL1%) ��u�@�鬰 %M1_FIND_DATE%	
echo ��찲��]�w��(%M1_TAG_HOL_FIL1%) �䰲�鬰   %M1_FIND_DATE%	

echo ��������(M1_TODAY)	%M1_TODAY%							>> %M1_LOG%
echo ����O�_���u�@��(M1_WORK_YN)		%M1_WORK_YN%			>> %M1_LOG%
echo ���u�@�]�w��(%M1_TAG_WRK_FIL1%) ��u�@�鬰 %M1_FIND_DATE%	>> %M1_LOG%
echo ��찲��]�w��(%M1_TAG_HOL_FIL1%) �䰲�鬰   %M1_FIND_DATE%	>> %M1_LOG%



echo. >> %M1_LOG%
echo. >> %M1_LOG%
echo. **************************************************	>> %M1_LOG%
echo. �{���W�� Find_Holiday.BAT								>> %M1_LOG%
echo. �{�������ɶ� %ex%-%y%-%z%,%time%  					>> %M1_LOG%
echo. **************************************************	>> %M1_LOG%

::set M1_FIND_DATE=20200101
::REM M1_FIND_DATE=YYYYMMDD	 workday.dat �W�Z�u�@��
::set M1_FIND_DATE=20200101
::REM M1_FIND_DATE=YYYYMMDD	 holiday.dat �Ұ���
::set M1_TODAY=%x%%y%%z%
::REM M1_TODAY=YYYYMMDD  	 ������
::set M1_WORK_YN=Y
::REM M1_WORK_YN=Y  	     �w�]�������W�Z�u�@��

GOTO L1_EXIT_OK

:L1_EXIT_OK
IF %M1_WORK_YN% EQU 10 SET M1_MSG_CHT_STR="[�ˬd����]_���ɤW�Z�u�@��]�w��_%M1_TAG_WRK_FIL1%-%M1_FIND_DATE%-[FM-%M1_SENDIP%]"
IF %M1_WORK_YN% EQU 20 SET M1_MSG_CHT_STR="[�ˬd����]_�ˬd%M1_TODAY%_�����`�W�Z��-������(%M1_TODAY%)-�u�@���(%M1_FIND_DATE%,%M1_WEEK_D%)-[FM-%M1_SENDIP%]"
IF %M1_WORK_YN% EQU 30 SET M1_MSG_CHT_STR="[�ˬd����]_FILE(%M1_TAG_HOL_FIL1%)��� %M1_TODAY% ,���鬰�ɥ𰲤�-[FM-%M1_SENDIP%]"
::IF %M1_WORK_YN% GTR 5 SET M1_MSG_CHT_STR="[�ˬd���`]_M1_TAG_HOL_FIL1% ����� %M1_TODAY% -[FM-%M1_SENDIP%]"


::ECHO %M1_MSG_CHT_STR%
::timeout /t 3600
SET M1_MSG_ICON=64
SET M1_event=ok_msg
GOTO L1_SENDMSG1

:L1_SENDMSG1
REM �N LOG �g�b�e�� ***2019/01/21
REM add attach query file
echo. >> %M1_LOG%
echo. >> %M1_LOG%
TYPE %M1_LOG_HEAD%	>  %M1_Swap_TMP%
TYPE %M1_LOG%		>> %M1_Swap_TMP%
TYPE %M1_Swap_TMP%	>> %M1_Swap_OK%
echo. >  %M1_LOG%
TYPE %M1_Swap_ok%	>> %M1_LOG%

echo. **************************************************	
::SET M0_LOG=%M1_LOG%  FOR SEND MSG				
echo. **************************************************	
SET M0_LOG=%M1_LOG%
SET M0_MSG_CHT_STR=%M1_MSG_CHT_STR%


IF NOT EXIST %M1_SENDMSG_1% GOTO L1_SENDMSG2
call %M1_SENDMSG_1%
REM echo msgbox %M1_OK_STR%,64,"�ˬd�ɮװT��%DATE%-%TIME%">1.vbs && start 1.vbs && ping -n 2 127.1>nul && del 1.vbs
GOTO L1_SENDMSG2

:L1_SENDMSG2
IF NOT EXIST %M1_SENDMSG_2% GOTO L1_SENDMSG3
call %M1_SENDMSG_2%
REM sent %M1_SENDIP% %M1_MSG_CHT_STR%
GOTO L1_SENDMSG3

:L1_SENDMSG3
IF NOT EXIST %M1_SENDMSG_3% GOTO L1_EXIT_OUT
call %M1_SENDMSG_3%
REM START curl -S -X POST http://maker.ifttt.com/trigger/123msg/with/key/%M1_WEP% -F "value1=%M1_MSG_OK%"

GOTO L1_EXIT_OUT

REM ************************************************************
REM L1_EXIT_OUT
REM ************************************************************
:L1_EXIT_OUT
net use /del %M1_TAG_DRIVE% /y 
ENDLOCAL
EXIT

:L1_start_Admin	
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
GOTO L1_start_Admin01

::DEBUG	
echo M1_TAG_HOL_FIL1,	%M1_TAG_HOL_FIL1%
echo M1_TAG_WRK_FIL1,	%M1_TAG_WRK_FIL1%
echo L1_TODAY_WORK_YES
echo variable1, %M1_i% 
echo M1_FIND_DATE,  %M1_FIND_DATE%
echo M1_TODAY,  %M1_TODAY%
echo M1_WORK_YN,  %M1_WORK_YN%
echo M1_WEEK_D,	%M1_WEEK_D%
echo M0_LOG,	%M0_LOG%
timeout /t 3600