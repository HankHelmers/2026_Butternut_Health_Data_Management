library(tidyverse) # Clarity in code writing
library(readr)
library(styler)
library(knitr)     # purl
library(dplyr)     # Data selecting and filtering
library(lubridate) # For working with dates and times
library(DT)        # datatables for visualizing changes

# ---------------------------------
# Import data
#   Suppressing the message because it just reads out all the column names
june_health_assess <- suppressMessages(read_csv("source_data/2025_June_July_Butternut_Health_Assessment_Form_Responses.csv", show_col_types = FALSE))

# ---------------------------------
june_processing_path <- "data_2025&on/1_Processing/2025_June_July/"
source(paste0(june_processing_path, "Preparing_Columns.R"))

# Prepare timestamp & plant numbers before retrieving individual entries
purl(input=paste0(june_processing_path,"Identification_Variables.Rmd"), output="communication/purl/Identification_Variables.R")
source("communication/purl/Identification_Variables.R")

# Remove testing individuals
source(paste0(june_processing_path, "Removals.R"))

# Retype the straight forward typings
#   Noting that some variables aren't fully retyped until data cleaning step
purl(input=paste0(june_processing_path,"Typing.Rmd"), output="communication/purl/Typing.R")
source("communication/purl/Typing.R")

# Special adjustments, per variable, due to form structure
#   E.g., Height/densiomenter text to number, Epicormics from numeric to "Yes"/"No"
purl(input=paste0(june_processing_path,"Adjustments_From_Form_Structure.Rmd"), output="communication/purl/Adjustments_From_Form_Structure.R")
source("communication/purl/Adjustments_From_Form_Structure.R")

#  Renamings of each categorical options
purl(input=paste0(june_processing_path,"Categorical_Renamings.Rmd"), output="communication/purl/Categorical_Renamings.R")
source("communication/purl/Categorical_Renamings.R")

# Aligning photo data with renaming photo data
source(paste0(june_processing_path, "Correct_Photo_Data.R"))

# ---------------------------------
# Re-order 
june_health_assess <- june_health_assess %>%
  select(
    timestamp, email, date, site_name, plant_number, plant_initials, 
    first_photo, last_photo, camera, adult_or_seedling,
    everything()
  )

# Remove clutter from environment
rm(list = setdiff(ls(), "june_health_assess"))

# Write to CSV
write.csv(june_health_assess, "output_data/1_processed_June_July_2025_Health_Assessments.csv", row.names = FALSE)

# Data types

# 1. Create a data frame of the column names and their precise internal type (e.g., double, integer)
data_types_table <- data.frame(
  Variable_Name = names(june_health_assess),
  Specific_Data_Type = sapply(june_health_assess, typeof),
  row.names = NULL
)

# 2. View it as a beautifully formatted table right in your console
knitr::kable(data_types_table, format = "markdown")
