#!/bin/sh

# Each subdirectory should contain a shell script
# named 'gen.sh'. This script should take two
# arguments - the name of the markdown source file,
# and the name of the markdown source file with the
# file extension removed.

generate_other_format()
{
    directory="$1"
    if [ ! -d "$directory" ]; then
	echo "Error: '$directory' does not exist; Cannot generate"
	echo "        specified format"
	exit 1
    fi
    
    # Grab a list of all of subdirectories in the current directory
    while read -r current_file; do
	echo "Working on directory '$directory', file '$current_file'"

	# Make sure the 'gen.sh' exists
	if [ ! -f "$directory/gen.sh" ]; then
	    echo " - Oops! '$directory/gen.sh' does not exist. Skipping..."
	    continue
	else
	    echo " - Discovered '$directory/gen.sh"
	fi

	filename="$current_file"
	barename="$(basename "$filename" | sed -r 's/.md$//g')"

	echo " - Running '$directory/gen.sh'"
	echo ""

	(cd "$directory" || exit 1; bash "gen.sh" "../$filename" "$barename" \
	     | genscript_output "$directory/gen.sh")

	echo ""
    done < "chapters.txt"
}

genscript_output()
{
    while read -r line; do
	echo "[$1]  $line"
    done
}

output_format="$1"

# If no options are specified, then generate all
# of the other formats
if [ "x$output_format" == "x" ]; then
    find . -maxdepth 1 -mindepth 1 -type d | \
	while read -r directory; do
	    generate_other_format "$directory"
	done
else
    # Otherwise, only generate the specified format
    generate_other_format "$output_format"
fi
