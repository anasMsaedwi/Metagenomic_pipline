#!/bin/bash
# Step 4: Read Mapping & Coverage Calculation
# Tools: Bowtie2, Samtools
# Input: Contigs + Clean Reads | Output: Sorted BAM + Depth.txt

ASSEMBLY="assembly_result/final.contigs.fa"
R1="clean_data/clean_1.fastq"
R2="clean_data/clean_2.fastq"
MAP_DIR="mapping"

mkdir -p $MAP_DIR

# 1. Build Index (Fixes the "Index not found" error)
echo "Building Bowtie2 Index..."
bowtie2-build $ASSEMBLY $MAP_DIR/assembly_index

# 2. Map Reads
echo "Mapping reads..."
bowtie2 -x $MAP_DIR/assembly_index \
        -1 $R1 -2 $R2 \
        -S $MAP_DIR/mapped.sam \
        --threads 8

# 3. Process BAM (Sort & Index)
echo "Sorting and Indexing..."
samtools view -bS $MAP_DIR/mapped.sam | samtools sort -@ 8 -o $MAP_DIR/mapped.sorted.bam
samtools index $MAP_DIR/mapped.sorted.bam

# 4. Calculate Depth (Required for Binning)
echo "Calculating Depth..."
jgi_summarize_bam_contig_depths --outputDepth $MAP_DIR/depth.txt $MAP_DIR/mapped.sorted.bam

# Cleanup
rm $MAP_DIR/mapped.sam
echo "Mapping Complete."
