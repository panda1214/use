REM  停用 國安-午班 排程    
REM 指令	schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1310-B-午班-重開機 " [/s computer [/u [domain\]user /p password]] /?   
SET M0_RUNDIR=\Msg\schedule
SET M0_LOG=\Msg\schedule\Log\PM_Schedule_DISable.txt  
D:
CD  %M0_RUNDIR%
            
echo. > %M0_LOG%

REM 資料夾: \國安-午班排程
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1328-2331-B-午班-重開機"  >> %M0_LOG%                             
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1358-B-午班-記得簽到" 	>> %M0_LOG%                              
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1405-請打開喇叭" 	   		>> %M0_LOG%    

schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1410_刪除1400啟動喇叭排程" >> %M0_LOG%                            
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1410-B-午班-OPWEB檢查轉檔" >> %M0_LOG%                              
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1427-B-午班_檢查期貨_STEP_115_8000" >> %M0_LOG%                           
REM schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1430-B-午班-01日-(1)主管更新文件 (2)上個月稽核月抽查資料收集" 	 >> %M0_LOG%                        
REM schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1430-B-午班-M-月15日-(1)大州Log(2)WindowsUpdate(3)法人交易使用者清單(4)RTC(5)主管更新文件" 			 >> %M0_LOG%                          
REM schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1430-B-午班-M-月底(4,5週)(周1,周5) MAIL 最後一週_提醒查核各項報表更換(內湖，敦南機房更換月進出登記表)"  >> %M0_LOG%                            
REM schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1530-W-每周四_一般-備份硬碟資料至隨身硬碟" 					 >> %M0_LOG%  
                                                      
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1600-午班啟動 Speed_Center, 監控交易線路" 					  >> %M0_LOG%                                  
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1605-B-午班-下複委託預約單,手機,AP,WEB_三個複委託平台下預約單"  >> %M0_LOG%                                   
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1631-B-午班-下複委託預約單,手機,AP,WEB_三個複委託平台下預約單"  >> %M0_LOG%                                   
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1642-B-午班_檢查期貨_STEP_125_" 								  >> %M0_LOG% 

schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1700-B-午班-下複委託預約單,手機,AP,WEB_三個複委託平台下預約單"  >> %M0_LOG%                                   
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1730-B-午班-下複委託預約單,手機,AP,WEB_三個複委託平台下預約單"  >> %M0_LOG%                                             
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1805-B-午班_財管系統轉檔通知[正式機.249.83]" 			         >> %M0_LOG%   

                               
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1900-B-午班_檢查大州庫存轉檔_LOG" 					 >> %M0_LOG%                                          
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1941-B-午班-1941-OPWEB_檢查轉檔-成交檔港股人民幣商品"	 >> %M0_LOG%  
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1948-B-午班-檢查-大州證券_2030寄出庫存轉檔MAIL" 		 >> %M0_LOG%                                    
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1950-B-午班-重新登入 複委託AP 確認登入正常" 			 >> %M0_LOG%                                  
REM schtasks /CHANGE /DISABLE /TN "\國安-午班排程\1955-B-午班_計算大州帳務轉檔過程記錄表-1950-2040" 	 >> %M0_LOG%                                  
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\2010-B-午班-檢查複委託美股預約單轉正式單" 			 >> %M0_LOG%                                  
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\2012-B-午班_檢查_10.93.3.40_分戶帳轉檔_MAIL" 			 >> %M0_LOG%                                                              
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\2040-B-午班_檢查股票申購抽籤" 						 >> %M0_LOG%  
                                       
  
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\2100-B-午班-檢查-ArcSlight-Logger" 					 >> %M0_LOG%  
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\2120-B-午班_檢查內湖_RXCS_庫存轉檔" 					 >> %M0_LOG%                                      
REM schtasks /CHANGE /DISABLE /TN "\國安-午班排程\2100-B-午班_每日2100_檢查國證園地法令是否有異動" 	 >> %M0_LOG%                                   
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\2130-B-午班-W-寄出工作週報 (1030)(1515)(2130)" 		 >> %M0_LOG%       
REM schtasks /CHANGE /DISABLE /TN "\國安-午班排程\2140-B-午班_複委託美國股市昨收報價檢查完成通知" 		 >> %M0_LOG% 
                                 
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\2212-B-午班_大州期經紀轉檔國證園地MAIL-Report22" 		 >> %M0_LOG%                                                              
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\2230-午班下班_停止監控程式(Speedcenter_seMonitor)" 	 >> %M0_LOG%   
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\2240-B-午班_複委託美國股市昨收報價檢查完成通知"		 >> %M0_LOG%                                 
REM schtasks /CHANGE /DISABLE /TN "\國安-午班排程\2235-B-午班2251-重開機" 							 >> %M0_LOG%                                           
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\2245-B-午班-整理工作，下班打卡，準備離開" 			 >> %M0_LOG%                                  
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\2255-B-午班-金控人資簽退" 							 >> %M0_LOG%                                                  
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\2335-B-午班-重開機" 						 			 >> %M0_LOG%  
schtasks /CHANGE /DISABLE /TN "\國安-午班排程\2340-B-午班-close_outlook" 						 	 >> %M0_LOG%        


REM schtasks /CHANGE /DISABLE /TN "\國安-午班_鬧鐘_Send_Meaasge\1410-B-午班-OPWEB檢查轉檔" 			 >> %M0_LOG%                               
REM schtasks /CHANGE /DISABLE /TN "\國安-午班_鬧鐘_Send_Meaasge\1415-W-至系統支援部鐵櫃上拿檢查表" 	 >> %M0_LOG%   
REM schtasks /CHANGE /DISABLE /TN "\國安-午班_鬧鐘_Send_Meaasge\1430-W-每周_備份硬碟資料至隨身硬碟"  >> %M0_LOG%                                  
REM schtasks /CHANGE /DISABLE /TN "\國安-午班_鬧鐘_Send_Meaasge\1500-計算中台組統計資料_封包數" 	 >> %M0_LOG%                                  
REM schtasks /CHANGE /DISABLE /TN "\國安-午班_鬧鐘_Send_Meaasge\1920 大州庫存 1900-1916 應已完成" 	 >> %M0_LOG%     



schtasks /query  >> %M0_LOG% 

REM start /max notepad %M0_LOG% 
start /max C:\Windows\System32\taskschd.msc
EXIT