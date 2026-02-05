# Explanation for Question 3

This script reads student marks from `marks.txt`.  
Each student has three subject marks.  
The script checks:

- If a student failed in **exactly one** subject (marks < 33)
- If a student passed **all** subjects (all marks ≥ 33)

It uses:
- `while read` loop to process each line
- `xargs` to trim spaces
- Arithmetic checks for fail counts
- `awk` to print students who passed all subjects

Finally, it prints:
- List of students who failed exactly one subject
- List of students who passed all subjects
- Count of each category
