@echo off

D:
CD \Msg\Use



REM start Switch_Desk1.exe
REM 產生一個區間的亂數 (1-15) (1-15 分)
set /a "_rand=%random% %% 15"
REM change secs1
set /a M9_rnd=_rand*49
echo. %_rand%
echo. %M9_rnd%

Timeout /t %M9_rnd%



REM 如何在命令行引數下產生一個區間的亂數
REM Windows Command Shell 底下內建一個亂數變數 %random%
REM 它產生的數值介於 0~32767 之間。
REM 要將它局限在一定區間，以便程式應用！
REM 以下批次檔，使用時，給與程式三個參數
