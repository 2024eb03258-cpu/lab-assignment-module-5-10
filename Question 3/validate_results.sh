#!/bin/bash

if [ ! -f marks.txt ]; then
    echo "marks.txt not found."
    exit 1
fi

failed_one=0
passed_all=0

echo "Students failed in exactly ONE subject:"
while IFS=',' read -r roll name m1 m2 m3; do
    m1=$(echo "$m1" | xargs)
    m2=$(echo "$m2" | xargs)
    m3=$(echo "$m3" | xargs)
    fail_count=0

    [ "$m1" -lt 33 ] && fail_count=$((fail_count+1))
    [ "$m2" -lt 33 ] && fail_count=$((fail_count+1))
    [ "$m3" -lt 33 ] && fail_count=$((fail_count+1))

    if [ "$fail_count" -eq 1 ]; then
        echo "$roll, $name"
        failed_one=$((failed_one+1))
    elif [ "$fail_count" -eq 0 ]; then
        passed_all=$((passed_all+1))
    fi
done < marks.txt

echo
echo "Students passed in ALL subjects:"
awk -F',' '{
    gsub(/ /,"",$3); gsub(/ /,"",$4); gsub(/ /,"",$5);
    if($3>=33 && $4>=33 && $5>=33) print $1", "$2
}' marks.txt

echo
echo "Count failed in exactly one subject: $failed_one"
echo "Count passed in all subjects: $passed_all"
