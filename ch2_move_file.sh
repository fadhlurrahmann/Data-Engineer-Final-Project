#!/bin/bash

filename_excel="daily_market_price.xlsx"
source_dir="/local/data/market"
target_dir="/hdfs/data/data1"

# Check if the directory exists
if [ -d "$target_dir" ]; then
    echo "Directory '$target_dir' exists"
    sleep 3
    echo "File is moving..."
    cp "$source_dir/$filename_excel" "$target_dir"
    sleep 3
    echo "File moved successfully"
else
    echo "File or target directory does not exist"
fi
