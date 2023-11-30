@ECHO OFF
set "var=C:\Users\%USERNAME%\Nextcloud\3_Programming\GOES16_PowerShell_Wallpaper\Run_Automatically/SetWP.ps1"

PowerShell.exe -Command %var%

:: Set second montior wallpaer black
:: https://forums.powershell.org/t/powershell-to-set-second-monitor-wallpaper/17949

PowerShell.exe -Command "Get-Monitor | Select-Object -Last 2 | Select-Object -First 1 | Set-WallPaper -Path C:\Users\Brandon\Nextcloud\B\Wallpaper\wpoverlay_3c_black.png"