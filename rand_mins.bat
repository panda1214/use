@echo off

D:
CD \Msg\Use



REM start Switch_Desk1.exe
REM ���ͤ@�Ӱ϶����ü� (1-15) (1-15 ��)
set /a "_rand=%random% %% 15"
REM change secs1
set /a M9_rnd=_rand*49
echo. %_rand%
echo. %M9_rnd%

Timeout /t %M9_rnd%



REM �p��b�R�O��޼ƤU���ͤ@�Ӱ϶����ü�
REM Windows Command Shell ���U���ؤ@�Ӷü��ܼ� %random%
REM �����ͪ��ƭȤ��� 0~32767 �����C
REM �n�N�������b�@�w�϶��A�H�K�{�����ΡI
REM �H�U�妸�ɡA�ϥήɡA���P�{���T�ӰѼ�
