#!/usr/bin/env bash

#SBATCH --ntasks 1
#SBATCH --cpus-per-task 4
#SBATCH --mem 8G
#SBATCH --time 02:00:00

# This FASTA was queried from UniProt using UniProt IDs of proteins 
# captured by both SPACE and the crosslinked fraction of SPACEmap
# (See the Uniprot.ID column in input/SPACEmap_crosslinked_fraction_overlap_with_SPACE.tsv)
fasta="input/SPACEmap_crosslinked_fraction_overlap_with_SPACE_protein.fa"

mkdir tmp

interproscan-5.47-82.0/interproscan.sh \
    --output-dir output/interproscan_matches_clf \
    --input ${fasta} \
    --iprlookup \
    --tempdir tmp
