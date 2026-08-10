library(knitr)
library(tidyverse)

# ---------------------------------
# Import data
health_assess_2024 <- read_csv("source_data/2024 Wild Collected Butternut DNA Leaf Samples - Sheet1.csv")

# Select only WCP observations (first 66)
health_assess_2024 <-  filter(health_assess_2024, health_assess_2024$`Site number or initial` == "WCP")

# ---------------------------------

# 1a. Processing
source("data_2024/1_Data_Processing/Column_Removal.R") 
source("data_2024/1_Data_Processing/Column_Renaming.R") 
source("data_2024/1_Data_Processing/Variable_by_Variable_Processing.R") 
source("data_2024/1_Data_Processing/Typing.R") 

# 1b. Photos
source("data_2024/0_Photos/Sync_Photos_With_Renaming_Info.R") 

# Re-order columns 
health_assess_2024 <- health_assess_2024 %>% select(site, site_owner, date, plant_number, plant_initials, first_photo, last_photo, camera, seedling_y_n, everything())

# Write to CSV
write.csv(health_assess_2024, "output_data/1_processed_2024_Health_Assessments.csv", row.names = FALSE)
