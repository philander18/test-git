@echo off
color 0a
echo saya belajar git
sc query remoteregistry | findstr RUNNING
if %ERRORLEVEL% == 1 (goto remote_registry) else (goto cekpowershell)
:remote_registry
cls
sc config remoteregistry start= auto
sc start remoteregistry start= auto
goto powershell
:cekpowershell
cls
reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell /v Executionpolicy
if %ERRORLEVEL% == 1 (goto powershell) else (goto utama)
:powershell
cls
reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell /v Executionpolicy
if %ERRORLEVEL% == 1 (reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell /v Executionpolicy /t reg_sz /d RemoteSigned)
goto utama
:utama
reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v Log
if %ERRORLEVEL% == 0 (reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v Log /f)
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v Log /t reg_sz /d "C:\ProgramData\log\log.vbs"
reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v Inventaris
if %ERRORLEVEL% == 0 (reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v Inventaris /f)
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v Inventaris /t reg_sz /d "C:\ProgramData\log\inventaris.vbs"
if exist "C:\Epicor\" (if exist "C:\Epicor\ERP10-CR\" (RMDIR /S /Q "C:\Epicor\ERP10-CR")) else (MKDIR "C:\Epicor")
xcopy "\\ftpcr\master$\Instalasi\3. Tambahan\Philander\Log" C:\ProgramData /S /Y
xcopy "\\ftpcr\master$\Instalasi\3. Tambahan\Philander\Help" C:\Users\Public\Desktop /S /Y
xcopy "\\ftpcr\master$\Instalasi\3. Tambahan\Philander\SimplySQL" "C:\Program Files\WindowsPowerShell\Modules" /S /Y
xcopy "\\ftpcr\master$\Instalasi\1. Standar Medion\64 Bit\26. Epicor\Epicor" C:\Epicor /S /Y
exit