for img in *.[jJ][pP][gG]
do
  ORIEN=$(exif "$img" | grep Orientation | head -n1 | cut -f2 -d'|' | cut -f1 -d' ')
 
  if [ x$ORIEN == "xleft" ] ; then
        echo $img " rotated left";
  	convert $img -rotate -90 $img
  elif [ x$ORIEN == "xright" ] ; then
        echo $img " rotated right";
  	convert $img -rotate 90 $img
  else
        echo $img " is landscape";
  fi
  
done

