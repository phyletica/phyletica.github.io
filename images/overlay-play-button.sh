#!/bin/bash

if [ ! $# -eq 1 ]
then
    echo "This script requires one argument: input gif path"
    exit 1
fi

gif_path="$1"

if [ ! -e "$gif_path" ]
then
    echo "ERROR: file "$gif_path" does not exist"
    exit 1
fi

tmp_dir="$(mktemp -d)"
path_prefix="${gif_path%.*}"
out_path="${path_prefix}.png"

convert -coalesce "$gif_path" "${tmp_dir}/tmp-frame-%06d.png"

if [ ! -e "${tmp_dir}/tmp-frame-000000.png" ]
then
    echo "ERROR: problem parsing "$gif_path""
    exit 1
fi

convert "${tmp_dir}/tmp-frame-000000.png" play.png -gravity center -composite "$out_path" 

echo "Overlay PNG successfully output to $out_path."

rm -rf $tmp_dir
