#!/usr/bin/env bash

#SBATCH --ntasks 1
#SBATCH --cpus-per-task 4
#SBATCH --mem 8G
#SBATCH --time 02:00:00

# To reproduce the run of InterProScan, you would need to change the paths below

# This FASTA was queried from UniProt using UniProt IDs of proteins 
# whose peptides were captured by the crosslinked fraction of SPACEmap
# (See the Uniprot.ID column in input/Crosslinked_fraction_CLF_proteins.tsv)
fasta="input/Crosslinked_fraction_CLF_proteins.fa"

interproscan-5.47-82.0/interproscan.sh \
    --output-dir interproscan_matches \
    --input ${fasta} \
    --iprlookup \
    --tempdir ../tmp
