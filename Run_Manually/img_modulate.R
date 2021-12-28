
`%>%` <- magrittr::`%>%`
args = commandArgs(TRUE)
path = args[[1]] %>% as.character
blackpath = args[[2]] %>% as.character

if(FALSE){
  # for debugging
  path <- "C:/Users/Brandon/Dropbox/Photos/Wallpaper/wallpaper.jpg"
 blackpath <- "C:/Users/Brandon/Dropbox/3_Programming/GOES16_PowerShell_Wallpaper/Run_Manually/black.png" 
}

img <- magick::image_read(path) # read image

img_info <- magick::image_info(img) # read path can also be URL

# crop bottom layer
out_img <- img %>% magick::image_crop(geometry = "1808x1775+0") 

# darken
out_img <- out_img %>% magick::image_modulate(brightness = 70)

# crop noaa logo
black <- magick::image_read(blackpath)

out_img <- magick::image_composite(out_img, black, offset = "+0+1600")

# zoom out. 
out_img <- magick::image_border(out_img, "black", "0x200")

# overlay colorful background
out_img2 <- magick::image_border(out_img, "black", "1029x0")
img2 <- magick::image_read("C:/Users/Brandon/Dropbox/Photos/Wallpaper/wpoverlay_2.png")
imgstack <- magick::image_mosaic(c(out_img2, img2))
imgstack <- magick::image_flatten(imgstack)
out_img <- imgstack

# overlay text
out_img <- out_img %>% magick::image_annotate(
  text = paste0("Updated: ", Sys.time()), 
  size = 30, 
  color = "white", #boxcolor = "pink",
  # degrees = 60, 
  gravity = "southeast",
  location = "+50+100",
  font = "Times"
) 
# write
magick::image_write(out_img, path) # write image

