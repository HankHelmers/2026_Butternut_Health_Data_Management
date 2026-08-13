library(tidyverse)
library(lubridate) # working with time data
library(knitr)     # purl
library(DT)        # datatables for visualizing changes

# ---------------------------------
# Import data
after_health_assess <- read_csv("source_data/July_7_2026_Revisions_Butternut_Health_Assessmen.csv")

# ---------------------------------
# 1. Processing
august_processing_path <- "data_2025&on/1_Processing/2025_August/"
source(paste0(august_processing_path, "Renaming_Columns.R"))
source(paste0(august_processing_path, "Column_Removal.R"))

purl(input=paste0(august_processing_path,"Combining_Columns.Rmd"), output="communication/purl/Combining_Columns.R")
source("communication/purl/Combining_Columns.R")

source(paste0(august_processing_path, "Typing.R"))
source(paste0(august_processing_path, "Removals.R"))
source(paste0(august_processing_path, "Identification_Variables.R"))

purl(input=paste0(august_processing_path,"Adjustments_From_Form_Structure.Rmd"), output="communication/purl/Adjustments_From_Form_Structure.R")
source("communication/purl/Adjustments_From_Form_Structure.R")

purl(input=paste0(august_processing_path,"Categorical_Renamings.Rmd"), output="communication/purl/Categorical_Renamings.R")
source("communication/purl/Categorical_Renamings.R")


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