#!/bin/bash

if [ ! $# -eq 1 ]
then
    echo "This script requires one argument: input image path"
    exit 1
fi

image_path="$1"

if [ ! -e "$image_path" ]
then
    echo "ERROR: file "$image_path" does not exist"
    exit 1
fi

out_path="$(dirname "$image_path")/reduced-$(basename "$image_path")"

convert "$image_path" -flatten -strip -resize 512 -quality 80 "$out_path"
