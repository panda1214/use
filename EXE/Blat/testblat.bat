@echo on
:::::::::::::: Lets set some variables ::::::::::::::
set eFm=itm@cathaysec.com.tw
set server=cathaymail.linyuan.com.tw
set portn=25
set tryn=1
set eUser=123_msg@cathaysec.com.tw
set ePw=Abc123
set eTo=-to "123_msg@cathaysec.com.tw,panda.tung@cathaysec.com.tw"
Set eSub="���� BLAT EMAIL"
set subj=-subject %eSub%
set RUNLOG1=blattest.log
REM blat276 -profile -delete "<default>"
::::::::::::::::: Now we run Blat!  :::::::::::::::::
REM ���o BATCH �Ҧb���| (blat276.exe�Ҧb���|)


REM -----------------
REM 1.�Ψt�κ޲z��������
REM 2.�`�N���|


REM 1.�Ψt�κ޲z��������
REM 2.�`�N���|

d:
cd\msg


dir . > %RUNLOG1%
dir . > NUL



blat276.exe -bodyF %RUNLOG1% %eTo% %subj% -attacht %RUNLOG1% -charset big5 

pause