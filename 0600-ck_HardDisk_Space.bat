@echo off
nircmd cmdwait 1000 win setsize ititle "cmd.exe" 3600 3600 100 200
mode con cols=20 lines=10
GOTO L0_start_Admin
:L0_start_Admin01
REM *************************************
REM 20200817 ����w ck_HardDisk_Space �ˬd �ۤvPC�w�ЪŶ� 
REM 2021-0519 Update  C,D,E,F CSV �[���ͤ��
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
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::VB SCRIPE version
REM today   & Update M0_TAGFILE day **-1 =yesterday
echo wscript.echo dateadd("d",-1,date) >%tmp%\tmp.vbs
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set ex_1T=%%i
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set y_1T=%%j
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set z_1T=%%k

SET/A cx_1T= ex_1T-1911
set/A  x_1T= %ex_1T%
if %y_1T% LSS 10 set y_1T=0%y_1T%
if %z_1T% LSS 10 set z_1T=0%z_1T%

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

echo. Running Yesterday is: %ex_1T%/%y_1T%/%z_1T%  YYYY/MM/DD[DD-1] 
echo. Running Date is: %x%/%y%/%z%  YYYY/MM/DD
echo. Running Chinese Yesterday is: %cx_1T%%y_1T%%z_1T%  CYYMMDD[DD-1]
echo. Running Date is: %cx%%y%%z%  CYYMM 
::PAUSE
REM ���� 2020/04/01 


REM *********** SET �{���U���Ѽ�  *********
REM !!! SET TAGDIR,RUNDIR,BAKDIR, CK_FILE,RUNLOG...
REM logckcount �֭p�ˬd����(����LOG���L����)
REM set /A M0_Check_WAait=60 �C���� 60 SEConds
REM SET /A M0_Check_TOT_Count=10��,	 �@�ˬd10����,  �ɶ���,�٥��ˬd�즳�ɮקY�o�X�iĵ,
REM (1)�L�ɮײ��ͥi�Q�ˬd,�Ȱ�60���� 
REM (2)���������T�����ɮ�
REM (3)�ˬd�ɮפ��e�� "���`" �� ���` ,�Y���}�{��,�õo�X���G�O���`�β��`
REM #########################
SET M0_MSG_ICON=64
SET M0_event=err_msg
SET M0_WEP=cpAo5pnlpx8uuld8ebP7oc

REM ******DEBUG
set M0_SENDIP=10.93.9.65
set M0_ServerIP=10.93.9.65
set M0_ServerName=Panda_PC
set M0_TAG_Drive=C:
SET M0_MSG_CHT_STR="[�ˬd��]_�ˬdPC�w�ЪŶ�-[FM-%M0_SENDIP%]"
SET M0_MSG_ENG_STR=[Process...]_Check_PC_HardDisk_FreeSpace-[FM-%M0_SENDIP%]
set M0_MASTER_Drive=F:
SET M0_MASTER_DRIVE_FREE='***'
REM !!!####20190121######
	SET M0_RUNDRIVE=D:
	SET M0_RUNDIR=\Msg\Use
	SET M0_SAVELOg=D:\LOG
	SET M0_LOGDIR=%M0_RUNDIR%\LOG
	SET M0_SETDIR=%M0_RUNDIR%
	SET M0_SENDMSG_1=%M0_SETDIR%\send_msg1_panda.bat
	SET M0_SENDMSG_2=%M0_SETDIR%\NO_send_msg2_panda.bat
	SET M0_SENDMSG_3=%M0_SETDIR%\NO_send_msg3_panda.bat
	REM *****
	SET M0_SAVELOG=D:\LOG
	SET M0_LOG_C=%M0_SAVELOG%\Daily_Check_Drive_C.csv
	SET M0_LOG_D=%M0_SAVELOG%\Daily_Check_Drive_D.csv
	SET M0_LOG_E=%M0_SAVELOG%\Daily_Check_Drive_E.csv
	SET M0_LOG_F=%M0_SAVELOG%\Daily_Check_Drive_F.csv
	SET M0_LOG_sum1=%M0_SAVELOG%\Daily_Drive_sum1.csv
	REM SET M0_DSIK_LOG_STR=%M0_TAG_Drive%,%M0_SPACE%  �p�U ���g�JM0_DSIK_LOG_STR �̫���[ Daily_Drive_sum1.csv
	REM  F:,449591779328,E:,31177760768		,D:,428020916224	,C:,453894643712	
	SET M0_wmic_swap=%M0_SAVELOG%\Daily_Drive_wmic_swap.txt
	SET M0_wmic_ok=%M0_SAVELOG%\Daily_Drive_wmic.txt


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
SET M0_LOG_HEAD=%M0_LOGDIR%\ck_HD_Space_LOG_HEAD.txt
     SET M0_LOG=%M0_LOGDIR%\ck_HD_Space_RUNLOG.txt
REM �N LOG �g�b�e�� ***2019/01/21
SET M0_Swap_TMP=%M0_LOGDIR%\ck_HD_Space_LOG_TMP.txt
REM �C�����}�ɧ�M1_LOG �s�� M0_Swap_TMP
SET M0_Swap_OK=%M0_LOGDIR%\ck_HD_Space_LOG_OK.txt
REM �̫�@�����}�ɧ�LOG�g�b�e��, �᭱�A�[�W�� M0_LOG
REM !!!####20190123######


REM !!!####20190123######
:L0_CHECK_START
REM �N LOG �g�b�e�� ***2019/01/21
echo. > %M0_LOG_HEAD%
echo. > %M0_LOG%
echo. > %M0_Swap_TMP%
echo. > %M0_Swap_OK%

echo. **************************************************	>> %M0_LOG_HEAD%
echo. �{���W�� ck_HardDisk_Space.BAT						>> %M0_LOG_HEAD%
echo. �{������ɶ� %ex%-%y%-%z%,%time%  					>> %M0_LOG_HEAD%
echo. *�C���Ʀs�J D:\Log\Daily_Check_Drive_*.csv			>> %M0_LOG_HEAD%
echo. **************************************************	>> %M0_LOG_HEAD%
echo. ***			Summary							 ***	>> %M0_LOG_HEAD%


REM wmic /output:c:\process.html process list /format:htable.xsl
REM wmic /output:a.html logicaldisk where ��DriveType=3�� get DeviceID,Size,FreeSpace,Description,FileSystem /format:htabl
REM wmic /output:D:\LOG\Drive_sum.csv logicaldisk where ��DriveType=3�� get DeviceID,Size,FreeSpace,FileSystem   /format:csv
REM wmic+�����}��+�O�W+wql�y�y+�ʵ�+�Ƶ��]�Ϊ̻��O�ʵ����Ѽơ^+�ʵ��}���v
REM �����}�Ghttps://kknews.cc/tech/93jo28l.html
REM cm  TEST **** wmic logicaldisk where(DriveType=3) list brief  
wmic /output:%M0_wmic_swap% logicaldisk where(DriveType=3)  get DeviceID,Size,FreeSpace,FileSystem,VolumeName   /format:csv
::	SET M0_wmic_swap=%M0_SAVELOG%\Daily_Drive_wmic_swap.txt
::	SET M0_wmic_ok=%M0_SAVELOG%\Daily_Drive_wmic.txt
type %M0_wmic_swap% > %M0_wmic_ok%
:: WMIC �w�] USC2-LE BOM (Unicode) -> �� TYPE �ন BIG5
REM wmic /output:\LOG\Drive_sum.csv logicaldisk full /format:csv 


::timeout /t 2600

:L0_CHECK_START_01
REM SWAP HARD_DISK_DRIVE
REM �����ˬd���L���\��HARD_DISK_DRIVE
SET M1_ALL_DRIVE=C:D:E:F:
set M1_NOW_DRIVE=%M1_ALL_DRIVE:~0,2%
REM C:
SET M1_ALL_DRIVE=%M1_ALL_DRIVE:~2%
REM D:E:F:

echo %M1_NOW_DRIVE%
echo %M1_ALL_DRIVE%
REM PAUSE
REM set M0_TAG_Drive=G:

:L0_CHECK_STEP01
REM PAUSE

:L0_CHECK_STEP02
REM set M0_MASTER_Drive=F:
REM SET M0_MASTER_DRIVE_FREE='***'
set M0_MASTER_Drive=F:
set M0_TAG_Drive=F:

IF NOT EXIST %M0_MASTER_Drive% GOTO L0_EXIT_ERROR
set M0_TAG_Drive=F:
echo. 														>> %M0_LOG%
echo. **************************************************	>> %M0_LOG%
echo. �ˬd***�D�n�ʱ��ϺЪŶ�  %M0_MASTER_Drive%***			>> %M0_LOG%
echo. 														>> %M0_LOG%
fsutil volume diskfree %M0_MASTER_Drive%					> %M0_Swap_TMP%
TYPE %M0_Swap_TMP% >> %M0_LOG%

REM 	FIND �i�Ϊ����ϥΦ줸���`��  : 426744819712 (397.44GB)
REM 	echo %%i
REM 	�i�Ϊ����ϥΦ줸���`��
REM 	echo %%j
REM 	:
REM 	echo %%k
REM 	426744819712
REM 	echo %%l
REM 	(397.44GB)

for /f "usebackq tokens=1-4 delims= " %%i IN (`FIND "�i�Ϊ����ϥΦ줸���`��" "%M0_Swap_TMP%" `) DO (
	::echo %%l
	SET M0_SPACE=%%k
	SET M0_SPACE_G=%%l
	SET M0_MASTER_DRIVE_FREE=%%l
	)
	

echo. %%l
echo. %M0_SPACE%
echo. %M0_MASTER_DRIVE_FREE%
echo. �ˬdPC�w��_�̥D�n�ʱ��ϺЪŶ�_%M0_MASTER_Drive%_%M0_MASTER_DRIVE_FREE% 	>> %M0_LOG%
SET M0_DSIK_LOG_STR=%x%/%y%/%z%,%M0_TAG_Drive%,%M0_SPACE%
echo. %M0_TAG_Drive%,%x%/%y%/%z%,�i�Ϊ����ϥΦ줸���`�� ,%M0_SPACE% 			>> %M0_LOG_F%
echo. **************************************************						>> %M0_LOG%
::PAUSE
GOTO L0_CHECK_Drive_D

:L0_CHECK_Drive_E
set M0_TAG_Drive=E:
IF NOT EXIST %M0_TAG_Drive% GOTO L0_EXIT_ERROR
echo. >> %M0_LOG%
echo. **************************************************	>> %M0_LOG%
echo. �ˬd�ϺЪŶ�  %M0_TAG_Drive% >> %M0_LOG%
echo. 														>> %M0_LOG%
fsutil volume diskfree %M0_TAG_Drive%						> %M0_Swap_TMP%
TYPE %M0_Swap_TMP% >> %M0_LOG%

for /f "usebackq tokens=1-4 delims= " %%i IN (`FIND "�i�Ϊ����ϥΦ줸���`��" "%M0_Swap_TMP%" `) DO (
	::echo %%l
	SET M0_SPACE=%%k
	SET M0_SPACE_G=%%l
	)
	
SET M0_DSIK_LOG_STR=%M0_DSIK_LOG_STR%,%M0_TAG_Drive%,%M0_SPACE%		
echo. %M0_TAG_Drive%,%x%/%y%/%z%,�i�Ϊ����ϥΦ줸���`�� ,%M0_SPACE% 	>> %M0_LOG_E%
echo. **************************************************	>> %M0_LOG%
echo. >> %M0_LOG%

:L0_CHECK_Drive_D
set M0_TAG_Drive=D:
IF NOT EXIST %M0_TAG_Drive% GOTO L0_EXIT_ERROR
echo. >> %M0_LOG%
echo. **************************************************	>> %M0_LOG%
echo. �ˬd�ϺЪŶ�  %M0_TAG_Drive% >> %M0_LOG%
echo. 														>> %M0_LOG%

fsutil volume diskfree %M0_TAG_Drive%						> %M0_Swap_TMP%
TYPE %M0_Swap_TMP% >> %M0_LOG%
for /f "usebackq tokens=1-4 delims= " %%i IN (`FIND "�i�Ϊ����ϥΦ줸���`��" "%M0_Swap_TMP%" `) DO (
	::echo %%l
	SET M0_SPACE=%%k
	SET M0_SPACE_G=%%l
	)
	
SET M0_DSIK_LOG_STR=%M0_DSIK_LOG_STR%,%M0_TAG_Drive%,%M0_SPACE%	
echo. %M0_TAG_Drive%,%x%/%y%/%z%,�i�Ϊ����ϥΦ줸���`�� ,%M0_SPACE% 	>> %M0_LOG_D%
echo. **************************************************	>> %M0_LOG%
echo. >> %M0_LOG%

set M0_TAG_Drive=C:
IF NOT EXIST %M0_TAG_Drive% GOTO L0_EXIT_ERROR
echo. >> %M0_LOG%
echo. **************************************************	>> %M0_LOG%
echo. �ˬd�ϺЪŶ�  %M0_TAG_Drive% >> %M0_LOG%
echo. 														>> %M0_LOG%

fsutil volume diskfree %M0_TAG_Drive%						> %M0_Swap_TMP%
TYPE %M0_Swap_TMP% >> %M0_LOG%
for /f "usebackq tokens=1-4 delims= " %%i IN (`FIND "�i�Ϊ����ϥΦ줸���`��" "%M0_Swap_TMP%" `) DO (
	::echo %%l
	SET M0_SPACE=%%k
	SET M0_SPACE_G=%%l
	)
	
SET M0_DSIK_LOG_STR=%M0_DSIK_LOG_STR%,%M0_TAG_Drive%,%M0_SPACE%
echo. %M0_TAG_Drive%,%x%/%y%/%z%,�i�Ϊ����ϥΦ줸���`�� ,%M0_SPACE% 	>> %M0_LOG_C%
echo. **************************************************	>> %M0_LOG%

::timeout /t 30
echo. >> %M0_LOG%
echo. >> %M0_LOG%
echo. **************************************************	>> %M0_LOG%
echo. �{���W�� ck_HardDisk_Space.BAT						>> %M0_LOG%
echo. �{�������ɶ� %ex%-%y%-%z%,%time%  					>> %M0_LOG%
echo. **************************************************	>> %M0_LOG%
REM GOTO L0_Drive_CHANGE_01
GOTO L0_EXIT_OK


:L0_EXIT_OK
SET M0_MSG_CHT_STR="[�ˬd����]_�ˬd_PC[%M0_ServerName%-%M0_ServerIP%]�w��_�̥D�n�ʱ��ϺЪŶ�_%M0_MASTER_Drive%%M0_MASTER_DRIVE_FREE%-[FM-%M0_SENDIP%]"
SET M0_MSG_ENG_STR=[Finish...]Check_PC[%M0_ServerName%-%M0_ServerIP%])_HD_FreeSpace%M0_MASTER_Drive%%M0_MASTER_DRIVE_FREE%-[FM-%M0_SENDIP%]
SET M0_MSG_ICON=64
SET M0_event=ok_msg
GOTO L0_SENDMSG1

:L0_EXIT_ERROR
echo. **************************************************	>> %M0_LOG%
echo. �ˬd�ϺЪŶ� %M0_TAG_Drive% 	ERROR ERROR	ERROR		>> %M0_LOG%
echo. �䤣��w�о� %M0_TAG_Drive%							>> %M0_LOG%
echo. **************************************************	>> %M0_LOG%
SET M0_MSG_CHT_STR="[***ERROR***]_�ˬdPC[%M0_ServerName%-%M0_ServerIP%]�w�ЪŶ�,�䤣��w�о�_%M0_TAG_Drive%_-[FM-%M0_SENDIP%]"
SET M0_MSG_ENG_STR=[***ERROR***]Check_PC[%M0_ServerName%-%M0_ServerIP%]HardDisk_FreeSpace_no_finded_HD_Drive%M0_TAG_Drive%_-[FM-%M0_SENDIP%]
SET M0_MSG_ICON=16
SET M0_event=err_msg


:L0_SENDMSG1
REM �N LOG �g�b�e�� ***2019/01/21
echo. %M0_DSIK_LOG_STR%	 >> %M0_LOG_sum1%
TYPE %M0_LOG_HEAD% >> %M0_Swap_OK%
TYPE %M0_LOG_wmic% >> %M0_Swap_OK%
::TYPE D:\LOG\Drive_sum.csv >> %M0_Swap_OK%
echo. >> %M0_LOG%
echo. >> %M0_LOG%
TYPE %M0_LOG% >> %M0_Swap_OK%

SET M0_LOG=%M0_Swap_OK%
SET M0_LOG_OTHER=%M0_Swap_OK%,%M0_LOG_sum1%,%M0_wmic_ok%



REM �N LOG �g�b�e�� ***2019/01/21


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
net use /del %M0_TAG_DRIVE% /y 
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

	