 wsl --cd /mnt/c/Users/Brandon/Nextcloud/3_Programming/GOES16_PowerShell_Wallpaper/Linux --exec bash dl_three.sh 
 
 
:: refresh wp.bat
 
 
set "dbdir=C:\Users\%USERNAME%\Nextcloud\"
set "scrdir=%dbdir%3_Programming\GOES16_PowerShell_Wallpaper\Run_Manually/"
set "imgdir=%dbdir%Photos\Wallpaper\"
set "wppath=%imgdir%wallpaper.jpg"

:: Set Wallpaper
PowerShell.exe -Command %scrdir%"setwp.ps1" -image %wppath%

timeout 10