
`%>%` <- magrittr::`%>%`
args = commandArgs(TRUE)
path1 = args[[1]] %>% as.character
path2 = args[[2]] %>% as.character
blackpath = args[[3]] %>% as.character

if(FALSE){
  # for debugging
  `%>%` <- magrittr::`%>%`
  
  path1 <- "C:/Users/Brandon/Nextcloud/B/Wallpaper/wallpaper1.jpg"
    path2 <- "C:/Users/Brandon/Nextcloud/B/Wallpaper/wallpaper2.jpg"
 blackpath <- "C:/Users/Brandon/Nextcloud/3_Programming/GOES16_PowerShell_Wallpaper/Run_Manually/black.png" 
}

img1 <- magick::image_read(path1) # read image
img2 <- magick::image_read(path2) # read image

img1_info <- magick::image_info(img1) # read path can also be URL
img2_info <- magick::image_info(img2) # read path can also be URL

# crop bottom layer
out_img1 <- img1 %>% magick::image_crop(geometry = "1808x1775+0") 
out_img2 <- img2 %>% magick::image_crop(geometry = "1808x1775+0") 

# darken
out_img1 <- out_img1 %>% magick::image_modulate(brightness = 70)
out_img2 <- out_img2 %>% magick::image_modulate(brightness = 70)

# crop noaa logo bottom
black <- magick::image_read(blackpath)
out_img1 <- magick::image_composite(out_img1, black, offset = "+0+1600")
out_img2 <- magick::image_composite(out_img2, black, offset = "+0+1600")

# zoom out. bottom top border
out_img1 <- magick::image_border(out_img1, "black", "0x200")
out_img2 <- magick::image_border(out_img2, "black", "0x200")

if(TRUE){
  # overlay (optionally colorful) background
  out_img1 <- magick::image_border(out_img1, "black", "1029x0")
  out_img2 <- magick::image_border(out_img2, "black", "1029x0")
  img_o <- magick::image_read("C:/Users/Brandon/Nextcloud/B/Wallpaper/wpoverlay_3c_black.png")
  
  img1stack <- magick::image_mosaic(c(out_img1, img_o))
  img2stack <- magick::image_mosaic(c(out_img2, img_o))
  
  img1stack <- magick::image_flatten(img1stack)
  img2stack <- magick::image_flatten(img2stack)
  
  out_img1 <- img1stack
  out_img2 <- img2stack
  
}




# combine two images
out_img_c <- magick::image_append(magick::image_scale(c(out_img1, out_img2)))

# overlay text timestamp
out_img_c <- out_img_c %>% magick::image_annotate(
  text = paste0(Sys.time()),
  # text = paste0("Updated: ", Sys.time()),
  size = 60,
  color = "white", #boxcolor = "pink",
  # degrees = 60,
  # gravity = "southwest",
  # location = "+1650+0",
  gravity = "southeast",
  location = "+1650+0", # location goes away from gravity. so for southeast, +x goes left. but for southwest, +x goes right
  font = "sans"
)

# zoom out more
out_img_c <- magick::image_border(out_img_c, "black", "2000x2000")





# write
out_path <- "C:/Users/Brandon/Nextcloud/B/Wallpaper/wallpaper.jpg"
magick::image_write(out_img_c, out_path) # write image

