#!/bin/bash

src_file=$1
dst_dir=$2
libreoffice --headless -convert-to pdf "$src_file" -outdir "$dst_dir"
