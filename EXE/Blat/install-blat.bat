@echo on
:::::::::::::: Lets set some variables ::::::::::::::
set eFm=123_msg@cathaysec.com.tw
set server=cathaymail.linyuan.com.tw
set server=202.154.192.72
set portn=25
set tryn=1
set eUser=123_msg@cathaysec.com.tw
set ePw=Cathay123
::::::::::::::::: Now we run Blat!  :::::::::::::::::
REM 取得 BATCH 所在路徑 (blat276.exe所在路徑)
SET V_BATPATH=%~DP0%

REM -----------------
REM 1.用系統管理身份執行(!!! 用開始->右鍵-MSDOS->執行 administrator DOS)
REM 2.注意路徑


REM 1.用系統管理身份執行
REM 2.注意路徑

echo V_BATPATH=%~DP0%
pause
d:
CD %V_BATPATH%

blat276 -install %server% %eFm% %tryn% %portn% -profile 123 -u %eUser% -pw %ePw% -q
blat276 -install 202.154.192.72 123_msg@cathaysec.com.tw 1 25 123 -q


pause 