@ECHO OFF

:: Prompt for user input
@REM set /p WPINPUT="Press 1 for Geocolor, 2 for DayCloudPhase: " || set WPINPUT==1
@REM 
@REM if %WPINPUT%== 2 (
@REM   set WPTYPE=DayCloudPhase
@REM ) else (
@REM   set WPTYPE=GEOCOLOR
@REM ) 
@REM echo Downloading %WPTYPE%

:START
set waitMins=1
echo Press 1 for GeoColor, 2 for DayCloudPhase. Default GeoColor will be selected in %waitMins% minute(s).

:: Calculate Seconds
set /a waitMins=waitMins*60

:: Choices are n and c, default choice is n, timeout = 1800 seconds
choice /c 12 /d 1 /t %waitMins%

:: [N]ow = 1; [C]ancel = 2
goto Label%errorlevel%

:Label1
set WPTYPE=GEOCOLOR

:: Make sure that the process doesn't fall through to Lable2
goto :DL

:Label2 
set WPTYPE=DayCloudPhase


:DL
:: Download Wallpaper.
set "dbdir=C:\Users\%USERNAME%\Nextcloud\"
set "scrdir=%dbdir%3_Programming\GOES16_PowerShell_Wallpaper\Run_Manually/"
set "imgdir=%dbdir%B\Wallpaper\"

set "wpurl=https://cdn.star.nesdis.noaa.gov/GOES16/ABI/FD/%WPTYPE%/1808x1808.jpg"

set "wppath=%imgdir%wallpaper.jpg"%
%

PowerShell.exe -Command %scrdir%"dlwp.ps1" -wpurl %wpurl% -wppath %wppath%

:: Modify Wallpaper
set "blpath=%scrdir%black.png"

"C:\Program Files\R\R-4.1.1\bin\Rscript.exe" %scrdir%img_modulate.R %wppath% %blpath%

:: Set Wallpaper
PowerShell.exe -Command %scrdir%"setwp.ps1" -image %wppath%


:: Set second montior wallpaer black
:: https://forums.powershell.org/t/powershell-to-set-second-monitor-wallpaper/17949

PowerShell.exe -Command "Get-Monitor | Select-Object -Last 2 | Select-Object -First 1 | Set-WallPaper -Path C:\Users\Brandon\Nextcloud\B\Wallpaper\wpoverlay_3c_black.png"