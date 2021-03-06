# Set wallpaper URL to download
# $wallpaperURL = "https://cdn.star.nesdis.noaa.gov/GOES16/ABI/FD/GEOCOLOR/5424x5424.jpg"

# Conditional based on hour of day.
# Between hour 4 and 16, download daucloudphase. otherwise download geocolor 

# powershell logical https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_logical_operators?view=powershell-7
# powershell current time https://stackoverflow.com/questions/52285389/assign-current-time-to-powershell-variable
# datetime.tostring format https://docs.microsoft.com/en-us/dotnet/api/system.datetime.tostring?view=netcore-3.1
$hour = [datetime]::now.ToString('HH')
$hour = [int]::Parse($hour)
if(($hour -gt 3) -and ($hour -lt 17)){
  $wallpaperURL = "https://cdn.star.nesdis.noaa.gov/GOES16/ABI/FD/GEOCOLOR/1808x1808.jpg"
}else{
  $wallpaperURL = "https://cdn.star.nesdis.noaa.gov/GOES16/ABI/FD/GEOCOLOR/1808x1808.jpg"
  # $wallpaperURL = "https://cdn.star.nesdis.noaa.gov/GOES16/ABI/FD/DayCloudPhase/1808x1808.jpg"
  
}

# method = 1 for single monitor setup. method = 2 for experimental multiple monitor setup
$method = 2

if($method -eq 1){
  # Set download destination (use timestamped filename)
  $wallpaperFile = "C:\Users\" + $env:UserName + "\Dropbox\wallpaper\wallpaper.jpg"
} else{
  # Set download destination (use timestamped filename)
  # C:\Users\Brandon\AppData\Roaming\Microsoft\Windows\Themes # TranscodedWallpaper, Transcoded_001
  $wallpaperFile = "C:\Users\" + $env:UserName + "\AppData\Roaming\Microsoft\Windows\Themes\TranscodedWallpaper"
  $wp2File = "C:\Users\" + $env:UserName + "\AppData\Roaming\Microsoft\Windows\Themes\Transcoded_001"
  $wp2 = "C:\Users\" + $env:UserName + "\Pictures\black.png"
  Copy-Item $wp2 -Destination $wp2File 
}




# Download and apply wallpaper 
# Computer\HKEY_CURRENT_USER\Control Panel\Desktop
Invoke-WebRequest -Uri $wallpaperURL -OutFile $wallpaperFile

if($method -eq 1){
  Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $wallpaperFile
}

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
