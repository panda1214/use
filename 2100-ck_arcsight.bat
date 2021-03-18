@echo off
REM *************************************
REM 20190509 董國安 ck_arcsight.bat 檢查 ck_arcsight \\10.93.3.220\Network\Network\648518346341351425
REM 0640-0650 檢查arcsight LogServer 有無FireWall 昨日LOG
REM ************************************
setlocal enableDelayedExpansion

REM 底下為IFTTT轉Line金鑰
REM curl -X POST -H "Content-Type: application/json" -d 
REM '{"value1":"J"}' https://maker.ifttt.com/trigger/{event}/with/key/dtLi4Ps62eMFj8FFCUGzCw
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::VB SCRIPE version
REM today   & Update M0_TAGFILE day **0 =today
echo wscript.echo dateadd("d",0,date) >%tmp%\tmp.vbs
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set ex=%%i
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set y=%%j
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set z=%%k
SET/A cx= ex-1911
set/A  x= %ex%
if %y% LSS 10 set y=0%y%
if %z% LSS 10 set z=0%z%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::VB SCRIPE version
REM today   & Update M0_TAGFILE day **-1 =yesterday
echo wscript.echo dateadd("d",-1,date) >%tmp%\tmp.vbs
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set ex_1T=%%i
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set y_1T=%%j
for /f "tokens=1,2,3 delims=/- " %%i in ('cscript /nologo %tmp%\tmp.vbs') do set z_1T=%%k

SET/A cx_1T= ex_1T-1911
set/A  x_1T= %ex_1T%
if %y_1T% LSS 10 set y_1T=0%y_1T%
if %z_1T% LSS 10 set z_1T=0%z_1T%

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

echo. Running Yesterday is: %ex_1T%/%y_1T%/%z_1T%  YYYY/MM/DD[DD-1] 
echo. Running Date is: %x%/%y%/%z%  YYYY/MM/DD
echo. Running Chinese Yesterday is: %cx_1T%%y_1T%%z_1T%  CYYMMDD[DD-1]
echo. Running Date is: %cx%%y%%z%  CYYMM 
::PAUSE
REM 今日 2020/04/01 


REM *********** SET 程式各項參數  *********
REM !!! SET TAGDIR,RUNDIR,BAKDIR, CK_FILE,RUNLOG...
REM logckcount 累計檢查次數(不管LOG有無異動)
REM set /A M0_Check_WAait=60 每次休息 60 SEConds
REM SET /A M0_Check_TOT_Count=10次,	 共檢查10分鐘,  時間到,還未檢查到有檔案即發出告警,
REM (1)無檔案產生可被檢查,暫停60秒等待 
REM (2)中間有正確今日檔案
REM (3)檢查檔案內容有 "異常" 或 正常 ,即離開程式,並發出結果是正常或異常
REM #########################
SET M0_MSG_ICON=64
SET M0_event=err_msg
SET M0_WEP=cpAo5pnlpx8uuld8ebP7oc

SET /A M0_Check_TOT_Count=10
SET /A M0_Check_Log_Count=0
SET /A M0_TOTAL_COUNT=1
SET /A M0_CHECK_COUNT=0
set /A M0_Check_Wait=60
REM ******DEBUG
set M0_SENDIP=10.93.3.190
set M0_ServerIP=10.93.3.220
set M0_ServerName=arcsight-Log

REM DIR is Creat Day : Yesterday , File is Today
REM \\10.93.3.220\Network\Network\648518346341351425\20190507
set M0_TAGDIR1=\Network\Network\648518346341351425\%ex_1T%%y_1T%%z_1T%
set M0_TAGDIR_FILE1=\\%M0_ServerIP%%M0_TAGDIR1%




SET M0_MSG_CHT_STR="2055-2100[檢查中]_檢查arcsight防火牆備存LOG-昨日目錄[%ex_1T%%y_1T%%z_1T%]%M0_TAGDIR_FILE1%-[FM-%M0_SENDIP%]"
SET M0_MSG_ENG_STR=2055-2100[Process...]_Check arcsight FireWall Backup log Yesterday[%ex_1T%%y_1T%%z_1T%] DIRs-%M0_TAGDIR_FILE1%-[FM-%M0_SENDIP%]
REM !!!####20190121######
	SET M0_RUNDRIVE=D:
	SET M0_RUNDIR=\Msg\Use
	SET M0_LOGDIR=%M0_RUNDIR%\LOG
	
	REM 因目前 send_msg1.bat 受交易日影響需放在 M0_RUNDIR
	REM 因目前 M0_RUNDIR KEY又放在\set\Tpass 
	REM 2019/01/23 將原Msg 執行 及子目錄全部搬到 \msg\set
	SET M0_SETDIR=%M0_RUNDIR%
	SET M0_SENDMSG_1=%M0_SETDIR%\send_msg1_panda.bat
	SET M0_SENDMSG_2=%M0_SETDIR%\NO_send_msg2_panda.bat
	SET M0_SENDMSG_3=%M0_SETDIR%\NO_send_msg3_panda.bat


:L0_MKDIR00	
%M0_RUNDRIVE%
CD %M0_RUNDIR% 
if exist  %M0_LOGDIR% GOTO L0_MKDIR01
	MD %M0_LOGDIR%

:L0_MKDIR01	
CD %M0_RUNDIR% 
if exist  %M0_SETDIR% GOTO L0_MKDIREND
	MD %M0_SETDIR%
:L0_MKDIREND		

:L0_CREAT_REPORT
REM !!!####20190123######
SET M0_LOG_HEAD=%M0_LOGDIR%\ck_arcsight_LOG_HEAD.txt
     SET M0_LOG=%M0_LOGDIR%\ck_arcsight_RUNLOG.txt
REM 將 LOG 寫在前面 ***2019/01/21
SET M0_Swap_TMP=%M0_LOGDIR%\ck_arcsight_LOG_TMP.txt
REM 每次離開時把M1_LOG 存至 M0_Swap_TMP
SET M0_Swap_OK=%M0_LOGDIR%\ck_arcsight_LOG_OK.txt

REM 最後一次離開時把LOG寫在前面, 後面再加上原 M0_LOG
REM !!!####20190123######


REM !!!####20190123######
:L0_CHECK_START
REM 將 LOG 寫在前面 ***2019/01/21
echo. > %M0_LOG_HEAD%
echo. > %M0_LOG%
echo. > %M0_Swap_TMP%
echo. > %M0_Swap_OK%

echo. **************************************************	>> %M0_LOG_HEAD%
echo. 程式名稱 ck_arcsight.BAT								>> %M0_LOG_HEAD%
echo. 程式執行時間 %ex%-%y%-%z%,%time%  					>> %M0_LOG_HEAD%
echo. 應檢查目錄正確日期 %ex_1T%-%y_1T%-%z_1T%			 	>> %M0_LOG_HEAD%
echo. 共檢查 %M0_TOTAL_COUNT% 個目錄						>> %M0_LOG_HEAD%
echo. **************************************************	>> %M0_LOG_HEAD%


:L0_CHECK_START_02
REM 更換主機 **** L0_CHECK_START_02
REM Clear File & set SERVER FILE 1 !!!####20190509######
TYPE %M0_LOG% >> %M0_Swap_TMP%
echo. > %M0_LOG%




set M0_ServerIP=10.93.3.220
set M0_ServerName=ArcSight-Log
REM MAP network dirs to DRIVE
echo. **************************************************	>> %M0_LOG%
set M0_TAG_DRIVE=M:
SET M0_MAP_DESC=\\10.93.3.220\network\network\648518346341351425
::PAUSE
echo. 程式設定檢查主機及目錄為磁碟機	M:	>> %M0_LOG%
echo. MAP Dir M:^=%M0_MAP_DESC%				>> %M0_LOG%

net use /del %M0_TAG_DRIVE% /y  
net use %M0_TAG_DRIVE%  "\\10.93.3.220\network\network\648518346341351425" arcsight /user:"10.93.3.220\administrator" /persistent:YES  
 
set M0_TAGDIR1=%M0_TAG_DRIVE%
set M0_TAGDIR_FILE1=%M0_TAG_DRIVE%\%ex_1T%%y_1T%%z_1T%
echo. 檢查目錄為 %M0_TAGDIR_FILE1% >> %M0_LOG%
echo. **************************************************	>> %M0_LOG%
echo. 														>> %M0_LOG%


:L0_CHECK_STEP01
SET /A M0_Check_Log_Count=%M0_Check_Log_Count%+1

echo. 程式第 %M0_Check_Log_Count%次執行, 執行時間 %ex%-%y%-%z%,%time%  	>> %M0_LOG%
echo. +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 	>> %M0_LOG%
echo. TAG SERVER--%M0_ServerName%---%M0_ServerIP%							>> %M0_LOG%
echo. 原始__檢查路徑---%M0_MAP_DESC%\%ex_1T%%y_1T%%z_1T%					>> %M0_LOG%	
echo. MAP Dir M: -------^%M0_MAP_DESC%										>> %M0_LOG%
echo. 置換後檢查路徑---%M0_TAGDIR_FILE1%									>> %M0_LOG%	
echo. +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 	>> %M0_LOG%
::PAUSE
IF NOT EXIST %M0_TAGDIR_FILE1% GOTO L0_ERROR
dir /a-d /-c %M0_TAGDIR_FILE1%													>> %M0_LOG%


echo. @@@應檢查目錄 %M0_TOTAL_COUNT% , 目前檢查目錄 %M0_CHECK_COUNT% 檢查正常	>> %M0_LOG%
echo. >> %M0_LOG%
echo. >> %M0_LOG%
GOTO L0_EXIT_OK

:L0_EXIT
REM start "C:\Program Files (x86)\Notepad++\notepad.exe"  %M0_LOG%
IF %M0_TOTAL_COUNT% EQU %M0_CHECK_COUNT% GOTO L0_EXIT_OK
IF %M0_TOTAL_COUNT% GTR %M0_CHECK_COUNT% GOTO L0_EXIT_ERROR


:L0_EXIT_OK
SET M0_MSG_CHT_STR="2055-2100[OK]arcsight防火牆備存LOG檢查正常-昨日目錄[%ex_1T%%y_1T%%z_1T%]%M0_TAGDIR_FILE1%-[FM-%M0_SENDIP%]"
SET M0_MSG_ENG_STR=2055-2100[OK]_Check arcsight FireWall Backup log Yesterday[%ex_1T%%y_1T%%z_1T%] DIRs-%M0_TAGDIR_FILE1%-[FM-%M0_SENDIP%]
SET M0_MSG_ICON=64
SET M0_event=ok_msg
GOTO L0_SENDMSG1

:L0_EXIT_ERROR
SET M0_MSG_CHT_STR="2055-2100[***ERROR***]檢查異常-arcsight防火牆備存LOG檢查異常-昨日目錄[%ex_1T%%y_1T%%z_1T%]%M0_TAGDIR_FILE1%不存在-[FM-%M0_SENDIP%]"
SET M0_MSG_ENG_STR=2055-2100[***ERROR***]Check arcsight FireWall Backup log Yesterday[%ex_1T%%y_1T%%z_1T%] DIRs ERROR-%M0_TAGDIR_FILE1% NOT FIND-[FM-%M0_SENDIP%]
SET M0_MSG_ICON=16
SET M0_event=err_msg
GOTO L0_CHECK_WAIT

:L0_SENDMSG1
REM 將 LOG 寫在前面 ***2019/01/21
TYPE %M0_LOG_HEAD% >> %M0_Swap_OK%
TYPE %M0_LOG% >> %M0_Swap_OK%
echo. >> %M0_LOG%
echo. >> %M0_LOG%
echo. **************************************** >> %M0_Swap_OK%
echo. *   以下為記錄執行期間各次訊息         * >> %M0_Swap_OK%
echo. **************************************** >> %M0_Swap_OK%
TYPE %M0_Swap_TMP% >> %M0_Swap_OK%
SET M0_LOG=%M0_Swap_OK%
REM 將 LOG 寫在前面 ***2019/01/21


IF NOT EXIST %M0_SENDMSG_1% GOTO L0_SENDMSG2
call %M0_SENDMSG_1%
REM echo msgbox %M0_OK_STR%,64,"檢查檔案訊息%DATE%-%TIME%">1.vbs && start 1.vbs && ping -n 2 127.1>nul && del 1.vbs
GOTO L0_SENDMSG2

:L0_SENDMSG2
IF NOT EXIST %M0_SENDMSG_2% GOTO L0_SENDMSG3
call %M0_SENDMSG_2%
REM sent %M0_SENDIP% %M0_MSG_CHT_STR%
GOTO L0_SENDMSG3

:L0_SENDMSG3
IF NOT EXIST %M0_SENDMSG_3% GOTO L0_EXIT_OUT
call %M0_SENDMSG_3%
REM START curl -S -X POST http://maker.ifttt.com/trigger/123msg/with/key/%M0_WEP% -F "value1=%M0_MSG_OK%"

GOTO L0_EXIT_OUT


:L0_EXIT_OUT
net use /del %M0_TAG_DRIVE% /y 
ENDLOCAL

EXIT



REM ************************************************************
REM ERROR SUB FUNCTION
REM ************************************************************
:L0_ERROR

echo. >> %M0_LOG%
echo. >> %M0_LOG%
echo. 檢查%M0_TAGDIR_FILE1%異常---昨日目錄[%ex_1T%%y_1T%%z_1T%]不存在, 請確認系統是否正常或今日為交易日 >> %M0_LOG%
echo. 檢查異常,檢查異常,檢查異常,檢查異常,檢查異常,檢查異常,檢查異常@@@@@@ >> %M0_LOG%
echo. $$$$$$$$$$應檢查檔案 %M0_TOTAL_COUNT% , 目前 %M0_CHECK_COUNT% 個正常 >> %M0_LOG%
echo. +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	   >> %M0_LOG%
SET M0_MSG_CHT_STR="2055-2100[***ERROR***]檢查異常-arcsight防火牆備存LOG檢查異常--昨日目錄[%ex_1T%%y_1T%%z_1T%]不存在-%M0_TAGDIR_FILE1%-[FM-%M0_SENDIP%]"
SET M0_MSG_ENG_STR=2055-2100[***ERROR***]Check arcsight FireWall Backup log Yesterday[%ex_1T%%y_1T%%z_1T%] DIRs NOT FIND ERROR-%M0_TAGDIR_FILE1%-[FM-%M0_SENDIP%]
SET M0_MSG_ICON=16
GOTO L0_CHECK_WAIT


REM 將 LOG 寫在前面 ***2019/01/21	
:L0_CHECK_WAIT


rem SET /A M0_Check_TOT_Count=25
rem SET /A M0_Check_Log_Count=0
rem set /A M0_Check_Wait=60
	REM 將 LOG 寫在前面 ***2019/01/21
	IF %M0_Check_Log_Count% GEQ %M0_Check_TOT_Count% GOTO L0_SENDMSG1
	REM 將 LOG 寫在前面 ***2019/01/21
	echo. >> %M0_LOG%
	echo. ++++++++++++++++++++++++++++++++++++++						    >> %M0_LOG%
	echo. 程式第%M0_Check_Log_Count%次,檢查時間 %time%					    >> %M0_LOG%
	echo. 目前檢查次數為 %M0_Check_Log_Count% 比設定檢查次數 %M0_Check_TOT_Count% 小,繼續檢查... >> %M0_LOG%
	echo. ++++++++++++++++++++++++++++++++++++++						    >> %M0_LOG%
	echo. >> %M0_LOG%

	REM 進入下一回圈---Show Screen---------
	cls
	echo. ******************************************
	echo. 進入等候下一次檢查時間中
	echo. 原始迴圈設定值, 	%M0_Check_TOT_Count%
	echo. 目前檢查迴圈計次, %M0_Check_Log_Count%
	echo. 等待%M0_Check_Wait% 秒後,下次將迴圈計次值加 1
	echo. ******************************************
	
	TIMEOUT /T %M0_Check_Wait%
	REM 清除上次留存 LOG, 還原為空檔

	GOTO L0_CHECK_STEP01

	

	