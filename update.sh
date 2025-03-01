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

# Copy the CNAME, sitemap.xml, and robots.txt files to the docs directory
cp CNAME docs
cp sitemap.xml docs
cp robots.txt docs
cp index.html docs

# Replace all occurrences of https://sites.google.com/view/cellostudiofremont with / in HTML files
find docs -type f -name '*.html' -exec sed -i '' 's|https://sites.google.com/view/cellostudiofremont/|/|g' {} +
