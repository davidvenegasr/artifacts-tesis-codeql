#!/bin/bash

TARGETS_DIR="./targets"

# Create and empty the targets.txt file
echo -n "" > targets.txt

# Execute preinstall.sh scripts with sudo
for dir in "$TARGETS_DIR"/*; do
    if [ -d "$dir" ]; then
        echo "Processing $dir ..."
        if [ -f "$dir/preinstall.sh" ]; then
            echo "Executing preinstall.sh in $dir with sudo ..."
            (cd "$dir" && sudo ./preinstall.sh)
        else
            echo "No preinstall.sh found in $dir."
        fi
    fi
done
