@echo off
net user %username% /domain > d:\showmsg.txt
CALL test.vbs
