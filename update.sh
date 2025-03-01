#!/bin/sh

# Remove the docs and sites.google.com directories
rm -rf docs
rm -rf sites.google.com

# Download the website
wget -r https://sites.google.com/view/cellostudiofremont

# Traverse all directories recursively and rename files to .html
find sites.google.com/view/cellostudiofremont -type f ! -name '*.html' | while read -r file; do
  mv "$file" "${file}.html"
done

# Move the downloaded website to the docs directory
mv sites.google.com/view/cellostudiofremont docs

# Remove the sites.google.com directory
rm -rf sites.google.com
