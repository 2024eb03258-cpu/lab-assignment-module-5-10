#!/bin/bash

if [ ! -f input.txt ]; then
    echo "input.txt not found."
    exit 1
fi

# Convert to lowercase, replace non-letters with newlines, remove empty lines
words=$(tr 'A-Z' 'a-z' < input.txt | tr -c 'a-z' '\n' | sed '/^$/d')

# Clear output files
> vowels.txt
> consonants.txt
> mixed.txt

for w in $words; do
    if echo "$w" | grep -Eq '^[aeiou]+$'; then
        echo "$w" >> vowels.txt
    elif echo "$w" | grep -Eq '^[bcdfghjklmnpqrstvwxyz]+$'; then
        echo "$w" >> consonants.txt
    elif echo "$w" | grep -Eq '^[bcdfghjklmnpqrstvwxyz][a-z]*[aeiou][a-z]*$'; then
        echo "$w" >> mixed.txt
    fi
done
