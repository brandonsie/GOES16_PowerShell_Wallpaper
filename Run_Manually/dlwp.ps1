param(
    [Parameter(Mandatory=$True, Position=0, ValueFromPipeline=$false)]
    [System.String]
    $wpurl,

    [Parameter(Mandatory=$True, Position=1, ValueFromPipeline=$false)]
    [System.String]
    $wppath
)

echo $wpurl
echo $wppath
# Download wallpaper
Invoke-WebRequest -Uri $wpurl -OutFile $wppath