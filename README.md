# PhD_Thesis_Chapter_3

A versioned, tracked project that has the correct code, R version, and package versions to reproducibly create the metapathway/drug associations from Chapter 3 of this PhD Thesis.

Needs these data files to work...
# For Core Dasatinib Metagenes Analysis:

CCLE_RNAseq_genes_counts_20180929.gct (from the CCLE)

GDSC2_fitted_dose_response_25Feb20.csv (from the GDSC)

heatmap-mik.R

# Data Notes:

Some of these are included in Data/ while others were too large for GitHub and must be obtained from their sources (eg CCLE and GDSC2 data).

# renv:

renv is used to create a reproducible r environment - i.e. all package versions are consistent within this repository.

renv requires renv.lock, renv/activate.R, and settings in .Rprofile to work correctly.

Upon cloning this repository, open the project file in R 3.6.2 and renv should automatically bootstrap and install itself.

Then, use renv::restore() to restore the project library locally. If asked, input y to activate the project before restore.
