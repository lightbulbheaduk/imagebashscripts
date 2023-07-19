for img in *.mpo
do
  echo " splitting " $img;

  imgName=${img%.mpo}

  # create temporary left and right images
  exiftool -trailer:all= $img -o $imgName"_L.jpg"
  exiftool $img -mpimage2 -b > $imgName"_R.jpg"

  echo " combining left and right for " $imgName;
  # create stereo image  
  convert $imgName"_L.jpg" $imgName"_R.jpg" +append $imgName"-stereo.jpg"

  # create red-blue image and resize it for anaBuilder (x dimension of 2000 pixels)
  composite -stereo 0 $imgName"_L.jpg" $imgName"_R.jpg" $imgName"-redbluetmp.jpg"

  # extract the dimensions of the image
  pixelX=$(identify $imgName"-redbluetmp.jpg" | sed 's/^.*JPEG \(.*\)x.*$/\1/' | cut -d' ' -f2);
  pixelY=$(identify $imgName"-redbluetmp.jpg" | sed 's/^.*x\(.*\)+.*$/\1/' | cut -d'+' -f1); 
  
  if [ $pixelX -gt $pixelY ] ; then
    tempsize=`echo "scale=4; 2000/$pixelX" | bc`;   
  else
    tempsize=`echo "scale=4; 2000/$pixelY" | bc`;   
  fi
  
  size=`echo "scale=4; $tempsize*100" | bc`;
  
  convert $imgName"-redbluetmp.jpg" -resize $size% $imgName"-redblue.jpg"

  # remove the temporary images
  echo " removing temporary images"
  rm $imgName"_L.jpg"
  rm $imgName"_R.jpg"
  rm $imgName"-redbluetmp.jpg"
done
