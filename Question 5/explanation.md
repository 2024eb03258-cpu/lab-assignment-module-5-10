# Explanation for Question 5

This script compares two directories without copying or modifying any files.

It performs three tasks:
1. Lists files that exist only in dirA.
2. Lists files that exist only in dirB.
3. For files with the same name in both directories, it checks whether their contents match.

Tools used:
- `comm` to compare sorted file lists
- `cmp -s` to silently check if two files are identical
- Process substitution `<( )` to feed sorted lists into `comm`

Output:
- Unique files in each directory
- MATCH or DIFFER for common files
