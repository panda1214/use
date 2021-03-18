::@echo off
setlocal enableDelayedExpansion

REM::  程式自動設定為 Administrator 權限**
GOTO L0_GET_ADMIN
REM::  ************************************

:L0_END_GET_ADMIN
:L0_MAIN_START_001

::REM 欲查詢 
::REM Change boot From Win7
::REM bcdedit /default  {current}

::REM Change boot From Win_10
bcdedit /default {676e0dcc-7abd-11ea-8d1e-b1ab3c2d891c}

::timeout /tt 36000
exit


EXIT
:L0_GET_ADMIN
::@echo off
REM  程式自動設定為 Administrator 權限
REM  https://dotblogs.com.tw/c5todo/2016/08/21/155005
REM
CLS
ECHO.
ECHO =============================
ECHO Running Admin Shell
ECHO =============================

:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
ECHO.
ECHO **************************************
ECHO Invoking UAC for Privilege Escalation
ECHO **************************************

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

GOTO L0_END_GET_ADMIN

::REM use admin cmd box 		bcdedit > d:\bcdedit.txt
::REM Windows 開機管理程式
::REM --------------------
::REM identifier              {bootmgr}
::REM device                  partition=\Device\HarddiskVolume8
::REM path                    \EFI\Microsoft\Boot\bootmgfw.efi
::REM description             Windows Boot Manager
::REM locale                  zh-TW
::REM inherit                 {globalsettings}
::REM default                 {default}
::REM resumeobject            {676e0dcb-7abd-11ea-8d1e-b1ab3c2d891c}
::REM displayorder            {current}
                        {default}
::REM toolsdisplayorder       {memdiag}
::REM timeout                 7

::REM Windows 開機載入器
::REM -------------------
::REM identifier              {current}
::REM device                  partition=C:
::REM path                    \Windows\system32\winload.efi
::REM description             Windows 10
::REM locale                  zh-TW
::REM inherit                 {bootloadersettings}
::REM recoverysequence        {676e0dd9-7abd-11ea-8d1e-b1ab3c2d891c}
::REM displaymessageoverride  Recovery
::REM recoveryenabled         Yes
::REM isolatedcontext         Yes
::REM allowedinmemorysettings 0x15000075
::REM osdevice                partition=C:
::REM systemroot              \Windows
::REM resumeobject            {676e0dcb-7abd-11ea-8d1e-b1ab3c2d891c}
::REM nx                      OptIn
::REM bootmenupolicy          Standard
::REM hypervisorlaunchtype    Off

::REM Windows 開機載入器
::REM -------------------
::REM identifier              {default}
::REM device                  partition=G:
::REM path                    \Windows\system32\winload.efi
::REM description             Win 7_pro
::REM locale                  zh-TW
::REM osdevice                partition=G:
::REM systemroot              \Windows
::REM resumeobject            {5548bddc-fc82-11ea-8763-806e6f6e6963}
::REM bootmenupolicy          Standard
