#!/bin/bash
# Step 3: Assembly Evaluation using QUAST
# Input: Contigs | Output: HTML Report

ASSEMBLY="assembly_result/final.contigs.fa"
OUT_DIR="quast_report"

echo "Running QUAST..."
quast $ASSEMBLY -o $OUT_DIR --threads 8

echo "Evaluation Complete. Check $OUT_DIR/report.html"
