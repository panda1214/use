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
REM :: 2.�O�_�K�X����e7�� ,�[�W���{�� pwd_date_Plus.exe��Ƶ{
REM :: schtasks /Create /SD %M0_NEXTRUNDAY% /ST 09:00:00 /SC daily /TN "0900-�ˬd�K�X�������Ƶ{"  /TR "d:\msg\use\pwd_date_Plus.exe"	
setlocal DisableDelayedExpansion

REM  �{���۰ʳ]�w�� Administrator �v��
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
REM :: 1.��ܱb���αK�X�����  
REM :: 2.�O�_�K�X����e7�� ,�[�W���{�� pwd_date_Plus.exe��Ƶ{
REM :: schtasks /Create /SD %M0_NEXTRUNDAY% /ST 09:00:00 /SC daily /TN "0900-�ˬd�K�X�������Ƶ{"  /TR "d:\msg\use\pwd_date_Plus.exe"	
setlocal DisableDelayedExpansion
REM ===================================================================================
REM �]�w�{���Ҧ��ܼ�
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
REM M0_ENDDAY="YYYY/MM/DD" �K�X������
set M0_TODAY="Today"
REM M0_TODAY="YYYY/MM/DD"  ������
set M0_LOGON_USER="OOOOOO"
REM M0_LOGON_USER=�n�J�b������m�W
set M0_DAYS=99
REM M0_DAYS=99 �p��K�X����Ѽ�
set M0_NEXTRUNDAY=YYYYMMDD
REM M0_NEXTRUNDAY �]�w�K�X����e7��,�]�w���楻�{���Ƶ{
REM �]�w�{���Ҧ��ܼ�
REM ==================================




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
	
echo. > %M0_TAGFIL1%
echo. > %M0_LOG1%
echo. > %M0_LOG2%
	
REM ======================================================
REM =====DUMP  net user %username% to %tmp%\showmsg.txt

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
set M0_ENDDAY_DATE=%M0_j%
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
::echo �n�J�b����,   %M0_LOGON_USER% 	����w			==> "����w"
::echo �K�X�����,   %M0_ENDDAY%		"YYYY/MM/DD"	==> 
::echo   ������,   %M0_TODAY			"%x%/%y%/%z%"	==>
::echo �K�X����Ѽ�, %M0_DAYS%				99			==>	"99"

echo X=MsgBox("�ˬd�K�X������" +vbCrLf+ vbCrLf+ "�d�ߨ�n�J�b���� " + "%M0_LOGON_USER%"  + vbCrLf+  "�K�X����� " + %M0_ENDDAY% +vbCrLf+ "�K�X����Ѽ� " + "%M0_DAYS%" +" ��" +vbCrLf+ vbCrLf +  "(1)��� �O   ���}���ˬd�{���A����������� " +  vbCrLf + "(2)��� �_   �N�۰ʧ�s���]�w�K�X����e7�ѡA�ˬd�Ƶ{ " +  vbCrLf + "(3)��� ���� �N�۰ʲM���ˬd�Ƶ{�A���A����" ,vbYesNoCancel+vbExclamation,"�ǰe�ˬd�K�X�����������T��"^) > %tmp%\tmp2.vbs
>>%tmp%\tmp2.vbs echo wscript.quit X
call %tmp%\tmp2.vbs
echo %ERRORLEVEL%

IF %ERRORLEVEL% EQU 2 GOTO  L0_SET_S_DELETE
IF %ERRORLEVEL% EQU 6 GOTO  L0_YES
IF %ERRORLEVEL% EQU 7 GOTO  L0_SET_S_CHECK

GOTO  L0_EXIT
:L0_SET_S_DELETE
REM : ��ܰT��
REM *************************************************************************
::schtasks /delete /TN "0900-�ˬd�K�X�������Ƶ{" < D:\auto_ans.txt
echo ::%ERRORLEVEL% EQU 2 GOTO  L0_SET_S_DELETE 				>> %M0_LOG2% 
echo ::"schtasks /delete /TN "0900-�ˬd�K�X�������Ƶ{" /F "   >> %M0_LOG2% 
schtasks /delete /TN "0900-�ˬd�K�X�������Ƶ{" /F 
::timeout /t 3600
GOTO L0_EXIT


:L0_YES
echo ::%%ERRORLEVEL% EQU 6 GOTO  L0_YES							>> %M0_LOG2% 
GOTO L0_EXIT
	

:L0_EXIT
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
del %tmp%\y.txt
exit


:L0_SET_S_CHECK
REM ============:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::VB SCRIPE version
REM ���o 7 �ѫe����]�w schedule
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

REM M0_TODAY="YYYY/MM/DD"  ������
::echo today yyyymmdd ,	%x%%y%%z%
::echo today yyyy/mm/dd, %x%/%y%/%z%
::echo today taiwan year yyy/mm/dd,	%cx%/%y%/%z%
REM ===================================================================================
	
:::L0_SET_SCHEDULE_CHECK

REM **************************************************************************
REM : �[�JSchedule
REM SCHTASKS /Create /ST 09:00:00 /SC daily /TN "school-shutdown2200" /TR "shutdown -s -f -t 30"
REM 		��C�� 22:00 �����������O�éR�W�� "school-shutdown2200"�C
REM 		�]���S�����w�H�t�ΰ���A�u���إ߱Ƶ{���b���n�J�ɤ~�|�����������O�C
schtasks /query  >> %M0_LOG1% 
::timeout /t 3600

REM ���浲�G
REM �u�@�W��                                 �U������ɶ�           ���A           
REM ======================================== ====================== ===============
REM 0900-�ˬd�K�X�������Ƶ{                2020/9/9 �W�� 10:00:00 �N��    
REM SET M0_Schedule_STR=0900-�ˬd�K�X�������Ƶ{
REM SCHTASKS /Create /ST 09:00:00 /SC daily /TN "0900-�ˬd�K�X�������Ƶ{" /TR "d:\msg\use\pwd_date.exe"
REM *************************************************************************************************
REM : ��X�K�X���Schedule
for /f "usebackq tokens=1-4 delims= " %%i IN (`FIND "0900-�ˬd�K�X�������Ƶ{" %M0_LOG1% `) DO (
	SET /A M0_FIND_SCHEDULE=1
	)	

::IF 	%M0_FIND_SCHEDULE% EQU 0 GOTO L0_CREATE_SCH
::IF 	%M0_FIND_SCHEDULE% EQU 1 GOTO L0_NEW_SCHEDULE
:::L0_NEW_SCHEDULE
::REM echo schtasks /Create /SD %M0_NEXTRUNDAY% /ST 09:00:00 /SC daily /TN "0900-�ˬd�K�X�������Ƶ{"  /TR "C:\%~nx0"	
::schtasks /delete /TN "0900-�ˬd�K�X�������Ƶ{" /F 
::schtasks /Create /SD 2020/12/28 /ST 09:00:00 /SC daily /TN "0900-�ˬd�K�X�������Ƶ{"  /TR C:\pwd_date_Plus.bat
::echo %M0_NEXTRUNDAY%
::timeout 3600

echo ::"%ERRORLEVEL% EQU 7 GOTO  L0_SET_S_CHECK" 				>> %M0_LOG2% 
echo ::"%M0_NEXTRUNDAY%" 										>> %M0_LOG2% 
echo ::"schtasks /delete /TN "0900-�ˬd�K�X�������Ƶ{" /F" 	>> %M0_LOG2% 
schtasks /delete /TN "0900-�ˬd�K�X�������Ƶ{" /F   			
echo ::"schtasks /Create /SD %M0_NEXTRUNDAY% /ST 09:00:00 /SC daily /TN "0900-�ˬd�K�X�������Ƶ{"  /TR C:\%~nx0"	 >> %M0_LOG2% 
schtasks /Create /SD %M0_NEXTRUNDAY% /ST 09:00:00 /SC daily /TN "0900-�ˬd�K�X�������Ƶ{"  /TR C:\%~nx0	
::timeout /t 3600

GOTO L0_EXIT	




