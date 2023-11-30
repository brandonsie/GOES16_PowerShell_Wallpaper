
set "dbdir=C:\Users\%USERNAME%\Nextcloud\"
set "scrdir=%dbdir%3_Programming\GOES16_PowerShell_Wallpaper\Run_Manually/"
set "imgdir=%dbdir%B\Wallpaper\"
set "wppath=%imgdir%wallpaper.jpg"

:: Set Wallpaper
PowerShell.exe -Command %scrdir%"setwp.ps1" -image %wppath%



:: Set second montior wallpaer black
:: https://forums.powershell.org/t/powershell-to-set-second-monitor-wallpaper/17949

PowerShell.exe -Command "Get-Monitor | Select-Object -Last 2 | Select-Object -First 1 | Set-WallPaper -Path C:\Users\Brandon\Nextcloud\B\Wallpaper\wpoverlay_3c_black.png"