# Set wallpape URL to download
$wallpaperURL = "https://cdn.star.nesdis.noaa.gov/GOES16/ABI/FD/GEOCOLOR/10848x10848.jpg" #10k doesn't have watermark

# Set download destination (use timestamped filename to retain manually downloaded file)
$wallpaperFile = "C:\Users\brand\Dropbox\wallpaper\wallpaper_10k_$(get-date -f yyyy-MM-dd-HHMMss).jpg"

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