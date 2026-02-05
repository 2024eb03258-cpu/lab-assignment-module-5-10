#!/bin/bash

# Check if emails.txt exists
if [ ! -f emails.txt ]; then
    echo "emails.txt not found."
    exit 1
fi

# Extract valid emails: letters/digits before @, letters after @, ending with .com
grep -E '^[A-Za-z0-9]+@[A-Za-z]+\.com$' emails.txt | sort | uniq > valid.txt

# Extract invalid emails (everything NOT matching the valid pattern)
grep -Ev '^[A-Za-z0-9]+@[A-Za-z]+\.com$' emails.txt > invalid.txt
