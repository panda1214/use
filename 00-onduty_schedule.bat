::::::::::::::::::::::::::::
REM FOR use	1-0725-上班前重開機切換排程 
REM 
REM 切換至 	2-0730-1759-上班期間系統開機後 ON
REM 		4-1800-0724-下班-系統開機後 OFF
REM 指令	schtasks /CHANGE /DISABLE /TN "\國安-電券早班\0625-A-早班_-重開機" [/s computer [/u [domain\]user /p password]] /?   
@echo off
CLS

REM::
GOTO L0_GET_ADMIN
REM  程式自動設定為 Administrator 權限
REM  https://dotblogs.com.tw/c5todo/2016/08/21/155005
REM
:L0_END_GET_ADMIN
REM::

:L0_MAIN_START
::::::::::::::::::::::::::::
::START
::::::::::::::::::::::::::::
REM  停用 國安-電券早班 排程    
REM 指令	schtasks /CHANGE /DISABLE /TN "\國安-電券早班\0625-A-早班_-重開機" [/s computer [/u [domain\]user /p password]] /?   
REM SCHTASKS /Create [/S system [/U username [/P [password]]]]
REM     [/RU username [/RP password]] /SC schedule [/MO modifier] [/D day]
REM     [/M months] [/I idletime] /TN taskname /TR taskrun [/ST starttime]
REM     [/RI interval] [ {/ET endtime | /DU duration} [/K] [/XML xmlfile] [/V1]]
REM     [/SD startdate] [/ED enddate] [/IT | /NP] [/Z] [/F] [/HRESULT] [/?]
::::::::::::::::::::::::::::
::SET 
::::::::::::::::::::::::::::
SET M0_RUNDIR=\Msg\Use
SET M0_LOG=\Msg\Use\Log\00-onduty-schedule.log  
D:
CD  %M0_RUNDIR%
SET M0_SETDIR=\Msg\Use
SET M0_SENDMSG_1=%M0_SETDIR%\send_msg1_panda.bat
REM :: SendMail
SET M0_SENDMSG_2=%M0_SETDIR%\Nosend_msg1_panda1214.bat
REM :: SendSMS
SET M0_SENDMSG_3=%M0_SETDIR%\Nosend_msg3_panda.bat

IF NOT EXIST %M0_RUNDIR%\msg_str_sec_bye.eee GOTO L1_CK_FILE_ERR01
:L1_END_CK_FILE_ERR01
::msg_str_sec_bye.eee '執行00-onduty_schedule.bat' 5
MSG * /TIME:3 執行00-onduty_schedule.bat

:L0_START_01
::::::::::::::::::::::::::::
::START_01
::::::::::::::::::::::::::::
echo. > %M0_LOG%    
echo. :::  1-0750-上班前重開機 run D:\Msg\Use\00-onduty_schedule.bat                            
echo. :::  ============================================================= 			>> %M0_LOG%  
echo. :::  -----------     every thing  on ----------  4 5 off	-----------			>> %M0_LOG%    
schtasks /CHANGE /ENABLE  /TN "\0830_班\1-0750-上班前重開機"						>> %M0_LOG% 
schtasks /CHANGE /ENABLE  /TN "\0830_班\2-0800-1829-上班期間系統開機後"				>> %M0_LOG% 
echo. ::: 0830_班\3-1825-下班後重開機" 永遠 ON 									    >> %M0_LOG% 
echo. :::  ----------- 3 Always ON------------	---------------------				>> %M0_LOG%  
schtasks /CHANGE /ENABLE  /TN "\0830_班\3-1825-下班後重開機"						>> %M0_LOG% 
echo. :::  ----------- 4, 5 off	------------	---------------------			>> %M0_LOG%  
schtasks /CHANGE /DISABLE /TN "\0830_班\4-1830-0755-下班-系統開機後"				>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\0830_班\5-休假期間_0755_重開機"						>> %M0_LOG% 
echo. :::  20210610 ADD------- WFH 1,2,3,4,5 OFF	----------------------			>> %M0_LOG% 
echo. :::  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@			>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\0830_班\1-0750-上班前重開機"						>> %M0_LOG%  
schtasks /CHANGE /DISABLE /TN "\0830_班\2-0800-1829-上班期間系統開機後"				>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\0830_班\3-1825-下班後重開機"						>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\0830_班\4-1830-0755-下班-系統開機後"				>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\0830_班\5-休假期間_0755_重開機"						>> %M0_LOG% 
schtasks /CHANGE /ENABLE /TN "\0830_班\99-0740-居家工作-上班期間-執行上班排程"		>> %M0_LOG% 
schtasks /CHANGE /ENABLE /TN "\0830_班\99-1830-居家工作-執行下班後關閉排程機"		>> %M0_LOG% 
echo. :::  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@			>> %M0_LOG% 
echo. :::  ==============================================================			>> %M0_LOG% 
echo. :::  >> %M0_LOG%  
echo. :::  >> %M0_LOG% 
echo. :::  ==========查詢目前狀態======================================== 			>> %M0_LOG% 
schtasks /query /fo csv /nh /TN "\0830_班\1-0750-上班前重開機"						>> %M0_LOG% 
schtasks /query /fo csv /nh /TN "\0830_班\2-0800-1829-上班期間系統開機後"			>> %M0_LOG%  
schtasks /query /fo csv /nh /TN "\0830_班\3-1825-下班後重開機"						>> %M0_LOG% 
schtasks /query /fo csv /nh /TN "\0830_班\4-1830-0755-下班-系統開機後"				>> %M0_LOG% 
schtasks /query /fo csv /nh /TN "\0830_班\5-休假期間_0755_重開機"					>> %M0_LOG% 
echo. :::  20210610 ADD------- WFH 1,2,3,4,5 OFF	----------------------			>> %M0_LOG% 
echo. :::  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@			>> %M0_LOG% 
schtasks /query /fo csv /nh /TN "\0830_班\99-0740-居家工作-上班期間-執行上班排程"	>> %M0_LOG% 
schtasks /query /fo csv /nh /TN "\0830_班\99-1830-居家工作-執行下班後關閉排程機"	>> %M0_LOG% 
echo. :::  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@			>> %M0_LOG% 
echo. :::  ============================================================== 			>> %M0_LOG% 
echo. >> %M0_LOG% 
echo. >> %M0_LOG% 
 echo. :::  ===============Set Up ON Alarm Schedule======================= 			>> %M0_LOG%  
schtasks /CHANGE /ENABLE  /TN "\Alarm\D-0825"										>> %M0_LOG%  
schtasks /CHANGE /ENABLE  /TN "\Alarm\D-0840"										>> %M0_LOG% 
schtasks /CHANGE /ENABLE  /TN "\Alarm\D-0900"										>> %M0_LOG% 
schtasks /CHANGE /ENABLE  /TN "\Alarm\D-1030"										>> %M0_LOG%
schtasks /CHANGE /ENABLE  /TN "\Alarm\D-1530"										>> %M0_LOG% 
schtasks /CHANGE /ENABLE  /TN "\Alarm\D-1715"										>> %M0_LOG%  
schtasks /CHANGE /ENABLE  /TN "\Alarm\D-1730"										>> %M0_LOG%    
schtasks /CHANGE /ENABLE  /TN "\Alarm\T-1630"										>> %M0_LOG% 
schtasks /CHANGE /ENABLE  /TN "\Alarm\W3-1555"										>> %M0_LOG%    
schtasks /CHANGE /ENABLE  /TN "\Alarm\W5-1555"										>> %M0_LOG%
echo. :::  ==========查詢目前狀態======================================== 			>> %M0_LOG% 
echo. :::  -----------     every thing  off-----------3,4,5 on	-----------			>> %M0_LOG% 
schtasks /query /fo csv /nh /TN "\Alarm\D-0825"										>> %M0_LOG% 
schtasks /query /fo csv /nh /TN "\Alarm\D-0840"										>> %M0_LOG% 
schtasks /query /fo csv /nh /TN "\Alarm\D-0900"										>> %M0_LOG% 
schtasks /query /fo csv /nh /TN "\Alarm\D-1030"										>> %M0_LOG% 
schtasks /query /fo csv /nh /TN "\Alarm\D-1530"										>> %M0_LOG%
schtasks /query /fo csv /nh /TN "\Alarm\D-1715"										>> %M0_LOG%
schtasks /query /fo csv /nh /TN "\Alarm\D-1730"										>> %M0_LOG%
schtasks /query /fo csv /nh /TN "\Alarm\T-1630"										>> %M0_LOG%
schtasks /query /fo csv /nh /TN "\Alarm\W3-1555"									>> %M0_LOG%
schtasks /query /fo csv /nh /TN "\Alarm\W5-1555"									>> %M0_LOG%  
echo. :::  ============================================================= 			>> %M0_LOG% 
echo. :::  ============================================================= 			>> %M0_LOG%  


REM start /max C:\Windows\System32\taskschd.msc
::::::::::::::::::::::::::::
::SENDMAG
::::::::::::::::::::::::::::
SET M0_MSG_CHT_STR="%date%-%time%-[執行排程00-onduty_schedule_OK]-[平日排上班程啟用成功][其他 ON - 3,4,5,OFF]"


:L0_SENDMSG1 
:: sendMail

IF NOT EXIST %M0_SENDMSG_1% GOTO L0_SENDMSG2
call %M0_SENDMSG_1%
GOTO L0_SENDMSG2

:L0_SENDMSG2
IF NOT EXIST %M0_SENDMSG_2% GOTO L0_SENDMSG3
call %M0_SENDMSG_2%
GOTO L0_SENDMSG3

:L0_SENDMSG3
IF NOT EXIST %M0_SENDMSG_3% GOTO L0_EXIT_OUT
SET M0_MSG_ENG_STR=%date%-%time%_1900-START_Schedule_Disable
SET M0_WEP=bFfG7yiit9oGWtGh2OGaio
set M0_event=time_line
curl -X POST http://maker.ifttt.com/trigger/%M0_event%/with/key/%M0_WEP% -F "value1=%M0_MSG_ENG_STR%"
GOTO L0_EXIT_OUT

:L0_EXIT_OUT
::msg_str_sec_bye.eee '完成00-onduty_schedule.bat' 5 
MSG * /TIME:3 完成00-onduty_schedule.bat
SET M0_WEP=
set M0_event=
SET M0_RUNDIR=
SET M0_LOG=
EXIT


EXIT
REM :: :::::::::::::::::::::::::::::::::::::::::::::::::::
REM :: 	SUB FUNCTION
REM :: :::::::::::::::::::::::::::::::::::::::::::::::::::
:L1_CK_FILE_ERR01
	@echo on
	echo  *** 找不到   %M0_RUNDIR%\msg_str_sec_bye.exe  >> %M0_LOG%
	echo  *** 找不到   %M0_RUNDIR%\msg_str_sec_bye.exe  >> %M0_LOG%	
	echo  *** 找不到   %M0_RUNDIR%\msg_str_sec_bye.exe  >> %M0_LOG%
	echo  *** 找不到   %M0_RUNDIR%\msg_str_sec_bye.exe  
	echo  *** 找不到   %M0_RUNDIR%\msg_str_sec_bye.exe  
	echo  *** 找不到   %M0_RUNDIR%\msg_str_sec_bye.exe  
	timeout /t 300
GOTO L1_END_CK_FILE_ERR01


EXIT
:L0_GET_ADMIN
REM  程式自動設定為 Administrator 權限
REM  https://dotblogs.com.tw/c5todo/2016/08/21/155005
REM
@echo off
CLS
ECHO.
ECHO =============================
ECHO Running Admin Shell
ECHO =============================

:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
ECHO.
ECHO **************************************
ECHO Invoking UAC for Privilege Escalation
ECHO **************************************

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)
ENDLOCAL 

GOTO L0_END_GET_ADMIN



