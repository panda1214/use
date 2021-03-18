@echo on
:::::::::::::: Lets set some variables ::::::::::::::
set eFm=itm@cathaysec.com.tw
set server=cathaymail.linyuan.com.tw
set portn=25
set tryn=1
set eUser=123_msg@cathaysec.com.tw
set ePw=Abc123
set eTo=-to "123_msg@cathaysec.com.tw,panda.tung@cathaysec.com.tw"
Set eSub="測試 BLAT EMAIL"
set subj=-subject %eSub%
set RUNLOG1=blattest.log
REM blat276 -profile -delete "<default>"
::::::::::::::::: Now we run Blat!  :::::::::::::::::
REM 取得 BATCH 所在路徑 (blat276.exe所在路徑)


REM -----------------
REM 1.用系統管理身份執行
REM 2.注意路徑


REM 1.用系統管理身份執行
REM 2.注意路徑

d:
cd\msg


dir . > %RUNLOG1%
dir . > NUL



blat276.exe -bodyF %RUNLOG1% %eTo% %subj% -attacht %RUNLOG1% -charset big5 

pause