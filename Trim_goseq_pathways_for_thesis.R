goseq_Das_Pathways <- read.csv("Data/goseq_Das_Pathways.csv", row.names = 1)

tableX <- goseq_Das_Pathways 

library(dplyr)
# Remove specific columns and reorder columns
tableX <- tableX %>%
  dplyr::select(Pathway, numDEInCat, numInCat, adjP, DEgenesInCat)

# Convert genes to character
tableX$DEgenesInCat <- as.character(tableX$DEgenesInCat)
for (i in 1:nrow(tableX)) {
  # Split, sort, and rejoin each element in the DEgenesInCat column
  genes <- unlist(strsplit(tableX$DEgenesInCat[i], "::"))
  sorted_genes <- sort(genes)
  tableX$DEgenesInCat[i] <- paste(sorted_genes, collapse = ", ")
}


# Rename columns
tableX <- dplyr::rename(tableX, "No. of In-group Genes in Pathway" = "numDEInCat", "Total No. of Genes in Pathway" = "numInCat", "Adjusted P-value" = "adjP", "In-group Genes in Pathway" = "DEgenesInCat")

# Save table for supplementary
write.csv(tableX, file = "Thesis/Supp_Table_X.csv")

# Remove non-significant rows
tableX <- tableX[tableX$"Adjusted P-value" < 0.05, ]
# Remove genes
tableX <- dplyr::select(tableX, -"In-group Genes in Pathway")

# Save table for 
write.csv(tableX, file = "Thesis/Table_X.csv")
