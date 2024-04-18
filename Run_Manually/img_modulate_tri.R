
`%>%` <- magrittr::`%>%`
args = commandArgs(TRUE)
path1 = args[[1]] %>% as.character
path2 = args[[2]] %>% as.character
# path3 = args[[3]] %>% as.character
path4 = args[[4]] %>% as.character
blackpath = args[[5]] %>% as.character

if(FALSE){
  # for debugging
  `%>%` <- magrittr::`%>%`

  # goes west, goes east, (meteosat), himawari  
  path1 <- "C:/Users/Brandon/Nextcloud/Photos/Wallpaper/wallpaper1.jpg"
  path2 <- "C:/Users/Brandon/Nextcloud/Photos/Wallpaper/wallpaper2.jpg"
  # path3 <- "C:/Users/Brandon/Nextcloud/Photos/Wallpaper/wallpaper3.jpg"
  path4 <- "C:/Users/Brandon/Nextcloud/Photos/Wallpaper/wallpaper4.jpg"
  blackpath <- "C:/Users/Brandon/Nextcloud/3_Programming/GOES16_PowerShell_Wallpaper/Run_Manually/black.png" 
}

img1 <- magick::image_read(path1) # read image
img2 <- magick::image_read(path2) 
# img3 <- magick::image_read(path3) 
img4 <- magick::image_read(path4) 


# resize image 3 (meteosat 800x800) and image 4 (himawari 5500x5500) to 1808
# img3 <- img3 %>% magick::image_resize("1808x1808")
img4 <- img4 %>% magick::image_resize("1808x1808")

img1_info <- magick::image_info(img1) # read path can also be URL
img2_info <- magick::image_info(img2) 
# img3_info <- magick::image_info(img3) 
img4_info <- magick::image_info(img4)


# crop bottom layer
# img4 does not have that bottom layer
out_img1 <- img1 %>% magick::image_crop(geometry = "1808x1775+0") 
out_img2 <- img2 %>% magick::image_crop(geometry = "1808x1775+0") 
# out_img3 <- img3 %>% magick::image_crop(geometry = "1808x1775+0") 
out_img4 <- img4 %>% magick::image_crop(geometry = "1808x1775+0") 

# darken
out_img1 <- out_img1 %>% magick::image_modulate(brightness = 70)
out_img2 <- out_img2 %>% magick::image_modulate(brightness = 70)
# out_img3 <- out_img3 %>% magick::image_modulate(brightness = 70)
out_img4 <- out_img4 %>% magick::image_modulate(brightness = 70)

# crop noaa logo bottom left
black <- magick::image_read(blackpath)
out_img1 <- magick::image_composite(out_img1, black, offset = "+0+1600")
out_img2 <- magick::image_composite(out_img2, black, offset = "+0+1600")
out_img4 <- magick::image_composite(out_img4, black, offset = "+0+1600")

# zoom out. bottom top border
out_img1 <- magick::image_border(out_img1, "black", "0x200")
out_img2 <- magick::image_border(out_img2, "black", "0x200")
# out_img3 <- magick::image_border(out_img3, "black", "0x200")
out_img4 <- magick::image_border(out_img4, "black", "0x200")

if(TRUE){
  # overlay (optionally colorful) background
  out_img1 <- magick::image_border(out_img1, "black", "1029x0")
  out_img2 <- magick::image_border(out_img2, "black", "1029x0")
  # out_img3 <- magick::image_border(out_img3, "black", "1029x0")
  out_img4 <- magick::image_border(out_img4, "black", "1029x0")
  img_o <- magick::image_read("C:/Users/Brandon/Nextcloud/Photos/Wallpaper/wpoverlay_3c_black.png")
  
  img1stack <- magick::image_mosaic(c(out_img1, img_o))
  img2stack <- magick::image_mosaic(c(out_img2, img_o))
  # img3stack <- magick::image_mosaic(c(out_img3, img_o))
  img4stack <- magick::image_mosaic(c(out_img4, img_o))
  
  img1stack <- magick::image_flatten(img1stack)
  img2stack <- magick::image_flatten(img2stack)
  # img3stack <- magick::image_flatten(img3stack)
  img4stack <- magick::image_flatten(img4stack)
  
  out_img1 <- img1stack
  out_img2 <- img2stack
  # out_img3 <- img3stack
  out_img4 <- img4stack
  
}

# trim images tighter

out_img1 <- magick::image_crop(out_img1, "2175x2175", gravity = "center")
out_img2 <- magick::image_crop(out_img2, "2175x2175", gravity = "center")
# out_img3 <- magick::image_crop(out_img3, "2175x2175", gravity = "center")
out_img4 <- magick::image_crop(out_img4, "2175x2175", gravity = "center")


# combine images
out_img_c <- magick::image_append(magick::image_scale(c(out_img1, out_img2, out_img4)))
# out_img_c <- magick::image_append(magick::image_scale(c(out_img1, out_img2, out_img3, out_img4)))

# overlay text timestamp
out_img_c <- out_img_c %>% magick::image_annotate(
  # text = paste0(Sys.time()),
  text = paste0(format(Sys.time(), "%a %Y-%m-%d %X ")),
  # text = paste0("Updated: ", Sys.time()),
  size = 60,
  color = "white", #boxcolor = "pink",
  # degrees = 60,
  # gravity = "southwest",
  # location = "+1650+0",
  gravity = "south",
  # gravity = "southeast",
  # location = "+1650+0", # location goes away from gravity. so for southeast, +x goes left. but for southwest, +x goes right
  font = "sans"
)

# zoom out more
out_img_c <- magick::image_border(out_img_c, "black", "2000x2000")





# write
out_path <- "C:/Users/Brandon/Nextcloud/Photos/Wallpaper/wallpaper.jpg"
magick::image_write(out_img_c, out_path) # write image

