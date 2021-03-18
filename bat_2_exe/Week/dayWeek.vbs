REM Weekday(date[,firstdayofweek])
wscript.echo (Weekday("2021-01-18",0) )  
REM  0 = vbUseSystemDayOfWeek - Use National Language Support (NLS) API setting

wscript.echo (Weekday("2021-01-18",1) )  
REM type 1 firstdayofweek Sunday (default)

REM ******USE
wscript.echo (Weekday("2021-01-18",2) )  
REM type 2 firstdayofweek Monday
REM 1->mon 2->tue
REM ******USE



wscript.echo (Weekday("2021-01-18",3) ) 
REM type 3 firstdayofweek Tuesday
 
wscript.echo (Weekday("2021-01-18",4) )  
REM type 4 firstdayofweek Wednesday
wscript.echo (Weekday("2021-01-18",5) )  
REM type 5 firstdayofweek Thursday
wscript.echo (Weekday("2021-01-18",6) )  
REM type 6 firstdayofweek Friday

wscript.echo (Weekday("2021-01-18",7) )  
REM type 7 firstdayofweek Saturday

