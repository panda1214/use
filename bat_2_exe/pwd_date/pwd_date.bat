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
REM :: 1.��ܱb���αK�X�����  
REM :: schtasks /Create /SD %M0_NEXTRUNDAY% /ST 09:00:00 /SC daily /TN "0900-�ˬd�K�X�������Ƶ{"  /TR "d:\msg\use\pwd_date_Plus.exe"	
setlocal enableDelayedExpansion
@echo off

REM ���U��IFTTT��Line���_
REM curl -X POST -H "Content-Type: application/json" -d 
REM '{"value1":"J"}' https://maker.ifttt.com/trigger/{event}/with/key/dtLi4Ps62eMFj8FFCUGzCw


REM ===================================================================================
REM �]�w�{���Ҧ��ܼ�
SET M0_TAGFIL1=%tmp%\showmsg.txt
REM ===============================
:: echo %username%
set M0_ENDDAY="YYYY/MM/DD"
REM M0_ENDDAY="YYYY/MM/DD" �K�X������
set M0_TODAY="Today"
REM M0_TODAY="YYYY/MM/DD"  ������
set M0_LOGON_USER="OOOOOO"
REM M0_LOGON_USER=�n�J�b������m�W
set M0_DAYS=99
REM M0_DAYS=99 �p��K�X����Ѽ�

REM �]�w�{���Ҧ��ܼ�
REM ===================================================================================


REM ============:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::VB SCRIPE version
REM ���o������  REM ���� 2020/09/08
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
REM M0_TODAY="YYYY/MM/DD"  ������
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
REM : ��X����m�W (���W)
for /f "usebackq tokens=1-4 delims= " %%i IN (`FIND "���W" %M0_TAGFIL1% `) DO (
	SET M0_i=%%i
	SET M0_j=%%j
	SET M0_k=%%k
	SET M0_l=%%l
	)
set M0_LOGON_USER=%M0_j%
REM M0_LOGON_USER=�n�J�b������m�W
REM : ��X����m�W (���W)
REM *************************************************************************************************

REM *************************************************************************************************
REM : ��X�K�X���
for /f "usebackq tokens=1-4 delims= " %%i IN (`FIND "�K�X���" %M0_TAGFIL1% `) DO (
	SET M0_i=%%i
	SET M0_j=%%j
	SET M0_k=%%k
	SET M0_l=%%l
	)
set M0_ENDDAY="%M0_j%"
REM M0_ENDDAY="YYYY/MM/DD" �K�X������
::echo variable1, %M0_i% 
::echo variable2, %M0_j%
::echo variable3, %M0_k%
::echo variable4, %M0_l%
REM : ��X�K�X���
REM *************************************************************************************************
::echo  %M0_i%,%M0_j%,%M0_k%,%M0_l% 
::echo ������ %M0_TODAY%


REM *************************************************************************************************
REM : �p��K�X����Ѽ�
echo wscript.echo DateDiff("d",%M0_TODAY%,%M0_ENDDAY%) >%tmp%\tmp.vbs
for /f %%i in ('cscript /nologo %tmp%\tmp.vbs') do (
	set M0_DAYS=%%i
	REM �K�X����Ѽ�
	)
REM : �p��K�X����Ѽ�
REM *************************************************************************************************


REM **************************************************************************
REM : ��ܰT��
REM **** batch �ܼ� �� VBS (VB SCRIPT)
::echo �n�J�b��ID��, %username%
::echo �n�J�b����,   %M0_LOGON_USER%
::echo �K�X�����,   %M0_ENDDAY%
::echo   ������,   %M0_TODAY%
::echo �K�X����Ѽ�, %M0_DAYS%

echo X=MsgBox("�ˬd�K�X������" +vbCrLf+ vbCrLf+ "(1)�d�ߨ�n�J�b���� " + "%M0_LOGON_USER%"  + vbCrLf+  "(2)�K�X����� " + %M0_ENDDAY% +vbCrLf+ "(3)�K�X����Ѽ� " + "%M0_DAYS%" +" ��"  ,vbOKOnly+vbInformation,"�ǰe�u�@�����T��"^) > %tmp%\tmp2.vbs
>>%tmp%\tmp2.vbs echo wscript.quit X

call %tmp%\tmp2.vbs

REM : ��ܰT��
REM *************************************************************************

REM ===================================================================================
REM �M���{���Ҧ��ܼ�
SET M0_TAGFIL1=
REM ===============================
:: echo %username%
set M0_ENDDAY=
REM M0_ENDDAY="YYYY/MM/DD" �K�X������
set M0_TODAY=
REM M0_TODAY="YYYY/MM/DD"  ������
set M0_LOGON_USER=
REM M0_LOGON_USER=�n�J�b������m�W
set M0_DAYS=
REM M0_DAYS=99 �p��K�X����Ѽ�

REM �]�w�{���Ҧ��ܼ�
REM ===================================================================================
del %tmp%\tmp1.vbs
del %tmp%\tmp2.vbs

exit


