#!/usr/bin/env bash

# Each subdirectory should contain a shell script
# named 'gen.sh'. This script should take two
# arguments - the name of the markdown source file,
# and the name of the markdown source file with the
# file extension removed.

generate_other_formats()
{
    # Grab a list of all of subdirectories in the current directory
    directories=( $(find . -maxdepth 1 -mindepth 1 -type d))

    echo    "==========================="
    echo    " Found output directories:"
    echo    " ${directories[@]}"
    echo -e "===========================\n"

    for i in ${directories[@]}; do
	echo "Working on directory '$i'"

	# Make sure the 'gen.sh' exists
	if [ ! -f "$i/gen.sh" ]; then
	    echo " - Oops! '$i/gen.sh' does not exist. Skipping..."
	    continue
	else
	    echo " - Discovered '$i/gen.sh"
	fi

	filename=$1
	barename=$(echo "$(basename "$filename")" | sed -r 's/.md$//g')

	echo -e " - Running '$i/gen.sh'\n"

	(cd "$i"; bash "gen.sh" "../$filename" "$barename" | genscript_output "$i/gen.sh")

	echo ""
    done
}

genscript_output()
{
    while read -r line; do
	echo "[$1]  $line"
    done
}

generate_other_formats ../chapter1.md
