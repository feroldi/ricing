#!/bin/sh

# Each subdirectory should contain a shell script
# named 'gen.sh'. This script should take two
# arguments - the name of the markdown source file,
# and the name of the markdown source file with the
# file extension removed.

generate_other_formats()
{
    directories="$(find . -maxdepth 1 -mindepth 1 -type d)"
    echo "==========================="
    echo " Found output directories:"
    echo " $directories"
    echo "==========================="
    echo ""

    # Grab a list of all of subdirectories in the current directory
    for i in $directories; do
	while read -r current_file; do
	    echo "Working on directory '$i', file '$current_file'"

	    # Make sure the 'gen.sh' exists
	    if [ ! -f "$i/gen.sh" ]; then
		echo " - Oops! '$i/gen.sh' does not exist. Skipping..."
		continue
	    else
		echo " - Discovered '$i/gen.sh"
	    fi

	    filename="$current_file"
	    barename="$(basename "$filename" | sed -r 's/.md$//g')"

	    echo " - Running '$i/gen.sh'"
	    echo ""

	    (cd "$i" || exit 1; bash "gen.sh" "../$filename" "$barename" | genscript_output "$i/gen.sh")

	    echo ""
	done < "chapters.txt"
    done
}

genscript_output()
{
    while read -r line; do
	echo "[$1]  $line"
    done
}

generate_other_formats
