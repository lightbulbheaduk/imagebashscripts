#! /bin/bash

echo "Please enter the file name prefix: "
read file_name

y=$file_name
x=1

for fname in *.[jJ][pP][gG]
do
  if [ $x -lt '10' ] ; then
     z="00"
  elif [ $x -lt '100' ] ; then
     z="0"
  else
     z=""
  fi

  mv $fname `printf "$y$z$x.jpg"`

  x=$(($x+1))
done
