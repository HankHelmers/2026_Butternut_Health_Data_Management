library(knitr)
library(tidyverse)


# Import data
health_assess_2024 <- read_csv("Raw_Datasets/2024 Wild Collected Butternut DNA Leaf Samples - Sheet1.csv")

# Select only WCP observations (first 66)
health_assess_2024 <-  filter(health_assess_2024, health_assess_2024$`Site number or initial` == "WCP")

# Select relevant columns


# Apply processing from R Markdown
purl(input="1_Data_Processing/2024/_2024_All_Preparation.Rmd", output="purl/_2024_All_Preparation.R")
source("purl/_2024_All_Preparation.R")

write.csv(health_assess_2024, "cleaned_2024_Health_Assessments.csv", row.names = FALSE)
