@echo off
::REM ****************************************************
::2021-0125 穝糤ら㏄せ()ㄒ安ら,э浪琩㏄1
::REM
::ら琌痁  (1)干痁ら (2)㏄せ┪㏄ら (3)ㄒ安ら
::REM workday.dat 干痁ら 20210220 M1_WORK_YN->10 11
::REM holiday.dat   砞﹚ㄒ安ら 20210101(5) 20210220(6) M1_WORK_YN->20 21
::REM  ㏄せ┪㏄ら ()ㄒ安ら 20210109(6) 20210110(7) M1_WORK_YN->30 31

::REM (1) 浪琩ら琌   workday.dat 干痁ら
::REM (2) ゑ癸らら戳Τ礚 holiday.dat Τら砞﹚ㄒ安ら
::REM (3) 浪琩ら琌 ㏄せ┪㏄ら ,    Τら骋()ㄒ安ら
::REM ****************************************************
::REM workday.dat
::REM 20210220
::REM 20210911

::REM holiday.dat
::REM 20210101
::REM 20210210

REM ************************************

GOTO L1_start_Admin
:L1_start_Admin01



REM ┏IFTTT锣Line芲
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
echo wscript.echo dateadd("d",+1,date) >%tmp%\tmp.vbs
::REM echo wscript.echo dateadd("d",+5,date) >%tmp%\tmp.vbs
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
REM 赋瓣 FIND 弄holiday.dat 盢柑 安らтㄓ
REM ************************************
REM ===================================================================================
REM 砞﹚祘Α┮Τ跑计
SET M1_TAG_WRK_FIL1=D:\msg\use\workday.dat
SET M1_TAG_HOL_FIL1=D:\msg\use\holiday.dat
set M1_SYSTEM_DATE=%sx%-%sy%-%sz%
REM ===============================
set M1_FIND_DATE=%x%%y%%z%
REM M1_FIND_DATE=YYYYMMDD	 ノ肚癳钡Μ FIND *.dat  ずら句ら戳
set M1_FIND_WRK_DATE=20000000
set M1_FIND_HOL_DATE=20000000
set M1_TODAY=%x%%y%%z%
REM M1_TODAY=YYYYMMDD  	 らら戳
set M1_WORK_YN=1
::REM M1_WORK_YN=1  	     箇砞らら戳痁ら (1->  true(A) fail(go step2)   2->true(Y) fail(go step3) 		3->true(N) fail (S)
set M1_WEEK_D=0
REM M1_WEEK_D=0 	     箇砞ら㏄ 0

REM 砞﹚祘Α┮Τ跑计
REM ===================================================================================
REM *********** SET 祘Α兜把计  *********
REM !!! SET TAGDIR,RUNDIR,BAKDIR, CK_FILE,RUNLOG...
REM #########################
REM 
SET M1_event=err_msg
:: REM SET M1_event=err_msg  For Line Message Event
set M1_SENDIP=10.93.9.65
set M1_ServerIP=10.93.9.65
set M1_ServerName=Panda_PC
SET M1_MSG_CHT_STR="[浪琩い]_らら戳(01)%M1_TAG_WRK_FIL1% (2)╰参㏄碭 (3)%M1_TAG_HOL_FIL1%-[FM-%M1_SENDIP%]"
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
SET M1_LOG_HEAD=%M1_LOGDIR%\FD_TM_Holiday_LOG_HEAD.txt
     SET M1_LOG=%M1_LOGDIR%\FD_TM_Holiday_RUNLOG.txt
REM 盢 LOG 糶玡 ***2019/01/21
SET M1_Swap_TMP=%M1_LOGDIR%\FD_TM_Holiday_LOG_TMP.txt
REM –Ω瞒秨рM1_LOG  M1_Swap_TMP
SET M1_Swap_OK=%M1_LOGDIR%\FD_TM_Holiday_LOG_OK.txt
REM 程Ω瞒秨рLOG糶玡,  M1_LOG


:L1_CHECK_START01
::REM 癬﹍ LOG File & empty log file
echo. > %M1_LOG_HEAD%
echo. > %M1_LOG%
SET M0_LOG=%M1_LOG%
::REM M1_LOG use in send mesg file name (mail attach file)
echo. > %M1_Swap_TMP%
echo. > %M1_Swap_OK%

echo. **************************************************	>> %M1_LOG_HEAD%
echo. 祘Α嘿 Find_TM_Holiday.BAT							>> %M1_LOG_HEAD%
echo. 祘Α磅︽丁 %M1_SYSTEM_DATE%, %time%  				>> %M1_LOG_HEAD%
echo. **************************************************	>> %M1_LOG_HEAD%
::timeout /t 3600





:L1_CHECK_STEP01
REM *************************************************************************************************
REM SUB FUNC :L1_CHECK_STEP01
echo Process...Step 1 : т %M1_TODAY% 琌 %M1_TAG_WRK_FIL1% 干痁ら 		>> %M1_LOG%
echo Process...Step 1 : т %M1_TODAY% 琌 %M1_TAG_WRK_FIL1% 干痁ら
REM *************************************************************************************************
SET M1_MSG_CHT_STR="[浪琩い]_STEP01-т %M1_TODAY% 琌 %M1_TAG_WRK_FIL1% ノ干痁ら-[FM-%M1_SENDIP%]"
set M1_FIND_DATE=%x%%y%%z%
REM M1_FIND_DATE=YYYYMMDD	 ノ肚癳钡Μ FIND *.dat  ずら句ら戳
set M1_TODAY=%x%%y%%z%
REM M1_TODAY=YYYYMMDD  	 らら戳
set M1_WORK_YN=00
REM M1_WORK_YN=10  SUN FUNC true らら戳痁ら GOTO L1_CHECK_STEP_END
REM M1_WORK_YN=11  SUN FUNC fail らら戳痁ら goto step 2


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
set M1_MSG_CHT_STR="[浪琩ЧΘ]_(%M1_TODAY%)琌干痁ら т砞﹚郎_%M1_TAG_WRK_FIL1%-%M1_FIND_DATE%-[FM-%M1_SENDIP%]"
echo END.....Process...Step 1 : т %M1_TODAY%  %M1_TAG_WRK_FIL1% 干痁ら						>> %M1_LOG%
echo. >> %M1_LOG%
echo. >> %M1_LOG%
GOTO L1_CHECK_STEP_END

:L1_STEP01_NO
set M1_FIND_WRK_DATE=(ゼт)
set M1_WORK_YN=11
SET M1_MSG_CHT_STR="[浪琩い]_STEP02-%M1_TAG_HOL_FIL1% т %M1_TODAY% Τ礚砞﹚ら干ヰ安ら-[FM-%M1_SENDIP%]"	
echo END.....Process...Step 1 :ゼт %M1_TODAY%  %M1_TAG_WRK_FIL1% 干痁ら,秈Step 2浪琩.		>> %M1_LOG%
REM M1_WORK_YN=2  SUN FUNC fail らら戳痁ら goto step 2

GOTO L1_CHECK_STEP02
::TEST
::GOTO L1_CHECK_STEP02
REM *************************************************************************************************
REM :: END FUNC L1_CHECK_STEP01	т %M1_TODAY%  %M1_TAG_WRK_FIL1% 干痁ら
REM *************************************************************************************************




:L1_CHECK_STEP02
REM *************************************************************************************************
REM : т    ㏄6,ら Τ礚 holiday.dat Τら獶㏄6㏄らぇ干ヰ安ら
REM :: SUB FUNC L1_CHECK_STEP02
SET M1_MSG_CHT_STR="[浪琩い]_STEP02-%M1_TAG_HOL_FIL1% т %M1_TODAY% Τ礚砞﹚ら干ヰ安ら-[FM-%M1_SENDIP%]"	
echo. >> %M1_LOG%
echo. >> %M1_LOG%
echo Process...Step 2 : %M1_TAG_HOL_FIL1% т %M1_TODAY% Τ礚砞﹚ら干ヰ安ら,秈Step 2浪琩....		>> %M1_LOG%
echo Process...Step 2 : %M1_TAG_HOL_FIL1% т %M1_TODAY% Τ礚砞﹚ら干ヰ安ら,秈Step 2浪琩....
REM *************************************************************************************************
set M1_FIND_DATE=%x%%y%%z%
REM :: M1_FIND_DATE=YYYYMMDD	 ノ肚癳钡Μ FIND *.dat  ずら句ら戳
REM :: set M1_TODAY=%x%%y%%z%
REM :: M1_TODAY=YYYYMMDD  	 らら戳
set M1_WORK_YN=30
REM M1_WORK_YN=30  SUN FUNC т FILE(%M1_TAG_HOL_FIL1%)т %M1_TODAY% ,ら干ヰ安ら  true  L1_STEP02_FIND 
REM M1_WORK_YN=31  SUN FUNC т FILE(%M1_TAG_HOL_FIL1%)т %M1_TODAY% ,ら干ヰ安ら  fail  L1_STEP02_NOFIND

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
SET M1_MSG_CHT_STR="[浪琩ЧΘ]_浪琩ら戳( %M1_TODAY% )干ヰ安ら,т干ヰ安ら砞﹚郎_FILE (%M1_TAG_HOL_FIL1%-%M1_FIND_DATE%)-[FM-%M1_SENDIP%]"
echo End........Process...Step 2 :  [浪琩ЧΘ]_ら戳( %M1_TODAY% )干ヰ安ら,т干ヰ安ら砞﹚郎_FILE (%M1_TAG_HOL_FIL1%-%M1_FIND_DATE%)	>> %M1_LOG%
GOTO L1_CHECK_STEP_END


:L1_STEP02_NOFIND 
set M1_FIND_HOL_DATE=(ゼт)
set M1_WORK_YN=21
echo END.....Process...Step 2 :  %M1_TODAY% ぃ %M1_TAG_HOL_FIL1% ,秈STEP 3浪琩ら琌㏄碭?	>> %M1_LOG%

GOTO L1_CHECK_STEP03

REM *************************************************************************************************
REM :: END FUNC L1_CHECK_STEP02 	т     ら琌   workday.dat 干痁ら
REM *************************************************************************************************


:L1_CHECK_STEP03

echo. >> %M1_LOG%
echo. >> %M1_LOG%
REM *************************************************************************************************
REM :: SUB FUNC :L1_CHECK_STEP03
REM :: (2) 浪琩ら琌 ㏄せ┪㏄ら ,    Τら骋()ㄒ安ら
REM :: 眔ら秅 ?
SET M1_MSG_CHT_STR="[浪琩い]_STEP03-т %M1_TODAY% 琌 ㏄せ┪㏄ら,Τら骋()ㄒ安ら-[FM-%M1_SENDIP%]"  
echo Process...Step 3 : т %M1_TODAY% 琌 ㏄せ┪㏄ら,Τら骋()ㄒ安ら	>> %M1_LOG%
echo Process...Step 3 : т %M1_TODAY% 琌 ㏄せ┪㏄ら,Τら骋()ㄒ安ら
REM *************************************************************************************************
set M1_FIND_DATE=%x%%y%%z%
REM :: M1_FIND_DATE=YYYYMMDD	 ノ肚癳钡Μ FIND *.dat  ずら句ら戳
REM :: set M1_TODAY=%x%%y%%z%
REM M1_TODAY=YYYYMMDD  	 らら戳
set M1_WORK_YN=31
REM M1_WORK_YN=20  SUN FUNC 浪琩ら琌 ㏄せ┪㏄ら  true  GOTO L1_CHECK_STEP_END
REM M1_WORK_YN=21  SUN FUNC fail らら戳痁ら goto Step 2


REM : (3) 浪琩ら琌 ㏄せ┪㏄ら ,    Τら骋()ㄒ安ら
REM ::眔ら秅 ?
echo wscript.echo weekday("%x%-%y%-%z%",2) >%tmp%\tmp1.vbs
for /f "tokens=1 delims= " %%a in ('cscript /nologo %tmp%\tmp1.vbs') do (
  IF %%a==1 (set M1_WEEK_D=秅)
  IF %%a==2 (set M1_WEEK_D=秅)
  IF %%a==3 (set M1_WEEK_D=秅)
  IF %%a==4 (set M1_WEEK_D=秅)
  IF %%a==5 (set M1_WEEK_D=秅き)
  IF %%a==6 (set M1_WEEK_D=秅せ)
  IF %%a==7 (set M1_WEEK_D=秅ら) 
  SET M1_WEEKEND=%%a 
  )

IF %M1_WEEK_D% EQU 秅せ GOTO L1_STEP03_DAY6
IF %M1_WEEK_D% EQU 秅ら GOTO L1_STEP03_DAY7
::REM IF %M1_FIND_DATE% NEQ (秅せ,秅ら, =1-5) GOTO L1_STEP03_NO
GOTO L1_STEP03_DAY15


set M1_WORK_YN=31
GOTO :L1_SYSTEM_ERROR




:L1_STEP03_DAY6
SET M1_MSG_CHT_STR="[浪琩ЧΘ]_浪琩ら戳( %M1_TODAY%-%M1_WEEK_D%),絋粄()ヰ安ら-[FM-%M1_SENDIP%]"
echo END....Process...Step 2 :  浪琩ら戳(%M1_TODAY%_%M1_WEEK_D%),絋粄()ヰ安ら	>> %M1_LOG%
echo END....Process...Step 2 :  浪琩ら戳(%M1_TODAY%_%M1_WEEK_D%),絋粄()ヰ安ら	
echo. >> %M1_LOG%
echo. >> %M1_LOG%
echo *****New Process ら㏄せ()ㄒ安ら,э浪琩秅*****					>> %M1_LOG%
::REM 2021-0125 穝糤ら㏄せ()ㄒ安ら,э浪琩㏄1(+3)  [+1=㏄せ ]  [+2=秅ら [+3=秅]
::REM today   & Update M1_TAGFILE day **+1 =tommorrow 
echo wscript.echo dateadd("d",+3,date) >%tmp%\tmp.vbs
::REM echo wscript.echo dateadd("d",+7,date) >%tmp%\tmp.vbs
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set ex=%%i
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set y=%%j
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set z=%%k
SET/A cx= ex-1911
set/A  x= %ex%
if %y% LSS 10 set y=0%y%
if %z% LSS 10 set z=0%z%

set M1_FIND_DATE=%x%%y%%z%
REM M1_FIND_DATE=YYYYMMDD	 ノ肚癳钡Μ FIND *.dat  ずら句ら戳
set M1_FIND_WRK_DATE=20000000
set M1_FIND_HOL_DATE=20000000
set M1_TODAY=%x%%y%%z%
GOTO  L1_CHECK_STEP01
::REM 2021-0125 穝糤ら㏄せ()ㄒ安ら,э浪琩㏄1(+3)  [+1=㏄せ ]  [+2=秅ら [+3=秅]

:L1_STEP03_DAY7
set M1_FIND_DATE=%M1_TODAY%_%M1_WEEK_D%
set M1_WORK_YN=30
set M1_FIND_DATE=%M1_TODAY%
SET M1_MSG_CHT_STR="[浪琩ЧΘ]_浪琩ら戳( %M1_TODAY%-%M1_WEEK_D%),絋粄()ヰ安ら-[FM-%M1_SENDIP%]"
echo END....Process...Step 2 :  浪琩ら戳(%M1_TODAY%_%M1_WEEK_D%),絋粄()ヰ安ら	>> %M1_LOG%
echo END....Process...Step 2 :  浪琩ら戳(%M1_TODAY%_%M1_WEEK_D%),絋粄()ヰ安ら	
echo. >> %M1_LOG%
echo. >> %M1_LOG%				
REM 秅せ,秅ら()ヰ安ら
GOTO L1_CHECK_STEP_END 


:L1_STEP03_DAY15
set M1_FIND_DATE=%M1_TODAY%_%M1_WEEK_D%
set M1_WORK_YN=30
set M1_FIND_DATE=%M1_TODAY%
SET M1_MSG_CHT_STR="[浪琩ЧΘ]_浪琩ら戳(%M1_TODAY%_%M1_WEEK_D%)キらら,絋粄璶痁-[FM-%M1_SENDIP%]"
echo END....Process...Step 3 : 浪琩ら戳(%M1_TODAY%_%M1_WEEK_D%)キらら,絋粄璶痁	>> %M1_LOG%
echo END....Process...Step 3 : 浪琩ら戳(%M1_TODAY%_%M1_WEEK_D%)キらら,絋粄璶痁
echo. >> %M1_LOG%
echo. >> %M1_LOG%
::REM IF %%i 1-5 GOTO  L1_CHECK_STEP02
GOTO L1_CHECK_STEP_END

REM *************************************************************************************************
REM :: END FUNC L1_CHECK_STEP03	(3) 浪琩ら琌 ㏄せ┪㏄ら ,Τら骋()ㄒ安ら,1-5キらら
REM *************************************************************************************************



:L1_SYSTEM_ERROR
SET M1_MSG_ICON=32
SET M1_event=err_msg	
SET M1_MSG_CHT_STR="[浪琩钵盽]_%M1_TAG_WRK_FIL1%_%M1_TAG_HOL_FIL1% ゼт %M1_TODAY% -[FM-%M1_SENDIP%]"
echo. >> %M1_LOG%
echo. >> %M1_LOG%
echo. [浪琩钵盽]_干痁ら郎 %M1_TAG_WRK_FIL1%_ゼт %M1_TODAY%		>> %M1_LOG%
echo. [浪琩钵盽]_干ヰ安ら郎 %M1_TAG_HOL_FIL1%_ゼт %M1_TODAY%		>> %M1_LOG%
echo Process...SYSTEM ERROR ERROR @@@								>> %M1_LOG%
echo Process...SYSTEM ERROR ERROR @@@
GOTO L1_SENDMSG1


:L1_CHECK_STEP_END
echo. >> %M1_LOG%
echo. >> %M1_LOG%
echo. ***********************************************************************************************	>> %M1_LOG%
echo. ***********************************************************************************************   >> %M1_LOG%
echo Process...CHECK_STEP_END		>> %M1_LOG%
echo Process...CHECK_STEP_END

echo ╰参ら戳(M1_SYSTEM_DATE)   %M1_SYSTEM_DATE%
echo 浪琩琌ら戳(M1_TODAY)	%M1_TODAY%												>> %M1_LOG%
echo.-----------------------------------------------------------------------	>> %M1_LOG%
echo  浪琩琌ら戳(%M1_TODAY%)琌ら(M1_WORK_YN)%M1_WORK_YN%					>> %M1_LOG%
echo 10,20,30 種竡弧:													>> %M1_LOG%
echo 10[ step1 ok FIND IN(%M1_TAG_WRK_FIL1%) 11(step1 Fail GOTO step 2 check) ]	>> %M1_LOG%
echo 20[ step1 ok FIND IN(%M1_TAG_HOL_FIL1%) 21(step2 Fail GOTO step 3 check) ]	>> %M1_LOG%
echo 30[ step3 OK  DAY67 OR DAY15) 31(step3 Fail  SYSTEM ERROR)				  ]	>> %M1_LOG%
echo.-----------------------------------------------------------------------	>> %M1_LOG%
echo т砞﹚郎 (%M1_TAG_WRK_FIL1%) ㄤ干痁ら %M1_FIND_WRK_DATE%	>> %M1_LOG%
echo т安ら砞﹚郎 (%M1_TAG_HOL_FIL1%) ㄤ干ヰ安ら %M1_FIND_HOL_DATE%	>> %M1_LOG%




echo. >> %M1_LOG%
echo. >> %M1_LOG%
echo. **************************************************	>> %M1_LOG%
echo. 祘Α嘿 Find_TM_Holiday.BAT							>> %M1_LOG%
echo. 祘ΑЧΘ丁  %M1_SYSTEM_DATE%, %time%  				>> %M1_LOG%
echo. **************************************************	>> %M1_LOG%
GOTO L1_EXIT_OK

:L1_EXIT_OK

::IF %M1_WORK_YN% GTR 5 SET M1_MSG_CHT_STR="[浪琩钵盽]_M1_TAG_HOL_FIL1% ゼт %M1_TODAY% -[FM-%M1_SENDIP%]"


::ECHO %M1_MSG_CHT_STR%
::timeout /t 3600
SET M1_MSG_ICON=64
SET M1_event=ok_msg
GOTO L1_SENDMSG1

:L1_SENDMSG1
REM 盢 LOG 糶玡 ***2019/01/21
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
REM echo msgbox %M1_OK_STR%,64,"浪琩郎癟%DATE%-%TIME%">1.vbs && start 1.vbs && ping -n 2 127.1>nul && del 1.vbs
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
REM 祘Α笆砞﹚ Administrator 舦
REM ************************************************************
REM  祘Α笆砞﹚ Administrator 舦
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