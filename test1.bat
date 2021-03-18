D:
CD \msg\use


::msg_str_sec_bye.bat "bat-00_kill_Before_Boot.bat" 900

msg_str_sec_bye.exe 'exe-00_kill_Before_Boot.bat' 5  
timeout /t 20

msg_str_sec_bye.exe "exe-00_kill_Before_Boot.bat" 10
timeout /t 20

msg_str_sec_bye.exe eee-00_kill_Before_Boot.bat 10
timeout /t 20