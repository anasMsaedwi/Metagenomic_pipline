# Meta_pipli

# 🧬 Metagenomic Profiling Pipeline: From Reads to MAGs

![License](https://img.shields.io/badge/license-MIT-green)
![Language](https://img.shields.io/badge/language-Bash%20%7C%20R-blue)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20HPC-orange)
![Status](https://img.shields.io/badge/status-stable-brightgreen)

## 📖 Introduction

**Shotgun Metagenomics** has revolutionized our ability to study microbial communities directly from environmental samples without cultivation. This project implements a comprehensive bioinformatics pipeline to recover **Metagenome-Assembled Genomes (MAGs)** from raw sequencing data.

The pipeline simulates a high-performance computing (HPC) workflow, encompassing quality control, de novo assembly, read mapping, genome binning, and functional annotation. It was validated using the **ZymoBIOMICS Microbial Community Standard**, successfully recovering high-quality genomes with distinct functional profiles.

## 🔄 Workflow Strategy

The analysis follows a "Assembly-First" approach, optimized for recovering low-abundance genomes.

```mermaid
graph TD
    A[Raw Reads .fastq] -->|fastp| B(Quality Control)
    B -->|MEGAHIT| C[De Novo Assembly]
    B -->|Bowtie2| D[Read Mapping]
    C --> D
    D -->|Samtools| E[Sorted BAM]
    C -->|MetaBAT2| F[Genome Binning]
    E --> F
    F -->|CheckM| G[Quality Assessment]
    F -->|Prokka| H[Functional Annotation]
    H -->|Proksee| I[Visualization]
    
    style A fill:#f9f,stroke:#333,stroke-width:2px
    style F fill:#bbf,stroke:#333,stroke-width:2px
    style I fill:#bfb,stroke:#333,stroke-width:2px
```
# Metagenomics Pipeline

A comprehensive pipeline for metagenomic analysis from raw sequencing data to genome assembly, binning, and annotation.

## 🛠 Technologies & Dependencies

This pipeline relies on the following open-source tools, managed via Conda:

| Tool | Version | Purpose |
|------|---------|---------|
| fastp | 0.23.4 | Ultra-fast all-in-one FASTQ preprocessor |
| MEGAHIT | 1.2.9 | Ultra-fast single-node solution for large assembly |
| Bowtie2 | 2.5.1 | Fast and sensitive read alignment |
| MetaBAT2 | 2.15 | Adaptive reconstruction of single genomes from complex microbial communities |
| Prokka | 1.14.6 | Rapid prokaryotic genome annotation |
| QUAST | 5.2.0 | Quality Assessment Tool for Genome Assemblies |

## ⚙️ Installation & Setup

To ensure reproducibility, an `environment.yml` file is provided to recreate the exact software environment.

```bash
# 1. Clone the repository
git clone https://github.com/AnasSaadawi/Metagenomics-Pipeline.git
cd Metagenomics-Pipeline

# 2. Create Conda environment
conda env create -f environment.yml

# 3. Activate the environment
conda activate meta_pipeline
