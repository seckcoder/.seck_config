#!/bin/bash
source_script=$PWD/sub.sed
ybuild_script=$PWD/ybuild.sed
process() {
  local file=$1
  if [ "${file##*.}" = "h" ] || [ "${file##*.}" = "cc" ]; then
    echo "processing $file.."
    sed -i -f $source_script $file
  elif [ "${file##*\/}" = "YBUILD" ]; then
    echo "processing $file.."
    sed -i -f $ybuild_script $file
  fi
}

iterate() {
  for file in `ls`; do
    if [ -f "$file" ]; then
      process $PWD/$file
    elif [ -L "$file" ]; then
      echo "escape link: $PWD/$file"
    elif [ -d "$file" ]; then
      cd $file
      iterate 
      cd ..
    fi
  done
}

iterate
