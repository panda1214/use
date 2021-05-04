REM  停用 國安-電券早班 排程    
REM 指令	schtasks /CHANGE /DISABLE /TN "\國安-電券早班\0625-A-早班_-重開機" [/s computer [/u [domain\]user /p password]] /?   
SET M0_RUNDIR=\Msg\schedule
SET M0_LOG=\Msg\schedule\Log\AM_Schedule_Disable.txt  
D:
CD  %M0_RUNDIR%
            
echo. > %M0_LOG%                                
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0010_重啟主機後相關啟動"					>> %M0_LOG% 
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0628-1631-A-早班-重開機"					>> %M0_LOG%           
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0658-A-早班-早班-記得簽到"                >> %M0_LOG% 
           
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0700-請打開喇叭"                          >> %M0_LOG%              
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0703-A-早班-檢查接單中心dashboard"   		>> %M0_LOG%            
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0704-A-早班-VIP-檢查接單中心dashboard"    >> %M0_LOG%                   
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0705-A-早班_檢查CsMonitor"                >> %M0_LOG% 
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0705-A-早班-回覆_LINE訊息_收到"           >> %M0_LOG%             
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0708-A-早班-檢查外期轉檔作業(MAIL或網頁)" >> %M0_LOG%            
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0709-A-早班-下預約單_官網(web)平台下預約單"  >> %M0_LOG%           
       
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0711-A-早班_樹精靈AP下單"                             >> %M0_LOG%  
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0712-A-早班-下預約單_備援__官網(webbk)平台下預約單"   >> %M0_LOG% 
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0713-A-早班-下預約單_官網(web)平台下預約單"   		>> %M0_LOG% 
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0740-A-早班-檢查AS400-SVRC21-轉檔(共10個紅色)-1"      >> %M0_LOG%  
       
REM schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0741-A-早班-檢查Tpass_Speedy11,12檔案內容"        >> %M0_LOG%             
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0743-A-早班-OPWEB_檢查-轉檔檢核-0500以後轉檔"         >> %M0_LOG%    
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0750-A-早班-語音下單"                                 >> %M0_LOG%  

schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0800-檢查-[嘉實資訊]-cathaysec2基金代碼對應通知信"    >> %M0_LOG%  
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0802-A-早班-OPWEB_檢查-Server Monitor"              >> %M0_LOG%  
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0807-A-早班-檢查接單中心dashboard"                  >> %M0_LOG%      

schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0825-1_檢查_昨日開戶完成_CRM_Word"                  >> %M0_LOG%  
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0825-2_檢查_昨日開戶完成_CRM"             		  >> %M0_LOG%  
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0828-A-早班-SGTP網頁檢查-轉檔檢核(Cathay_Cathay123)"      >> %M0_LOG%       
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0833-A-早班-凱衛admin訊息檢查"   					   		>> %M0_LOG%  
REM D:\Msg\sent.exe
REM /l /v A123274643 @@@_工作提醒0833_@@@凱衛Admin檢查，登入凱衛管理介面ADMIN/kway;;hts_檢查訊息
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0900-0905 PRM監看-查看各電子平台流量是否異常"   				>> %M0_LOG%     
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0900-A-早班-檢查證交所與櫃買的MIS即時公告-緊急公告"  			>> %M0_LOG%            
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\0930-A-早班-檢查dropbox可否登入"  						    >> %M0_LOG%                   
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\1030-A-早班-01日-(1)主管更新文件 (2)上個月稽核月抽查資料收集" >> %M0_LOG%            
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\1030-A-早班-M-月15日-(1)大州Log(2)WindowsUpdate(3)法人交易使用者清單(4)RTC(5)主管更新文件"    >> %M0_LOG%         
      
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\1530-A-早班-W-寄出工作週報 (1030)(1515)(2130)"  >> %M0_LOG%           
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\1530-W-每周四_一般-備份硬碟資料至隨身硬碟"  >> %M0_LOG%            
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\1545-A-早班_(1)關閉電源(2)整理工作，下班打卡，準備離開"  >> %M0_LOG%           
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\1558-A-早班-1600金控人資簽退"  >> %M0_LOG%    

schtasks /CHANGE /ENABLE /TN "\國安-早班排程\1640-A-早班-重開機" 				>> %M0_LOG%           
schtasks /CHANGE /ENABLE /TN "\國安-早班排程\1650-A-早班-重開機後砍程式待機"  	>> %M0_LOG%   

schtasks /query  >> %M0_LOG% 

                   
start /max C:\Windows\System32\taskschd.msc
exit  

schtasks /query  >> %M0_LOG% 

                   
start /max C:\Windows\System32\taskschd.msc
exit