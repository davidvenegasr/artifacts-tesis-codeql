#!/bin/bash

TARGETS_DIR="./targets"

# Create and empty the targets.txt file
echo -n "" > targets.txt

# Execute fetch.sh scripts with the TARGET environment variable set
for dir in "$TARGETS_DIR"/*; do
    if [ -d "$dir" ]; then
        echo "Processing $dir ..."
        if [ -f "$dir/fetch.sh" ]; then
            foldername=$(basename "$dir")
            target="/home/dvenegas/Documents/TESIS/newMagma/exp/$foldername"
            echo "Executing fetch.sh in $dir with TARGET=$target ..."
            (cd "$dir" && TARGET="$target" ./fetch.sh)

            # Append the value of the TARGET variable to targets.txt
            echo "$target" >> targets.txt
        else
            echo "No fetch.sh found in $dir."
        fi
    fi
done
