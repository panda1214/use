@echo off
::REM ****************************************************
::判別今日是否上班  (1)補上班工作日 (2)周六或周日 (3)例假日
::REM workday.dat 補上班工作日 20210220 M1_WORK_YN->10 11
::REM holiday.dat   設定例假日 20210101(5) 20210220(6) M1_WORK_YN->20 21
::REM  周六或周日 (一般)例假日 20210109(6) 20210110(7) M1_WORK_YN->30 31
::REM (1) 檢查今日是否存在   workday.dat 為補上班工作日
::REM (2) 比對今日日期有無在 holiday.dat 如有代表今日為設定例假日
::REM (3) 檢查今日是否為 周六或周日 ,    如有代表今日為勞工(一般)例假日
::REM ****************************************************
::REM workday.dat
::REM 20210220
::REM 20210911

::REM holiday.dat
::REM 20210101
::REM 20210210
::REM ****************************************************
::REM 2021.01.19 ADD MEMO 以 Find_Holiday(20110119.bat).bat 為 BASE 改為 0030 自動開關 0830 排程
:: (1) workday.dat	-> 有 -> 上班->    RUN SUB FUNC L1_ONDUTY
:: (2) holiday.dat	-> 有 -> 例假->    RUN SUB FUNC L1_OFFDUTY
:: (3) 	周1-周5    	-> 是 -> 上班->    RUN SUB FUNC L1_ONDUTY
:: 		周6-周7    	-> 是 -> 例假->    RUN SUB FUNC L1_OFFDUTY
::===================================================================
REM ************************************

GOTO L1_start_Admin
:L1_start_Admin01


REM 底下為IFTTT轉Line金鑰
REM curl -X POST -H "Content-Type: application/json" -d 
REM '{"value1":"J"}' https://maker.ifttt.com/trigger/{event}/with/key/dtLi4Ps62eMFj8FFCUGzCw
REM today   & Update M1_TAGFILE day **0 =today
echo wscript.echo dateadd("d",0,date) >%tmp%\tmp.vbs
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set sx=%%i
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set sy=%%j
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set sz=%%k
if %sy% LSS 10 set sy=0%sy%
if %sz% LSS 10 set sz=0%sz%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::VB SCRIPE version
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::VB SCRIPE version
REM today   & Update M1_TAGFILE day **+1 =tommorrow 
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
SET M1_MSGDSP_EXE=msg_str_sec_bye.eee
SET M1_TAG_WRK_FIL1=D:\msg\use\workday.dat
SET M1_TAG_HOL_FIL1=D:\msg\use\holiday.dat
set M1_SYSTEM_DATE=%sx%-%sy%-%sz%
REM ===============================
set M1_FIND_DATE=%x%%y%%z%
REM M1_FIND_DATE=YYYYMMDD	 用於傳送接收 FIND *.dat  內日曆日期
set M1_FIND_WRK_DATE=20000000
set M1_FIND_HOL_DATE=20000000
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
SET M1_LOG_HEAD=%M1_LOGDIR%\0030-AUTO_SET_DUTY_LOG_HEAD.txt
SET M1_LOG=%M1_LOGDIR%\0030-AUTO_SET_DUTY_RUNLOG.txt
SET M1_LOG_WORK=%M1_LOGDIR%\0030-AUTO_SET_DUTY_RUNLOG_WORK.txt
REM 將 LOG 寫在前面 ***2019/01/21
SET M1_Swap_TMP=%M1_LOGDIR%\0030-AUTO_SET_DUTY_LOG_TMP.txt
REM 每次離開時把M1_LOG 存至 M1_Swap_TMP
SET M1_Swap_OK=%M1_LOGDIR%\0030-AUTO_SET_DUTY_LOG_OK.txt
REM 最後一次離開時把LOG寫在前面, 後面再加上原 M1_LOG



IF NOT EXIST %M1_RUNDIR%\%M1_MSGDSP_EXE% GOTO L1_CK_FILE_ERR01
:L1_END_CK_FILE_ERR01
REM %M1_MSGDSP_EXE% 執行0030_auto_set_duty.bat 5  


::::::::::::::::::::::::::::
::START_01
::::::::::::::::::::::::::::

:L1_CHECK_START01
::REM 起始 LOG File & empty log file
echo. > %M1_LOG_HEAD%
echo. > %M1_LOG%
echo. > %M1_LOG_WORK%
SET M0_LOG=%M1_LOG%
::REM M1_LOG use in send mesg file name (mail attach file)
echo. > %M1_Swap_TMP%
echo. > %M1_Swap_OK%

echo. **************************************************	>> %M1_LOG_HEAD%
echo. 程式名稱 0030-auto_set_duty.bat						>> %M1_LOG_HEAD%
echo. 程式執行時間 %M1_SYSTEM_DATE%, %time%  				>> %M1_LOG_HEAD%
echo. **************************************************	>> %M1_LOG_HEAD%






:L1_CHECK_STEP01
REM *************************************************************************************************
REM SUB FUNC :L1_CHECK_STEP01
echo Process...Step 1 : 找出 %M1_TODAY% 是否存在 %M1_TAG_WRK_FIL1% 為補上班工作日 		>> %M1_LOG_WORK%
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
set M1_FIND_WRK_DATE=%M1_i%
set M1_WORK_YN=10
set M1_MSG_CHT_STR="[檢查完成]_(%M1_TODAY%)是補上班工作日 ，找到設定檔_%M1_TAG_WRK_FIL1%-%M1_FIND_DATE%-[FM-%M1_SENDIP%]"
echo END.....Process...Step 1 : 已找出 %M1_TODAY% 存在 %M1_TAG_WRK_FIL1% 為補上班工作日						>> %M1_LOG_WORK%
echo. >> %M1_LOG_WORK%
echo. >> %M1_LOG_WORK%
GOTO L1_ONDUTY
::(1) workday.dat	-> 有 -> 上班->    RUN SUB FUNC L1_ONDUTY
::GOTO L1_CHECK_STEP_END

:L1_STEP01_NO
set M1_FIND_WRK_DATE=(未找到)
set M1_WORK_YN=11
SET M1_MSG_CHT_STR="[檢查中]_STEP02-%M1_TAG_HOL_FIL1% 找出 %M1_TODAY% 有無設定今日補休假日-[FM-%M1_SENDIP%]"	
echo END.....Process...Step 1 :未找到 %M1_TODAY% 存在 %M1_TAG_WRK_FIL1% 為補上班工作日,進入Step 2檢查.		>> %M1_LOG_WORK%
REM M1_WORK_YN=2  SUN FUNC fail 今日日期上班工作日 goto step 2

GOTO L1_CHECK_STEP02
::TEST
::GOTO L1_CHECK_STEP02
REM *************************************************************************************************
REM :: END FUNC L1_CHECK_STEP01	找出 %M1_TODAY% 存在 %M1_TAG_WRK_FIL1% 為補上班工作日
REM *************************************************************************************************




:L1_CHECK_STEP02
REM *************************************************************************************************
REM : 找出    周6,日 有無在 holiday.dat 如有代表今日為非周6周日之補休假日
REM :: SUB FUNC L1_CHECK_STEP02
SET M1_MSG_CHT_STR="[檢查中]_STEP02-%M1_TAG_HOL_FIL1% 找出 %M1_TODAY% 有無設定今日補休假日-[FM-%M1_SENDIP%]"	
echo. >> %M1_LOG_WORK%
echo. >> %M1_LOG_WORK%
echo Process...Step 2 : %M1_TAG_HOL_FIL1% 找出 %M1_TODAY% 有無設定今日補休假日,進入Step 2檢查....		>> %M1_LOG_WORK%
echo Process...Step 2 : %M1_TAG_HOL_FIL1% 找出 %M1_TODAY% 有無設定今日補休假日,進入Step 2檢查....
REM *************************************************************************************************
set M1_FIND_DATE=%x%%y%%z%
REM :: M1_FIND_DATE=YYYYMMDD	 用於傳送接收 FIND *.dat  內日曆日期
REM :: set M1_TODAY=%x%%y%%z%
REM :: M1_TODAY=YYYYMMDD  	 今日日期
set M1_WORK_YN=30
REM M1_WORK_YN=30  SUN FUNC 找出 FILE(%M1_TAG_HOL_FIL1%)找到 %M1_TODAY% ,今日為補休假日  true  L1_STEP02_FIND 
REM M1_WORK_YN=31  SUN FUNC 找出 FILE(%M1_TAG_HOL_FIL1%)找到 %M1_TODAY% ,今日為補休假日  fail  L1_STEP02_NOFIND

::SET M1_TAG_HOL_FIL1=D:\msg\use\holiday.dat
::SET M1_TAG_WRK_FIL1=D:\msg\use\workday.dat
for /f "usebackq tokens=1 delims= " %%i IN (`FIND "%M1_TODAY%" %M1_TAG_HOL_FIL1% `) DO (
	SET M1_i=%%i
	)
set M1_FIND_HOL_DATE=%M1_i%	

IF %M1_FIND_HOL_DATE% EQU %x%%y%%z% GOTO L1_STEP02_FIND 
IF %M1_FIND_HOL_DATE% NEQ %x%%y%%z% GOTO L1_STEP02_NOFIND


:L1_STEP02_FIND
::echo PROCESS......L1_STEP02_FIND 
set M1_FIND_HOL_DATE=%M1_i%	
set M1_WORK_YN=20
SET M1_MSG_CHT_STR="[檢查完成]_檢查今日日期( %M1_TODAY% )為補休假日,找到補休假日設定檔_FILE (%M1_TAG_HOL_FIL1%-%M1_FIND_DATE%)-[FM-%M1_SENDIP%]"
echo End........Process...Step 2 :  [檢查完成]_今日日期( %M1_TODAY% )為補休假日,找到補休假日設定檔_FILE (%M1_TAG_HOL_FIL1%-%M1_FIND_DATE%)	>> %M1_LOG%
GOTO L1_OFFDUTY
:: (2) holiday.dat	-> 有 -> 例假->    RUN SUB FUNC L1_OFFDUTY
::  GOTO L1_CHECK_STEP_END




:L1_STEP02_NOFIND 
set M1_FIND_HOL_DATE=(未找到)
set M1_WORK_YN=21
echo END.....Process...Step 2 :  %M1_TODAY% 不存在 %M1_TAG_HOL_FIL1% ,進入STEP 3檢查今日是為周幾?	>> %M1_LOG_WORK%

GOTO L1_CHECK_STEP03

REM *************************************************************************************************
REM :: END FUNC L1_CHECK_STEP02 	找出     今日是否存在   workday.dat 為補上班工作日
REM *************************************************************************************************


:L1_CHECK_STEP03

echo. >> %M1_LOG_WORK%  
echo. >> %M1_LOG_WORK%  
REM *************************************************************************************************
REM :: SUB FUNC :L1_CHECK_STEP03
REM :: (2) 檢查今日是否為 周六或周日 ,    如有代表今日為勞工(一般)例假日
REM :: 取得今日為週 ?
SET M1_MSG_CHT_STR="[檢查中]_STEP03-找出 %M1_TODAY% 是否為 周六或周日,如有代表今日為勞工(一般)例假日-[FM-%M1_SENDIP%]"  
echo Process...Step 3 : 找出 %M1_TODAY% 是否為 周六或周日,如有代表今日為勞工(一般)例假日	>> %M1_LOG_WORK%
echo Process...Step 3 : 找出 %M1_TODAY% 是否為 周六或周日,如有代表今日為勞工(一般)例假日
REM *************************************************************************************************
set M1_FIND_DATE=%x%%y%%z%
REM :: M1_FIND_DATE=YYYYMMDD	 用於傳送接收 FIND *.dat  內日曆日期
REM :: set M1_TODAY=%x%%y%%z%
REM M1_TODAY=YYYYMMDD  	 今日日期
set M1_WORK_YN=31
REM M1_WORK_YN=20  SUN FUNC 檢查今日是否為 周六或周日  true  GOTO L1_CHECK_STEP_END
REM M1_WORK_YN=21  SUN FUNC fail 今日日期上班工作日 goto Step 2


REM : (3) 檢查今日是否為 周六或周日 ,    如有代表今日為勞工(一般)例假日
REM ::取得今日為週 ?
echo wscript.echo weekday("%x%-%y%-%z%",2) >%tmp%\tmp1.vbs
for /f "tokens=1 delims= " %%a in ('cscript /nologo %tmp%\tmp1.vbs') do (
  IF %%a==1 (set M1_WEEK_D=週一)
  IF %%a==2 (set M1_WEEK_D=週二)
  IF %%a==3 (set M1_WEEK_D=週三)
  IF %%a==4 (set M1_WEEK_D=週四)
  IF %%a==5 (set M1_WEEK_D=週五)
  IF %%a==6 (set M1_WEEK_D=週六)
  IF %%a==7 (set M1_WEEK_D=週日) 
  SET M1_WEEKEND=%%a 
  )

IF %M1_WEEK_D% EQU 週六 GOTO L1_STEP03_DAY67
IF %M1_WEEK_D% EQU 週日 GOTO L1_STEP03_DAY67
::REM IF %M1_FIND_DATE% NEQ (週六,週日, =1-5) GOTO L1_STEP03_NO
GOTO L1_STEP03_DAY15


set M1_WORK_YN=31
GOTO :L1_SYSTEM_ERROR


:L1_STEP03_DAY67
set M1_FIND_DATE=%M1_TODAY%_%M1_WEEK_D%
set M1_WORK_YN=30
set M1_FIND_DATE=%M1_TODAY%
SET M1_MSG_CHT_STR="[檢查完成]_檢查日期( %M1_TODAY%-%M1_WEEK_D%),確認為(一般)休假日-[FM-%M1_SENDIP%]"
echo END....Process...Step 3 :  檢查日期(%M1_TODAY%_%M1_WEEK_D%),確認為(一般)休假日	>> %M1_LOG_WORK%
echo END....Process...Step 3 :  檢查日期(%M1_TODAY%_%M1_WEEK_D%),確認為(一般)休假日	
echo. >> %M1_LOG_WORK%
echo. >> %M1_LOG_WORK%			
:: REM 週六,週日(一般)休假日
GOTO L1_OFFDUTY
:: (3) 	周6-周7    	-> 是 -> 例假->    RUN SUB FUNC L1_OFFDUTY
::GOTO L1_CHECK_STEP_END 



::REM ****************************************************
::REM 2021.01.19 ADD MEMO 以 Find_Holiday(20110119.bat).bat 為 BASE 改為 0030 自動開關 0830 排程
:: (1) workday.dat	-> 有 -> 上班->    RUN SUB FUNC L1_ONDUTY
:: (2) holiday.dat	-> 有 -> 例假->    RUN SUB FUNC L1_OFFDUTY
:: (3) 	周1-周5    	-> 是 -> 上班->    RUN SUB FUNC L1_ONDUTY
:: 		周6-周7    	-> 是 -> 例假->    RUN SUB FUNC L1_OFFDUTY
::===================================================================
REM ************************************



:L1_STEP03_DAY15
set M1_FIND_DATE=%M1_TODAY%_%M1_WEEK_D%
set M1_WORK_YN=30
set M1_FIND_DATE=%M1_TODAY%
SET M1_MSG_CHT_STR="[檢查完成]_檢查日期(%M1_TODAY%_%M1_WEEK_D%)為平日工作日,確認要上班-[FM-%M1_SENDIP%]"
echo END....Process...Step 3 : 檢查日期(%M1_TODAY%_%M1_WEEK_D%)為平日工作日,確認要上班	>> %M1_LOG_WORK%
echo END....Process...Step 3 : 檢查日期(%M1_TODAY%_%M1_WEEK_D%)為平日工作日,確認要上班
echo. >> %M1_LOG_WORK%
echo. >> %M1_LOG_WORK%
::REM IF %%i 1-5 GOTO  L1_CHECK_STEP02
GOTO L1_ONDUTY
:: (3) 	周1-周5    	-> 是 -> 上班->    RUN SUB FUNC L1_ONDUTY
::GOTO L1_CHECK_STEP_END


REM *************************************************************************************************
REM :: END FUNC L1_CHECK_STEP03	(3) 檢查今日是否為 周六或周日 ,如有代表今日為勞工(一般)例假日,1-5為平日工作日
REM *************************************************************************************************



:L1_SYSTEM_ERROR
SET M1_MSG_ICON=32
SET M1_event=err_msg	
SET M1_MSG_CHT_STR="[檢查異常]_%M1_TAG_WRK_FIL1%_%M1_TAG_HOL_FIL1% 未找到 %M1_TODAY% -[FM-%M1_SENDIP%]"
echo. >> %M1_LOG%
echo. >> %M1_LOG%
echo. [檢查異常]_補上班日檔 %M1_TAG_WRK_FIL1%_未找到 %M1_TODAY%		>> %M1_LOG%
echo. [檢查異常]_補休假日檔 %M1_TAG_HOL_FIL1%_未找到 %M1_TODAY%		>> %M1_LOG%
echo Process...SYSTEM ERROR ERROR @@@								>> %M1_LOG%
echo Process...SYSTEM ERROR ERROR @@@
GOTO L1_SENDMSG1


:L1_CHECK_STEP_END
echo. >> %M1_LOG_WORK%
echo. >> %M1_LOG_WORK%
echo. ***********************************************************************************************	 >> %M1_LOG_WORK%
echo. ***********************************************************************************************   >> %M1_LOG_WORK%
echo Process...CHECK_STEP_END		>> %M1_LOG_WORK%
echo Process...CHECK_STEP_END

echo 今日日期為(M1_TODAY)	%M1_TODAY%											>> %M1_LOG_WORK%
echo.-----------------------------------------------------------------------	>> %M1_LOG_WORK%
echo 今日日期(%M1_TODAY%)是否為工作日(M1_WORK_YN)%M1_WORK_YN%					>> %M1_LOG_WORK%
echo 10[ step1 ok FIND IN(%M1_TAG_WRK_FIL1%) 11(step1 Fail GOTO step 2 check) ]	>> %M1_LOG_WORK%
echo 20[ step1 ok FIND IN(%M1_TAG_HOL_FIL1%)  21(step2 Fail GOTO step 3 check)]	>> %M1_LOG_WORK%
echo 30[ step3 OK  DAY67 OR DAY15) 31(step3 Fail  SYSTEM ERROR)				 ]	>> %M1_LOG_WORK%
echo.-----------------------------------------------------------------------	>> %M1_LOG_WORK%
echo 找到工作設定檔 (%M1_TAG_WRK_FIL1%) 其補上班日為 %M1_FIND_WRK_DATE%	>> %M1_LOG_WORK%
echo 找到假日設定檔 (%M1_TAG_HOL_FIL1%) 其補休假日為 %M1_FIND_HOL_DATE%	>> %M1_LOG_WORK%




echo. >> %M1_LOG_WORK%
echo. >> %M1_LOG_WORK%
echo. **************************************************	>> %M1_LOG_WORK%
echo. 程式名稱 0030-auto_set_duty.bat						>> %M1_LOG_WORK%
echo. 程式完成時間  %M1_SYSTEM_DATE%, %time%  				>> %M1_LOG_WORK%
echo. **************************************************	>> %M1_LOG_WORK%
GOTO L1_EXIT_OK

:L1_EXIT_OK

::IF %M1_WORK_YN% GTR 5 SET M1_MSG_CHT_STR="[檢查異常]_M1_TAG_HOL_FIL1% 未找到 %M1_TODAY% -[FM-%M1_SENDIP%]"


::ECHO %M1_MSG_CHT_STR%
::timeout /t 3600
SET M1_MSG_ICON=64
SET M1_event=ok_msg
GOTO L1_SENDMSG1

:L1_SENDMSG1
REM 將 LOG 寫在前面 ***2019/01/21
REM add attach query file
REM echo. >> %M1_LOG_WORK%
REM echo. >> %M1_LOG_WORK%
TYPE %M1_LOG_HEAD%	>  %M1_Swap_TMP%
TYPE %M1_LOG%			>> %M1_Swap_TMP%
TYPE %M1_LOG_WORK%	>> %M1_Swap_TMP%
TYPE %M1_Swap_TMP%	>> %M1_Swap_OK%
echo. >  %M1_LOG%
TYPE %M1_Swap_ok%	>> %M1_LOG%



echo. **************************************************	
::SET M0_LOG=%M1_LOG%  FOR SEND MSG				
echo. **************************************************	
SET M0_LOG=%M1_LOG%
SET M0_MSG_CHT_STR=%M1_MSG_CHT_STR%
SET M0_RUNDRIVE=%M1_RUNDRIVE%
SET M0_RUNDIR=%M1_RUNDIR% 

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

%M1_RUNDRIVE%
CD %M1_RUNDIR% 
MSG * /TIME:3 '完成0030_auto_set_duty.bat' 5 
ENDLOCAL
EXIT

EXIT
REM :: :::::::::::::::::::::::::::::::::::::::::::::::::::
REM :: 	SUB FUNCTION
REM :: :::::::::::::::::::::::::::::::::::::::::::::::::::
:L1_CK_FILE_ERR01
	@echo on
	echo  *** 找不到   %M1_RUNDIR%\%M1_MSGDSP_EXE%  >> %M1_LOG_WORK%
	echo  *** 找不到   %M1_RUNDIR%\%M1_MSGDSP_EXE%  >> %M1_LOG_WORK%
	echo  *** 找不到   %M1_RUNDIR%\%M1_MSGDSP_EXE%  >> %M1_LOG_WORK%
	echo  *** 找不到   %M1_RUNDIR%\%M1_MSGDSP_EXE%  
	echo  *** 找不到   %M1_RUNDIR%\%M1_MSGDSP_EXE%  
	echo  *** 找不到   %M1_RUNDIR%\%M1_MSGDSP_EXE% 
	timeout /t 300
GOTO L1_END_CK_FILE_ERR01



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


::::::::::::::::::::::::::::
ECHO sub func call 
::::::::::::::::::::::::::::
:L1_ONDUTY
echo. :::  ============================================================= 			>> %M1_LOG_WORK%  
echo  :::  ======================上班 ==================================			>> %M1_LOG_WORK%  
echo  :::  "0750 process"															>> %M1_LOG_WORK%  
echo. :::  "1-0750-上班前重開機 run D:\Msg\Use\00-onduty_schedule.bat"  			>> %M1_LOG_WORK%                       
echo. :::  ============================================================= 			>> %M1_LOG_WORK%  
echo. :::  -----------     every thing  on ----------4 5 off	-----------			>> %M1_LOG_WORK%  
schtasks /CHANGE /ENABLE  /TN "\0830_班\1-0750-上班前重開機"						>> %M1_LOG_WORK% 
schtasks /CHANGE /ENABLE  /TN "\0830_班\2-0800-1829-上班期間系統開機後"				>> %M1_LOG_WORK% 
echo. ::: "0830_班\3-1825-下班後重開機 永遠 ON" 									>> %M1_LOG_WORK% 
echo. :::  ----------- 3 Always ON------------	---------------------				>> %M1_LOG_WORK%  
schtasks /CHANGE /ENABLE  /TN "\0830_班\3-1825-下班後重開機"						>> %M1_LOG_WORK% 
echo. :::  ----------- 4, 5 off	------------	---------------------				>> %M1_LOG_WORK%  
schtasks /CHANGE /DISABLE /TN "\0830_班\4-1830-0755-下班-系統開機後"				>> %M1_LOG_WORK% 
schtasks /CHANGE /DISABLE /TN "\0830_班\5-休假期間_0755_重開機"						>> %M1_LOG_WORK% 
echo. :::  20210610 ADD------- WFH 1,2,3,4,5 OFF	----------------------			>> %M1_LOG_WORK% 
echo. :::  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@			>> %M1_LOG_WORK% 
schtasks /CHANGE /DISABLE /TN "\0830_班\1-0750-上班前重開機"						>> %M1_LOG_WORK%  
schtasks /CHANGE /DISABLE /TN "\0830_班\2-0800-1829-上班期間系統開機後"				>> %M1_LOG_WORK% 
schtasks /CHANGE /DISABLE /TN "\0830_班\3-1825-下班後重開機"						>> %M1_LOG_WORK% 
schtasks /CHANGE /DISABLE /TN "\0830_班\4-1830-0755-下班-系統開機後"				>> %M1_LOG_WORK% 
schtasks /CHANGE /DISABLE /TN "\0830_班\5-休假期間_0755_重開機"						>> %M1_LOG_WORK% 
schtasks /CHANGE /ENABLE /TN "\0830_班\99-0740-居家工作-上班期間-執行上班排程"		>> %M1_LOG_WORK% 
schtasks /CHANGE /ENABLE /TN "\0830_班\99-1830-居家工作-執行下班後關閉排程機"		>> %M1_LOG_WORK% 
echo. :::  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@			>> %M1_LOG_WORK% 
echo. :::  ==============================================================			>> %M1_LOG_WORK% 
echo. :::  >>  %M1_LOG_WORK% 
echo. :::  ===============Set Up ON Alarm Schedule======================= 			>> %M1_LOG_WORK%
schtasks /CHANGE /ENABLE  /TN "\Alarm\D-0825"										>> %M1_LOG_WORK%    
schtasks /CHANGE /ENABLE  /TN "\Alarm\D-0840"										>> %M1_LOG_WORK% 
schtasks /CHANGE /ENABLE  /TN "\Alarm\D-0900"										>> %M1_LOG_WORK%
schtasks /CHANGE /ENABLE  /TN "\Alarm\D-1030"										>> %M1_LOG_WORK%
schtasks /CHANGE /ENABLE  /TN "\Alarm\D-1405"										>> %M1_LOG_WORK% 
schtasks /CHANGE /ENABLE  /TN "\Alarm\D-1530"										>> %M1_LOG_WORK% 
schtasks /CHANGE /ENABLE  /TN "\Alarm\D-1705"										>> %M1_LOG_WORK% 
schtasks /CHANGE /ENABLE  /TN "\Alarm\D-1715"										>> %M1_LOG_WORK% 
schtasks /CHANGE /ENABLE  /TN "\Alarm\D-1730"										>> %M1_LOG_WORK%     
schtasks /CHANGE /ENABLE  /TN "\Alarm\T-1630"										>> %M1_LOG_WORK% 
schtasks /CHANGE /ENABLE  /TN "\Alarm\W3-1555"										>> %M1_LOG_WORK%    
schtasks /CHANGE /ENABLE  /TN "\Alarm\W5-1555"										>> %M1_LOG_WORK%
echo. :::  >>  %M1_LOG_WORK% 
echo. :::  ==========查詢目前狀態======================================== 			>> %M1_LOG% 
echo. :::  -----------     every thing  on 	---------4 5 off  -----------			>> %M1_LOG%   
schtasks /query /fo csv /nh /TN "\0830_班\1-0750-上班前重開機"						>> %M1_LOG% 
schtasks /query /fo csv /nh /TN "\0830_班\2-0800-1829-上班期間系統開機後"			>> %M1_LOG%  
schtasks /query /fo csv /nh /TN "\0830_班\3-1825-下班後重開機"						>> %M1_LOG% 
echo. :::  ----------- 4, 5 off	-----------------------------------------			>> %M1_LOG%  
schtasks /query /fo csv /nh /TN "\0830_班\4-1830-0755-下班-系統開機後"				>> %M1_LOG% 
schtasks /query /fo csv /nh /TN "\0830_班\5-休假期間_0755_重開機"					>> %M1_LOG% 
echo. :::  20210610 ADD------- WFH 1,2,3,4,5 OFF	----------------------			>> %M1_LOG% 
echo. :::  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@			>> %M1_LOG% 
schtasks /query /fo csv /nh /TN "\0830_班\99-0740-居家工作-上班期間-執行上班排程"	>> %M1_LOG% 
schtasks /query /fo csv /nh /TN "\0830_班\99-1830-居家工作-執行下班後關閉排程機"	>> %M1_LOG% 
echo. :::  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@			>> %M1_LOG% 
echo. :::  ==============================================================			>> %M1_LOG% 
echo. >> %M1_LOG% 
echo. :::  ===============QUERY set Up Alarm ON Schedule======================= 	>> %M1_LOG%   
schtasks /query /fo csv /nh /TN "\Alarm\D-0825"										>> %M1_LOG% 
schtasks /query /fo csv /nh /TN "\Alarm\D-0840"										>> %M1_LOG%
schtasks /query /fo csv /nh /TN "\Alarm\D-0900"										>> %M1_LOG% 
schtasks /query /fo csv /nh /TN "\Alarm\D-1030"										>> %M1_LOG% 
schtasks /query /fo csv /nh /TN "\Alarm\D-1405"										>> %M1_LOG%
schtasks /query /fo csv /nh /TN "\Alarm\D-1530"										>> %M1_LOG%
schtasks /query /fo csv /nh /TN "\Alarm\D-1705"										>> %M1_LOG%
schtasks /query /fo csv /nh /TN "\Alarm\D-1715"										>> %M1_LOG%
schtasks /query /fo csv /nh /TN "\Alarm\D-1730"										>> %M1_LOG%
schtasks /query /fo csv /nh /TN "\Alarm\T-1630"										>> %M1_LOG%
schtasks /query /fo csv /nh /TN "\Alarm\W3-1555"									>> %M1_LOG%
schtasks /query /fo csv /nh /TN "\Alarm\W5-1555"									>> %M1_LOG%  
echo. :::  ============================================================= 			>> %M1_LOG% 
echo. :::  ============================================================= 			>> %M1_LOG%  
 
GOTO L1_CHECK_STEP_END


:L1_OFFDUTY
echo. :::  ============================================================= 			>> %M1_LOG_WORK% 
echo  :::  ======================休假 ==================================			>> %M1_LOG_WORK%
echo. :::  "1825 process"															>> %M1_LOG_WORK%
echo. :::  "AS RUN 3-1825-下班後重開機 run D:\Msg\Use\00-offduty_schedule.bat"   	>> %M1_LOG_WORK%                                                   
echo. :::  ============================================================= 			>> %M1_LOG_WORK%
echo. :::  -----------     every thing  off-----------3,4,5 on	-----------			>> %M1_LOG_WORK%
schtasks /CHANGE /DISABLE /TN "\0830_班\1-0750-上班前重開機"						>> %M1_LOG_WORK%
schtasks /CHANGE /DISABLE /TN "\0830_班\2-0800-1829-上班期間系統開機後"				>> %M1_LOG_WORK% 
echo. ::: "0830_班\3-1825-下班後重開機 永遠 ON "									>> %M1_LOG_WORK% 
echo. :::  ----------- 3 Always ON---------------------------------					>> %M1_LOG_WORK%  
schtasks /CHANGE /ENABLE  /TN "\0830_班\3-1825-下班後重開機"						>> %M1_LOG_WORK% 
echo. :::  ----------- 4,5 ON	------------	-------------------------			>> %M1_LOG_WORK%  
schtasks /CHANGE /ENABLE /TN "\0830_班\4-1830-0755-下班-系統開機後"					>> %M1_LOG_WORK% 
schtasks /CHANGE /ENABLE /TN "\0830_班\5-休假期間_0755_重開機"						>> %M1_LOG_WORK% 

echo. :::  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@			>> %M1_LOG_WORK% 
schtasks /CHANGE /DISABLE /TN "\0830_班\1-0750-上班前重開機"						>> %M1_LOG_WORK% 
schtasks /CHANGE /DISABLE /TN "\0830_班\2-0800-1829-上班期間系統開機後"				>> %M1_LOG_WORK%
schtasks /CHANGE /DISABLE /TN "\0830_班\3-1825-下班後重開機"						>> %M1_LOG_WORK% 
schtasks /CHANGE /DISABLE /TN "\0830_班\4-1830-0755-下班-系統開機後"				>> %M1_LOG_WORK%
schtasks /CHANGE /DISABLE /TN "\0830_班\5-休假期間_0755_重開機"						>> %M1_LOG_WORK%
schtasks /CHANGE /DISABLE /TN "\0830_班\99-0740-居家工作-上班期間-執行上班排程"		>> %M1_LOG_WORK%
schtasks /CHANGE /DISABLE /TN "\0830_班\99-1830-居家工作-執行下班後關閉排程機"		>> %M1_LOG_WORK%
echo. :::  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@			>> %M1_LOG_WORK%
echo. :::  ============================================================= 			>> %M1_LOG_WORK% 
echo. :::  >> %M1_LOG_WORK% 
echo. :::  ===============Set Up Off Alarm Schedule======================= 			>> %M1_LOG_WORK%  
schtasks /CHANGE /DISABLE /TN "\Alarm\D-0825"										>> %M1_LOG_WORK% 
schtasks /CHANGE /DISABLE /TN "\Alarm\D-0840"										>> %M1_LOG_WORK% 
schtasks /CHANGE /DISABLE /TN "\Alarm\D-0900"										>> %M1_LOG_WORK% 
schtasks /CHANGE /DISABLE /TN "\Alarm\D-1030"										>> %M1_LOG_WORK%
schtasks /CHANGE /DISABLE /TN "\Alarm\D-1405"										>> %M1_LOG_WORK% 
schtasks /CHANGE /DISABLE /TN "\Alarm\D-1530"										>> %M1_LOG_WORK% 
schtasks /CHANGE /DISABLE /TN "\Alarm\D-1705"										>> %M1_LOG_WORK%
schtasks /CHANGE /DISABLE /TN "\Alarm\D-1715"										>> %M1_LOG_WORK% 
schtasks /CHANGE /DISABLE /TN "\Alarm\D-1730"										>> %M1_LOG_WORK%    
schtasks /CHANGE /DISABLE /TN "\Alarm\T-1630"										>> %M1_LOG_WORK% 
schtasks /CHANGE /DISABLE /TN "\Alarm\W3-1555"										>> %M1_LOG_WORK%    
schtasks /CHANGE /DISABLE /TN "\Alarm\W5-1555"										>> %M1_LOG_WORK%

echo. :::  >> %M1_LOG_WORK% 
echo. :::  ==========查詢目前狀態======================================== 			>> %M1_LOG% 
schtasks /query /fo csv /nh /TN "\0830_班\1-0750-上班前重開機"						>> %M1_LOG% 
schtasks /query /fo csv /nh /TN "\0830_班\2-0800-1829-上班期間系統開機後"			>> %M1_LOG%  
schtasks /query /fo csv /nh /TN "\0830_班\3-1825-下班後重開機"						>> %M1_LOG% 
schtasks /query /fo csv /nh /TN "\0830_班\4-1830-0755-下班-系統開機後"				>> %M1_LOG% 
schtasks /query /fo csv /nh /TN "\0830_班\5-休假期間_0755_重開機"					>> %M1_LOG% 
echo. :::  20210610 ADD------- WFH 1,2,3,4,5 OFF	----------------------			>> %M1_LOG% 
echo. :::  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@			>> %M1_LOG% 
schtasks /query /fo csv /nh /TN "\0830_班\99-0740-居家工作-上班期間-執行上班排程"	>> %M1_LOG% 
schtasks /query /fo csv /nh /TN "\0830_班\99-1830-居家工作-執行下班後關閉排程機"	>> %M1_LOG% 
echo. :::  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@			>> %M1_LOG% 
echo. :::  >> %M1_LOG%  
echo. :::  ===============QUERY set Up Alarm OFF Schedule======================= 	>> %M1_LOG%   
schtasks /query /fo csv /nh /TN "\Alarm\D-0825"										>> %M1_LOG% 
schtasks /query /fo csv /nh /TN "\Alarm\D-0840"										>> %M1_LOG% 
schtasks /query /fo csv /nh /TN "\Alarm\D-0900"										>> %M1_LOG% 
schtasks /query /fo csv /nh /TN "\Alarm\D-1030"										>> %M1_LOG% 
schtasks /query /fo csv /nh /TN "\Alarm\D-1405"										>> %M1_LOG% 
schtasks /query /fo csv /nh /TN "\Alarm\D-1530"										>> %M1_LOG%
schtasks /query /fo csv /nh /TN "\Alarm\D-1705"										>> %M1_LOG%
schtasks /query /fo csv /nh /TN "\Alarm\D-1715"										>> %M1_LOG%
schtasks /query /fo csv /nh /TN "\Alarm\D-1730"										>> %M1_LOG%
schtasks /query /fo csv /nh /TN "\Alarm\T-1630"										>> %M1_LOG%
schtasks /query /fo csv /nh /TN "\Alarm\W3-1555"									>> %M1_LOG%
schtasks /query /fo csv /nh /TN "\Alarm\W5-1555"									>> %M1_LOG%  
echo. :::  ============================================================= 			>> %M1_LOG% 
echo. :::  ============================================================= 			>> %M1_LOG%  

GOTO L1_CHECK_STEP_END



::DEBUG	
echo M1_TAG_HOL_FIL1,	%M1_TAG_HOL_FIL1%
echo M1_TAG_WRK_FIL1,	%M1_TAG_WRK_FIL1%
echo L1_TODAY_WORK_YES
echo variable1, %M1_i% 
echo M1_FIND_DATE,  %M1_FIND_DATE%
echo M1_TODAY,  %M1_TODAY%
echo M1_WORK_YN,  %M1_WORK_YN%
echo M1_WEEK_D,	%M1_WEEK_D%
echo M0_LOG,	%M1_LOG%
timeout /t 3600


