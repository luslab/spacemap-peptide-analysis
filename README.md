# spacemap-peptide-analysis
Data analysis for the SPACEmap experiment from [Rafiee et al., 2020](https://www.biorxiv.org/content/10.1101/2020.07.13.200212v6).

To reproduce the analysis, please run `scripts/SPACEmap_peptide_analysis_final.Rmd`. It will calculate the numbers of proteins and peptides for Fig. 4B and plot the bars for it. It will also plot Fig. 4D-G and Supplementary Fig. 4D-E and generate the following spreadsheets from the Supplementary Table 2 (in the `tsv` format): "Peptides mapped to a region," "SPACEmap-crosslinked peptides," and "Clustered domains." It will create an `output` directory alongside the `input` and `scripts` directories and put the plots and the spreadsheets in the `output`. You will need to install R packages included at the beginning of this R notebook.

To reproduce the InterProScan results on the proteins captured by both SPACEmap and SPACE, please run scripts `scan_clf.sh` and `scan_rf.sh`. You will need to install InterProScan v5.47-82.0 and change the path to InterProScan in both scripts accordingly. For InterProScan installation instructions, please see [its manual](https://interproscan-docs.readthedocs.io/en/latest/InstallationRequirements.html).

The input files for the analysis are as follows:

- `SPACE.tsv` - Proteins captured by the SPACE experiment.

- `SPACEmap_crosslinked_revised.tsv` - All crosslinked peptides from the SPACEmap experiment.

- `SPACEmap_crosslinked_fraction_overlap_with_SPACE.tsv` - Crosslinked peptides from SPACEmap also present in proteins from SPACE.

- `SPACEmap_released_fraction_overlap_with_SPACE.tsv` - Released peptides from SPACEmap also present in proteins from SPACE.

- `SPACEmap_crosslinked_fraction_overlap_with_SPACE_protein.fa` - Sequences of proteins that have at least one crosslinked peptide from SPACEmap.

- `SPACEmap_released_fraction_overlap_with_SPACE_protein.fa` - Sequences of proteins that have at least one released peptide from SPACEmap.

- `SPACEmap_crosslinked_fraction_overlap_with_SPACE_protein.fa.tsv` - InterProScan results on `SPACEmap_crosslinked_fraction_overlap_with_SPACE_protein.fa`.

- `SPACEmap_released_fraction_overlap_with_SPACE_protein.fa.tsv` - InterProScan results on `SPACEmap_released_fraction_overlap_with_SPACE_protein.fa`.
