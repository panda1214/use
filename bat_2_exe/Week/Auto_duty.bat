@echo off
::REM ****************************************************
::REM 20210112 利用 FIND 讀入holiday.dat 將裡面存入假日找出來
::REM workday.dat 補上班工作日 20210220 M1_WORK_YN->A
::REM  周六或周日 (一般)例假日 20210109(6) 20210110(7) M1_WORK_YN->Y
::REM holiday.dat   設定例假日 20210101(5) 20210220(6) M1_WORK_YN->N

::REM (1) 檢查今日是否存在   workday.dat 為補上班工作日
::REM (2) 檢查今日是否為 周六或周日 ,    如有代表今日為勞工(一般)例假日
::REM (3) 比對今日日期有無在 holiday.dat 如有代表今日為設定例假日
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


REM 底下為IFTTT轉Line金鑰
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
REM 董國安 FIND 讀入holiday.dat 將裡面存入 假日找出來
REM ************************************
REM ===================================================================================
REM 設定程式所有變數
SET M1_TAG_WRK_FIL1=D:\msg\use\workday.dat
SET M1_TAG_HOL_FIL1=D:\msg\use\holiday.dat
REM ===============================
set M1_FIND_DATE=%x%%y%%z%
REM M1_FIND_DATE=YYYYMMDD	 用於傳送接收 FIND *.dat  內日曆日期
set M1_TODAY=%x%%y%%z%
REM M1_TODAY=YYYYMMDD  	 今日日期
set M1_WORK_YN=1
::REM M1_WORK_YN=1  	     預設今日日期上班工作日 (1->  true(A) fail(go step2)   2->true(Y) fail(go step3) 		3->true(N) fail (S)
set M1_WEEK_D=0
REM M1_WEEK_D=0 	     預設今日周 0

REM 設定程式所有變數
REM ===================================================================================
REM *********** SET 程式各項參數  *********
REM !!! SET TAGDIR,RUNDIR,BAKDIR, CK_FILE,RUNLOG...
REM #########################
REM 
SET M1_event=err_msg
:: REM SET M1_event=err_msg  For Line Message Event
set M1_SENDIP=10.93.9.65
set M1_ServerIP=10.93.9.65
set M1_ServerName=Panda_PC
SET M1_MSG_CHT_STR="[檢查中]_今日日期(01)%M1_TAG_WRK_FIL1% (2)系統周幾 (3)%M1_TAG_HOL_FIL1%-[FM-%M1_SENDIP%]"
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
REM 將 LOG 寫在前面 ***2019/01/21
SET M1_Swap_TMP=%M1_LOGDIR%\FD_Holiday_LOG_TMP.txt
REM 每次離開時把M1_LOG 存至 M1_Swap_TMP
SET M1_Swap_OK=%M1_LOGDIR%\FD_Holiday_LOG_OK.txt
REM 最後一次離開時把LOG寫在前面, 後面再加上原 M1_LOG


:L1_CHECK_START01
::REM 起始 LOG File & empty log file
echo. > %M1_LOG_HEAD%
echo. > %M1_LOG%
SET M0_LOG=%M1_LOG%
::REM M1_LOG use in send mesg file name (mail attach file)
echo. > %M1_Swap_TMP%
echo. > %M1_Swap_OK%

echo. **************************************************	>> %M1_LOG_HEAD%
echo. 程式名稱 Find_Holiday.BAT								>> %M1_LOG_HEAD%
echo. 程式執行時間 %ex%-%y%-%z%,%time%  					>> %M1_LOG_HEAD%
echo. **************************************************	>> %M1_LOG_HEAD%
::timeout /t 3600





:L1_CHECK_STEP01
REM *************************************************************************************************
REM SUB FUNC :L1_CHECK_STEP01
echo Process...Step 1 : 找出 %M1_TODAY% 是否存在 %M1_TAG_WRK_FIL1% 為補上班工作日 		>> %M1_LOG%
echo Process...Step 1 : 找出 %M1_TODAY% 是否存在 %M1_TAG_WRK_FIL1% 為補上班工作日
REM *************************************************************************************************
SET M1_MSG_CHT_STR="[檢查中]_STEP01-找出 %M1_TODAY% 是否存在 %M1_TAG_WRK_FIL1% 用以判別補上班工作日-[FM-%M1_SENDIP%]"
set M1_FIND_DATE=%x%%y%%z%
REM M1_FIND_DATE=YYYYMMDD	 用於傳送接收 FIND *.dat  內日曆日期
set M1_TODAY=%x%%y%%z%
REM M1_TODAY=YYYYMMDD  	 今日日期
set M1_WORK_YN=00
REM M1_WORK_YN=10  SUN FUNC true 今日日期上班工作日 GOTO L1_CHECK_STEP_END
REM M1_WORK_YN=11  SUN FUNC fail 今日日期上班工作日 goto step 2


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
REM ::SUN FUNC  M1_WORK_YN=1 true 今日日期上班工作日 GOTO L1_CHECK_STEP_END
::echo L1_TODAY_WORK_YES
::echo variable1, %M1_i% 
::echo M1_FIND_DATE,  %M1_FIND_DATE%
::echo M1_TODAY,  %M1_TODAY%
::echo M1_WORK_YN,  %M1_WORK_YN%
::timeout /t 3600
echo END.....Process...Step 1 : 已找出 %M1_TODAY% 存在 %M1_TAG_WRK_FIL1% 為補上班工作日						>> %M1_LOG%
SET M1_MSG_CHT_STR="[檢查完成]_找到補上班工作日設定檔_%M1_TAG_WRK_FIL1%-%M1_FIND_DATE%-[FM-%M1_SENDIP%]"
echo. >> %M1_LOG%
echo. >> %M1_LOG%
GOTO L1_CHECK_STEP_END

:L1_STEP01_NO
set M1_WORK_YN=11
REM M1_WORK_YN=2  SUN FUNC fail 今日日期上班工作日 goto step 2

GOTO L1_CHECK_STEP02
::TEST
::GOTO L1_CHECK_STEP03
REM *************************************************************************************************
REM :: END FUNC L1_CHECK_STEP01	找出 %M1_TODAY% 存在 %M1_TAG_WRK_FIL1% 為補上班工作日
REM *************************************************************************************************



:L1_CHECK_STEP02
echo END.....Process...Step 1 :  %M1_TODAY% 不存在 %M1_TAG_WRK_FIL1% ,進入STEP 2檢查今日是為周幾?	>> %M1_LOG%
echo. >> %M1_LOG%
echo. >> %M1_LOG%
REM *************************************************************************************************
REM :: SUB FUNC :L1_CHECK_STEP02
REM :: (2) 檢查今日是否為 周六或周日 ,    如有代表今日為勞工(一般)例假日
REM :: 取得今日為週 ?
SET M1_MSG_CHT_STR="[檢查中]_STEP02-找出 %M1_TODAY% 是否為 周六或周日,如有代表今日為勞工(一般)例假日-[FM-%M1_SENDIP%]"  
echo Process...Step 2 : 找出 %M1_TODAY% 是否為 周六或周日,如有代表今日為勞工(一般)例假日								>> %M1_LOG%
echo Process...Step 2 : 找出 %M1_TODAY% 是否為 周六或周日,如有代表今日為勞工(一般)例假日
REM *************************************************************************************************
set M1_FIND_DATE=%x%%y%%z%
REM :: M1_FIND_DATE=YYYYMMDD	 用於傳送接收 FIND *.dat  內日曆日期
REM :: set M1_TODAY=%x%%y%%z%
REM M1_TODAY=YYYYMMDD  	 今日日期
set M1_WORK_YN=20
REM M1_WORK_YN=20  SUN FUNC 檢查今日是否為 周六或周日  true  GOTO L1_CHECK_STEP_END
REM M1_WORK_YN=21  SUN FUNC fail 今日日期上班工作日 goto step 3




REM : (2) 檢查今日是否為 周六或周日 ,    如有代表今日為勞工(一般)例假日
REM ::取得今日為週 ?

FOR /F "tokens=2" %%i IN ('date/t') DO (
  IF 週一==%%i (set M1_WEEK_D=週一)
  IF 週二==%%i (set M1_WEEK_D=週二)
  IF 週三==%%i (set M1_WEEK_D=週三)
  IF 週四==%%i (set M1_WEEK_D=週四)
  IF 週五==%%i (set M1_WEEK_D=週五)
  IF 週六==%%i (set M1_WEEK_D=週六)
  IF 週日==%%i (set M1_WEEK_D=週日) 
SET M1_WEEKEND=%%i 
  )



IF %M1_WEEK_D% EQU 週六 GOTO L1_STEP02_YES
IF %M1_WEEK_D% EQU 週日 GOTO L1_STEP02_YES
::REM IF %M1_FIND_DATE% NEQ (週六,週日, =1-5) GOTO L1_STEP02_NO
GOTO L1_STEP02_NO


:L1_STEP02_YES
set M1_FIND_DATE=系統日期_day_of_Week
set M1_WORK_YN=21
echo END....Process...Step 2 :  系統日期%M1_TODAY% 是周六或周日,確認今日為(一般)休假日,進入STEP 3檢查是否補休假日	>> %M1_LOG%
echo END....Process...Step 2 :  系統日期%M1_TODAY% 是周六或周日,確認今日為(一般)休假日,進入STEP 3檢查是否補休假日	
echo. >> %M1_LOG%
echo. >> %M1_LOG%				
GOTO GOTO L1_CHECK_STEP03


:L1_STEP02_NO
set M1_WORK_YN=20
set M1_FIND_DATE=
echo END....Process...Step 2 :  %M1_TODAY% 今日非為周六或周日,為平日工作日	>> %M1_LOG%
echo END....Process...Step 2 :  %M1_TODAY% 今日非為周六或周日,為平日工作日
echo. >> %M1_LOG%
echo. >> %M1_LOG%


::REM IF %%i 1-5 GOTO  L1_CHECK_STEP03
GOTO L1_CHECK_STEP_END 
REM *************************************************************************************************
REM :: END FUNC L1_CHECK_STEP02	(2) 檢查今日是否為 周六或周日 ,    如有代表今日為勞工(一般)例假日
REM *************************************************************************************************



:L1_CHECK_STEP03
REM *************************************************************************************************
REM : 找出    周6,日 有無在 holiday.dat 如有代表今日為非周6周日之例假日
REM :: SUB FUNC L1_CHECK_STEP03
SET M1_MSG_CHT_STR="[檢查中]_STEP03-%M1_TAG_HOL_FIL1% 找出 %M1_TODAY% 有無設定今日補休假日-[FM-%M1_SENDIP%]"	
echo Process...Step 3 : %M1_TAG_HOL_FIL1% 找出 %M1_TODAY% 有無設定今日補休假日,進入STEP 3檢查....				>> %M1_LOG%
echo Process...Step 3 : %M1_TAG_HOL_FIL1% 找出 %M1_TODAY% 有無設定今日補休假日,進入STEP 3檢查....
REM *************************************************************************************************
set M1_FIND_DATE=%x%%y%%z%
REM :: M1_FIND_DATE=YYYYMMDD	 用於傳送接收 FIND *.dat  內日曆日期
REM :: set M1_TODAY=%x%%y%%z%
REM :: M1_TODAY=YYYYMMDD  	 今日日期
set M1_WORK_YN=30
REM M1_WORK_YN=30  SUN FUNC 找出 FILE(%M1_TAG_HOL_FIL1%)找到 %M1_TODAY% ,今日為補休假日  true  L1_STEP03_FIND 
REM M1_WORK_YN=31  SUN FUNC 找出 FILE(%M1_TAG_HOL_FIL1%)找到 %M1_TODAY% ,今日為補休假日  fail  L1_STEP03_NOFIND

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
SET M1_MSG_CHT_STR="[檢查完成]_FILE(%M1_TAG_HOL_FIL1%)找到 %M1_TODAY% ,今日為補休假日-[FM-%M1_SENDIP%]"
::echo PROCESS......L1_STEP03_FIND 
set M1_WORK_YN=30


echo End........Process...Step 3 : 找到 %M1_TODAY% ,今日為補休假日(且非周六或周日)		>> %M1_LOG%
SET M1_MSG_CHT_STR="[檢查完成]_補休假日設定檔_%M1_TAG_HOL_FIL1%找到 %M1_FIND_DATE% 今日為補休假日(且非周六或周日)-[FM-%M1_SENDIP%]"
GOTO L1_CHECK_STEP_END


:L1_STEP03_NOFIND 
set M1_FIND_DATE=ERROR
SET M1_MSG_CHT_STR="[檢查異常]_M1_TAG_HOL_FIL1% 未找到 %M1_TODAY% -[FM-%M1_SENDIP%]"
echo @@@@End........Process...Step 3 : %M1_TAG_HOL_FIL1% 未找到 %M1_TODAY%  ,今日為工作日(非周六或周日)@@@@		>> %M1_LOG%
set M1_WORK_YN=31
GOTO L1_SYSTEM_ERROR

REM *************************************************************************************************
REM :: END FUNC L1_CHECK_STEP03 	找出     今日是否存在   workday.dat 為補上班工作日
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

echo 今日日期為(M1_TODAY)為	%M1_TODAY%							
echo 今日是否為工作日(M1_WORK_YN)為	%M1_WORK_YN%			
echo 找到工作設定檔(%M1_TAG_WRK_FIL1%) 其工作日為 %M1_FIND_DATE%	
echo 找到假日設定檔(%M1_TAG_HOL_FIL1%) 其假日為   %M1_FIND_DATE%	

echo 今日日期為(M1_TODAY)	%M1_TODAY%							>> %M1_LOG%
echo 今日是否為工作日(M1_WORK_YN)		%M1_WORK_YN%			>> %M1_LOG%
echo 找到工作設定檔(%M1_TAG_WRK_FIL1%) 其工作日為 %M1_FIND_DATE%	>> %M1_LOG%
echo 找到假日設定檔(%M1_TAG_HOL_FIL1%) 其假日為   %M1_FIND_DATE%	>> %M1_LOG%



echo. >> %M1_LOG%
echo. >> %M1_LOG%
echo. **************************************************	>> %M1_LOG%
echo. 程式名稱 Find_Holiday.BAT								>> %M1_LOG%
echo. 程式完成時間 %ex%-%y%-%z%,%time%  					>> %M1_LOG%
echo. **************************************************	>> %M1_LOG%

::set M1_FIND_DATE=20200101
::REM M1_FIND_DATE=YYYYMMDD	 workday.dat 上班工作日
::set M1_FIND_DATE=20200101
::REM M1_FIND_DATE=YYYYMMDD	 holiday.dat 例假日
::set M1_TODAY=%x%%y%%z%
::REM M1_TODAY=YYYYMMDD  	 今日日期
::set M1_WORK_YN=Y
::REM M1_WORK_YN=Y  	     預設今日日期上班工作日

GOTO L1_EXIT_OK

:L1_EXIT_OK
IF %M1_WORK_YN% EQU 10 SET M1_MSG_CHT_STR="[檢查完成]_找到補上班工作日設定檔_%M1_TAG_WRK_FIL1%-%M1_FIND_DATE%-[FM-%M1_SENDIP%]"
IF %M1_WORK_YN% EQU 20 SET M1_MSG_CHT_STR="[檢查完成]_檢查%M1_TODAY%_為正常上班日-今日日期(%M1_TODAY%)-工作日期(%M1_FIND_DATE%,%M1_WEEK_D%)-[FM-%M1_SENDIP%]"
IF %M1_WORK_YN% EQU 30 SET M1_MSG_CHT_STR="[檢查完成]_FILE(%M1_TAG_HOL_FIL1%)找到 %M1_TODAY% ,今日為補休假日-[FM-%M1_SENDIP%]"
::IF %M1_WORK_YN% GTR 5 SET M1_MSG_CHT_STR="[檢查異常]_M1_TAG_HOL_FIL1% 未找到 %M1_TODAY% -[FM-%M1_SENDIP%]"


::ECHO %M1_MSG_CHT_STR%
::timeout /t 3600
SET M1_MSG_ICON=64
SET M1_event=ok_msg
GOTO L1_SENDMSG1

:L1_SENDMSG1
REM 將 LOG 寫在前面 ***2019/01/21
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
REM echo msgbox %M1_OK_STR%,64,"檢查檔案訊息%DATE%-%TIME%">1.vbs && start 1.vbs && ping -n 2 127.1>nul && del 1.vbs
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
REM 程式自動設定為 Administrator 權限
REM ************************************************************
REM  程式自動設定為 Administrator 權限
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