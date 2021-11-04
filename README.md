# spacemap-peptide-analysis
Data analysis for the SPACEmap experiment from [Rafiee et al., 2020](https://www.biorxiv.org/content/10.1101/2020.07.13.200212v6).

To reproduce the analysis, please run `scripts/SPACEmap_peptide_analysis_final.Rmd`. It will calculate the numbers of proteins and peptides for the panel Fig. 4B and plot the bars for it. It will also plot Fig. 4D-G, Supplementary Fig. 4D-E and raw images for Supplementary Fig. 4F-G. Finally, it will generate the following spreadsheets from the Supplementary Table 2 (in the `tsv` format): "Peptides mapped to a region," "SPACEmap-crosslinked peptides," and "Clustered domains." It will create an `output` directory alongside the `input` and `scripts` directories and put the plots and the spreadsheets in the `output`. You will need to install R packages included at the beginning of this R notebook. We used the following versions:

- `dplyr`: 1.0.3

- `tidyr`: 1.1.3

- `stringr`: 1.4.0

- `purrr`: 0.3.4

- `tibble`: 3.0.6

- `ggplot2`: 3.3.3

- `ggrepel`: 0.9.1

- `kableExtra`: 1.3.1

- `scales`: 1.1.1

- `tictoc`: 1.0

- `seqinr`: 4.2.5

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

The expected output is as follows:

- `output/interproscan_matches_clf` appears if `scan_clf.sh` was run and contains the results from InterProScan on `SPACEmap_crosslinked_fraction_overlap_with_SPACE_protein.fa`. The expected files are: `SPACEmap_crosslinked_fraction_overlap_with_SPACE_protein.fa.{gff3,json,tsv,xml}`. `SPACEmap_crosslinked_fraction_overlap_with_SPACE_protein.fa.tsv` is copied over to `input` and used in the analysis.

- `output/interproscan_matches_rf` appears if `scan_rf.sh` was run and contains the results from InterProScan on `SPACEmap_released_fraction_overlap_with_SPACE_protein.fa`. The expected files are: `SPACEmap_released_fraction_overlap_with_SPACE_protein.fa.{gff3,json,tsv,xml}`. `SPACEmap_released_fraction_overlap_with_SPACE_protein.fa.tsv` is copied over to `input` and used in the analysis.

- `output/plots` contains the following PDF files:
    - `Fig_4B_upper_bar.pdf` - The upper bar for Fig. 4B.
    - `Fig_4B_lower_bar.pdf` - The lower bar for Fig. 4B.
    - `Fig_4D_S4D-left.pdf` - The bar plot for Supplementary Fig. 4D, left, whose top 5 bars are used for Fig. 4D.
    - `Fig_4E_S4E-left.pdf` - The bar plot for Supplementary Fig. 4E, left, whose top 5 bars are used for Fig. 4E.
    - `Fig_4F_left.pdf` - The scatter plot for Fig. 4F, left.
    - `Fig_4F_right.pdf` - The scatter plot for Fig. 4F, right.
    - `Fig_4G_left.pdf` - The scatter plot for Fig. 4G, left.
    - `Fig_4G_right.pdf` - The scatter plot for Fig. 4G, right.
    - `Fig_S4D-right.pdf` - The bar plot for Supplementary Fig. 4D, right.
    - `Fig_S4E-right.pdf` - The bar plot for Supplementary Fig. 4E, right.
    - `Fig_S4F_draft_all_matches.pdf` - A draft plot of matches for the first step in Supplementary Fig. 4F.
    - `Fig_S4G_draft_peptides.pdf` - A draft plot of peptides in the protein sequence for Supplementary Fig. 4G.

- `output/tables` contains the following TSV files:
    - `Supplementary_Table2_Clustered_domains.tsv` - Spreadsheet "Clustered domains" from Supplementary Table 2.
    - `Supplementary_Table2_Figure_4B_mapped_peptides.tsv` - Spreadsheet "Figure 4B, mapped peptides" from Supplementary Table 2.
    - `Supplementary_Table2_Figure_4B-E_mapping_details.tsv` - Spreadsheet "Figure 4B-E mapping details" from Supplementary Table 2.
