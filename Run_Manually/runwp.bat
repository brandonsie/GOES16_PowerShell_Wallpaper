@ECHO OFF

:: Prompt for user input
set /p WPINPUT="Press 1 for Geocolor, 2 for DayCloudPhase: " || set WPINPUT==1

if %WPINPUT%== 2 (
  set WPTYPE=DayCloudPhase
) else (
  set WPTYPE=GEOCOLOR
) 
echo Downloading %WPTYPE%


:: timeout 10000

:: Download Wallpaper.
set "dbdir=C:\Users\%USERNAME%\Dropbox\"
set "scrdir=%dbdir%3_Programming\GOES16_PowerShell_Wallpaper\Run_Manually/"
set "imgdir=%dbdir%Photos\Wallpaper\"

set "wpurl=https://cdn.star.nesdis.noaa.gov/GOES16/ABI/FD/%WPTYPE%/1808x1808.jpg"

set "wppath=%imgdir%wallpaper.jpg"%
%

PowerShell.exe -Command %scrdir%"dlwp.ps1" -wpurl %wpurl% -wppath %wppath%

:: Modify Wallpaper
set "blpath=%scrdir%black.png"

"C:\Program Files\R\R-4.1.1\bin\Rscript.exe" %scrdir%img_modulate.R %wppath% %blpath%

:: Set Wallpaper
PowerShell.exe -Command %scrdir%"setwp.ps1" -image %wppath%

