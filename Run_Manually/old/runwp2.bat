@ECHO OFF



:: Download Wallpaper.
set "dbdir=C:\Users\%USERNAME%\Nextcloud\"
set "scrdir=%dbdir%3_Programming\GOES16_PowerShell_Wallpaper\Run_Manually/"
set "imgdir=%dbdir%B\Wallpaper\"

set "wpurl=https://cdn.star.nesdis.noaa.gov/GOES16/ABI/FD/DayCloudPhase/1808x1808.jpg"
set "wppath=%imgdir%wallpaper.jpg"


PowerShell.exe -Command %scrdir%"dlwp.ps1" -wpurl %wpurl% -wppath %wppath%

:: Modify Wallpaper
set "blpath=%scrdir%black.png"

"C:\Program Files\R\R-4.1.1\bin\Rscript.exe" %scrdir%img_modulate.R %wppath% %blpath%

:: Set Wallpaper
PowerShell.exe -Command %scrdir%"setwp.ps1" -image %wppath%


:: Set second montior wallpaer black
:: https://forums.powershell.org/t/powershell-to-set-second-monitor-wallpaper/17949

PowerShell.exe -Command "Get-Monitor | Select-Object -Last 2 | Select-Object -First 1 | Set-WallPaper -Path C:\Users\Brandon\Dropbox\B\Wallpaper\wpoverlay_3c_black.png"