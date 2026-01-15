#!/bin/bash
# Step 6: Taxonomic Classification using Kraken2
# Input: Bins (FASTA) | Output: Taxonomy Report

# Note: Ideally loop through all bins
BIN_DIR="bins"
DB_DIR="kraken_db"
OUT_DIR="taxonomy"

mkdir -p $OUT_DIR

# Example for one bin (loop can be added)
for bin in $BIN_DIR/*.fa; do
    name=$(basename $bin .fa)
    echo "Classifying $name..."
    kraken2 --db $DB_DIR \
            $bin \
            --report $OUT_DIR/${name}_report.txt \
            --output $OUT_DIR/${name}_output.txt
done
