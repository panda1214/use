@echo off
REM ****************************************************
REM 20200701 利用 FIND 將存入 SET 之 LOGON ID 找出
REM (1) 
REM ************************************
setlocal enableDelayedExpansion
REM 底下為IFTTT轉Line金鑰
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

REM 今日 2020/04/01 



REM *********** SET 程式各項參數  *********
REM !!! SET TAGDIR,RUNDIR,BAKDIR, CK_FILE,RUNLOG...
REM logckcount 累計檢查次數(不管LOG有無異動)
REM set /A M0_Check_WAait=60 每次休息 60 SEConds
REM SET /A M0_Check_TOT_Count=10次,	 共檢查10分鐘,  時間到,還未檢查到有檔案即發出告警,
REM (1)無檔案產生可被檢查,暫停60秒等待 
REM (2)中間有正確今日檔案
REM (3)檢查檔案內容有 "異常" 或 正常 ,即離開程式,並發出結果是正常或異常
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
set M0_TAGDIR=\Msg\Use\Log
set M0_TAGFIL1=%M0_TAGDIR%\set.txt
SET M0_LOG1=%M0_TAGDIR%\ck_logon_RUNLOG.txt

SET M0_LOGDIR=\LOG
SET M0_RUNDIR=\Msg\Use
set M0_STR1=USER
set M0_STR2=NAME



SET M0_MSG_CHT_STR="[檢查中]_檢查並記錄開機後,登入帳號-[FM-%M0_SENDIP%]"
SET M0_MSG_ENG_STR=[Process...]_Check Logon PC User ID-[FM-%M0_SENDIP%]
REM !!!####20190121######

	
	REM 因目前 send_msg1.bat 受交易日影響需放在 M0_RUNDIR
	REM 因目前 M0_RUNDIR KEY又放在\set\Tpass 
	REM 2019/01/23 將原Msg 執行 及子目錄全部搬到 \msg\set
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


echo. **************************************************		>> %M0_LOG1%
echo. 程式名稱      : 0-logon_User.BAT						>> %M0_LOG1%
echo. 程式執行時間  : %ex%-%y%-%z%,%time%  					>> %M0_LOG1%
echo. 應檢查目錄檔案: %M0_TAGFIL1%							>> %M0_LOG1%
echo. **************************************************		>> %M0_LOG1%
echo. >> %M0_LOG1%
echo. >> %M0_LOG1%

REM ======CMD======
net user %username% /domain >> %M0_TAGFIL1%
::GOTO L0_NETUSER_ERR
IF %ERRORLEVEL% equ 0 GOTO L0_NETUSER_OK
IF %ERRORLEVEL% neq 0 GOTO L0_NETUSER_ERR

GOTO L0_NOMESSAGE



REM net user A123274643 /domain >> %M0_TAGFIL1%
REM ======CMD======

:L0_NETUSER_OK
IF NOT EXIST %M0_TAGFIL1% GOTO L0_EXIT_ERROR
REM *************************************************************************************************
REM : 找出中文姓名 (全名)
for /f "usebackq tokens=1-4 delims= " %%i IN (`FIND "全名" %M0_TAGFIL1% `) DO (
	SET M0_i=%%i
	SET M0_j=%%j
	SET M0_k=%%k
	SET M0_l=%%l
	)
set M1_LOGONID=%M0_j%
echo.  找到 登入帳號-中文姓名(全名)_[%M1_LOGONID% ]
::timeout /t 300
REM : 找出中文姓名 (全名)
REM *************************************************************************************************
GOTO L0_EXIT_OK


:L0_NETUSER_ERR
set > %M0_TAGFIL1%
IF NOT EXIST %M0_TAGFIL1% GOTO L0_EXIT_ERROR
REM *************************************************************************************************
REM : 找到 登入帳號 (ID)
for /f "usebackq tokens=1-4 delims= " %%i IN (`FIND "USERNAME" %M0_TAGFIL1% `) DO (
	SET M0_i=%%i
	)
::echo %M0_i% 
::echo %M0_j% 
::echo %M0_k%
::echo %M0_l%
set M1_LOGONID=%M0_i:~9,10%
echo.  ***************************** >> %M0_LOG1%
echo.  找到 登入帳號-_[%M1_LOGONID%] >> %M0_LOG1%
echo.  ***************************** >> %M0_LOG1%
echo.  因為無法執行 網域 cathaysec.com.tw 下的網域控制站處理,改用尋找SET環境
echo.  

::net user %username% /domain >> %M0_TAGFIL1%
::timeout /t 300
REM : 找到 登入帳號 (ID)
REM *************************************************************************************************
GOTO L0_EXIT_OK




:L0_EXIT_OK
SET M0_MSG_CHT_STR="[已記錄]_檢查並記錄開機後,登入帳號-[%M1_LOGONID%]-[FM-%M0_SENDIP%]"
SET M0_MSG_ENG_STR=[log Done]_Check Logon PC User ID-[%M1_LOGONID%]-[FM-%M0_SENDIP%]
SET M0_MSG_ICON=64
set M0_event=1_panda_ok_msg
GOTO L0_SENDMSG1

:L0_EXIT_ERROR
SET M0_MSG_CHT_STR="[***ERROR***]異常_找不到登入檔_SET-[%M0_TAGFIL1%]-[FM-%M0_SENDIP%]"
SET M0_MSG_ENG_STR=[***ERROR***]_Log File Error For LOG Logon PC User ID-[%M0_TAGFIL1%] File NOT FIND-[FM-%M0_SENDIP%]
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

