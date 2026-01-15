#!/bin/bash
# Step 5: Binning using MetaBAT2
# Input: Contigs + Depth file | Output: Genome Bins (FASTA)

ASSEMBLY="assembly_result/final.contigs.fa"
DEPTH="mapping/depth.txt"
OUT_DIR="bins"

mkdir -p $OUT_DIR

echo "Starting Binning..."
metabat2 -i $ASSEMBLY \
         -a $DEPTH \
         -o $OUT_DIR/bin \
         -t 8

echo "Binning Complete."
