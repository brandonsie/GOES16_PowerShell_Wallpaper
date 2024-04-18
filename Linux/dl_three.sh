#!/bin/bash

# dl_three.sh
# Download GOES-EAST, GOES-WEST, and Himawari recent images, then stitch them together in to a single wallpaper
# Brandon Sie 2024-04-18

# =========================
# Prompt for User Input
# Geocolor vs. DayCloudHase
# Daytime Disk vs. Most Recent
# https://tecadmin.net/prompt-user-input-in-linux-shell-script/
# =========================

	# # disabled geocolor/daycloudphase prompt. just always do geocolor.
	# himarawi has some other options here but not daycloudphase https://rammb.cira.colostate.edu/ramsdis/online/himawari-8_new.asp
	# read -p "1 for Geocolor or 2 for DayCloudPhase? (timeout 3s): " -t 3 imgtype
	# if [ -v $imgtype ]; then 
		# # if variable set to empty string (timeout read prompt) then set default value
		# # https://linuxsimply.com/bash-scripting-tutorial/conditional-statements/if/set-variable-if-not/
		# imgtype=1
	# fi

	# if [ $imgtype = 1 ]; then
		# imgtitle="GEOCOLOR"
	# fi

	# if [ $imgtype = 2 ]; then
		# imgtitle="DayCloudPhase"
	# fi

	# echo "imgtype: " $imgtype ", imgtitle: " $imgtitle
imgtitle="GEOCOLOR"

read -p "1 for daytime disk or 2 for most recent? (timeout 3s): " -t 3 timetype
if [ -v $timetype ]; then 
	timetype=1
fi

if [ $timetype = 1 ]; then
	timetitle="DaytimeDisk"
fi

if [ $timetype = 2 ]; then
	timetitle="MostRecent"
fi

echo "timetype: " $timetype ", timetitle: ", $timetitle




# =========================
# Download Satellite Images
# =========================
# load configuration from config.sh
# https://stackoverflow.com/questions/5228345/how-can-i-reference-a-file-for-variables-using-bash
source config.sh
echo "wp2time" $wp2time
echo "wp4time" $wp4time

# configure URLs to download based on user Input
if [ $timetype = 1 ]; then
	# for GOES, get day number. for himawari, get YYYYMMDD
	year=$(date +"%Y") # get year https://www.cyberciti.biz/faq/bsd-appleosx-bash-ksh-get-current-year-shell-script/
	doy=$(date +%j) # get day of year
	pdoy=$((doy-1)) # get previous day, guaranteeing data is available
	month=$(date +"%m")
	day=$(date +"%d")
	pday=$((day-1)) # get previous day, guaranteed data is available.

	wpurl1="https://cdn.star.nesdis.noaa.gov/GOES18/ABI/FD/$imgtitle/$year$pdoy${wp1time}_GOES18-ABI-FD-GEOCOLOR-$imgresolution.jpg"
	wpurl2="https://cdn.star.nesdis.noaa.gov/GOES16/ABI/FD/$imgtitle/$year$pdoy${wp2time}_GOES16-ABI-FD-GEOCOLOR-$imgresolution.jpg"
	
	# himawari time format is 20240418153000
	#                         YYYYMMDDHHMMSS
	# wpurl4="https://rammb.cira.colostate.edu/ramsdis/online/images/himawari-8/full_disk_ahi_true_color/full_disk_ahi_true_color_20240418153000.jpg
	# https://rammb.cira.colostate.edu/ramsdis/online/images/himawari-8/full_disk_ahi_true_color/full_disk_ahi_true_color_20240418030000.jpg
	# only 800x800 is available?
	 wpurl4="https://rammb.cira.colostate.edu/ramsdis/online/images/himawari-8/full_disk_ahi_true_color/full_disk_ahi_true_color_$year$month$pday$wp4time.jpg"
	
fi

if [ $timetype = 2 ]; then
	wpurl1="https://cdn.star.nesdis.noaa.gov/GOES18/ABI/FD/$imgtitle/1808x1808.jpg"
	wpurl2="https://cdn.star.nesdis.noaa.gov/GOES16/ABI/FD/$imgtitle/1808x1808.jpg"
	wpurl4="https://rammb.cira.colostate.edu/ramsdis/online/images/latest/himawari-8/full_disk_ahi_true_color.jpg"
	# wpurl4="https://rammb.cira.colostate.edu/ramsdis/online/images/latest_hi_res/himawari-8/full_disk_ahi_true_color.jpg"
fi

	echo $wpurl1
	echo $wpurl2
	echo $wpurl4


# Download
curl -o ${imgdir}"wallpaper1.jpg" $wpurl1
curl -o ${imgdir}"wallpaper2.jpg" $wpurl2
curl -o ${imgdir}"wallpaper4.jpg" $wpurl4

# Image process in rammb# sudo apt install r-base-core
Rscript ${scrdir}img_modulate_tri.R "wallpaper1.jpg" "wallpaper2.jpg" "" "wallpaper4.jpg" $scrdir"black.png" "wpoverlay_3c_black.png" "wallpaper.jpg"



#(!) set wallpaper
# https://www.baeldung.com/linux/change-desktop-wallpaper-from-terminal

