library(knitr)
library(tidyverse)

# ---------------------------------
# Import data
health_assess_2024 <- read_csv("Raw_Datasets/2024 Wild Collected Butternut DNA Leaf Samples - Sheet1.csv")

# Select only WCP observations (first 66)
health_assess_2024 <-  filter(health_assess_2024, health_assess_2024$`Site number or initial` == "WCP")

# ---------------------------------
# 0. Photos



# 1. Processing
source("data_2024/1_Data_Processing/Column_Removal.R") 
source("data_2024/1_Data_Processing/Column_Renaming.R") 
source("data_2024/1_Data_Processing/Variable_by_Variable_Processing.R") 
source("data_2024/1_Data_Processing/Typing.R") 




# Write to CSV
write.csv(health_assess_2024, "cleaned_2024_Health_Assessments.csv", row.names = FALSE)
