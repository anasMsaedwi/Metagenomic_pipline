#!/bin/bash
# Step 1: Quality Control using fastp
# Input: Raw Fastq | Output: Clean Fastq

INPUT_R1="raw_data/SRR7877884_1.fastq"
INPUT_R2="raw_data/SRR7877884_2.2.fastq"
OUT_DIR="clean_data"

mkdir -p $OUT_DIR

echo "Starting Quality Control..."
fastp -i $INPUT_R1 -I $INPUT_R2 \
      -o $OUT_DIR/clean_1.fastq -O $OUT_DIR/clean_2.fastq \
      -h $OUT_DIR/report.html -j $OUT_DIR/report.json \
      --thread 8

echo "QC Complete."
