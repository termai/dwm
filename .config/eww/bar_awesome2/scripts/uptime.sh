#!/bin/bash

starts=$(last | grep "$(date | awk '{print $1,$2, " " $3}')" | awk '{print $8}' | tail -1)
ends=$(last | grep "$(date | awk '{print $1,$2, " " $3}')" | grep -o -E '\b[0-2]?[0-9]:[0-5][0-9]\b' | head -n 1)

convstarts=$(date -d "$starts" +"%I:%M")
convends=$(date -d "$ends" +"%I:%M")



# Split the times into hours and minutes
IFS=":" read -r hours1 minutes1 <<< "$convstarts"
IFS=":" read -r hours2 minutes2 <<< "$convends"


# Calculate the difference in minutes
minutes_diff=$(( (hours2 * 60 + minutes2) - (hours1 * 60 + minutes1) ))

# Calculate the hours and minutes from the difference using bc
hours_diff=$(echo "scale=0; $minutes_diff / 60" | bc)
minutes_diff=$(echo "$minutes_diff % 60" | bc)

echo "Time difference: $hours_diff hours and $minutes_diff minutes"
