@echo off
REM ****************************************************
REM 20200701 �Q�� FIND �N�s�J systeminfo  �� "�t�ζ}���ɶ�"  ��X�}���ɶ�       2020/9/21, �W�� 11:09:19 
REM (1) 
REM ************************************
setlocal enableDelayedExpansion
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


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::PAUSE
::echo. Running Date is: %x%/%y%/%z%  YYYY/MM/DD
::echo. Running Date is: %cx%%y%%z%  CYYMM 

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
REM SET M0_event=err_msg

REM set M0_event=123_ok_test
REM set M0_event=123_err_test
REM SET M0_WEP=cpAo5pnlpx8uuld8ebP7oc

REM set M0_event=1_panda_ok_msg
set M0_event=1_panda_err_msg
SET M0_WEP=d11JbnhamEDAVhh4fI4Sdp


REM ******DEBUG

set M0_SENDIP=10.93.9.65
set M0_ServerName=Panda_Pc
set M0_RUNDRIVE=D:
SET M0_LOGDIR=\Msg\Use\Log
SET M0_RUNDIR=\Msg\Use
set M0_TAGFIL1=%M0_LOGDIR%\Power_on_systeminfo.txt
SET M0_LOG1=%M0_LOGDIR%\Power_on_RUNLOG.txt

set M0_boot_time=��X�}���ɶ�



SET M0_MSG_CHT_STR="[�ˬd��]_�ˬd�ðO���}���������T-[FM-%M0_SENDIP%]"
SET M0_MSG_ENG_STR=[Process...]_Check Power on systeminfo-[FM-%M0_SENDIP%]
REM !!!####20190121######

	
	REM �]�ثe send_msg1.bat �������v�T�ݩ�b M0_RUNDIR
	REM �]�ثe M0_RUNDIR KEY�S��b\set\Tpass 
	REM 2019/01/23 �N��Msg ���� �Τl�ؿ������h�� \msg\set
	SET M0_SETDIR=%M0_RUNDIR%
	SET M0_SENDMSG_1=%M0_SETDIR%\send_msg1_panda.bat
	SET M0_SENDMSG_2=%M0_SETDIR%\send_msg2_panda.bat
	SET M0_SENDMSG_3=%M0_SETDIR%\send_msg3_panda.bat


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


:L0_CHECK_START
REM 
%M0_RUNDRIVE%
CD %M0_RUNDIR%
copy nul %M0_TAGFIL1% /y /v > NUL
echo. > %M0_LOG1%


echo. **************************************************	>> %M0_LOG1%
echo. �{���W��      : 0-Power_on.BAT						>> %M0_LOG1%
echo. �{������ɶ�  : %ex%-%y%-%z%,%time%  					>> %M0_LOG1%
echo. ���ˬd�ؿ��ɮ�: %M0_TAGFIL1%							>> %M0_LOG1%
echo. **************************************************	>> %M0_LOG1%
echo. >> %M0_LOG1%
echo. >> %M0_LOG1%

REM ======CMD======
systeminfo >> %M0_TAGFIL1%
REM net user A123274643 /domain >> %M0_TAGFIL1%
REM ======CMD======
IF NOT EXIST %M0_TAGFIL1% GOTO L0_EXIT_ERROR
REM *************************************************************************************************
REM : ��X�}���ɶ� 
for /f "usebackq tokens=1-4 delims= " %%i IN (`FIND "�}���ɶ�" %M0_TAGFIL1% `) DO (
	SET M0_i=%%i
	SET M0_j=%%j
	SET M0_k=%%k
	SET M0_l=%%l
	)
echo. %M0_i%,%M0_j%,%M0_k%,%M0_l% >> %M0_LOG1%
set M0_boot_time= %M0_i% %M0_j% %M0_k% %M0_l%
echo. %M0_boot_time%
echo. ��� �}���ɶ�_[ %M0_boot_time% ]
::timeout /t 3600
REM *************************************************************************************************
REM : ��X�}���ɶ� 


:L0_EXIT_OK
SET M0_MSG_CHT_STR="[�w�O��]_�ˬd�ðO���}���������T,�}���ɶ�-[ %M0_boot_time% ]-[FM-%M0_SENDIP%]"
SET M0_MSG_ENG_STR=[log Done]_Check Power on systeminfo_Boot_Time[ %M0_boot_time% ]-[FM-%M0_SENDIP%]
SET M0_MSG_ICON=64
set M0_event=1_panda_ok_msg
GOTO L0_SENDMSG1

:L0_EXIT_ERROR
SET M0_MSG_CHT_STR="[***ERROR***]���`_�䤣��}���������T_systeminfo-[%M0_TAGFIL1%]-[FM-%M0_SENDIP%]"
SET M0_MSG_ENG_STR=[***ERROR***]_Not Find Power on systeminfo-[%M0_TAGFIL1%] File NOT FIND-[FM-%M0_SENDIP%]
SET M0_MSG_ICON=16
set M0_event=1_panda_err_msg
GOTO L0_CHECK_WAIT

:L0_SENDMSG1
REM add attach query file
echo. >> %M0_LOG1%
echo. >> %M0_LOG1%
TYPE %M0_TAGFIL1% >> %M0_LOG1%



IF NOT EXIST %M0_SENDMSG_1% GOTO L0_SENDMSG2
REM FOR SEND MAIL
SET M0_LOG=%M0_LOG1%
call %M0_SENDMSG_1%
REM echo msgbox %M0_OK_STR%,64,"??d???T??%DATE%-%TIME%">1.vbs && start 1.vbs && ping -n 2 127.1>nul && del 1.vbs
GOTO L0_SENDMSG2

:L0_SENDMSG2
IF NOT EXIST %M0_SENDMSG_2% GOTO L0_SENDMSG3
call %M0_SENDMSG_2%
REM sent %M0_SENDIP% %M0_MSG_CHT_STR%
GOTO L0_SENDMSG3

:L0_SENDMSG3
IF NOT EXIST %M0_SENDMSG_3% GOTO L0_EXIT_OUT
REM call %M0_SENDMSG_3%
REM START curl -S -X POST http://maker.ifttt.com/trigger/123msg/with/key/%M0_WEP% -F "value1=%M0_MSG_OK%"

GOTO L0_EXIT_OUT


:L0_EXIT_OUT
set M0_ServerIP=
set M0_ServerName=
set M0_RUNDRIVE=
set M0_TAGDIR=
set M0_TAGFIL1=
SET M0_LOG1=
SET M0_LOGDIR=
SET M0_RUNDIR=
set M0_STR1=
set M0_STR2=

SET M1_USERNAME=
SET M1_LOGONID=

EXIT


REM::	�D���W��:             W23-009-065
REM::	�@�~�t�ΦW��:         Microsoft Windows 10 ���~�� LTSC
REM::	�@�~�t�Ϊ���:         10.0.17763 N/A �ի� 17763
REM::	�@�~�t�λs�y��:       Microsoft Corporation
REM::	�@�~�t�γ]�w:         �����u�@��
REM::	�@�~�t�βի�����:     Multiprocessor Free
REM::	���U���֦���:         user
REM::	���U���q:             
REM::	���~�ѧO�X:           00425-00000-00002-AA758
REM::	��l�w�ˤ��:         2020/7/29, �W�� 10:53:07
REM::	�t�ζ}���ɶ�:         2020/9/21, �W�� 11:09:19
REM::	�t�λs�y��:           LENOVO
REM::	�t�Ϋ���:             10A6A0L5TW
REM::	�t������:             x64-based PC
REM::	�B�z��:               �w�w�� 1 �B�z���C
REM::	                      [01]: Intel64 Family 6 Model 60 Stepping 3 GenuineIntel ~3401 Mhz
REM::	BIOS ����:            LENOVO FBKT75AUS, 2014/4/1
REM::	Windows �ؿ�:         C:\Windows
REM::	�t�Υؿ�:             C:\Windows\system32
REM::	�}���˸m:             \Device\HarddiskVolume6
REM::	�t�Φa�ϳ]�w:         zh-tw;���� (�x�W)
REM::	��J�k�a�ϳ]�w:       zh-tw;���� (�x�W)
REM::	�ɰ�:                 (UTC+08:00) �x�_
REM::	����O�����`�p:       16,045 MB
REM::	�i�ι���O����:       11,441 MB
REM::	�����O����: �j�p�W��: 18,477 MB
REM::	�����O����: �i��:     13,670 MB
REM::	�����O����: �ϥΤ�:   4,807 MB
REM::	�����ɦ�m:           C:\pagefile.sys
REM::	����:                 cathaysec.com.tw
REM::	�n�J���A��:           \\SECSVR19-01
REM::	Hotfix:               �w�w�� 11 Hotfix�C
REM::	                      [01]: KB2693643
REM::	                      [02]: KB4565625
REM::	                      [03]: KB4465065
REM::	                     [04]: KB4470788
REM::	                      [05]: KB4486153
REM::	                      [06]: KB4487038
REM::	                      [07]: KB4539571
REM::	                     [08]: KB4558997
REM::	                     [09]: KB4561600
REM::	                     [10]: KB4566424
REM::	                  [11]: KB4565349

