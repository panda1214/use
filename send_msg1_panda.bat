

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
:::::::::::::: Lets set some variables ::::::::::::::
set M0_SUB_TITLE_STR=%M0_MSG_CHT_STR%
set M0_eLOG_BODY=%M0_LOG%
set M0_eLOG_ATTACHT=%M0_LOG_OTHER%
set M0_eTO=-to "panda.tung@cathaysec.com.tw"
Set M0_eSUBJ=-subject %M0_SUB_TITLE_STR%
Set M0_eFM=-f itm@cathaysec.com.tw
set M0_eSVR=-server cathaymail.linyuan.com.tw -port 25 -try 1
set M0_eUSER=-u itm@cathaysec.com.tw -pw Abc123


@echo on
%M0_RUNDRIVE%
CD %M0_RUNDIR% 
::echo   %M0_LOG%
::echo   %M0_eLOG_BODY%
::echo   %M0_eLOG_ATTACHT%
::TIMEOUT /t 1800
::pause

if defined M0_eLOG_ATTACHT GOTO L0_MANY_ATTACHT
:L0_ONLY_ONE
blat276 -bodyF %M0_eLOG_BODY% %M0_eTO% %M0_eSUBJ% %M0_eFM% %M0_eSVR% %M0_eUSER% -attacht %M0_eLOG_BODY%  -charset big5 
::echo "L0_ONLY_ONE"
goto L0__EXIT

:L0_MANY_ATTACHT
blat276 -bodyF %M0_eLOG_BODY% %M0_eTO% %M0_eSUBJ% %M0_eFM% %M0_eSVR% %M0_eUSER% -attacht %M0_eLOG_ATTACHT% -charset big5 
::echo "L0_MANY_ATTACH"
goto L0__EXIT

:L0__EXIT
:: timeout /t 600

::::
REM cmail.exe %M0_host% %M0_to% %M0_from% %M0_subj% %M0_LOG%

::::set M0_host=-host:itm@cathaysec.com.tw:Abc123@cathaymail.linyuan.com.tw
::::set M0_from=-from:itm@cathaysec.com.tw
::::set M0_to=-to:panda.tung@cathaysec.com.tw
REM SET M0_MSG_CHT_STR=�ˬd�ɮװT��
::::SET M0_subj=-subject:%M0_MSG_CHT_STR%
REM M0_RUNLOG1
::::SET M0_LOG=-body-file:%M0_RUNLOG1%


 