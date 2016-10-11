# Alternative Formats
This directory contains `convert.sh`, which will convert the contents of the book from
Markdown into a variety of other formats.

Supported formats are

 - LaTeX
 - HTML
 - Man page

## Running the Script

Very simple:

    $ ./convert.sh

This will convert the book into all of the supported formats. These copies are stored
in their respective subdirectories.

## Adding more formats

To add a new format, create a subdirectory with a sensible name
This subdirectory should contain a shell script
named 'gen.sh'. This script should take two
arguments - the name and path to the markdown source file,
and the name of the markdown source file with the
file extension removed (in that order).

`gen.sh` scripts perform all of the work required to convert
the markdown source to whichever format. See `html/gen.sh` for
an example