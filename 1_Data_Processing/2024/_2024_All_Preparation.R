library(knitr)
library(tidyverse)

setwd("C:/Users/helmerhj/Documents/GitHub/2025-reu-temp")

# Import data
health_assess_2024 <- read_csv("data/Raw_Datasets/2024 Wild Collected Butternut DNA Leaf Samples - Sheet1.csv")

# Apply cleaning
purl(input="data_cleaning/_2024_All_Preparation.Rmd", output="purl/_2024_All_Preparation.R")
source("purl/_2024_All_Preparation.R")

write.csv(health_assess_2025, "data/Cleaned_Datasets/cleaned_2024_Health_Assessments.csv", row.names = FALSE)
