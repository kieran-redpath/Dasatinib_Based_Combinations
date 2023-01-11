# PhD_Phase_1_Versioned_3.6.2

Creating a versioned, tracked project that has the correct code, R version, and package versions to reproducibly create the metapathway/drug associations that informed Phase 1 of this project.

Needs these data files to work...
# For Core Dasatinib Metagenes Analysis:

CCLE_RNAseq_genes_counts_20180929.gct (from the CCLE)

GDSC2_fitted_dose_response_15Oct19.csv (from the GDSC, might not be neccesary)

GDSC2_fitted_dose_response_25Feb20.csv (from the GDSC)

gse62254_gastric_cancer.RData (Don't know if this is used for anything)

heatmap-mik.R
# For TCGA Analysis:

tcga_gastric_cancer.RData (from the TCGA)

# For Prostate Cancer Analysis:

13059_2007_1735_MOESM4_treated+control_ESM.csv (from prostate cancer paper)

# Data Notes:

Some of these are included in Data/ while others were too large and must be required from their sources (eg CCLE and GDSC2 data). GSE data are from https://github.com/mikblack/Gastric_Cancer_Datasets

# renv:

renv is used to create a reproducible r environment - i.e. all package versions are consistent within this repository.

renv requires renv.lock, renv/activate.R, and settings in .Rprofile to work correctly.

Upon cloning this repository, open the project file in R 3.6.2 and renv should automatically bootstrap and install itself.

Then, use renv::restore() to restore the project library locally. If asked, input y to activate the project before restore.
