# Do some quick comparisons between the different results
library(gplots)

# Load other data: goseq Reactome (can't do tt3 since there's no sig pathways)
fgsea_AUC_T <- read.csv("Data_fgsea_tt2/fgsea_Das_Pathways.csv")
fgsea_LN_IC50_T <- read.csv("Data_fgsea_tt1/fgsea_Das_Pathways.csv")
goseq_Ranked_P <- read.csv("Data/goseq_Das_Pathways.csv", row.names = 1)  %>% .[.$adjP < 0.05, ]

fgsea_AUC_pathways <- unique(fgsea_AUC_T$pathway)
fgsea_LN_IC50_pathways <- unique(fgsea_LN_IC50_T$pathway)
goseq_pathways <- unique(goseq_Ranked_P$Pathway)

# Create a list of sets for the Venn diagram
venn_list <- list(
  "fgsea_AUC_T" = fgsea_AUC_pathways,
  "fgsea_LN_IC50_T" = fgsea_LN_IC50_pathways,
  "goseq_Ranked_P" = goseq_pathways
)

# Plot the Venn diagram
venn(venn_list)

# Find overlapping pathways
# Goseq and fgsea AUC
intersect(fgsea_AUC_pathways, goseq_pathways)
# Goseq and fgsea IC50
intersect(fgsea_LN_IC50_pathways, goseq_pathways)
# All 3
Reduce(intersect, list(fgsea_AUC_pathways, fgsea_LN_IC50_pathways, goseq_pathways)) %>% write.csv(file = "Thesis/goseq_fgsea_AUC_fgsea_LN_IC50_overlap.csv")

# Do this in ggplot2 and ggvenn
library(ggvenn)
library(ggplot2)

# Create a list with simple placeholder set names
venn_list <- list(
  "AUC Pathways" = fgsea_AUC_pathways,
  "IC50 Pathways" = fgsea_LN_IC50_pathways,  # Placeholder name
  "GOseq Pathways" = goseq_pathways
)

# Generate the Venn diagram
venn_plot <- ggvenn(
  venn_list,
  fill_color = c("white", "white", "white"), # scales::hue_pal()(3),  # Default ggplot2 colors
  stroke_size = 1,
  set_name_size = 0  # Hide default set labels
) + 
  theme(text = element_text(family = "Times New Roman", size = 12))

# Add correctly formatted set labels using `annotate()`
venn_plot <- venn_plot + 
  annotate("text", x = -1, y = 1, label = "GSEA Pathways (AUC)", family = "Times New Roman", size = 5) +
  annotate("text", x = 0, y = -1, label = "Over-Representation Analysis\nPathways", family = "Times New Roman", size = 5) +
  annotate("text", x = 1, y = 1, label = expression("GSEA Pathways (IC" * phantom()[50] * ")"), 
           family = "Times New Roman", size = 5, parse = TRUE)

# Save the plot
ggsave("Thesis/Venn_Diagram.png", plot = venn_plot, width = 204.92, height = 250, units = "mm", dpi = 300)

# Display the plot
print(venn_plot)
