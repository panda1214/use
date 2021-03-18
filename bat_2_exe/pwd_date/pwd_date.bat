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
REM :: schtasks /Create /SD %M0_NEXTRUNDAY% /ST 09:00:00 /SC daily /TN "0900-檢查密碼到期日期排程"  /TR "d:\msg\use\pwd_date_Plus.exe"	
setlocal enableDelayedExpansion
@echo off

REM 底下為IFTTT轉Line金鑰
REM curl -X POST -H "Content-Type: application/json" -d 
REM '{"value1":"J"}' https://maker.ifttt.com/trigger/{event}/with/key/dtLi4Ps62eMFj8FFCUGzCw


REM ===================================================================================
REM 設定程式所有變數
SET M0_TAGFIL1=%tmp%\showmsg.txt
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

REM 設定程式所有變數
REM ===================================================================================


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
	
	
REM ======================================================
REM =====DUMP  net user %username% to %tmp%\showmsg.txt
echo. > %M0_TAGFIL1%
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
::echo 登入帳號為,   %M0_LOGON_USER%
::echo 密碼到期日,   %M0_ENDDAY%
::echo   今日日期,   %M0_TODAY%
::echo 密碼到期天數, %M0_DAYS%

echo X=MsgBox("檢查密碼到期日期" +vbCrLf+ vbCrLf+ "(1)查詢到登入帳號為 " + "%M0_LOGON_USER%"  + vbCrLf+  "(2)密碼到期日 " + %M0_ENDDAY% +vbCrLf+ "(3)密碼到期天數 " + "%M0_DAYS%" +" 天"  ,vbOKOnly+vbInformation,"傳送工作提醒訊息"^) > %tmp%\tmp2.vbs
>>%tmp%\tmp2.vbs echo wscript.quit X

call %tmp%\tmp2.vbs

REM : 顯示訊息
REM *************************************************************************

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

exit


