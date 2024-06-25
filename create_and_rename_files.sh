#!/bin/bash

# Create 20 files with .txt extensions
for i in {1..20}
do
    touch "file_$i.txt"
done

# Rename the first 5 files to .yml extension
for i in {1..5}
do
    mv "file_$i.txt" "file_$i.yml"
done

# Get the latest 5 created files
latest_files=$(ls -t | head -5)

# Print the latest 5 created files
echo "Latest 5 created files:"
echo "$latest_files"
