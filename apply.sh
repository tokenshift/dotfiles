#!/bin/bash

git submodule init
git submodule update --recursive

temp_dir=$(mktemp -d)
echo "Working folder: $temp_dir"

cp -r ./home/ "$temp_dir"
find "$temp_dir" -name .git -type f -delete

rsync -avzh "$temp_dir/" "$HOME/"

rm -Rf "$temp_dir"
