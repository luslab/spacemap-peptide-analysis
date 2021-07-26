#!/usr/bin/env bash

#SBATCH --ntasks 1
#SBATCH --cpus-per-task 4
#SBATCH --mem 8G
#SBATCH --time 02:00:00

# This FASTA was queried from UniProt using UniProt IDs of proteins 
# whose peptides were captured by both SPACE and 
# the released fraction of SPACEmap
# (See the Uniprot.ID column in input/Released_fraction.txt_overlapped_with_SPACE.tsv)
fasta="input/Released_fraction.txt_overlapped_with_SPACE.fa"

interproscan-5.47-82.0/interproscan.sh \
    --output-dir interproscan_matches_rf \
    --input ${fasta} \
    --iprlookup \
    --tempdir tmp
