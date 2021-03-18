::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJHaR4E4/JxBoZQeNMleuD7gZpc317uiLpwMUV+1f
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJHSX834FOx5oTgWWAzmFA60Z1Pjs69WDo1kYaPIofLDf26CLH9Af/1aqcI4otg==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
REM **************************************************************************
REM :: 1.顯示帳號及密碼到期日  
REM :: 2.是否密碼到期前7日 ,加上本程式 pwd_date_Plus.exe到排程
REM :: schtasks /Create /SD %M0_NEXTRUNDAY% /ST 09:00:00 /SC daily /TN "0900-檢查密碼到期日期排程"  /TR "d:\msg\use\pwd_date_Plus.exe"	
setlocal DisableDelayedExpansion

REM  程式自動設定為 Administrator 權限
REM  https://dotblogs.com.tw/c5todo/2016/08/21/155005
REM
@echo off
CLS
ECHO.
ECHO =============================
ECHO Running Admin Shell
ECHO =============================

:init
setlocal ENABLEDelayedExpansion
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

REM **************************************************************************
REM :: 1.顯示帳號及密碼到期日  
REM :: 2.是否密碼到期前7日 ,加上本程式 pwd_date_Plus.exe到排程
REM :: schtasks /Create /SD %M0_NEXTRUNDAY% /ST 09:00:00 /SC daily /TN "0900-檢查密碼到期日期排程"  /TR "d:\msg\use\pwd_date_Plus.exe"	
setlocal DisableDelayedExpansion
REM ===================================================================================
REM 設定程式所有變數
SET M0_TAGFIL1=%tmp%\showmsg.txt
SET M0_LOG1=%tmp%\schtasks.txt
SET M0_LOG2=%tmp%\runlog.txt
::SET M0_AUTO_ANS=%tmp%\y.txt
::echo Y > %M0_AUTO_ANS%
::echo %M0_AUTO_ANS%
REM Creat autoans.txt
::echo on

::type %M0_AUTO_ANS%
echo %~0
copy %~0 C:\

::timeout /t 10
REM ===============================
:: echo %username%
set M0_ENDDAY="YYYY/MM/DD"
REM M0_ENDDAY="YYYY/MM/DD" 密碼到期日期
set M0_TODAY="Today"
REM M0_TODAY="YYYY/MM/DD"  今日日期
set M0_LOGON_USER="OOOOOO"
REM M0_LOGON_USER=登入帳號中文姓名
set M0_DAYS=99
REM M0_DAYS=99 計算密碼到期天數
set M0_NEXTRUNDAY=YYYYMMDD
REM M0_NEXTRUNDAY 設定密碼到期前7天,設定執行本程式排程
REM 設定程式所有變數
REM ==================================




REM ============:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::VB SCRIPE version
REM 取得今日日期  REM 今日 2020/09/08
REM today   & Update M0_TAGFILE day **0 =today  
echo wscript.echo dateadd("d",0,date) >%tmp%\tmp.vbs
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set ex=%%i
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set y=%%j
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set z=%%k
SET/A cx= ex-1911
set/A  x= %ex%
if %y% LSS 10 set y=0%y%
if %z% LSS 10 set z=0%z%
set M0_TODAY="%x%/%y%/%z%"
REM M0_TODAY="YYYY/MM/DD"  今日日期
::echo today yyyymmdd ,	%x%%y%%z%
::echo today yyyy/mm/dd, %x%/%y%/%z%
::echo today taiwan year yyy/mm/dd,	%cx%/%y%/%z%
REM ===================================================================================
	
echo. > %M0_TAGFIL1%
echo. > %M0_LOG1%
echo. > %M0_LOG2%
	
REM ======================================================
REM =====DUMP  net user %username% to %tmp%\showmsg.txt

net user %username% /domain > %M0_TAGFIL1%
REM ======================================================


REM *************************************************************************************************
REM : 找出中文姓名 (全名)
for /f "usebackq tokens=1-4 delims= " %%i IN (`FIND "全名" %M0_TAGFIL1% `) DO (
	SET M0_i=%%i
	SET M0_j=%%j
	SET M0_k=%%k
	SET M0_l=%%l
	)
set M0_LOGON_USER=%M0_j%
REM M0_LOGON_USER=登入帳號中文姓名
REM : 找出中文姓名 (全名)
REM *************************************************************************************************

REM *************************************************************************************************
REM : 找出密碼到期
for /f "usebackq tokens=1-4 delims= " %%i IN (`FIND "密碼到期" %M0_TAGFIL1% `) DO (
	SET M0_i=%%i
	SET M0_j=%%j
	SET M0_k=%%k
	SET M0_l=%%l
	)
set M0_ENDDAY_DATE=%M0_j%
set M0_ENDDAY="%M0_j%"

REM M0_ENDDAY="YYYY/MM/DD" 密碼到期日期
::echo variable1, %M0_i% 
::echo variable2, %M0_j%
::echo variable3, %M0_k%
::echo variable4, %M0_l%
REM : 找出密碼到期
REM *************************************************************************************************
::echo  %M0_i%,%M0_j%,%M0_k%,%M0_l% 
::echo 今日日期 %M0_TODAY%


REM *************************************************************************************************
REM : 計算密碼到期天數
echo wscript.echo DateDiff("d",%M0_TODAY%,%M0_ENDDAY%) >%tmp%\tmp.vbs
for /f %%i in ('cscript /nologo %tmp%\tmp.vbs') do (
	set M0_DAYS=%%i
	REM 密碼到期天數
	)
REM : 計算密碼到期天數
REM *************************************************************************************************


REM **************************************************************************
REM : 顯示訊息
REM **** batch 變數 傳 VBS (VB SCRIPT)
::echo 登入帳號ID為, %username%
::echo 登入帳號為,   %M0_LOGON_USER% 	董國安			==> "董國安"
::echo 密碼到期日,   %M0_ENDDAY%		"YYYY/MM/DD"	==> 
::echo   今日日期,   %M0_TODAY			"%x%/%y%/%z%"	==>
::echo 密碼到期天數, %M0_DAYS%				99			==>	"99"

echo X=MsgBox("檢查密碼到期日期" +vbCrLf+ vbCrLf+ "查詢到登入帳號為 " + "%M0_LOGON_USER%"  + vbCrLf+  "密碼到期日 " + %M0_ENDDAY% +vbCrLf+ "密碼到期天數 " + "%M0_DAYS%" +" 天" +vbCrLf+ vbCrLf +  "(1)選擇 是   離開本檢查程式，不做任何改變 " +  vbCrLf + "(2)選擇 否   將自動更新為設定密碼到期前7天，檢查排程 " +  vbCrLf + "(3)選擇 取消 將自動清除檢查排程，不再提醒" ,vbYesNoCancel+vbExclamation,"傳送檢查密碼到期日期提醒訊息"^) > %tmp%\tmp2.vbs
>>%tmp%\tmp2.vbs echo wscript.quit X
call %tmp%\tmp2.vbs
echo %ERRORLEVEL%

IF %ERRORLEVEL% EQU 2 GOTO  L0_SET_S_DELETE
IF %ERRORLEVEL% EQU 6 GOTO  L0_YES
IF %ERRORLEVEL% EQU 7 GOTO  L0_SET_S_CHECK

GOTO  L0_EXIT
:L0_SET_S_DELETE
REM : 顯示訊息
REM *************************************************************************
::schtasks /delete /TN "0900-檢查密碼到期日期排程" < D:\auto_ans.txt
echo ::%ERRORLEVEL% EQU 2 GOTO  L0_SET_S_DELETE 				>> %M0_LOG2% 
echo ::"schtasks /delete /TN "0900-檢查密碼到期日期排程" /F "   >> %M0_LOG2% 
schtasks /delete /TN "0900-檢查密碼到期日期排程" /F 
::timeout /t 3600
GOTO L0_EXIT


:L0_YES
echo ::%%ERRORLEVEL% EQU 6 GOTO  L0_YES							>> %M0_LOG2% 
GOTO L0_EXIT
	

:L0_EXIT
REM ===================================================================================
REM 清除程式所有變數
SET M0_TAGFIL1=
REM ===============================
:: echo %username%
set M0_ENDDAY=
REM M0_ENDDAY="YYYY/MM/DD" 密碼到期日期
set M0_TODAY=
REM M0_TODAY="YYYY/MM/DD"  今日日期
set M0_LOGON_USER=
REM M0_LOGON_USER=登入帳號中文姓名
set M0_DAYS=
REM M0_DAYS=99 計算密碼到期天數

REM 設定程式所有變數
REM ===================================================================================
del %tmp%\tmp1.vbs
del %tmp%\tmp2.vbs
del %tmp%\y.txt
exit


:L0_SET_S_CHECK
REM ============:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::VB SCRIPE version
REM 取得 7 天前日期設定 schedule
REM today   & Update M0_TAGFILE day **0 =today  
echo wscript.echo dateadd("d",-7,%M0_ENDDAY%) > d:\tmp1.vbs
::echo wscript.echo dateadd("d",-7,%M0_ENDDAY_DATE%) >%tmp%\tmp1.vbs
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo d:\tmp1.vbs') do set ex_7=%%i
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo d:\tmp1.vbs') do set y_7=%%j
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo d:\tmp1.vbs') do set z_7=%%k
SET/A cx= ex_7-1911
set/A  x_7= %ex_7%
if %y_7% LSS 10 set y_7=0%y_7%
if %z_7% LSS 10 set z_7=0%z_7%
set M0_NEXTRUNDAY=%x_7%/%y_7%/%z_7%
::TIMEOUT /t 1800

REM M0_TODAY="YYYY/MM/DD"  今日日期
::echo today yyyymmdd ,	%x%%y%%z%
::echo today yyyy/mm/dd, %x%/%y%/%z%
::echo today taiwan year yyy/mm/dd,	%cx%/%y%/%z%
REM ===================================================================================
	
:::L0_SET_SCHEDULE_CHECK

REM **************************************************************************
REM : 加入Schedule
REM SCHTASKS /Create /ST 09:00:00 /SC daily /TN "school-shutdown2200" /TR "shutdown -s -f -t 30"
REM 		於每天 22:00 執行關機指令並命名為 "school-shutdown2200"。
REM 		因為沒有指定以系統執行，只有建立排程的帳號登入時才會執行關機指令。
schtasks /query  >> %M0_LOG1% 
::timeout /t 3600

REM 執行結果
REM 工作名稱                                 下次執行時間           狀態           
REM ======================================== ====================== ===============
REM 0900-檢查密碼到期日期排程                2020/9/9 上午 10:00:00 就緒    
REM SET M0_Schedule_STR=0900-檢查密碼到期日期排程
REM SCHTASKS /Create /ST 09:00:00 /SC daily /TN "0900-檢查密碼到期日期排程" /TR "d:\msg\use\pwd_date.exe"
REM *************************************************************************************************
REM : 找出密碼到期Schedule
for /f "usebackq tokens=1-4 delims= " %%i IN (`FIND "0900-檢查密碼到期日期排程" %M0_LOG1% `) DO (
	SET /A M0_FIND_SCHEDULE=1
	)	

::IF 	%M0_FIND_SCHEDULE% EQU 0 GOTO L0_CREATE_SCH
::IF 	%M0_FIND_SCHEDULE% EQU 1 GOTO L0_NEW_SCHEDULE
:::L0_NEW_SCHEDULE
::REM echo schtasks /Create /SD %M0_NEXTRUNDAY% /ST 09:00:00 /SC daily /TN "0900-檢查密碼到期日期排程"  /TR "C:\%~nx0"	
::schtasks /delete /TN "0900-檢查密碼到期日期排程" /F 
::schtasks /Create /SD 2020/12/28 /ST 09:00:00 /SC daily /TN "0900-檢查密碼到期日期排程"  /TR C:\pwd_date_Plus.bat
::echo %M0_NEXTRUNDAY%
::timeout 3600

echo ::"%ERRORLEVEL% EQU 7 GOTO  L0_SET_S_CHECK" 				>> %M0_LOG2% 
echo ::"%M0_NEXTRUNDAY%" 										>> %M0_LOG2% 
echo ::"schtasks /delete /TN "0900-檢查密碼到期日期排程" /F" 	>> %M0_LOG2% 
schtasks /delete /TN "0900-檢查密碼到期日期排程" /F   			
echo ::"schtasks /Create /SD %M0_NEXTRUNDAY% /ST 09:00:00 /SC daily /TN "0900-檢查密碼到期日期排程"  /TR C:\%~nx0"	 >> %M0_LOG2% 
schtasks /Create /SD %M0_NEXTRUNDAY% /ST 09:00:00 /SC daily /TN "0900-檢查密碼到期日期排程"  /TR C:\%~nx0	
::timeout /t 3600

GOTO L0_EXIT	




