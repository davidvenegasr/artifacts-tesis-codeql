#!/bin/bash
set -e

# Function to apply patches to each target
apply_patches() {
    local target="$1"

    # TODO filter patches by target config.yaml
    find "targets/$target/patches/setup" "targets/$target/patches/bugs" -name "*.patch" | \
    while read patch; do
        echo "Applying $patch"
        name=${patch##*/}
        name=${name%.patch}
        sed "s/%MAGMA_BUG%/$name/g" "$patch" | patch -p1 -d "/home/dvenegas/Documents/TESIS/newMagma/exp/$target/repo"
    done
}

# Read targets from targets.txt and apply patches
while read target; do
    echo "Processing target: $target"
    apply_patches "$target"
done < short_targets.txt
