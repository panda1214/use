@echo on
:::::::::::::: Lets set some variables ::::::::::::::
REM M0_SUB_TITLE_STR 											�H��D��
REM M0_eRUNLOG1 												�H�����1
REM M0_eRUNLOG2 												�H�����2
REM M0_eTO=-to "panda.tung@cathaysec.com.tw" 					����H Email Address
REM M0_eSUBJ=-subject %M0_SUB_TITLE_STR%     					�ন�H��D���y�k
REM M0_eFM=-f itm@cathaysec.com.tw			 					�H��H Email Address
REM M0_eSVR=-server cathaymail.linyuan.com.tw -port 25 -try 1   EMAIL SERVER & Port & retry
REM M0_eUSER=-u itm@cathaysec.com.tw -pw Abc123 				�H��H Email Address�αK�X
:::::::::::::: Lets set some variables ::::::::::::::
:: CALL SEND_MSG �ݶǤJ�ܼ�
::::::::::::::SET M0_LOG=%M1_LOG%
::::::::::::::SET M0_MSG_CHT_STR=%M1_MSG_CHT_STR%
::::::::::::::SET M0_RUNDRIVE=%M1_RUNDRIVE%
::::::::::::::SET M0_RUNDIR=%M1_RUNDIR% 
:::::::::::::: Lets set some variables ::::::::::::::
set M0_SUB_TITLE_STR=%M0_MSG_CHT_STR%
set M0_eRUNLOG1=%M0_LOG%
set M0_eTO=-to "panda.tung@cathaysec.com.tw"
Set M0_eSUBJ=-subject %M0_SUB_TITLE_STR%
Set M0_eFM=-f itm@cathaysec.com.tw
set M0_eSVR=-server cathaymail.linyuan.com.tw -port 25 -try 1
set M0_eUSER=-u itm@cathaysec.com.tw -pw Abc123


@echo on
%M0_RUNDRIVE%
CD %M0_RUNDIR% 

blat276 -bodyF %M0_eRUNLOG1% %M0_eTO% %M0_eSUBJ% %M0_eFM% %M0_eSVR% %M0_eUSER% -attacht %M0_eRUNLOG1% -charset big5 

REM timeout /t 30 

::::
REM cmail.exe %M0_host% %M0_to% %M0_from% %M0_subj% %M0_LOG%

::::set M0_host=-host:itm@cathaysec.com.tw:Abc123@cathaymail.linyuan.com.tw
::::set M0_from=-from:itm@cathaysec.com.tw
::::set M0_to=-to:panda.tung@cathaysec.com.tw
REM SET M0_MSG_CHT_STR=�ˬd�ɮװT��
::::SET M0_subj=-subject:%M0_MSG_CHT_STR%
REM M0_RUNLOG1
::::SET M0_LOG=-body-file:%M0_RUNLOG1%


 