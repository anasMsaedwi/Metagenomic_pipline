#!/bin/bash
# Step 7: Functional Annotation using Prokka
# Input: Bins (FASTA) | Output: GFF/TBL/FNA

BIN_DIR="bins"
OUT_DIR="annotation"

for bin in $BIN_DIR/*.fa; do
    name=$(basename $bin .fa)
    echo "Annotating $name..."
    prokka $bin --outdir $OUT_DIR/$name --prefix $name --cpus 4 --force
done
