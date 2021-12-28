


# Set wallpape URL to download
$wallpaperURL = "https://cdn.star.nesdis.noaa.gov/GOES16/ABI/FD/GEOCOLOR/5424x5424.jpg" #note 5k image has watermark # DayCloudPhase

# Set download destination (use timestamped filename to retain manually downloaded file)
$wallpaperFile = "C:\Users\" + $env:UserName + "\Dropbox\Photos\wallpaper\wallpaper_5k_$(get-date -f yyyy-MM-dd-HHMMss).jpg"

# Download wallpaper
Invoke-WebRequest -Uri $wallpaperURL -OutFile $wallpaperFile

# Modify wallpaper with R

# Apply wallpaper
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