REM  ���� ��w-���Z�Ƶ{ �Ƶ{    
REM ���O	schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0625-A-���Z_-���}��" [/s computer [/u [domain\]user /p password]] /?   
SET M0_RUNDIR=\Msg\schedule
SET M0_LOG=\Msg\schedule\Log\AM_Schedule_Disable.txt  
D:
CD  %M0_RUNDIR%
            
echo. > %M0_LOG%                    


schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0010_���ҥD��������Ұ�"					>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0628-1631-A-���Z-���}��"					>> %M0_LOG%           
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0658-A-���Z-���Z-�O�oñ��"                >> %M0_LOG% 
           
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0700-�Х��}��z"                          >> %M0_LOG%              
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0703-A-���Z-�ˬd���椤��dashboard"   		>> %M0_LOG%            
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0704-A-���Z-VIP-�ˬd���椤��dashboard"    >> %M0_LOG%                   
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0705-A-���Z_�ˬdCsMonitor"                >> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0705-A-���Z-�^��_LINE�T��_����"           >> %M0_LOG%             
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0708-A-���Z-�ˬd�~�����ɧ@�~(MAIL�κ���)" >> %M0_LOG%            
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0709-A-���Z-�U�w����_�x��(web)���x�U�w����"  >> %M0_LOG%           
       
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0711-A-���Z_����FAP�U��"                             >> %M0_LOG%  
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0712-A-���Z-�U�w����_�ƴ�__�x��(webbk)���x�U�w����"   >> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0713-A-���Z-�U�w����_�x��(web)���x�U�w����"   		>> %M0_LOG% 
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0740-A-���Z-�ˬdAS400-SVRC21-����(�@10�Ӭ���)-1"      >> %M0_LOG%  
       
REM schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0741-A-���Z-�ˬdTpass_Speedy11,12�ɮפ��e"        >> %M0_LOG%             
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0743-A-���Z-OPWEB_�ˬd-�����ˮ�-0500�H������"         >> %M0_LOG%    
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0750-A-���Z-�y���U��"                                 >> %M0_LOG%  

schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0800-�ˬd-[�Ź��T]-cathaysec2����N�X�����q���H"    >> %M0_LOG%  
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0802-A-���Z-OPWEB_�ˬd-Server Monitor"              >> %M0_LOG%  
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0807-A-���Z-�ˬd���椤��dashboard"                  >> %M0_LOG%      

schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0825-1_�ˬd_�Q��}�᧹��_CRM_Word"                  >> %M0_LOG%  
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0825-2_�ˬd_�Q��}�᧹��_CRM"             		  >> %M0_LOG%  
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0828-A-���Z-SGTP�����ˬd-�����ˮ�(Cathay_Cathay123)"      >> %M0_LOG%       
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0833-A-���Z-�ͽ�admin�T���ˬd"   					   		>> %M0_LOG%  
REM D:\Msg\sent.exe
REM /l /v A123274643 @@@_�u�@����0833_@@@�ͽ�Admin�ˬd�A�n�J�ͽú޲z����ADMIN/kway;;hts_�ˬd�T��
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0900-0905 PRM�ʬ�-�d�ݦU�q�l���x�y�q�O�_���`"   				>> %M0_LOG%     
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0900-A-���Z-�ˬd�ҥ�һP�d�R��MIS�Y�ɤ��i-��椽�i"  			>> %M0_LOG%            
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\0930-A-���Z-�ˬddropbox�i�_�n�J"  						    >> %M0_LOG%                   
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\1030-A-���Z-01��-(1)�D�ާ�s��� (2)�W�Ӥ�]�֤��d��Ʀ���" >> %M0_LOG%            
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\1030-A-���Z-M-��15��-(1)�j�{Log(2)WindowsUpdate(3)�k�H����ϥΪ̲M��(4)RTC(5)�D�ާ�s���"    >> %M0_LOG%         
      
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\1530-A-���Z-W-�H�X�u�@�g�� (1030)(1515)(2130)"  >> %M0_LOG%           
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\1530-W-�C�P�|_�@��-�ƥ��w�и�Ʀ��H���w��"  >> %M0_LOG%            
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\1545-A-���Z_(1)�����q��(2)��z�u�@�A�U�Z���d�A�ǳ����}"  >> %M0_LOG%           
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\1558-A-���Z-1600�����H��ñ�h"  >> %M0_LOG%    

schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\1640-A-���Z-���}��" 				>> %M0_LOG%           
schtasks /CHANGE /DISABLE /TN "\��w-���Z�Ƶ{\1650-A-���Z-���}�����{���ݾ�"  	>> %M0_LOG%   

schtasks /query  >> %M0_LOG% 

                   
start /max C:\Windows\System32\taskschd.msc
exit