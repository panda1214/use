setlocal EnableDelayedExpansion
::@echo off
GOTO L0_start_Admin
:L0_start_Admin01
REM REM @@@ *************************************
REM REM 使用者設定變數區
REM REM 使用者設定變數區
SET /A M0_msg1001=60
:: = 60 天 ---> 第1段通知 , 通知 1天

SET /A M0_msg1002=45
:: = 45 天 ---> 第2段通知 , 通知 1天

SET /A M0_msg1003=16
:: < 16 天 ---> 第3段通知 ,***每天通知***

SET /A M0_msg1004=8
:: < 8  天 ---> 第4段通知  通知改為***ERROR***

REM REM @@@ ************************************


REM *************************************
REM 20200820 董國安 ck_CGPWD_DATE.bat 檢查AD_帳號到期日
REM ************************************

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
echo today yyyymmdd ,	%x%%y%%z%
echo today yyyy/mm/dd, %x%/%y%/%z%
echo today taiwan year yyy/mm/dd,	%cx%/%y%/%z%
REM 今日 2020/04/01 

REM *********** SET 程式各項參數  *********
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
::  密碼到期日
SET M0_DAYS=90
SET M0_MSG_CHT_STR="[檢查中]_員工[%M0_LOGON_USER%],密碼到期日為[%M0_ENDDAY%],還剩[%M0_DAYS%]天需要變更[FM-%M0_SENDIP%]"
SET M0_MSG_ENG_STR=[Process...]_Stuff[%M0_LOGON_USER%],Password_EndDate[%M0_ENDDAY%],Leave[%M0_DAYS%]Days_Need_To_Change[FM-%M0_SENDIP%]

	SET M0_RUNDRIVE=D:
	SET M0_RUNDIR=\Msg\Use
	SET M0_LOGDIR=%M0_RUNDIR%\Log
	SET M0_SETDIR=%M0_RUNDIR%
	SET M0_SENDMSG_1=%M0_SETDIR%\send_msg1_panda.bat
	SET M0_SENDMSG_2=%M0_SETDIR%\NO_send_msg2_panda.bat
	SET M0_SENDMSG_3=%M0_SETDIR%\NO_send_msg3_panda.bat

REM *********** SET 程式各項參數  *********


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
REM 將 LOG 寫在前面 ***2019/01/21
SET M0_Swap_TMP=%M0_LOGDIR%\ck_CGPWD_DATE_LOG_TMP.txt
REM 每次離開時把M1_LOG 存至 M0_Swap_TMP
SET M0_Swap_OK=%M0_LOGDIR%\ck_CGPWD_DATE_LOG_OK.txt
REM 最後一次離開時把LOG寫在前面, 後面再加上原 M0_LOG
REM !!!####20190123######



:L0_CHECK_START
echo. > %M0_TAGFIL1%
echo. > %M0_LOG_HEAD%
echo. > %M0_LOG%
echo. > %M0_Swap_TMP%
echo. > %M0_Swap_OK%

echo. **************************************************	>> %M0_LOG_HEAD%
echo. 程式名稱 ck_CGPWD_DATE.BAT							>> %M0_LOG_HEAD%
echo. 程式執行時間 %ex%-%y%-%z%,%time%  					>> %M0_LOG_HEAD%
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
REM : 找出中文姓名 (全名)
for /f "usebackq tokens=1-4 delims= " %%i IN (`FIND "全名" %M0_TAGFIL1% `) DO (
	SET M0_i=%%i
	SET M0_j=%%j
	SET M0_k=%%k
	SET M0_l=%%l
	)
set M0_LOGON_USER=%M0_j%
REM : 找出中文姓名 (全名)
REM *************************************************************************************************

REM *************************************************************************************************
REM : 密碼到期
for /f "usebackq tokens=1-4 delims= " %%i IN (`FIND "密碼到期" %M0_TAGFIL1% `) DO (
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
		
REM : 密碼到期
REM *************************************************************************************************

::echo %M0_i% ,%M0_j%,%M0_k%,%M0_l%
::echo %M0_j%
::echo %M0_ENDDAY%
::echo %M0_ENDDAY%-%M0_TODAY%


echo wscript.echo DateDiff("d",%M0_TODAY%,%M0_ENDDAY%) >%tmp%\tmp.vbs
for /f %%i in ('cscript /nologo %tmp%\tmp.vbs') do set M0_DAYS=%%i

if %y% LSS 10 set y=0%y%
if %z% LSS 10 set z=0%z%
echo 密碼到期日,%M0_ENDDAY%
echo   今日日期,%M0_TODAY%
echo 密碼到期天數,%M0_DAYS%


echo 今日日期,%M0_TODAY% 		>> %M0_LOG%
echo 密碼到期日,%M0_ENDDAY%		>> %M0_LOG%
echo 密碼到期天數,%M0_DAYS%		>> %M0_LOG%
echo. >> %M0_LOG%
echo. >> %M0_LOG%
::if %M0_DAYS%  LSS 50 echo less
::if %M0_DAYS%  LSS 62 echo hi

::timeout /t 180

echo. **************************************************	>> %M0_LOG%
echo. 程式名稱 ck_CGPWD_DATE.BAT						>> %M0_LOG%
echo. 程式完成時間 %ex%-%y%-%z%,%time%  					>> %M0_LOG%
echo. **************************************************	>> %M0_LOG%
REM GOTO L0_Drive_CHANGE_01
GOTO L0_EXIT_OK


:L0_EXIT_OK

if %M0_DAYS%  LSS  %M0_msg1004% goto L0_msg1004
if %M0_DAYS%  LSS  %M0_msg1003% goto L0_msg1003
if %M0_DAYS%  EQU  %M0_msg1002% goto L0_msg1002
if %M0_DAYS%  EQU  %M0_msg1001% goto L0_msg1001

::其他 CASE 不處理,直接離開
goto GOTO L0_EXIT_OUT

:L0_msg1004
SET M0_MSG_CHT_STR="[***ERROR***]_員工[%M0_LOGON_USER%],密碼到期日為[%M0_ENDDAY%],還剩[%M0_DAYS%]天需要變更-[FM-%M0_SENDIP%]小於%M0_msg1004%"
SET M0_MSG_ENG_STR=[***ERROR***]_Stuff[%M0_LOGON_USER%],Password_EndDate[%M0_ENDDAY%],Leave[%M0_DAYS%]Days_Need_To_Change"[FM-%M0_SENDIP%]
SET M0_MSG_ICON=16
SET M0_event=err_msg
GOTO L0_SENDMSG1

:L0_msg1003
SET M0_MSG_CHT_STR="[每日通知]_員工[%M0_LOGON_USER%],密碼到期日為[%M0_ENDDAY%],還剩[%M0_DAYS%]天需要變更-[FM-%M0_SENDIP%]小於%M0_msg1003%"
SET M0_MSG_ENG_STR=[Daily_Notice]_Stuff[%M0_LOGON_USER%],Password_EndDate[%M0_ENDDAY%],Leave[%M0_DAYS%]Days_Need_To_Change"[FM-%M0_SENDIP%]
GOTO L0_msg1001_END

:L0_msg1002
SET M0_MSG_CHT_STR="[僅當日通知]_員工[%M0_LOGON_USER%],密碼到期日為[%M0_ENDDAY%],還剩[%M0_DAYS%]天需要變更-[FM-%M0_SENDIP%]等於%M0_msg1002%"
SET M0_MSG_ENG_STR=[Today_Notice]_Stuff[%M0_LOGON_USER%],Password_EndDate[%M0_ENDDAY%],Leave[%M0_DAYS%]Days_Need_To_Change"[FM-%M0_SENDIP%]
GOTO L0_msg1001_END

:L0_msg1001
SET M0_MSG_CHT_STR="[僅當日通知]_員工[%M0_LOGON_USER%],密碼到期日為[%M0_ENDDAY%],還剩[%M0_DAYS%]天需要變更-[FM-%M0_SENDIP%]等於%M0_msg1001%"
SET M0_MSG_ENG_STR=[Today_Notice]_Stuff[%M0_LOGON_USER%],Password_EndDate[%M0_ENDDAY%],Leave[%M0_DAYS%]Days_Need_To_Change"[FM-%M0_SENDIP%]
GOTO L0_msg1001_END

:L0_msg1001_END
SET M0_MSG_ICON=64
SET M0_event=ok_msg
GOTO L0_SENDMSG1

:L0_EXIT_ERROR
echo. **************************************************	>> %M0_LOG%
echo. 查詢員工密碼錯誤	ERROR ERROR	ERROR					>> %M0_LOG%
echo. 找不到密碼查詢檔  %M0_TAGFIL1%						>> %M0_LOG%
echo. **************************************************	>> %M0_LOG%
SET M0_MSG_CHT_STR="[***ERROR***]_員工[%M0_LOGON_USER%]密碼查詢錯誤,找不到密碼查詢檔[ %M0_TAGFIL1%]-[FM-%M0_SENDIP%]"
SET M0_MSG_ENG_STR=[***ERROR***]Query_Stuff[%M0_LOGON_USER%]Password_EndDate_ERROR_CANNOT_FIND_Password_Query_File[%M0_TAGFIL1%]-[FM-%M0_SENDIP%]
SET M0_MSG_ICON=16
SET M0_event=err_msg
GOTO L0_SENDMSG1


:L0_SENDMSG1
REM 將 LOG 寫在前面 ***2019/01/21
TYPE %M0_LOG_HEAD% >> %M0_Swap_OK%
TYPE %M0_LOG% >> %M0_Swap_OK%
echo. >> %M0_LOG%
echo. >> %M0_LOG%
TYPE %M0_TAGFIL1% >> %M0_Swap_OK%
echo. >> %M0_LOG%
echo. >> %M0_LOG%
SET M0_LOG=%M0_Swap_OK%




REM 將 LOG 寫在前面 ***2019/01/21
::cd
::echo %M0_LOG%
::echo %M0_SENDMSG_1% 
::PAUSE

IF NOT EXIST %M0_SENDMSG_1% GOTO L0_SENDMSG2
call %M0_SENDMSG_1%
REM echo msgbox %M0_OK_STR%,64,"檢查檔案訊息%DATE%-%TIME%">1.vbs && start 1.vbs && ping -n 2 127.1>nul && del 1.vbs
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
GOTO L0_start_Admin01

::net user A123274643 /domain >> %M0_TAGFIL1%
REM  使用者名稱             A123274643
REM  全名                   董國安
REM  註解                   [2012/05/15 報到]
REM  使用者的註解
REM  國家/區域碼            000 (系統預設值)
REM  帳戶使用中             Yes
REM  帳戶到期               從不

REM  上次設定密碼           2020/7/13 下午 01:24:41
REM  密碼到期               2020/10/11 下午 01:24:41
REM  可變更密碼             2020/7/14 下午 01:24:41
REM  請輸入密碼             No
REM  使用者可以變更密碼     Yes

REM  容許的工作站           全部
REM  登入指令檔
REM  使用者設定檔
REM  主目錄
REM  上次登入時間           2020/8/20 下午 01:05:35

REM  可容許的登入時數       全部

REM  本機群組會員
REM  全域群組會員           *Domain Users         *Cathaysec Server Main
REM  						   *Cathaysec Change Cont*GP26好麥驗測報表(w)
REM  						   *Cathaysec EIP HotNews*Cathaysec Mant AD-Use
REM  						   *grp6120000
REM  命令已經成功完成。


	