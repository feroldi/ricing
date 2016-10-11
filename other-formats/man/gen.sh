#!/bin/sh

set -e

input_file="$1"
barename="$2"
output_file="$barename.7"

echo "Input:  $input_file"
echo "Output: $output_file"

if [ "x$(which pandoc)" == "xpandoc not found" ]; then
    echo "Pandoc is not installed; Cannot generate Man page"
    exit 1
fi

pandoc --version | head -n 1

# Here we go...
echo "Here we go..."

# Pandoc won't create a full LaTex document by itself.
# We have to provide the boilerplate manually.
pandoc -s -f "markdown" -t "man" "$input_file" > "$output_file"

[ "$?" -eq "0" ] && echo "Generated '$output_file'" || echo "Failed to generate '$output_file'"
