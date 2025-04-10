if (Test-Path C:\Epicor){
    if (Test-Path C:\Epicor\ERP10-CR){
        Remove-Item -Path C:\Epicor\ERP10-CR -Recurse -Force
        }
    if (Test-Path 'C:\Epicor\Shortcut ERP10-CR'){
        Remove-Item -Path 'C:\Epicor\Shortcut ERP10-CR' -Recurse -Force
        }
    } else {
    New-Item -Path 'C:\Epicor' -ItemType Directory
    }
xcopy "\\ftpcr\master$\Instalasi\1. Standar Medion\64 Bit\26. Epicor\Epicor" C:\Epicor /S /Y