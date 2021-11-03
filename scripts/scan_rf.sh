#!/usr/bin/env bash

#SBATCH --ntasks 1
#SBATCH --cpus-per-task 4
#SBATCH --mem 8G
#SBATCH --time 04:00:00

# Please change according to your installations of Java 11 and Perl 5
module purge
module load Java/11.0.2 
module load Perl/5.32.1-GCCcore-10.3.0 

# This FASTA was queried from UniProt using UniProt IDs of proteins 
# captured by both SPACE and the crosslinked fraction of SPACEmap
# (See the Uniprot.ID column in ../input/SPACEmap_crosslinked_fraction_overlap_with_SPACE.tsv)
fasta="../input/SPACEmap_released_fraction_overlap_with_SPACE_protein.fa"

mkdir -p ../output/interproscan_matches_rf
mkdir -p ../tmp

# Please change according to your InterProScan installation
../tools/interproscan-5.47-82.0/interproscan.sh \
    --output-dir ../output/interproscan_matches_rf \
    --input ${fasta} \
    --iprlookup \
    --tempdir ../tmp

cp ../output/interproscan_matches_rf/SPACEmap_released_fraction_overlap_with_SPACE_protein.fa.tsv ../input
