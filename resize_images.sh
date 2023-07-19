#! /bin/bash

echo "Please enter the larger dimension in pixels: "
read larger_dimension

mkdir resized

x=$larger_dimension
for img in *.[jJ][pP][gG]
do 
  pixelX=$(identify $img | sed 's/^.*JPEG \(.*\)x.*$/\1/' | cut -d' ' -f2);
  pixelY=$(identify $img | sed 's/^.*x\(.*\)+.*$/\1/' | cut -d'+' -f1); 
  
  if [ $pixelX -gt $pixelY ] ; then
    # full size pics are all about setting the larger dimension to 500px
    tempsize=`echo "scale=4; $x/$pixelX" | bc`;   
  else
    # full size pics are all about setting the larger dimension to 500px
    tempsize=`echo "scale=4; $x/$pixelY" | bc`;   
  fi
  
  size=`echo "scale=4; $tempsize*100" | bc`;
  
  echo " resizing image " $img;
  
  convert $img -resize $size% resized/$img
  
done
