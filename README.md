# Computationally Informed Combination Therapies for the Chemoprevention of Hereditary Diffuse Gastric Cancer

Needs these data files to work:

CCLE_RNAseq_genes_counts_20180929.gct (from the CCLE)

GDSC2_fitted_dose_response_25Feb20.csv (from the GDSC)

heatmap-mik.R

Some of these are included in /data/ while others are too large for GitHub and must be obtained from their sources (e.g., CCLE and GDSC2 data).

# renv:

renv is used to create a reproducible r environment - i.e. all package versions are consistent within this repository.

renv requires /renv.lock, /renv/activate.R, and settings in /.Rprofile to work correctly.

Upon cloning this repository, open the project file inthe version of R recorded in /renv.lock, and renv should automatically bootstrap and install itself.

Then, use renv::restore() to restore the project library locally. If asked, input y to activate the project before restore.
