#!/bin/bash

# Part 1: Check the HTTP status code of guvi.in and print success/failure message

# Check the HTTP status code of guvi.in
status_code=$(curl -o /dev/null -s -w "%{http_code}\n" http://guvi.in)

# Print the status code
echo "HTTP Status Code: $status_code"

# Print success or failure message based on the status code
if [ $status_code -eq 200 ]; then
  echo "Success: The website is reachable."
else
  echo "Failure: The website is not reachable. Status code: $status_code"
fi

# Part 2: replace all occurrence of the word ""give"" with ""learning"" from the 5th line till the end in only those lines that contain the word "welcome"

# Input file
input_file="file.txt"

# Temporary file for storing intermediate results
tmp_file=$(mktemp)

# Loop through each line of the input file
line_number=0
while IFS= read -r line; do
    ((line_number++))

    # Check if it's from the 5th line onwards and contains "welcome"
    if (( line_number >= 5 )) && [[ $line == *welcome* ]]; then
        # Replace "give" with "learning" in this line
        modified_line=$(echo "$line" | sed 's/\bgive\b/learning/g')
        echo "$modified_line" >> "$tmp_file"
    else
        # Otherwise, keep the line unchanged
        echo "$line" >> "$tmp_file"
    fi
done < "$input_file"

# Overwrite the original file with the modified contents
mv "$tmp_file" "$input_file"

# Remove the temporary file
rm "$tmp_file"

echo "Replacement complete."