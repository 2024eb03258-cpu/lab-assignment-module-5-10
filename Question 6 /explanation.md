# Explanation for Question 6

This script analyzes the text in `input.txt` and calculates:

- The longest word
- The shortest word
- The average word length
- The total number of unique words

Processing steps:
1. Convert all text to lowercase using `tr`.
2. Replace all non-letter characters with newlines to isolate words.
3. Remove empty lines.
4. Use `awk` to compute longest, shortest, and average word length.
5. Use `sort | uniq | wc -l` to count unique words.

The script outputs all four metrics clearly.
