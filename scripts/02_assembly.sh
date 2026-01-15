#!/bin/bash
# Step 2: De Novo Assembly using MEGAHIT
# Input: Clean Fastq | Output: Contigs (FASTA)

INPUT_R1="clean_data/clean_1.fastq"
INPUT_R2="clean_data/clean_2.fastq"
OUT_DIR="assembly_result"

# Remove old run if exists to avoid error
if [ -d "$OUT_DIR" ]; then
    rm -rf "$OUT_DIR"
fi

echo "Starting Assembly..."
megahit -1 $INPUT_R1 -2 $INPUT_R2 \
        -o $OUT_DIR \
        -t 8 \
        --min-contig-len 1000 \
        --presets meta-sensitive

echo "Assembly Complete. Output: $OUT_DIR/final.contigs.fa"
