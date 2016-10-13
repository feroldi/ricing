#!/bin/sh

# Each subdirectory should contain a shell script
# named 'gen.sh'. This script should take two
# arguments - the name of the markdown source file,
# and the name of the markdown source file with the
# file extension removed.

raise_error()
{
    printf '%s: %s' "$(basename $0): $1"
    exit 1
}

gen_format()
{
    DIR="$1"
    test -d "$DIR" || {
        raise_error "$DIR does not exist; cannot generate"
                    " specified format"
    }
    
    # grab a list of all of subdirectories in the current directory
    while read -r FILE; do
        printf '%s\n' "$DIR/$FILE"

        test ! -f "$directory/gen.sh" && {
            printf '%s\n' "$DIR/gen.sh does not exist; skipping..."
            continue
        }

        BASE="$(basename -s .md "$FILE")"

        printf '%s\n' "./$DIR/gen.sh"

        (
            cd "$DIR" || exit 1;
            ./gen.sh "../$FILE" "$BASE" | genscript_output "$DIR/gen.sh"
        )
    done < "chapters.txt"
}

genscript_output()
{
    while read -r LINE; do
        printf '%s\n' "[$(printf '%s' "$1" | tr a-z A-Z)] $LINE"
    done
}

while test $# -qt 0; do
    case "$1" in
        -h|--help)
            usage
            ;;
        *)
            gen_format "$1"
            shift 1
            ;;
    esac
done

