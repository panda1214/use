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
REM ���o BATCH �Ҧb���| (blat276.exe�Ҧb���|)
SET V_BATPATH=%~DP0%

REM -----------------
REM 1.�Ψt�κ޲z��������(!!! �ζ}�l->�k��-MSDOS->���� administrator DOS)
REM 2.�`�N���|


REM 1.�Ψt�κ޲z��������
REM 2.�`�N���|

echo V_BATPATH=%~DP0%
pause
d:
CD %V_BATPATH%

blat276 -install %server% %eFm% %tryn% %portn% -profile 123 -u %eUser% -pw %ePw% -q
blat276 -install 202.154.192.72 123_msg@cathaysec.com.tw 1 25 123 -q


pause 