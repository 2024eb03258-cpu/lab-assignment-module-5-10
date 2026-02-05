#!/bin/bash

if [ ! -f input.txt ]; then
    echo "input.txt not found."
    exit 1
fi

# Convert to lowercase, replace non-letters with newlines, remove empty lines
words=$(tr 'A-Z' 'a-z' < input.txt | tr -c 'a-z' '\n' | sed '/^$/d')

# Longest word
longest=$(echo "$words" | awk '{ if (length > max) { max = length; word = $0 } } END { print word }')

# Shortest word
shortest=$(echo "$words" | awk 'NR==1 { min = length; word = $0 } { if (length < min) { min = length; word = $0 } } END { print word }')

# Average word length
avg=$(echo "$words" | awk '{ total += length; count++ } END { if (count>0) print total/count }')

# Total unique words
unique=$(echo "$words" | sort | uniq | wc -l)

echo "Longest word: $longest"
echo "Shortest word: $shortest"
echo "Average word length: $avg"
echo "Total unique words: $unique"
