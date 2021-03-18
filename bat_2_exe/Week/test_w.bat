:: batch script using VBS to get the weekday.
:: Get weekday and day of week number, for a date
@echo off  
if "%~1"=="" echo Use this to get the day of week: "%~nx0" dd-mm-yyyy& pause & goto :EOF
set file="%temp%\%~n0.temp.vbs"
echo>%file% WScript.Echo weekday(#%~1#)
for /f %%a in ('cscript //nologo %file%') do set "daynum=%%a"
del %file%
for /f "tokens=%daynum% delims=," %%a in ("Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday") do set "weekday=%%a"
echo dow is "%daynum%" - "%weekday%"
pause






REM =========================================
@if (@X)==(@Y) @end/*** Javascript comment
@echo off
set "date1=01/18/2021"
(
    mshta "about:<title>dow</title><body onload='init("%date1%")'><script language='javascript' src='file://%~dpnxf0'></script><span id='arg1'>%date1%</span></body>" 
) | (
    for /f "tokens=* delims=" %%B in ('more') do (
        echo day of the week: %%B
    )
)
pause
exit /b 0

**/

function init(ds) {
    //var dt = document.getElementById('arg1').value;
    var the_date=new Date(Date.parse(ds));
    var the_day=the_date.getDay();
    //alert(the_day);
    var fso= new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1);
    //fso.Write(the_date.getDay());
    close(fso.Write(the_day));

}