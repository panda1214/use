REM  ���� ��w-�ȯZ �Ƶ{    
REM ���O	schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1310-B-�ȯZ-���}�� " [/s computer [/u [domain\]user /p password]] /?   
SET M0_RUNDIR=\Msg\schedule
SET M0_LOG=\Msg\schedule\Log\PM_Schedule_DISable.txt  
D:
CD  %M0_RUNDIR%
            
echo. > %M0_LOG%

REM ��Ƨ�: \��w-�ȯZ�Ƶ{
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1328-2331-B-�ȯZ-���}��"  >> %M0_LOG%                             
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1358-B-�ȯZ-�O�oñ��" 	>> %M0_LOG%                              
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1405-�Х��}��z" 	   		>> %M0_LOG%    

schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1410_�R��1400�Ұʳ�z�Ƶ{" >> %M0_LOG%                            
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1410-B-�ȯZ-OPWEB�ˬd����" >> %M0_LOG%                              
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1427-B-�ȯZ_�ˬd���f_STEP_115_8000" >> %M0_LOG%                           
REM schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1430-B-�ȯZ-01��-(1)�D�ާ�s��� (2)�W�Ӥ�]�֤��d��Ʀ���" 	 >> %M0_LOG%                        
REM schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1430-B-�ȯZ-M-��15��-(1)�j�{Log(2)WindowsUpdate(3)�k�H����ϥΪ̲M��(4)RTC(5)�D�ާ�s���" 			 >> %M0_LOG%                          
REM schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1430-B-�ȯZ-M-�멳(4,5�g)(�P1,�P5) MAIL �̫�@�g_�����d�֦U�������(����A���n���Ч󴫤�i�X�n�O��)"  >> %M0_LOG%                            
REM schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1530-W-�C�P�|_�@��-�ƥ��w�и�Ʀ��H���w��" 					 >> %M0_LOG%  
                                                      
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1600-�ȯZ�Ұ� Speed_Center, �ʱ�����u��" 					  >> %M0_LOG%                                  
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1605-B-�ȯZ-�U�Ʃe�U�w����,���,AP,WEB_�T�ӽƩe�U���x�U�w����"  >> %M0_LOG%                                   
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1631-B-�ȯZ-�U�Ʃe�U�w����,���,AP,WEB_�T�ӽƩe�U���x�U�w����"  >> %M0_LOG%                                   
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1642-B-�ȯZ_�ˬd���f_STEP_125_" 								  >> %M0_LOG% 

schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1700-B-�ȯZ-�U�Ʃe�U�w����,���,AP,WEB_�T�ӽƩe�U���x�U�w����"  >> %M0_LOG%                                   
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1730-B-�ȯZ-�U�Ʃe�U�w����,���,AP,WEB_�T�ӽƩe�U���x�U�w����"  >> %M0_LOG%                                             
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1805-B-�ȯZ_�]�ިt�����ɳq��[������.249.83]" 			         >> %M0_LOG%   

                               
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1900-B-�ȯZ_�ˬd�j�{�w�s����_LOG" 					 >> %M0_LOG%                                          
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1941-B-�ȯZ-1941-OPWEB_�ˬd����-�����ɴ�ѤH�����ӫ~"	 >> %M0_LOG%  
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1948-B-�ȯZ-�ˬd-�j�{�Ҩ�_2030�H�X�w�s����MAIL" 		 >> %M0_LOG%                                    
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1950-B-�ȯZ-���s�n�J �Ʃe�UAP �T�{�n�J���`" 			 >> %M0_LOG%                                  
REM schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\1955-B-�ȯZ_�p��j�{�b�����ɹL�{�O����-1950-2040" 	 >> %M0_LOG%                                  
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\2010-B-�ȯZ-�ˬd�Ʃe�U���ѹw�����ॿ����" 			 >> %M0_LOG%                                  
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\2012-B-�ȯZ_�ˬd_10.93.3.40_����b����_MAIL" 			 >> %M0_LOG%                                                              
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\2040-B-�ȯZ_�ˬd�Ѳ����ʩ���" 						 >> %M0_LOG%  
                                       
  
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\2100-B-�ȯZ-�ˬd-ArcSlight-Logger" 					 >> %M0_LOG%  
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\2120-B-�ȯZ_�ˬd����_RXCS_�w�s����" 					 >> %M0_LOG%                                      
REM schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\2100-B-�ȯZ_�C��2100_�ˬd���Ҷ�a�k�O�O�_������" 	 >> %M0_LOG%                                   
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\2130-B-�ȯZ-W-�H�X�u�@�g�� (1030)(1515)(2130)" 		 >> %M0_LOG%       
REM schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\2140-B-�ȯZ_�Ʃe�U����ѥ��Q�������ˬd�����q��" 		 >> %M0_LOG% 
                                 
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\2212-B-�ȯZ_�j�{���g�����ɰ��Ҷ�aMAIL-Report22" 		 >> %M0_LOG%                                                              
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\2230-�ȯZ�U�Z_����ʱ��{��(Speedcenter_seMonitor)" 	 >> %M0_LOG%   
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\2240-B-�ȯZ_�Ʃe�U����ѥ��Q�������ˬd�����q��"		 >> %M0_LOG%                                 
REM schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\2235-B-�ȯZ2251-���}��" 							 >> %M0_LOG%                                           
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\2245-B-�ȯZ-��z�u�@�A�U�Z���d�A�ǳ����}" 			 >> %M0_LOG%                                  
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\2255-B-�ȯZ-�����H��ñ�h" 							 >> %M0_LOG%                                                  
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\2335-B-�ȯZ-���}��" 						 			 >> %M0_LOG%  
schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ�Ƶ{\2340-B-�ȯZ-close_outlook" 						 	 >> %M0_LOG%        


REM schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ_�x��_Send_Meaasge\1410-B-�ȯZ-OPWEB�ˬd����" 			 >> %M0_LOG%                               
REM schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ_�x��_Send_Meaasge\1415-W-�ܨt�Τ䴩���K�d�W���ˬd��" 	 >> %M0_LOG%   
REM schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ_�x��_Send_Meaasge\1430-W-�C�P_�ƥ��w�и�Ʀ��H���w��"  >> %M0_LOG%                                  
REM schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ_�x��_Send_Meaasge\1500-�p�⤤�x�ղέp���_�ʥ]��" 	 >> %M0_LOG%                                  
REM schtasks /CHANGE /DISABLE /TN "\��w-�ȯZ_�x��_Send_Meaasge\1920 �j�{�w�s 1900-1916 ���w����" 	 >> %M0_LOG%     



schtasks /query  >> %M0_LOG% 

REM start /max notepad %M0_LOG% 
start /max C:\Windows\System32\taskschd.msc
EXIT