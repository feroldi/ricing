#!/bin/bash

set -e

input_file="$1"
barename="$2"
output_file="$barename.html"

echo "Input:  $input_file"
echo "Output: $output_file"

if [ "x$(which pandoc)" == "xpandoc not found" ]; then
    echo "Pandoc is not installed; Cannot generate HTML"
    exit 1
fi

pandoc --version | head -n 1

# Here we go...
echo "Here we go..."

# Convert the markdown to html
pandoc -s -f "markdown" -t "html" "$input_file" > "$output_file"

[ "$?" -eq "0" ] && echo "Generated '$output_file'" || echo "Failed to generate '$output_file'"
