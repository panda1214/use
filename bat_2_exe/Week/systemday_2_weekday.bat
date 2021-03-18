REM 取得日期
for /F "tokens=1-4 delims=/ " %%a IN ("%date%") DO (
set _year=%%a
set _month=%%b
set _day=%%c
set _week=%%d
set _today=%%a%%b%%c
)

REM 顯示年，例：2015
echo %_year%

REM 顯示月，例：03
echo %_month%

REM 顯示日，例：30
echo %_day%

REM 顯示星期幾，例：週二
echo %_week%

REM 顯示今天日期，例：20150330
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