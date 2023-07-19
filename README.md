# imagebashscripts
A selection of bash scripts for image manipulation in a linux environment, written many years ago (early 2000s!) for processing images in bulk

## rename_images.sh
Provides a prompt for a file prefix, then upon receipt, iterates over all ".jpg" files in a directory, renaming them to be the prefix, followed by an incrementing number

## resize_images.sh (requires ImageMagick (www.imagemagick.org) to be installed) 
Provides a prompt for the largest dimension of an image, then upon receipt, iterates over all ".jpg" files in a directory.  It uses the ImageMagick "identify" function to read the X and Y dimensions of each image to work out whether the image is portrait or landscape, then resizes appropriately, so the longest edge is now the length specified in the input

## rotate_images.sh (requires ImageMagick (www.imagemagick.org) to be installed)
Iterates over all ".jpg" files in a directory, using the Orientation field of the exif data to work out whether it is a portrait shot, and which way round it is.  Uses the ImageMagick "convert" function to then rotate the portrait image appropriately so that is displays in a gallery correctly

## split_mpo.sh (requires ImageMagick (www.imagemagick.org) and exiftool (www.exiftool.org) to be installed)
Iterates over all ".mpo" files in a directory (generally produced by 3d cameras), uses exiftool to split out the right and left images, then uses ImageMagick "convert" function to create a stereoscopic image.  It then uses ImageMagick "composite" function to create a composite image of the right and left images, resizing that picture to 2000 pixels on its longest length to be fed into AnaBuilder (http://anabuilder.free.fr/welcomeEN.html) which allows manipulation of 3d photos
