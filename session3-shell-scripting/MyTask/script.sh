#!/bin/bash

# Print current date
current_date=$(date)
echo "Current Date: $current_date"

# Print hostname
host_name=$(hostname)
echo "Hostname: $host_name"

# Print username
user_name=$(whoami)
echo "Username: $user_name"

# Print disk usage
echo ""
echo "Disk Usage:"
df -h

# Take user input for directory name
echo ""
read -p "Enter a directory name: " dir_name

# Create directory
mkdir -p "$dir_name"
echo "Directory '$dir_name' created successfully."

# Take user input for file name
read -p "Enter a file name: " file_name

# Create file
touch "$dir_name/$file_name"
echo "File '$file_name' created successfully inside '$dir_name'."

# Display running processes
echo ""
echo "Running Processes:"
ps -ef

# Store running processes in the file
ps -ef > "$dir_name/$file_name"
echo "Running processes have been saved to $dir_name/$file_name"