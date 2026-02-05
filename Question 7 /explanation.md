# Explanation for Question 7

The script `patterns.sh` reads words from `input.txt` and classifies them into three categories:

### 1. Words containing only vowels → `vowels.txt`
A word is placed in this file if every character is a vowel (`a, e, i, o, u`).  
Case is ignored because the script converts all text to lowercase.

Pattern used:

### 2. Words containing only consonants → `consonants.txt`
A word is placed in this file if every character is a consonant.  
All non-letter characters are removed before checking.

Pattern used:

### 3. Words containing both vowels and consonants but starting with a consonant → `mixed.txt`
A word is placed here if:
- it starts with a consonant, and  
- It contains at least one vowel somewhere in the word.

Pattern used:

### Processing Steps
1. Convert all text to lowercase using `tr`.
2. Replace all non-letter characters with newlines to isolate words.
3. Remove empty lines.
4. For each word, apply the three regular expression checks in order.
5. Write each matching word into its corresponding output file.

This ensures that all words from `input.txt` are categorized correctly based on vowel and consonant patterns.
