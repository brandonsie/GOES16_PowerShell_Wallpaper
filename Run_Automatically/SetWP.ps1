# Set wallpaper URL to download
# $wallpaperURL = "https://cdn.star.nesdis.noaa.gov/GOES16/ABI/FD/GEOCOLOR/5424x5424.jpg"

$wallpaperURL = "https://cdn.star.nesdis.noaa.gov/GOES16/ABI/FD/GEOCOLOR/1808x1808.jpg"

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
