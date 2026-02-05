#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <dirA> <dirB>"
    exit 1
fi

dirA="$1"
dirB="$2"

# Check directories exist
if [ ! -d "$dirA" ] || [ ! -d "$dirB" ]; then
    echo "One or both directories do not exist."
    exit 1
fi

echo "Files only in $dirA:"
comm -23 <(ls "$dirA" | sort) <(ls "$dirB" | sort)
echo

echo "Files only in $dirB:"
comm -13 <(ls "$dirA" | sort) <(ls "$dirB" | sort)
echo

echo "Comparing common files:"
common=$(comm -12 <(ls "$dirA" | sort) <(ls "$dirB" | sort))

for file in $common; do
    if cmp -s "$dirA/$file" "$dirB/$file"; then
        echo "$file: MATCH"
    else
        echo "$file: DIFFER"
    fi
done
