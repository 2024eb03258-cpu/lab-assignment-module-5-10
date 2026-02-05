# Explanation for Question 4

This script processes the file `emails.txt` and separates valid and invalid email addresses.

A valid email must follow this format:
letters_or_digits @ letters .com

The script uses:
- `grep -E` to extract valid emails using a regular expression
- `grep -Ev` to extract invalid emails (everything not matching the valid pattern)
- `sort` and `uniq` to remove duplicate valid emails
- Redirection (`>`) to write results into `valid.txt` and `invalid.txt`

Output files:
- `valid.txt` contains unique valid email addresses
- `invalid.txt` contains all invalid email addresses

