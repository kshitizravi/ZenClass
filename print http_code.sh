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