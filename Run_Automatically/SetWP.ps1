# Set wallpaper URL to download

# Conditional based on hour of day.
# Between hour 4 and 16, download daycloudphase. otherwise download geocolor 

# powershell logical https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_logical_operators?view=powershell-7
# powershell current time https://stackoverflow.com/questions/52285389/assign-current-time-to-powershell-variable
# datetime.tostring format https://docs.microsoft.com/en-us/dotnet/api/system.datetime.tostring?view=netcore-3.1
$hour = [datetime]::now.ToString('HH')
$hour = [int]::Parse($hour)
if(($hour -gt 3) -and ($hour -lt 17)){
  $wallpaperURL = "https://cdn.star.nesdis.noaa.gov/GOES16/ABI/FD/DayCloudPhase/1808x1808.jpg"
}else{
  $wallpaperURL = "https://cdn.star.nesdis.noaa.gov/GOES16/ABI/FD/GEOCOLOR/1808x1808.jpg"
}

# Set download destination (use timestamped filename)
$wallpaperFile = "C:\Users\" + $env:UserName + "\Dropbox\wallpaper\wallpaper.jpg"


# Download and apply wallpaper
Invoke-WebRequest -Uri $wallpaperURL -OutFile $wallpaperFile
Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $wallpaperFile

rundll32.exe user32.dll, UpdatePerUserSystemParameters
rundll32.exe user32.dll, UpdatePerUserSystemParameters
rundll32.exe user32.dll, UpdatePerUserSystemParameters
rundll32.exe user32.dll, UpdatePerUserSystemParameters
rundll32.exe user32.dll, UpdatePerUserSystemParameters
rundll32.exe user32.dll, UpdatePerUserSystemParameters
rundll32.exe user32.dll, UpdatePerUserSystemParameters
rundll32.exe user32.dll, UpdatePerUserSystemParameters
rundll32.exe user32.dll, UpdatePerUserSystemParameters
rundll32.exe user32.dll, UpdatePerUserSystemParameters
