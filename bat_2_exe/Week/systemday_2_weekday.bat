REM ���o���
for /F "tokens=1-4 delims=/ " %%a IN ("%date%") DO (
set _year=%%a
set _month=%%b
set _day=%%c
set _week=%%d
set _today=%%a%%b%%c
)

REM ��ܦ~�A�ҡG2015
echo %_year%

REM ��ܤ�A�ҡG03
echo %_month%

REM ��ܤ�A�ҡG30
echo %_day%

REM ��ܬP���X�A�ҡG�g�G
echo %_week%

REM ��ܤ��Ѥ���A�ҡG20150330
echo %_today%

REM =========================
wmic path win32_localtime get dayofweek

REM ==========================
set day=%DATE:~0,3%

IF %day% == Mon set dayofweek=Monday
IF %day% == Tue set dayofweek=Tuesday
IF %day% == Wed set dayofweek=Wednesday
IF %day% == Thu set dayofweek=Thursday
IF %day% == Fri set dayofweek=Friday
IF %day% == Sat set dayofweek=Saturday