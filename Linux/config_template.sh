#!/bin/bash
# configure data paths here. read by dl_three.sh


dbdir="/home/brandon/Documents/Nextcloud/"
scrdir=$dbdir"3_Programming/GOES16_Powershell_Wallpaper/Linux/"
imgdir=$dbir"Photos/Wallpaper/"


imgresolution="1808x1808" # image resolution to download. matches file name in goes archive
# himawari i'm only downloading 800x800

# timestamp to download for each satellite.
# wp1 goes18 https://cdn.star.nesdis.noaa.gov/GOES18/ABI/FD/GEOCOLOR/
# wp2: goes16: https://cdn.star.nesdis.noaa.gov/GOES16/ABI/FD/GEOCOLOR/
# wp4: himawari https://rammb.cira.colostate.edu/ramsdis/online/archive_hi_res.asp?data_folder=himawari-8/full_disk_ahi_true_color&width=800&height=800
wp1time="2100"
wp2time="1710"
wp4time="030000"


