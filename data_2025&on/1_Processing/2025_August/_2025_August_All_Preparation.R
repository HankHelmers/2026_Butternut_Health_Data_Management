library(tidyverse)
library(lubridate) # working with time data

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

# source(paste0(august_processing_path, "Adjustments_From_Form_Structure.R"))



