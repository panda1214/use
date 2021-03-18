@echo off
CLS

set M0_RUNDIR=\Msg\Use
set M0_SETDIR=\Msg\Use
set M0_LOG=%M0_RUNDIR%\LOG\F_Reboot_bat.log
SET M0_SENDMSG_1=%M0_SETDIR%\send_msg1_panda.bat
REM :: SendMail
SET M0_SENDMSG_2=%M0_SETDIR%\nosend_msg1_panda1214.bat
REM :: SendSMS
SET M0_SENDMSG_3=%M0_SETDIR%\Nosend_msg3_panda.bat
REM :: Sendline
set M0_event=time_line
SET M0_MSG_CHT_STR="%date%"-"%time%"___執行排程_F_Reboot.bat____成功



D:
CD %M0_RUNDIR%
echo. > %M0_LOG%
::msg_str_sec_bye.eee '執行排程F_Reboot.bat成功' 3
MSG * /TIME:3 "                         執行排程F_Reboot.bat成功       "
echo. *****************************************************	>> %M0_LOG%
echo. 程式執行名稱 F_Reboot.bat								>> %M0_LOG%
echo. 程式執行日期 %date%,%time%							>> %M0_LOG%
echo. *****************************************************	>> %M0_LOG%
echo. >> %M0_LOG%
echo. >> %M0_LOG%


echo. :::  ============================================================== >> %M0_LOG% 
tasklist.exe >> %M0_LOG%
echo. :::  ============================================================== >> %M0_LOG% 

echo. >> %M0_LOG%
echo. >> %M0_LOG%
echo. *****************************************************	>> %M0_LOG%
echo. 程式執行名稱 F_Reboot.bat								>> %M0_LOG%
echo. 程式完成日期 %date%,%time%							>> %M0_LOG%
echo. *****************************************************	>> %M0_LOG%




:L0_SENDMSG1 
:: sendMail
IF NOT EXIST %M0_SENDMSG_1% GOTO L0_SENDMSG2
call %M0_SENDMSG_1%
::timeout /t 3600
GOTO L0_SENDMSG2

:L0_SENDMSG2
IF NOT EXIST %M0_SENDMSG_2% GOTO L0_SENDMSG3
call %M0_SENDMSG_2%
::timeout /t 3600
GOTO L0_SENDMSG3

:L0_SENDMSG3
IF NOT EXIST %M0_SENDMSG_3% GOTO L0_EXIT_OUT
SET M0_MSG_ENG_STR=%date%-%time%_1900-START_Schedule_Disable
SET M0_WEP=bFfG7yiit9oGWtGh2OGaio
set M0_event=time_line
curl -X POST http://maker.ifttt.com/trigger/%M0_event%/with/key/%M0_WEP% -F "value1=%M0_MSG_ENG_STR%"
GOTO L0_EXIT_OUT

:L0_EXIT_OUT
::msg_str_sec_bye.eee '完成排程F_Reboot.bat成功' 5
::MSG * /TIME:3 "                         完成排程F_Reboot.bat成功      "
set M0_RUNDIR=
set M0_LOG=
SET M0_WEP=
set M0_event=
SET M0_RUNDIR=
SET M0_LOG=
SET M0_MSG_CHT_STR=
::msg_str_sec_bye.eee '重開機' 3 
::MSG * /TIME:3 "                         完成排程F_Reboot.bat成功,重開機!!!!      "
shutdown /r /t 30 /f /c "F_Reboot_重開機"

EXIT