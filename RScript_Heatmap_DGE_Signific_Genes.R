## Script to plot a heatmap with differentially expressed (and significative) 
## genes in different studies 

## Set working directory
setwd("Your_Directory_Path")

## Organize 
fig <- read.csv("Input.csv")
fig$Study <- factor(fig$Study,
                    levels = c("Study_01", "Study_02", "Study_03"))
fig$Gene <- factor(fig$Gene,
                   levels = rev(c("Gene_01", "Gene_02", "Gene_03")))

## Plot
library(ggplot2)
ggplot(fig, aes(Study, Gene, fill = logFC))+
  geom_tile(color = "gray48", size=0.1)+
  geom_text(aes(label = PValue2), color = "black", size = 4)+
  scale_fill_gradient2(low = "dodgerblue3", high = "red", mid = "white",
                       midpoint = 0, limit = c(-5,5), space = "Lab", 
                       name="logFC") +
  theme_minimal() + # minimal theme
  theme(axis.title.y=element_blank(),
        axis.text.x = element_text(angle = 90, vjust = 0.5, 
                                   size = 8, hjust = 1,
                                   face = "italic"))+
    coord_fixed()

## Save plot
jpeg(file="Result.jpeg", width=4000, height=6800, units="px", res=600)
ggplot(fig, aes(Study, Gene, fill = logFC))+
  geom_tile(color = "gray48", size=0.1)+
  geom_text(aes(label = PValue2), color = "black", size = 4)+
  scale_fill_gradient2(low = "dodgerblue3", high = "red", mid = "white",
                       midpoint = 0, limit = c(-5,5), space = "Lab", 
                       name="logFC") +
  theme_minimal() + # minimal theme
  theme(axis.title.y=element_blank(),
        axis.text.x = element_text(angle = 90, vjust = 0.5, 
                                   size = 8, hjust = 1,
                                   face = "italic"))+
  coord_fixed()
dev.off()