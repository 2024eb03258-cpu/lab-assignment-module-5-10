#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

dir="$1"

if [ ! -d "$dir" ]; then
    echo "Directory does not exist."
    exit 1
fi

count=$(ls -1 "$dir" | wc -l)

echo "Number of files in $dir: $count"
#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

dir="$1"

if [ ! -d "$dir" ]; then
    echo "Directory does not exist."
    exit 1
fi

count=$(ls -1 "$dir" | wc -l)

echo "Number of files in $dir: $count"

