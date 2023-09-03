#!/bin/bash

# Specify the path and directory name to check
path="/hdfs/data"
directory_name="data1"

# Check if the directory exists
if [ -d "$path/$directory_name" ]; then
    echo "Directory '$directory_name' exists in '$path'"
else
    echo "Directory '$directory_name' does not exist in '$path'"
    sleep 3
    echo "Create Directory '$directory_name' ..."
    mkdir -p "$path/$directory_name"
    sleep 3
    echo "Directory '$directory_name' has been created"
fi

