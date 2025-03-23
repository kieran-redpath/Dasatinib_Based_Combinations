tableY <- read.csv("Thesis/tt3.csv", row.names = 1)

library(dplyr)
# Remove specific columns and reorder columns
tableY <- tableY %>%
  dplyr::select(Ensembl_ID, Gene_Symbol, Avg_Exp, IC50_logFC, IC50_Adj_PVal, AUC_logFC, AUC_Adj_PVal)

# Rename columns
tableY <- dplyr::rename(tableY, "Ensembl ID" = "Ensembl_ID", "Gene Symbol" = "Gene_Symbol", "Average Expression" = "Avg_Exp",
                        "log2 Fold Change (ln(IC50))" = "IC50_logFC", "FDR Adjusted P-value (ln(IC50))" = "IC50_Adj_PVal",
                        "log2 Fold Change (AUC)" = "AUC_logFC",  "FDR Adjusted P-value (AUC)" = "AUC_Adj_PVal")

# Remove transcripts that aren't significant in either 
tableY <- tableY[!(tableY$"FDR Adjusted P-value (ln(IC50))" >= 0.05 & tableY$"FDR Adjusted P-value (AUC)" >= 0.05), ]

# Round all numeric columns in tableY to 4 decimal places
tableY[] <- lapply(tableY, function(x) {
  if (is.numeric(x)) round(x, 4) else x
})

# Save table
write.csv(tableY, file = "Thesis/Table_Y.csv")
